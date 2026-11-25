Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37946.1795594110931847296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I6KwtIF/;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38692f62b22so6065982eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594110; x=1796198910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tHQ8xLNmOM5UCVgqyIY/UCRMiTDkpAQ565djX7vEh8=;
        b=I6KwtIF/d0vvVtCpXiEd6LcFsx94LGyvtQm5JgQEjCNBKJNlXXZJZqm/GtAI9f/g01
         /Y6rG7VWN9yooCXUju/G/l8B8gMNIXpKyT2YdEedVCkA/OLaf9SDJl5BcdKOcRhyp22G
         e+WR4TRa1GdzyQQUbN9aoDVsWEPON1s2fmqBt9Upgy1lqcrtilXZ87dkDBRuECww4Nig
         cmG7pZKZWLlpgpcn8cMCtIG5WikUO07xxRquXai66I/6ap/ONLK9cxhzd2pK8Tlbz+w1
         nixRvhMBbA94u9H+j6qgI1hqPsUS/A+vGeOgsz+Vd7vkH/SOvoXO7RhqGvGCBw3jccAy
         Y5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594110; x=1796198910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tHQ8xLNmOM5UCVgqyIY/UCRMiTDkpAQ565djX7vEh8=;
        b=KW4O7S7hgRbCQi/07Ov9u2u3hyLkSo/a/v2URVWs+6EZvrih6ArJeMMTwRaf/XC7oM
         KfsrhxRYfK6hJ8x8eIql6xY7BfD77f5F1b2Q1w6Gw+Oj0Y+PFQq/xb5M/jHp7id0Ozb6
         +45ehyRM8FxFG4GsszaFEyj5zx53Zg03Yh2gHSrVmyA5FvMGclSH2J0GS+MsqN4YGw92
         dzPTU9Un0L8/7OA0CacRDahjEuJlMDzEzFo2cY9SVClElASbCrbLFvNwNM3zAYbhpsiQ
         peSbQ4YHE/ZrRk9vmT0GMhmJpiY8np7hSbj1gT+dbXOp6bxJk+Yn1Sp8KtURdqwUfSdx
         FnEA==
X-Gm-Message-State: APuU4Z9Twrtumf1w5Jy3akjqHXoHmr3OqH+V8gNr8j12nrZ+NxJ5sDdH
	WG8cLO1ihrHiv825WaVIt1y/WrZ9dnRCMmQpoVX8EIDuzZnnPboCWXQw5bhwdT9F
X-Gm-Gg: AZFdTZdHvShkLHRbLQLNYfvtOfZ4VbeKRk3XSejvTpW4EgeiFBjJ6BMR2xCFsgPSMFH
	oPvo6WjpYDqTCauX/tgDZxO/YST7lgThAhnj1CUZA/hoe7mUFLSrqVila0Rfa8wjc43nZ5miQhY
	kpk1kzLxGy7Y3yuEv58qyJ7CwgmOJwT6pdQK4X5pyEWe9xRhtBnkU8j8uwVrbe2smhZjQw/qG6n
	yfTxr4EAKyi49lmYGG/0SnzLjpaspWpF0/kGE+cOjkCacNOh2Wsk5RbHsBF9olMwAPF6vabCuJs
	QsNZf6u4egOGL8b3SrN+8MdBXfXP+f/9Egy6HwzMdIk2+9thLu9MwNORN0jf48eh7+n3EqrYr1n
	ztfUCmH709w8HyqC8R1oKGwC8EK4ZdxQX4LRBAsO4a3AxK+hOe2ASYmO5n6fVJAJZYj9lyQBbsL
	hH3obLpZDoVsPwBqlH8aTVyFo4Pv08DTfImVyI6e5BZRPTz50XKstynQcjrCdcRUMJuKVCvMhQJ
	OZ0txufM6ffVg7VepSpDI9IRFaGNlC+1JW4w5mOMarnGCHUmrWd++/530o8D4EdUwNV3j1A21ON
	+EEmlU80NIDsbRiliEns3k7EkukRijvdxHOuQl1XUBMLs2e6+rpDMOS/IJnYGUOrAYyfEL1fXw4
	/TcCCr46l+ap2m1QyPuxIqF/zS/SaylEzluvGxjnND7eq4oZrXaN7C4J81ns0G2CMwY8MpkO/8u
	/PyKLYx4xRPe9XK6mm7Yvven9Ajtyc6UCX1RMbUkcnl/2FalFmqgkRAnF0z9B+UkeHFK/AgbjHO
	CPib4xfAhHlQd0TnKMZLapTlN491IjpRC6ZdsMo38XSQGYHhhZmJGqlM9e3k1IFRADXIx4M/5HI
	pN18
