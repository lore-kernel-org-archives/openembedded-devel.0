Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id D13567F31E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 02:09:52 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q10so5782239pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 19:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xp8uS+qN0Cyu90fBODmrqQfYpOvxv7O3WJdKz6gcODc=;
	b=OifJRgrwn8Nx5TV2EtUTMaSNcOmUdjQ+3sIYw9mruOGDzD7xY9UaDMn/q///E2wDBo
	OObSJcpxS0FYhIKuvYyG+udJ+S8Uecg6Ya7FfLBJeWSKLST30tADMvdZQ54QXDSAnXiN
	yy0uhasUSqFln/gAz82HtjJWDmUYmHJOsaQA753EMW+gmy1DcFwfENLbhgzrMhJIZhFZ
	gVxnpRNJqgFyEduD5oAsyLJG+6y2Wf4w47tK7tuF+lsroGKzOQP7dIq5RoJBxAiQYeiS
	4VWvtXMAyhzZ+egHDnM+wH+ojzpdcMG31DY4v+NTGfgFx7yl2xd7Srw/bDrM5snt2Fe3
	9rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xp8uS+qN0Cyu90fBODmrqQfYpOvxv7O3WJdKz6gcODc=;
	b=b1HU9Gfq+4EbNmb90F0Pd7WlXWAklQZ6w9Wn1PgP3hIP7iG4U58jqKpG6BKvEqDEKc
	Mg7gt7GweVA1LO8MyN2hDQL9tpJ6adw9U8Ecqk/y19LgS3k6Tkkpx2Dn/q+YUluOKN2E
	44kzl0kfMYaE2gkV/p9z7A/NtEe59aTmPB9DXHJJzYvFZQW2ifa8tEGwfF6LVFTx81q/
	Uty24dGqwtDcuYSeSKems48lsy/dSttk7nS05ZncrjIBmdJ3DZlP4QAPXQjWZv4MR4Jw
	iWFlEJLiPlG4h6YI4WxbS831AInZmlS7cLGQW9RgRfNVZjhsy6gmS0z7wnQZAN1xRTYM
	4rIQ==
X-Gm-Message-State: APjAAAU15xjiwiAqBvOkH9TPI1g36Xq5uhppKJXeANW5csg3w2j/WlB3
	CJtSBWMsWY6X9SpjPX2rrScjDFjZwD4=
X-Google-Smtp-Source: APXvYqybMqjoRGs0t/Jlc1eyUyYoe3Xan9F2K2CIj6cNGbMMWdmxo4Q7zAbPgWkCUJZ4Nq4pSN1Jog==
X-Received: by 2002:a17:90a:3d03:: with SMTP id
	h3mr8131796pjc.49.1569031792982; 
	Fri, 20 Sep 2019 19:09:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j126sm5417259pfb.186.2019.09.20.19.09.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 19:09:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Sep 2019 19:09:39 -0700
Message-Id: <20190921020939.2434810-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] uim: Update to 1.8.8
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
X-List-Received-Date: Sat, 21 Sep 2019 02:09:52 -0000
Content-Transfer-Encoding: 8bit

License-Update: Change URI from code.google.com to github.com [1]
Drop the patches they seem to be not needed
Add dependency on libedit

Disable parallel make due to races

aarch64 support is upstream so drop the patch

[1] https://github.com/uim/uim/commit/a1cf71ec3719389874c42dd4c719a15509983485#diff-7116ef0705885343c9e1b2171a06be0e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uim/0001-Add-support-for-aarch64.patch    | 80 -------------------
 .../uim/0001-fix-bug-for-cross-compile.patch  | 24 +++---
 .../uim/uim/uim-module-manager.patch          |  4 +-
 .../uim/{uim_1.8.6.bb => uim_1.8.8.bb}        | 17 ++--
 4 files changed, 22 insertions(+), 103 deletions(-)
 delete mode 100644 meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
 rename meta-oe/recipes-support/uim/{uim_1.8.6.bb => uim_1.8.8.bb} (90%)

