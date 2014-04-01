Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D60176EDF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 20:59:01 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id w10so10019956pde.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 13:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MvmuxsyWqWBR5UwVdLgBDZdLpsTlU3iwIIY+oayexRQ=;
	b=WBCSVEX0io9PcxAFuCniEoggSqeCAcbsRjzS5v+mxRXcUbDghsx12q3IWNY/Vev7uQ
	EX8hi68sV/PCarEQwjvJuHI8ESANQ51UnqiU1AKHorAP4/UyhOPDGkMuUixP1UDQtYqH
	mrNpI88HZryO+he5HgY2lZ9lghcXK3l0MGbPuDTam5IIuiTAuPazNxRQhOf8HpT5PYsg
	xGoGlIw+Nj+vXD74IALly+zA2ruEx0icSXqyss89Zo2mwVldY31QsNjs1Lep7KyjQ/CB
	fWFlf2Polok0eOoE807CKoTd6O2IfhVUERCY+MIMMw/oI3XhmaowAnhx6WAo8HreNypi
	BtKw==
X-Received: by 10.66.190.138 with SMTP id gq10mr17486758pac.108.1396385942559; 
	Tue, 01 Apr 2014 13:59:02 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	zb2sm51982399pbc.30.2014.04.01.13.59.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Apr 2014 13:59:01 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 13:58:38 -0700
Message-Id: <1396385919-5924-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/1] upgrade gnuplot to version 4.6.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 20:59:08 -0000

Applied changes in patch from Tim Orling, updated license to gnuplot.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 .../gnuplot/gnuplot-4.4.4/automake-1.12.x.patch    | 44 ----------------------
 .../lua-loadlibs-configure-in-fix.patch            | 16 ++++++++
 .../{gnuplot-4.4.4 => gnuplot-4.6.5}/subdirs.patch |  0
 meta-oe/recipes-extended/gnuplot/gnuplot.inc       |  3 +-
 .../gnuplot/{gnuplot_4.4.4.bb => gnuplot_4.6.5.bb} |  8 ++--
 5 files changed, 22 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
 rename meta-oe/recipes-extended/gnuplot/{gnuplot-4.4.4 => gnuplot-4.6.5}/subdirs.patch (100%)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_4.4.4.bb => gnuplot_4.6.5.bb} (65%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
deleted file mode 100644
index 51f703c..0000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-
-It's fixed in 4.6 and 4.7(HEAD)
-
-http://sourceforge.net/tracker/?func=detail&aid=3523591&group_id=2055&atid=102055
-
-diff -uNr gnuplot-4.4.4.orig/Makefile.am gnuplot-4.4.4/Makefile.am
---- gnuplot-4.4.4.orig/Makefile.am	2012-07-20 10:54:49.075828905 +0200
-+++ gnuplot-4.4.4/Makefile.am	2012-07-20 10:55:22.380831313 +0200
-@@ -1,5 +1,5 @@
- ## Process this file with automake to produce Makefile.in -*-Makefile-*-
--AUTOMAKE_OPTIONS = foreign 1.2h
-+AUTOMAKE_OPTIONS = foreign
- 
- SUBDIRS = config m4 term src  $(LISPDIR) man share
- 
-diff -uNr gnuplot-4.4.4.orig/configure.in gnuplot-4.4.4/configure.in
---- gnuplot-4.4.4.orig/configure.in	2011-09-02 06:09:40.000000000 +0200
-+++ gnuplot-4.4.4/configure.in	2012-07-20 10:55:53.289833224 +0200
-@@ -16,10 +16,11 @@
- dnl configure.in body
- 
- dnl Compiler characteristics
--dnl Check for ANSI C prototypes, the const and inline keywords,
--dnl and ANSI style stringification
-+dnl Check for the const and inline keywords and ANSI style stringification
-+dnl automake 1.12 dropped support for AM_C_PROTOTYPES and ansi2knr
-+dnl But our code still tests for #ifdef PROTOTYPES, so define it here
-+AC_DEFINE(PROTOTYPES,1,[Automake 1.12 dropped support for building without prototypes])
- AC_PROG_CC
--AM_C_PROTOTYPES
- AC_PROG_CPP
- AC_C_CONST
- AC_C_INLINE
-diff -uNr gnuplot-4.4.4.orig/src/Makefile.am gnuplot-4.4.4/src/Makefile.am
---- gnuplot-4.4.4.orig/src/Makefile.am	2010-10-06 06:53:16.000000000 +0200
-+++ gnuplot-4.4.4/src/Makefile.am	2012-07-20 10:56:02.376834548 +0200
-@@ -1,5 +1,5 @@
- ## Process this file with automake to produce Makefile.in -*-Makefile-*-
--AUTOMAKE_OPTIONS = ansi2knr foreign 1.2h
-+AUTOMAKE_OPTIONS = foreign
- 
- # in the spirit of automake ...
- pkglibexecdir = $(libexecdir)/@PACKAGE@/@VERSION_MAJOR@
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
new file mode 100644
index 0000000..eba0942
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
@@ -0,0 +1,16 @@
+Index: gnuplot-4.6.5/configure.in
+===================================================================
+--- gnuplot-4.6.5.orig/configure.in
++++ gnuplot-4.6.5/configure.in
+@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
+   fi
+
+   if test "$with_lua" != no; then
++    dnl check for dlopen/dl to fix loadlibs link failure
++    AC_CHECK_FUNC([dlopen], [],
++      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
++    AC_SUBST(DLOPEN_LIBS)
++    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
+     TERMLIBS="$TERMLIBS $LUA_LIBS"
+     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
+   else
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
similarity index 100%
rename from meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch
rename to meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
index 96d6ee2..6c27e6d 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Gnuplot is a portable command-line driven interactive datafile \
 (text or binary) and function plotting utility."
 HOMEPAGE = "http://www.gnuplot.info/"
 SECTION = "console/scientific"
-LICENSE = "BSD-4"
+LICENSE = "gnuplot"
 LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
 DEPENDS = "virtual/libx11 gd readline"
 
@@ -12,6 +12,7 @@ acpaths = ""
 
 PACKAGECONFIG ??= "cairo"
 PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
 
 EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
                 --without-lisp-files \
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
similarity index 65%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
index 4ea312f..a98c425 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
@@ -1,16 +1,16 @@
 require gnuplot.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${PN}-${PV}.tar.gz;name=archive \
     http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
     file://subdirs.patch \
     file://gnuplot.desktop \
     file://gnuplot.png \
-    file://automake-1.12.x.patch \
+    file://lua-loadlibs-configure-in-fix.patch \
 "
 
-SRC_URI[archive.md5sum] = "97a43328e81e57ebed7f135ca0c07e82"
-SRC_URI[archive.sha256sum] = "d228599d08d5f87bcb79af8af8bb432c77d942802b1643f920c7baaeaf1ddbfd"
+SRC_URI[archive.md5sum] = "9a476b21f74bd99c876f1509d731a0f9"
+SRC_URI[archive.sha256sum] = "e550f030c7d04570e89c3d4e3f6e82296816508419c86ab46c4dd73156519a2d"
 SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
-- 
1.9.1


