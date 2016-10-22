Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E927671A73
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2016 20:20:28 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d199so3800837wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2016 13:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=X36FIzFE1OIfminnSieXGIK2fDUrjP5jRi3SLIoL4cc=;
	b=dt/f8qnqhwwD+kW8rFTXWeQTA4jCWjIuMG+2vJXxZQyP7EyO+gBWF5UayOUASZraOV
	9KmmGaTual/O+QDf8ob2xJci5REGIFGosXovtMTrNEoOqGsL22X1R7riv4T8QZGHERD5
	6oa/9gBD0+tkZ8D22/wIUN4LR4uSK5U2QKtmii/i0+iBS4hS12HIitBdJSUK6eLAYyl8
	iMivG0o+YF2nGFGrDvX9my1MpLNoxumrG3L5jXjoEk4eZarRXPIjSMbzeqZ9dY+BLdbh
	mctvD5jTgdIRWK/fGKFl5cM8d8ypm6CpI8EbEctfF67dWkNkg6UY74SVyXaG9yGKZY19
	7mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=X36FIzFE1OIfminnSieXGIK2fDUrjP5jRi3SLIoL4cc=;
	b=UzUskgfGcD1C+3bOL0CJ3PnSSdW+g/qiHdwji51Z2RzMGGxJubTxmEosdp9/ALV/4P
	tDSCUR9OkvXMEeTKl2pJOXbdTDJRRP7SoWpAMmD+02TyqEaJX91bxmk9CPn0gRVNVuKA
	Wm2XrwLhGpiHf3PbGTgUVqpR7CkRN6QVYLOKZMWodTETdtbsIowCWeJgaVwv1TNyHFu9
	cwi+VKFwcad/jV8h/vn3PPILcIW/dpT/W2nVht9PSNHZFNb+ov5icDrzl8w/l/f0bYxF
	fChepVmcyE0fpq8LhCQoFwqui+OJRvHBS09MpAE6OAhn/5KXGRYd2/OdJIzwr8MwDXzT
	70Uw==
X-Gm-Message-State: AA6/9Rl85eF5ImUPCg2ste0lfb8gog9qolClFRuzx+bfIwZ2v+sThd9ezRfJe9TT61dEOg==
X-Received: by 10.28.93.137 with SMTP id r131mr14856523wmb.2.1477167629493;
	Sat, 22 Oct 2016 13:20:29 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id f7sm8887743wjw.21.2016.10.22.13.20.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Oct 2016 13:20:28 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OpenEmbedded Devel <openembedded-devel@lists.openembedded.org>
Date: Sat, 22 Oct 2016 21:20:09 +0100
Message-Id: <1477167609-9011-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] vim: Update to v8.0.0022
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Oct 2016 20:20:29 -0000

v8.0.0022 is currently used in Debian Testing.

In the license file (uganda.txt) only the version number has changed.

The new version installs icons for gvim into /usr/share/icons. For now these are
just placed in the vim-common package as they use only a kB or so.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../vim/files/0001-patch-7.4.1733.patch            | 169 ---------------------
 .../{vim-tiny_7.4.1689.bb => vim-tiny_8.0.0022.bb} |   0
 .../vim/{vim_7.4.1689.bb => vim_8.0.0022.bb}       |   6 +-
 3 files changed, 3 insertions(+), 172 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch
 rename meta-oe/recipes-support/vim/{vim-tiny_7.4.1689.bb => vim-tiny_8.0.0022.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_7.4.1689.bb => vim_8.0.0022.bb} (94%)