diff --git a/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch b/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
deleted file mode 100644
index 391b0e68b0..0000000000
--- a/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 82f44f53b9a9766c2ec816f237506beb953eb332 Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@suse.de>
-Date: Wed, 29 Oct 2014 14:18:28 +0100
-Subject: [PATCH] Add support for aarch64
-
-* include/private/gcconfig.h: Add support for aarch64.
-
----
- sigscheme/libgcroots/include/private/gcconfig.h | 37 +++++++++++++++++++++++++
- 1 file changed, 37 insertions(+)
-
-diff --git a/sigscheme/libgcroots/include/private/gcconfig.h b/sigscheme/libgcroots/include/private/gcconfig.h
-index 4d42b03..0f13db6 100644
---- a/sigscheme/libgcroots/include/private/gcconfig.h
-+++ b/sigscheme/libgcroots/include/private/gcconfig.h
-@@ -62,6 +62,13 @@
- # endif
- 
- /* Determine the machine type: */
-+# if defined(__aarch64__)
-+#    define AARCH64
-+#    if !defined(LINUX)
-+#      define NOSYS
-+#      define mach_type_known
-+#    endif
-+# endif
- # if defined(__arm__) || defined(__thumb__)
- #    define ARM32
- #    if !defined(LINUX) && !defined(NETBSD)
-@@ -231,6 +238,10 @@
- #    define IA64
- #    define mach_type_known
- # endif
-+# if defined(LINUX) && defined(__aarch64__)
-+#    define AARCH64
-+#    define mach_type_known
-+# endif
- # if defined(LINUX) && defined(__arm__)
- #    define ARM32
- #    define mach_type_known
-@@ -504,6 +515,7 @@
- 		    /* 			running Amdahl UTS4		*/
-                     /*             S390       ==> 390-like machine      */
- 		    /*                  running LINUX                   */
-+                    /*             AARCH64    ==> ARM AArch64           */
- 		    /* 		   ARM32      ==> Intel StrongARM	*/
- 		    /* 		   IA64	      ==> Intel IPF		*/
- 		    /*				  (e.g. Itanium)	*/
-@@ -1724,6 +1736,31 @@
- #   endif
- # endif
- 
-+# ifdef AARCH64
-+#   define CPP_WORDSZ 64
-+#   define MACH_TYPE "AARCH64"
-+#   define ALIGNMENT 8
-+#   ifndef HBLKSIZE
-+#     define HBLKSIZE 4096
-+#   endif
-+#   ifdef LINUX
-+#     define OS_TYPE "LINUX"
-+#     define LINUX_STACKBOTTOM
-+#     define DYNAMIC_LOADING
-+      extern int __data_start[];
-+#     define DATASTART ((ptr_t)__data_start)
-+      extern char _end[];
-+#     define DATAEND ((ptr_t)(&_end))
-+#   endif
-+#   ifdef NOSYS
-+      /* __data_start is usually defined in the target linker script.   */
-+      extern int __data_start[];
-+#     define DATASTART ((ptr_t)__data_start)
-+      extern void *__stack_base__;
-+#     define STACKBOTTOM ((ptr_t)__stack_base__)
-+#   endif
-+# endif
-+
- # ifdef ARM32
- #   define CPP_WORDSZ 32
- #   define MACH_TYPE "ARM32"
diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
index 0c8f02d6ce..510a8c8407 100644
--- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
+++ b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
@@ -9,18 +9,16 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 9be879c..9249bfd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1208,8 +1208,8 @@ AC_HELP_STRING([--with-libedit[=DIR], Enable libedit support
- if test "x$use_libedit" != "xno"; then
-     saved_CPPFLAGS=$CPPFLAGS
-     saved_LDFLAGS=$LDFLAGS
--    CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
--    LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
-+    CPPFLAGS="${CPPFLAGS} "
-+    LDFLAGS="${LDFLAGS} "
-     AC_CHECK_LIB(curses, tgetent, LIBEDIT_LIBS="-lcurses",
-         [AC_CHECK_LIB(ncurses, tgetent, LIBEDIT_LIBS="-lncurses",
-             AC_MSG_WARN("libedit needs libcurses or libncurses. disabled...")
+@@ -1317,8 +1317,8 @@ if test "x$with_libedit" != xno; then
+ 
+   saved_CPPFLAGS=$CPPFLAGS
+   saved_LDFLAGS=$LDFLAGS
+-  CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
+-  LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
++  CPPFLAGS="${CPPFLAGS}"
++  LDFLAGS="${LDFLAGS}"
+   AC_CHECK_LIB(curses, tgetent, LIBEDIT_LIBS="-lcurses",
+     [AC_CHECK_LIB(ncurses, tgetent, LIBEDIT_LIBS="-lncurses",
+       AC_MSG_WARN("libedit needs libcurses or libncurses. disabled...")
diff --git a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
index 3078af0586..0fafc8533e 100644
--- a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
+++ b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
@@ -6,11 +6,9 @@ Date: Fri, 26 Jun 2015 12:57:48 +0900
  scm/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/scm/Makefile.am b/scm/Makefile.am
-index 14d9393..e8a1083 100644
 --- a/scm/Makefile.am
 +++ b/scm/Makefile.am
-@@ -119,7 +119,7 @@ if EXPAT
+@@ -115,7 +115,7 @@ if EXPAT
    module_names += "yahoo-jp"
  endif
  
diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.8.bb
similarity index 90%
rename from meta-oe/recipes-support/uim/uim_1.8.6.bb
rename to meta-oe/recipes-support/uim/uim_1.8.8.bb
index 1c58d40b1d..cc28e6e8fd 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.8.bb
@@ -1,19 +1,19 @@
 DESCRIPTION = "A multilingual user input method library"
 HOMEPAGE = "http://uim.freedesktop.org/"
 LICENSE = "BSD-3-Clause & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab2826b41ca0ff4030d38cc39791d1c8"
 SECTION = "inputmethods"
 
-SRC_URI = "https://github.com/uim/uim/releases/download/uim-${PV}/uim-${PV}.tar.bz2"
+SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2"
 
-SRC_URI_append_class-target = " file://uim-module-manager.patch \
+SRC_URI_append_class-target = "\
+    file://uim-module-manager.patch \
     file://0001-fix-bug-for-cross-compile.patch \
-    file://0001-Add-support-for-aarch64.patch \
 "
-SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
-SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
+SRC_URI[md5sum] = "01c7bd5d0d4f3a9f6f5befe6f57a470b"
+SRC_URI[sha256sum] = "34599bbcc4e5ab87832370763e38be5100984a64237555e9234a1ea225a0fadc"
 
-DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
+DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool libedit"
 DEPENDS_append_class-target = " intltool-native gtk+ gtk+3 uim-native takao-fonts"
 
 RDEPENDS_uim = "libuim0 libedit"
@@ -39,6 +39,9 @@ EXTRA_OECONF += "--disable-emacs \
 
 CONFIGUREOPTS_remove_class-target = "--disable-silent-rules"
 
+# https://github.com/uim/uim/issues/44
+PARALLEL_MAKE = ""
+
 #Because m4 file's find maxdepth=2, so copy the m4 files of the deep depth.
 do_configure_prepend () {
     cp ${S}/sigscheme/m4/* ${S}/m4/
-- 
2.23.0