X-Received: by 2002:a05:7300:f0c2:b0:386:688:7f25 with SMTP id 5a478bee46e88-386068880f5mr17128067eec.18.1795594110016;
        Wed, 25 Nov 2026 00:08:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 38/55] emacs: upgrade 30.2 -> 31.1
Date: Wed, 25 Nov 2026 00:06:54 -0800
Message-ID: <20261125080732.2419614-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133041
Content-Type: text/plain; charset="utf-8"

Upstream changes (etc/NEWS):
- The unexec dumper is removed, and the old 'ctags' program is no
  longer built or installed (etags remains).
- New configure option --with-systemduserunitdir.
- xterm-mouse-mode is on by default in compatible terminals; child
  frames are supported on TTY frames.
- site-start.el now loads before the early init file.
- Org updated to 9.8; IDLWAVE moved to GNU ELPA.

Drop the tree-sitter 0.26 support patch, it is part of 31.1. Refresh
use-emacs-native-tools-for-cross-compiling.patch: the dmpstruct.h rule
now calls $(AWK) instead of awk, so the first src/Makefile.in hunk no
longer applied. The other patches apply without fuzz. The recipe already
uses --with-dumping=none, so the unexec removal does not affect it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../emacs/{emacs_30.2.bb => emacs_31.1.bb}    |   7 +-
 ...t-Tree-sitter-version-0.26-and-later.patch | 118 ------------------
 ...acs-native-tools-for-cross-compiling.patch |  90 ++++++-------
 3 files changed, 47 insertions(+), 168 deletions(-)
 rename meta-oe/recipes-support/emacs/{emacs_30.2.bb => emacs_31.1.bb} (98%)
 delete mode 100644 meta-oe/recipes-support/emacs/files/0001-Support-Tree-sitter-version-0.26-and-later.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_30.2.bb b/meta-oe/recipes-support/emacs/emacs_31.1.bb
similarity index 98%
rename from meta-oe/recipes-support/emacs/emacs_30.2.bb
rename to meta-oe/recipes-support/emacs/emacs_31.1.bb
index 839036d987..bf2549f025 100644
--- a/meta-oe/recipes-support/emacs/emacs_30.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_31.1.bb
@@ -4,10 +4,7 @@ HOMEPAGE = "https://www.gnu.org/software/emacs/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = " \
-    ${GNU_MIRROR}/emacs/${BP}.tar.xz \
-    file://0001-Support-Tree-sitter-version-0.26-and-later.patch \
-"
+SRC_URI = "${GNU_MIRROR}/emacs/${BP}.tar.xz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/emacs/"
 
 SRC_URI:append:class-target = " \
@@ -16,7 +13,7 @@ SRC_URI:append:class-target = " \
     file://leim_dont-unexport-EMACSDATA.patch \
 "
 
-SRC_URI[sha256sum] = "b3f36f18a6dd2715713370166257de2fae01f9d38cfe878ced9b1e6ded5befd9"
+SRC_URI[sha256sum] = "1da5790d9580c81932b5bf700633114468da7b3412d69faa767daebf974f4586"
 
 CVE_STATUS[CVE-2007-6109] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