diff --git a/meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch b/meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch
deleted file mode 100644
index 98cf629..0000000
--- a/meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From ff1f017e5ab049557896655535e7d79663f89262 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Thu, 14 Apr 2016 16:46:02 +0200
-Subject: [PATCH] patch 7.4.1733
-
-Problem:    "make install" doesn't know about cross-compiling. (Christian
-            Neukirchen)
-Solution:   Add CROSS_COMPILING. (closes #740)
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Backport
----
- src/Makefile       | 19 +++++++++++++++----
- src/auto/configure |  4 ++++
- src/config.mk.in   |  1 +
- src/configure.in   |  3 +++
- src/version.c      |  2 ++
- 5 files changed, 25 insertions(+), 4 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index cf9636d..195cbd5 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -1998,23 +1998,25 @@ test1 \
- 	test70 test71 test72 test73 test74 test75 test76 test77 test78 test79 \
- 	test80 test81 test82 test83 test84 test85 test86 test87 test88 test89 \
- 	test90 test91 test92 test93 test94 test95 test97 test98 test99 \
--	test100 test101 test102 test103 test104 test105 test107 test108:
-+	test100 test101 test102 test103 test104 test107 test108:
- 	cd testdir; rm -f $@.out; $(MAKE) -f Makefile $@.out VIMPROG=../$(VIMTARGET) $(GUI_TESTARG) SCRIPTSOURCE=../$(SCRIPTSOURCE)
- 
- # Run individual NEW style test, assuming that Vim was already compiled.
- test_arglist \
- 	test_assert \
- 	test_assign \
-+	test_autocmd \
- 	test_backspace_opt \
- 	test_cdo \
- 	test_channel \
- 	test_cursor_func \
- 	test_delete \
- 	test_ex_undo \
--	test_expr \
- 	test_expand \
-+	test_expr \
- 	test_feedkeys \
- 	test_file_perm \
-+	test_fnamemodify \
- 	test_glob2regpat \
- 	test_hardcopy \
- 	test_help_tagjump \
-@@ -2024,17 +2026,22 @@ test_arglist \
- 	test_json \
- 	test_langmap \
- 	test_lispwords \
-+	test_matchstrpos \
- 	test_menu \
- 	test_packadd \
- 	test_partial \
- 	test_perl \
- 	test_quickfix \
-+	test_regexp_latin \
-+	test_regexp_utf8 \
- 	test_reltime \
- 	test_searchpos \
- 	test_set \
- 	test_sort \
-+	test_statusline \
- 	test_syn_attr \
- 	test_syntax \
-+	test_tabline \
- 	test_timers \
- 	test_undolevels \
- 	test_unlet \
-@@ -2042,6 +2049,8 @@ test_arglist \
- 	test_viml \
- 	test_visual \
- 	test_window_id \
-+	test_alot_latin \
-+	test_alot_utf8 \
- 	test_alot:
- 	cd testdir; rm -f $@.res test.log messages; $(MAKE) -f Makefile $@.res VIMPROG=../$(VIMTARGET) $(GUI_TESTARG) SCRIPTSOURCE=../$(SCRIPTSOURCE)
- 	@if test -f testdir/test.log; then \
-@@ -2126,9 +2135,11 @@ installrtbase: $(HELPSOURCE)/vim.1 $(DEST_VIM) $(DEST_RT) \
- # Generate the help tags with ":helptags" to handle all languages.
- # Move the distributed tags file aside and restore it, to avoid it being
- # different from the repository.
--	cd $(HELPSOURCE); if test -f tags; then mv -f tags tags.dist; fi
-+	cd $(HELPSOURCE); if test -z "$(CROSS_COMPILING)" -a -f tags; then \
-+		mv -f tags tags.dist; fi
- 	@echo generating help tags
--	-@cd $(HELPSOURCE); $(MAKE) VIMEXE=$(DEST_BIN)/$(VIMTARGET) vimtags
-+	-@cd $(HELPSOURCE); if test -z "$(CROSS_COMPILING)"; then \
-+		$(MAKE) VIMEXE=$(DEST_BIN)/$(VIMTARGET) vimtags; fi
- 	cd $(HELPSOURCE); \
- 		files=`ls *.txt tags`; \
- 		files="$$files `ls *.??x tags-?? 2>/dev/null || true`"; \
-diff --git a/src/auto/configure b/src/auto/configure
-index a708230..91b075d 100755
---- a/src/auto/configure
-+++ b/src/auto/configure
-@@ -721,6 +721,7 @@ OS_EXTRA_OBJ
- OS_EXTRA_SRC
- XCODE_SELECT
- CPP_MM
-+CROSS_COMPILING
- STRIP
- AWK
- FGREP
-@@ -4113,11 +4114,14 @@ else
- $as_echo "no" >&6; }
- fi
- 
-+CROSS_COMPILING=
- if test "$cross_compiling" = yes; then
-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: cannot compile a simple program; if not cross compiling check CC and CFLAGS" >&5
- $as_echo "cannot compile a simple program; if not cross compiling check CC and CFLAGS" >&6; }
-+  CROSS_COMPILING=1
- fi
- 
-+
- test "$GCC" = yes && CPP_MM=M;
- 
- if test -f ./toolcheck; then
-diff --git a/src/config.mk.in b/src/config.mk.in
-index 7c0726c..1002d7c 100644
---- a/src/config.mk.in
-+++ b/src/config.mk.in
-@@ -104,6 +104,7 @@ AWK		= @AWK@
- STRIP		= @STRIP@
- 
- EXEEXT		= @EXEEXT@
-+CROSS_COMPILING = @CROSS_COMPILING@
- 
- COMPILEDBY	= @compiledby@
- 
-diff --git a/src/configure.in b/src/configure.in
-index f29b62c..0a8c95b 100644
---- a/src/configure.in
-+++ b/src/configure.in
-@@ -88,9 +88,12 @@ fi
- 
- dnl If configure thinks we are cross compiling, there might be something
- dnl wrong with the CC or CFLAGS settings, give a useful warning message
-+CROSS_COMPILING=
- if test "$cross_compiling" = yes; then
-   AC_MSG_RESULT([cannot compile a simple program; if not cross compiling check CC and CFLAGS])
-+  CROSS_COMPILING=1
- fi
-+AC_SUBST(CROSS_COMPILING)
- 
- dnl gcc-cpp has the wonderful -MM option to produce nicer dependencies.
- dnl But gcc 3.1 changed the meaning!  See near the end.
-diff --git a/src/version.c b/src/version.c
-index 8d32e2a..f0630ea 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -749,6 +749,8 @@ static char *(features[]) =
- static int included_patches[] =
- {   /* Add new patch number below this line */
- /**/
-+    1733,
-+/**/
-     1689,
- /**/
-     1688,
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.1689.bb b/meta-oe/recipes-support/vim/vim-tiny_8.0.0022.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_7.4.1689.bb
rename to meta-oe/recipes-support/vim/vim-tiny_8.0.0022.bb
diff --git a/meta-oe/recipes-support/vim/vim_7.4.1689.bb b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
similarity index 94%
rename from meta-oe/recipes-support/vim/vim_7.4.1689.bb
rename to meta-oe/recipes-support/vim/vim_8.0.0022.bb
index f94a497..112ae80 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.1689.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
@@ -4,14 +4,13 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=c74ec0ada9a68354f9461e81d3596f61"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=eea32ac1424bba14096736a494ae9045"
 
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-           file://0001-patch-7.4.1733.patch;patchdir=.. \
 "
-SRCREV = "758535a1df4c5e86b45dddf12db2a54dea28ca40"
+SRCREV = "ec68a99464055029c01082762517e97245ddae0c"
 
 S = "${WORKDIR}/git/src"
 
@@ -98,6 +97,7 @@ FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/plugin \
     ${datadir}/${BPN}/${VIMDIR}/print \
     ${datadir}/${BPN}/${VIMDIR}/spell \
+    ${datadir}/icons \
 "
 
 RDEPENDS_${PN} = "ncurses-terminfo-base"
-- 
2.1.4


