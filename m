Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9309B734B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 12:24:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r12so13305100wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2016 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=LAKhkHwtkWAOgAUf164h7cg0qRMNpQguh1PIGwELtj0=;
	b=IX0hUzIpRMI7HZuIM1mHBXe5MGaV3vLq+dczDVIyD466R9EUyjoo9C4mqKRfEDyaWR
	h+6ZTVxNKbLcR7IpT6X907eN61oVWTYncs/tNISFBRaDr5ltew7AjX4gE5FlrTy7/X8d
	hQsDnDi54qyYKWMxVKyL3nuYRBllwfwf8pamcpm9a5yPly0nUhznVBY30GttrYTY6Vcb
	Q3ZbFILrGIGPDeGAtTb0h+GgnTQ3j9SGvO3WtpsRPdio0zANWxXYx0XhpuOGtmVsTmQX
	9t70INdaUaqcNQNGUOBRI6rW19mj80IUNIuHvR46Pg4TVJAv4hGrJPFYXU/tVJBSlPwO
	/Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=LAKhkHwtkWAOgAUf164h7cg0qRMNpQguh1PIGwELtj0=;
	b=LAfXOi2u8HeSn0hbBE0B/iRoOXXWfiJIf/gN+SkJy6NlM0L8clgImROB99/k+567rb
	4bB5xDV6ln7sujFtOFrq1wLHxmJBuI8+oSDM6XIzJkC83YxmyXaV/oErR3gswcPWbSRn
	clU0HCN4DA88T94qIDTHcxXcpxZOoAKt9zZ10hLSv4Gt+9tSyp3IJ8JTHp/I8tnb8ndp
	wV+nd9+EFTI5AASPPPvEfIaGCnvLFXgOrmUtb9tJoWTqmlcODVQEqhgIeNkTWKmehjWG
	yq85NzCNLU/L4VlolwvFoBK5E1QQ54gMRlqEIvaT+9cgJFKJfexEFZ2aiN8jmHZDTBRC
	HYVQ==
X-Gm-Message-State: AOPr4FXEWiV9/BkAgB4cKwNhVi1RarkDS0BxCShbWLCPBJ3/qFXp2ffRO/KA1OTyHIYtlg==
X-Received: by 10.28.144.11 with SMTP id s11mr13341100wmd.72.1462105470233;
	Sun, 01 May 2016 05:24:30 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	r123sm13111271wmg.20.2016.05.01.05.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 May 2016 05:24:29 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 May 2016 13:24:55 +0100
Message-Id: <1462105495-21996-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] vim: Upgrade to v7.4.1689
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
X-List-Received-Date: Sun, 01 May 2016 12:24:34 -0000

v7.4.1689 is currently used in Debian Testing and Arch Linux.

The tags file used as an index to vim's documentation is not correctly created
when cross compiling in v7.4.1689. Patch 7.4.1733 is backported to fix this
issue.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../vim/files/0001-patch-7.4.1733.patch            | 169 +++++++++++++++++++++
 .../{vim-tiny_7.4.769.bb => vim-tiny_7.4.1689.bb}  |   0
 .../vim/{vim_7.4.769.bb => vim_7.4.1689.bb}        |   6 +-
 3 files changed, 173 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch
 rename meta-oe/recipes-support/vim/{vim-tiny_7.4.769.bb => vim-tiny_7.4.1689.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_7.4.769.bb => vim_7.4.1689.bb} (93%)

