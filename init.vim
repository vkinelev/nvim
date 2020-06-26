set number
set relativenumber
set ignorecase
set cc=80
set clipboard=unnamedplus
set autoread
set signcolumn=yes
au FocusGained * :checktime

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-rails'

call plug#end()

" Required for operations modifying multiple buffers like rename.
set hidden

" Copy full path 
nnoremap cp :let @" = expand("%:p")<CR>

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['/Users/victor/.rvm/gems/ruby-2.5.1/bin/solargraph', 'stdio']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType ruby call SetLSPShortcuts()
augroup END

" FZF
nnoremap <leader>fi       :Files<CR>
nnoremap <leader>fw       :Windows<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
