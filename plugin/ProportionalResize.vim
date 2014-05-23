" ProportionalResize.vim: Adapt the window proportions after Vim is resized.
"
" DEPENDENCIES:
"   - Requires Vim 7.3 or higher and the +float feature.
"   - ProportionalResize.vim autoload script
"   - ProportionalResize/Record.vim autoload script
"
" Copyright: (C) 2013-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.01.002	15-Jan-2014	Add :NoProportionalResize command.
"   1.00.001	04-Feb-2013	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_ProportionalResize') || (v:version < 703) || ! has('float')
    finish
endif
let g:loaded_ProportionalResize = 1

"- configuration ---------------------------------------------------------------

if ! exists('g:ProportionalResize_RecordEvents')
    let g:ProportionalResize_RecordEvents = 'CursorHold,CursorHoldI'
endif
if ! empty(g:ProportionalResize_RecordEvents)
    call ProportionalResize#Record#InstallHooks()
endif
if ! exists('g:ProportionalResize_UpdateTime')
    let g:ProportionalResize_UpdateTime = 500
endif


"- commands --------------------------------------------------------------------

command! -nargs=1 -complete=command   ProportionalResize call ProportionalResize#CommandWrapper(1, <q-args>)
command! -nargs=1 -complete=command NoProportionalResize call ProportionalResize#CommandWrapper(0, <q-args>)

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