diff --git a/meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch b/meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch
new file mode 100644
index 0000000..98cf629
--- /dev/null
+++ b/meta-oe/recipes-support/vim/files/0001-patch-7.4.1733.patch
@@ -0,0 +1,169 @@
+From ff1f017e5ab049557896655535e7d79663f89262 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Thu, 14 Apr 2016 16:46:02 +0200
+Subject: [PATCH] patch 7.4.1733
+
+Problem:    "make install" doesn't know about cross-compiling. (Christian
+            Neukirchen)
+Solution:   Add CROSS_COMPILING. (closes #740)
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Backport
+---
+ src/Makefile       | 19 +++++++++++++++----
+ src/auto/configure |  4 ++++
+ src/config.mk.in   |  1 +
+ src/configure.in   |  3 +++
+ src/version.c      |  2 ++
+ 5 files changed, 25 insertions(+), 4 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index cf9636d..195cbd5 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -1998,23 +1998,25 @@ test1 \
+ 	test70 test71 test72 test73 test74 test75 test76 test77 test78 test79 \
+ 	test80 test81 test82 test83 test84 test85 test86 test87 test88 test89 \
+ 	test90 test91 test92 test93 test94 test95 test97 test98 test99 \
+-	test100 test101 test102 test103 test104 test105 test107 test108:
++	test100 test101 test102 test103 test104 test107 test108:
+ 	cd testdir; rm -f $@.out; $(MAKE) -f Makefile $@.out VIMPROG=../$(VIMTARGET) $(GUI_TESTARG) SCRIPTSOURCE=../$(SCRIPTSOURCE)
+ 
+ # Run individual NEW style test, assuming that Vim was already compiled.
+ test_arglist \
+ 	test_assert \
+ 	test_assign \
++	test_autocmd \
+ 	test_backspace_opt \
+ 	test_cdo \
+ 	test_channel \
+ 	test_cursor_func \
+ 	test_delete \
+ 	test_ex_undo \
+-	test_expr \
+ 	test_expand \
++	test_expr \
+ 	test_feedkeys \
+ 	test_file_perm \
++	test_fnamemodify \
+ 	test_glob2regpat \
+ 	test_hardcopy \
+ 	test_help_tagjump \
+@@ -2024,17 +2026,22 @@ test_arglist \
+ 	test_json \
+ 	test_langmap \
+ 	test_lispwords \
++	test_matchstrpos \
+ 	test_menu \
+ 	test_packadd \
+ 	test_partial \
+ 	test_perl \
+ 	test_quickfix \
++	test_regexp_latin \
++	test_regexp_utf8 \
+ 	test_reltime \
+ 	test_searchpos \
+ 	test_set \
+ 	test_sort \
++	test_statusline \
+ 	test_syn_attr \
+ 	test_syntax \
++	test_tabline \
+ 	test_timers \
+ 	test_undolevels \
+ 	test_unlet \
+@@ -2042,6 +2049,8 @@ test_arglist \
+ 	test_viml \
+ 	test_visual \
+ 	test_window_id \
++	test_alot_latin \
++	test_alot_utf8 \
+ 	test_alot:
+ 	cd testdir; rm -f $@.res test.log messages; $(MAKE) -f Makefile $@.res VIMPROG=../$(VIMTARGET) $(GUI_TESTARG) SCRIPTSOURCE=../$(SCRIPTSOURCE)
+ 	@if test -f testdir/test.log; then \
+@@ -2126,9 +2135,11 @@ installrtbase: $(HELPSOURCE)/vim.1 $(DEST_VIM) $(DEST_RT) \
+ # Generate the help tags with ":helptags" to handle all languages.
+ # Move the distributed tags file aside and restore it, to avoid it being
+ # different from the repository.
+-	cd $(HELPSOURCE); if test -f tags; then mv -f tags tags.dist; fi
++	cd $(HELPSOURCE); if test -z "$(CROSS_COMPILING)" -a -f tags; then \
++		mv -f tags tags.dist; fi
+ 	@echo generating help tags
+-	-@cd $(HELPSOURCE); $(MAKE) VIMEXE=$(DEST_BIN)/$(VIMTARGET) vimtags
++	-@cd $(HELPSOURCE); if test -z "$(CROSS_COMPILING)"; then \
++		$(MAKE) VIMEXE=$(DEST_BIN)/$(VIMTARGET) vimtags; fi
+ 	cd $(HELPSOURCE); \
+ 		files=`ls *.txt tags`; \
+ 		files="$$files `ls *.??x tags-?? 2>/dev/null || true`"; \
+diff --git a/src/auto/configure b/src/auto/configure
+index a708230..91b075d 100755
+--- a/src/auto/configure
++++ b/src/auto/configure
+@@ -721,6 +721,7 @@ OS_EXTRA_OBJ
+ OS_EXTRA_SRC
+ XCODE_SELECT
+ CPP_MM
++CROSS_COMPILING
+ STRIP
+ AWK
+ FGREP
+@@ -4113,11 +4114,14 @@ else
+ $as_echo "no" >&6; }
+ fi
+ 
++CROSS_COMPILING=
+ if test "$cross_compiling" = yes; then
+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: cannot compile a simple program; if not cross compiling check CC and CFLAGS" >&5
+ $as_echo "cannot compile a simple program; if not cross compiling check CC and CFLAGS" >&6; }
++  CROSS_COMPILING=1
+ fi
+ 
++
+ test "$GCC" = yes && CPP_MM=M;
+ 
+ if test -f ./toolcheck; then
+diff --git a/src/config.mk.in b/src/config.mk.in
+index 7c0726c..1002d7c 100644
+--- a/src/config.mk.in
++++ b/src/config.mk.in
+@@ -104,6 +104,7 @@ AWK		= @AWK@
+ STRIP		= @STRIP@
+ 
+ EXEEXT		= @EXEEXT@
++CROSS_COMPILING = @CROSS_COMPILING@
+ 
+ COMPILEDBY	= @compiledby@
+ 
+diff --git a/src/configure.in b/src/configure.in
+index f29b62c..0a8c95b 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -88,9 +88,12 @@ fi
+ 
+ dnl If configure thinks we are cross compiling, there might be something
+ dnl wrong with the CC or CFLAGS settings, give a useful warning message
++CROSS_COMPILING=
+ if test "$cross_compiling" = yes; then
+   AC_MSG_RESULT([cannot compile a simple program; if not cross compiling check CC and CFLAGS])
++  CROSS_COMPILING=1
+ fi
++AC_SUBST(CROSS_COMPILING)
+ 
+ dnl gcc-cpp has the wonderful -MM option to produce nicer dependencies.
+ dnl But gcc 3.1 changed the meaning!  See near the end.
+diff --git a/src/version.c b/src/version.c
+index 8d32e2a..f0630ea 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -749,6 +749,8 @@ static char *(features[]) =
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
++    1733,
++/**/
+     1689,
+ /**/
+     1688,
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.769.bb b/meta-oe/recipes-support/vim/vim-tiny_7.4.1689.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_7.4.769.bb
rename to meta-oe/recipes-support/vim/vim-tiny_7.4.1689.bb
diff --git a/meta-oe/recipes-support/vim/vim_7.4.769.bb b/meta-oe/recipes-support/vim/vim_7.4.1689.bb
similarity index 93%
rename from meta-oe/recipes-support/vim/vim_7.4.769.bb
rename to meta-oe/recipes-support/vim/vim_7.4.1689.bb
index 08e5027..5e6282b 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.769.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.1689.bb
@@ -9,8 +9,9 @@ LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=c74ec0ada9a68354f9461e8
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
+           file://0001-patch-7.4.1733.patch;patchdir=.. \
 "
-SRCREV = "2693ca21cee8a729d74682fd86a4818f2b050228"
+SRCREV = "758535a1df4c5e86b45dddf12db2a54dea28ca40"
 
 S = "${WORKDIR}/git/src"
 
@@ -62,10 +63,11 @@ EXTRA_OECONF = " \
 do_install() {
     autotools_do_install
 
-    # Work around rpm picking up csh or awk or perl as a dep
+    # Work around file-rdeps picking up csh, awk, perl or python as a dep
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
 
     # Install example vimrc from runtime files
     install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
-- 
2.1.4


