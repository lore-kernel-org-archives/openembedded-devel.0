Received: from 20.mo1.mail-out.ovh.net ([188.165.45.168]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UTXGQ-0003xb-PS
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Apr 2013 14:51:43 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id E323BFF8E98
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Apr 2013 14:18:14 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 20 Apr 2013 14:18:14 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 20 Apr 2013 14:18:13 +0200
Received: from b5-vm-mint0.betafive.co.uk (unknown [192.168.0.235])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 5305A16009F;
	Sat, 20 Apr 2013 13:17:03 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Sat, 20 Apr 2013 13:17:05 +0100
Message-Id: <1366460227-18964-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366460227-18964-1-git-send-email-paul@paulbarker.me.uk>
References: <1366460227-18964-1-git-send-email-paul@paulbarker.me.uk>
X-Ovh-Tracer-Id: 9765211368624523593
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfedvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [meta-oe][PATCH 1/3] vim: use example vimrc from vim runtime files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Apr 2013 12:51:50 -0000

Rather than keeping our own local vimrc file we can use vimrc_example.vim from
the runtime files distributed with vim. This keeps us up-to-date with changes to
the config when we move to a new vim version.

Also tidy comments around do_install_append so that it is clearer what is
happening.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/files/vimrc |   96 -------------------------------
 meta-oe/recipes-support/vim/vim.inc     |    7 ++-
 2 files changed, 4 insertions(+), 99 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/files/vimrc

diff --git a/meta-oe/recipes-support/vim/files/vimrc b/meta-oe/recipes-support/vim/files/vimrc
deleted file mode 100644
index df65555..0000000
--- a/meta-oe/recipes-support/vim/files/vimrc
+++ /dev/null
@@ -1,96 +0,0 @@
-" An example for a vimrc file.
-"
-" Maintainer:	Bram Moolenaar <Bram@vim.org>
-" Last change:	2008 Jul 02
-"
-" To use it, copy it to
-"     for Unix and OS/2:  ~/.vimrc
-"	      for Amiga:  s:.vimrc
-"  for MS-DOS and Win32:  $VIM\_vimrc
-"	    for OpenVMS:  sys$login:.vimrc
-
-" When started as "evim", evim.vim will already have done these settings.
-if v:progname =~? "evim"
-  finish
-endif
-
-" Use Vim settings, rather then Vi settings (much better!).
-" This must be first, because it changes other options as a side effect.
-set nocompatible
-
-" allow backspacing over everything in insert mode
-set backspace=indent,eol,start
-
-if has("vms")
-  set nobackup		" do not keep a backup file, use versions instead
-else
-  set backup		" keep a backup file
-endif
-set history=50		" keep 50 lines of command line history
-set ruler		" show the cursor position all the time
-set showcmd		" display incomplete commands
-set incsearch		" do incremental searching
-
-" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
-" let &guioptions = substitute(&guioptions, "t", "", "g")
-
-" Don't use Ex mode, use Q for formatting
-map Q gq
-
-" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-" so that you can undo CTRL-U after inserting a line break.
-inoremap <C-U> <C-G>u<C-U>
-
-" In many terminal emulators the mouse works just fine, thus enable it.
-if has('mouse')
-  set mouse=a
-endif
-
-" Switch syntax highlighting on, when the terminal has colors
-" Also switch on highlighting the last used search pattern.
-"if &t_Co > 2 || has("gui_running")
-"  syntax on
-"  set hlsearch
-"endif
-
-" Only do this part when compiled with support for autocommands.
-if has("autocmd")
-
-  " Enable file type detection.
-  " Use the default filetype settings, so that mail gets 'tw' set to 72,
-  " 'cindent' is on in C files, etc.
-  " Also load indent files, to automatically do language-dependent indenting.
-  filetype plugin indent on
-
-  " Put these in an autocmd group, so that we can delete them easily.
-  augroup vimrcEx
-  au!
-
-  " For all text files set 'textwidth' to 78 characters.
-  autocmd FileType text setlocal textwidth=78
-
-  " When editing a file, always jump to the last known cursor position.
-  " Don't do it when the position is invalid or when inside an event handler
-  " (happens when dropping a file on gvim).
-  " Also don't do it when the mark is in the first line, that is the default
-  " position when opening a file.
-  autocmd BufReadPost *
-    \ if line("'\"") > 1 && line("'\"") <= line("$") |
-    \   exe "normal! g`\"" |
-    \ endif
-
-  augroup END
-
-else
-
-  set autoindent		" always set autoindenting on
-
-endif " has("autocmd")
-
-" Convenient command to see the difference between the current buffer and the
-" file it was loaded from, thus the changes you made.
-" Only define it when not defined already.
-if !exists(":DiffOrig")
-  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
-		  \ | wincmd p | diffthis
-endif
diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index 359e2c5..fbc0861 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -15,7 +15,6 @@ SRC_URI = " \
     ftp://ftp.${PN}.org/pub/${PN}/unix/${PN}-${PV_MAJOR}.tar.bz2;name=${VIMDIR} \
     ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-extra.tar.gz;name=${VIMDIR}-extra \
     ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-lang.tar.gz;name=${VIMDIR}-lang \
-    file://vimrc \
 "
 
 S = "${WORKDIR}/${VIMDIR}/src"
@@ -57,10 +56,12 @@ EXTRA_OECONF = " \
     STRIP=/bin/true \
 "
 
-# Work around rpm picking up csh as a dep
 do_install_append() {
+    # Work around rpm picking up csh as a dep
     chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132
-    install -m 0644 ${WORKDIR}/vimrc ${D}/${datadir}/${PN}
+
+    # Install example vimrc from runtime files
+    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${PN}/vimrc
 }
 
 PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
-- 
1.7.10.4