diff --git a/meta-oe/recipes-support/emacs/files/0001-Support-Tree-sitter-version-0.26-and-later.patch b/meta-oe/recipes-support/emacs/files/0001-Support-Tree-sitter-version-0.26-and-later.patch
deleted file mode 100644
index f771e56206..0000000000
--- a/meta-oe/recipes-support/emacs/files/0001-Support-Tree-sitter-version-0.26-and-later.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From d587ce8c65a0e22ab0a63ef2873a3dfcfbeba166 Mon Sep 17 00:00:00 2001
-From: Eli Zaretskii <eliz@gnu.org>
-Date: Fri, 17 Oct 2025 14:15:41 +0300
-Subject: [PATCH] Support Tree-sitter version 0.26 and later
-
-* src/treesit.c (init_treesit_functions)
-[TREE_SITTER_LANGUAGE_VERSION >= 15]: Define prototype for, and
-load 'ts_language_abi_version' instead of the deprecated (and
-removed in tree-sitter 0.26) 'ts_language_version'.
-(ts_language_abi_version) [TREE_SITTER_LANGUAGE_VERSION >= 15]:
-Define on WINDOWSNT, instead of 'ts_language_version'.
-(treesit_language_abi_version): New compatibility function.
-(treesit_load_language, Ftreesit_language_abi_version): Use
-'treesit_language_abi_version' instead of 'ts_language_version'.
-(Bug#79627)
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/emacs.git/commit/?id=d587ce8c65a0e22ab0a63ef2873a3dfcfbeba166]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-The hunk for treesit_load_language was applied by hand, the code around
-it differs in 30.2.
----
- src/treesit.c | 36 ++++++++++++++++++++++++++++++++++--
- 1 file changed, 34 insertions(+), 2 deletions(-)
-
-diff --git a/src/treesit.c b/src/treesit.c
---- a/src/treesit.c
-+++ b/src/treesit.c
-@@ -34,7 +34,11 @@
- # include "w32common.h"
- 
- /* In alphabetical order.  */
-+#if TREE_SITTER_LANGUAGE_VERSION >= 15
-+#undef ts_language_abi_version
-+#else
- #undef ts_language_version
-+#endif
- #undef ts_node_child
- #undef ts_node_child_by_field_name
- #undef ts_node_child_count
-@@ -89,7 +93,11 @@
- #undef ts_tree_get_changed_ranges
- #undef ts_tree_root_node
- 
-+#if TREE_SITTER_LANGUAGE_VERSION >= 15
-+DEF_DLL_FN (uint32_t, ts_language_abi_version, (const TSLanguage *));
-+#else
- DEF_DLL_FN (uint32_t, ts_language_version, (const TSLanguage *));
-+#endif
- DEF_DLL_FN (TSNode, ts_node_child, (TSNode, uint32_t));
- DEF_DLL_FN (TSNode, ts_node_child_by_field_name,
- 	    (TSNode, const char *, uint32_t));
-@@ -166,7 +174,11 @@
-   if (!library)
-     return false;
- 
-+#if TREE_SITTER_LANGUAGE_VERSION >= 15
-+  LOAD_DLL_FN (library, ts_language_abi_version);
-+#else
-   LOAD_DLL_FN (library, ts_language_version);
-+#endif
-   LOAD_DLL_FN (library, ts_node_child);
-   LOAD_DLL_FN (library, ts_node_child_by_field_name);
-   LOAD_DLL_FN (library, ts_node_child_count);
-@@ -224,7 +236,11 @@
-   return true;
- }
- 
-+#if TREE_SITTER_LANGUAGE_VERSION >= 15
-+#define ts_language_abi_version fn_ts_language_abi_version
-+#else
- #define ts_language_version fn_ts_language_version
-+#endif
- #define ts_node_child fn_ts_node_child
- #define ts_node_child_by_field_name fn_ts_node_child_by_field_name
- #define ts_node_child_count fn_ts_node_child_count
-@@ -632,6 +648,22 @@
-     }
- }
- 
-+/* This function is a compatibility shim.  Tree-sitter 0.25 introduced
-+   ts_language_abi_version as a replacement for ts_language_version, and
-+   tree-sitter 0.26 removed ts_language_version.  Here we use the fact
-+   that 0.25 bumped TREE_SITTER_LANGUAGE_VERSION to 15, to use the new
-+   function instead of the old one, when Emacs is compiled against
-+   tree-sitter version 0.25 or newer.  */
-+static uint32_t
-+treesit_language_abi_version (const TSLanguage *ts_lang)
-+{
-+#if TREE_SITTER_LANGUAGE_VERSION >= 15
-+  return ts_language_abi_version (ts_lang);
-+#else
-+  return ts_language_version (ts_lang);
-+#endif
-+}
-+
- /* Load the dynamic library of LANGUAGE_SYMBOL and return the pointer
-    to the language definition.
- 
-@@ -746,7 +778,7 @@
-     {
-       *signal_symbol = Qtreesit_load_language_error;
-       *signal_data = list2 (Qversion_mismatch,
--			    make_fixnum (ts_language_version (lang)));
-+			    make_fixnum (treesit_language_abi_version (lang)));
-       return NULL;
-     }
-   return lang;
-@@ -817,7 +849,7 @@
- 						       &signal_data);
-       if (ts_language == NULL)
- 	return Qnil;
--      uint32_t version =  ts_language_version (ts_language);
-+      uint32_t version =  treesit_language_abi_version (ts_language);
-       return make_fixnum((ptrdiff_t) version);
-     }
- }
diff --git a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
index a1b6ea6ddf..c661be1c12 100644
--- a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
+++ b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
@@ -14,20 +14,55 @@ version of the recipe instead.
 
 Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
 
-Index: emacs-29.1/src/Makefile.in
-===================================================================
---- emacs-29.1.orig/src/Makefile.in
-+++ emacs-29.1/src/Makefile.in
-@@ -542,7 +542,7 @@ ifeq ($(CHECK_STRUCTS),true)
+diff --git a/Makefile.in b/Makefile.in
+index 04c21fc..912d455 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -320,7 +320,7 @@ GLIB_COMPILE_SCHEMAS = glib-compile-schemas
+ TRANSFORM = @program_transform_name@
+ 
+ # Prevent any settings in the user environment causing problems.
+-unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
++unexport  EMACSDOC EMACSPATH
+ 
+ # What emacs should be called when installed.
+ EMACS_NAME = `echo emacs | sed '$(TRANSFORM)'`
+diff --git a/lisp/Makefile.in b/lisp/Makefile.in
+index 1142147..f1cd99b 100644
+--- a/lisp/Makefile.in
++++ b/lisp/Makefile.in
+@@ -53,7 +53,7 @@ FIND_DELETE = @FIND_DELETE@
+ # We never change directory before running Emacs, so a relative file
+ # name is fine, and makes life easier.  If we need to change
+ # directory, we can use emacs --chdir.
+-EMACS = ../src/emacs${EXEEXT}
++EMACS = bootstrap-emacs
+ 
+ # Command line flags for Emacs.
+ 
+@@ -112,7 +112,7 @@ MAIN_FIRST = ./emacs-lisp/eieio.el ./emacs-lisp/eieio-base.el \
+   ./org/oc.el ./org/ol.el ./emacs-lisp/cl-lib.el
+ 
+ # Prevent any settings in the user environment causing problems.
+-unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
++unexport EMACSDOC EMACSPATH
+ 
+ # The actual Emacs command run in the targets below.
+ emacs = '$(EMACS)' $(EMACSOPT)
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 111f94f..d30c854 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -518,7 +518,7 @@ ifeq ($(CHECK_STRUCTS),true)
  pdumper.o: dmpstruct.h
  endif
  dmpstruct.h: $(srcdir)/dmpstruct.awk
 -dmpstruct.h: $(libsrc)/make-fingerprint$(EXEEXT) $(dmpstruct_headers)
 +dmpstruct.h:  $(dmpstruct_headers)
- 	$(AM_V_GEN)POSIXLY_CORRECT=1 awk -f $(srcdir)/dmpstruct.awk \
+ 	$(AM_V_GEN)POSIXLY_CORRECT=1 $(AWK) -f $(srcdir)/dmpstruct.awk \
  		$(dmpstruct_headers) > $@
  
-@@ -651,8 +651,7 @@
+@@ -627,8 +627,7 @@ SYSTEM_TYPE = @SYSTEM_TYPE@
  ## Strictly speaking, emacs does not depend directly on all of $lisp,
  ## since not all pieces are used on all platforms.  But DOC depends
  ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp here.
@@ -37,7 +72,7 @@ Index: emacs-29.1/src/Makefile.in
                  $(lispsource)/international/charprop.el ${charsets}
  ifeq ($(SYSTEM_TYPE),cygwin)
  	find ${top_builddir} -name '*.eln' | rebase -v -O -T -
-@@ -695,7 +695,7 @@ endif
+@@ -663,7 +662,7 @@ endif
  $(etc)/DOC: $(libsrc)/make-docfile$(EXEEXT) $(doc_obj)
  	$(AM_V_GEN)$(MKDIR_P) $(etc)
  	$(AM_V_at)rm -f $(etc)/DOC
@@ -46,7 +81,7 @@ Index: emacs-29.1/src/Makefile.in
  	  $(SOME_MACHINE_OBJECTS) $(doc_obj) > $(etc)/DOC
  
  $(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
-@@ -712,7 +712,7 @@ buildobj.h: Makefile
+@@ -680,7 +679,7 @@ buildobj.h: Makefile
  GLOBAL_SOURCES = $(base_obj:.o=.c) $(NS_OBJC_OBJ:.o=.m)
  
  gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
@@ -55,7 +90,7 @@ Index: emacs-29.1/src/Makefile.in
  	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp globals.h
  	$(AM_V_at)echo timestamp > $@
  
-@@ -726,7 +726,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
+@@ -694,7 +693,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
  	$(MAKE) -C $(dir $@) all
  
  ifeq ($(HAVE_PDUMPER),yes)
@@ -64,38 +99,3 @@ Index: emacs-29.1/src/Makefile.in
  else
  MAKE_PDUMPER_FINGERPRINT =
  endif
-Index: emacs-29.1/lisp/Makefile.in
-===================================================================
---- emacs-29.1.orig/lisp/Makefile.in
-+++ emacs-29.1/lisp/Makefile.in
-@@ -53,7 +53,7 @@ FIND_DELETE = @FIND_DELETE@
- # We never change directory before running Emacs, so a relative file
- # name is fine, and makes life easier.  If we need to change
- # directory, we can use emacs --chdir.
--EMACS = ../src/emacs${EXEEXT}
-+EMACS = bootstrap-emacs
- 
- # Command line flags for Emacs.
- 
-@@ -109,7 +109,7 @@ MAIN_FIRST = ./emacs-lisp/eieio.el ./ema
-   ./org/oc.el ./org/ol.el ./emacs-lisp/cl-lib.el
- 
- # Prevent any settings in the user environment causing problems.
--unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
-+unexport EMACSDOC EMACSPATH
- 
- # The actual Emacs command run in the targets below.
- emacs = '$(EMACS)' $(EMACSOPT)
-Index: emacs-29.1/Makefile.in
-===================================================================
---- emacs-29.1.orig/Makefile.in
-+++ emacs-29.1/Makefile.in
-@@ -328,7 +328,7 @@ GLIB_COMPILE_SCHEMAS = glib-compile-sche
- TRANSFORM = @program_transform_name@
- 
- # Prevent any settings in the user environment causing problems.
--unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
-+unexport  EMACSDOC EMACSPATH
- 
- # What emacs should be called when installed.
- EMACS_NAME = `echo emacs | sed '$(TRANSFORM)'`
