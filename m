Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 25D8877354
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676901"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:44 +0200
Message-Id: <8c4e6998807019d7c69c138a07735ee11270b673.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/34] gnumeric: fix gobject introspection support
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...n-drop-introspection-macros-replace-them-.patch | 84 ++++++++++++++++++++++
 .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |  5 +-
 2 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric/0001-configure.in-drop-introspection-macros-replace-them-.patch

diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric/0001-configure.in-drop-introspection-macros-replace-them-.patch b/meta-gnome/recipes-gnome/gnumeric/gnumeric/0001-configure.in-drop-introspection-macros-replace-them-.patch
new file mode 100644
index 0000000..914d2cc
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric/0001-configure.in-drop-introspection-macros-replace-them-.patch
@@ -0,0 +1,84 @@
+From de5f0a535d6ea1932d2c7de53bd33510c8682ee7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 22 Feb 2016 16:34:03 +0200
+Subject: [PATCH] configure.in: drop introspection macros, replace them with a
+ standard one
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.in | 57 +--------------------------------------------------------
+ 1 file changed, 1 insertion(+), 56 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 8e1aa37..3086503 100644
+--- a/configure.in
++++ b/configure.in
+@@ -934,63 +934,8 @@ AC_SUBST(MONO_CFLAGS)
+ AC_SUBST(MONO_LIBS)
+ ])
+ 
+-# GObject Introspection
+-GIR_REQ=1.0.0
+-AC_ARG_ENABLE(introspection,
+-          AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
+-                         [Enable introspection for this build]),, 
+-                         [enable_introspection=no])
+-
+-AC_MSG_CHECKING([for gobject-introspection])
+-
+-dnl presence/version checking
+-AS_CASE([$enable_introspection],
+-[no], [
+-    found_introspection="no (disabled, use --enable-introspection to enable)"
+-],
+-[yes],[
+-    PKG_CHECK_EXISTS([gobject-introspection-1.0],,
+-                     AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
+-    PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $GIR_REQ],
+-                     found_introspection=yes,
+-                     AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
+-],
+-[auto],[
+-    PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $GIR_REQ], found_introspection=yes, found_introspection=no)
+-dnl Canonicalize enable_introspection
+-enable_introspection=$found_introspection
+-],
+-[	
+-    AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
+-])
++GOBJECT_INTROSPECTION_CHECK([1.46.0])
+ 
+-AC_MSG_RESULT([$found_introspection])
+-
+-INTROSPECTION_SCANNER=
+-INTROSPECTION_COMPILER=
+-INTROSPECTION_GENERATE=
+-INTROSPECTION_GIRDIR=
+-INTROSPECTION_TYPELIBDIR=
+-if test "x$found_introspection" = "xyes"; then
+-   INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-   INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-   INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-   INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-   INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+-   INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+-   INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-   INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+-fi
+-AC_SUBST(INTROSPECTION_SCANNER)
+-AC_SUBST(INTROSPECTION_COMPILER)
+-AC_SUBST(INTROSPECTION_GENERATE)
+-AC_SUBST(INTROSPECTION_GIRDIR)
+-AC_SUBST(INTROSPECTION_TYPELIBDIR)
+-AC_SUBST(INTROSPECTION_CFLAGS)
+-AC_SUBST(INTROSPECTION_LIBS)
+-AC_SUBST(INTROSPECTION_MAKEFILE)
+-
+-AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
+ dnl we need to change the install directories for distcheck
+ AC_ARG_WITH([gir-dir],
+ 	AS_HELP_STRING(
+-- 
+2.7.0
+
diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 71f99ca..9eeb93f 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -7,9 +7,10 @@ SUMMARY = "Gnumeric spreadsheet for GNOME"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-inherit gnome
+inherit gnome pythonnative
 
-SRC_URI += "file://do-not-use-srcdir.patch"
+SRC_URI += "file://do-not-use-srcdir.patch \
+            file://0001-configure.in-drop-introspection-macros-replace-them-.patch"
 
 SRC_URI[archive.md5sum] = "3fd87cca95334b5d8ac922989670fe27"
 SRC_URI[archive.sha256sum] = "037b53d909e5d1454b2afda8c4fb1e7838e260343e36d4e36245f4a5d0e04111"
-- 
2.7.0


