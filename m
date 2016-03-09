Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 423A46FF97
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:09:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62868864"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:22 +0200
Message-Id: <c4889a5303ec51d55abdfb7d0e2f2e81a3b31139.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/38] libgsf: fix gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:09:59 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...c-drop-a-copy-paste-of-introspection.m4-m.patch | 103 +++++++++++++++++++++
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb  |   4 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch

diff --git a/meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch b/meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
new file mode 100644
index 0000000..bc0090e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
@@ -0,0 +1,103 @@
+From 16d2c2e74350fda5505982fb150e72af7aee7454 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 19 Feb 2016 16:23:56 +0200
+Subject: [PATCH] configure.ac: drop a copy-paste of introspection.m4 macros
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 78 +-----------------------------------------------------------
+ 1 file changed, 1 insertion(+), 77 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 54f7663..3038535 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,83 +77,7 @@ libgsf_reqs="
+ "
+ 
+ PKG_CHECK_MODULES(LIBGSF, $libgsf_reqs)
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
+-
+-AC_MSG_RESULT([$found_introspection])
+-
+-if test "x$found_introspection" = "xyes"; then
+-   dnl You can override INTROSPECTION_GIRDIR and INTROSPECTION_TYPELIBDIR
+-   dnl if you wish.  If you override the latter, you might want to set
+-   dnl GI_TYPELIB_PATH to include the same directory.  For example
+-   dnl
+-   dnl GI_TYPELIB_PATH=$PREFIX/lib64/girepository-1.0
+-   dnl INTROSPECTION_TYPELIBDIR=$GI_TYPELIB_PATH
+-   dnl INTROSPECTION_GIRDIR=$PREFIX/share/gir-1.0
+-   dnl
+-   dnl Note, that unlike binaries produced with libgsf, nothing tells
+-   dnl python where to find libgsf, so you might also need to set
+-   dnl LD_LIBRARY_PATH.
+-
+-   INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-   INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-   INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-   if test "x$INTROSPECTION_GIRDIR" = x; then
+-     INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-   fi
+-   if test "x$INTROSPECTION_TYPELIBDIR" = x; then
+-     INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+-   fi
+-   INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+-   INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-   INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+-else
+-   INTROSPECTION_SCANNER=
+-   INTROSPECTION_COMPILER=
+-   INTROSPECTION_GENERATE=
+-   INTROSPECTION_GIRDIR=
+-   INTROSPECTION_TYPELIBDIR=
+-   INTROSPECTION_CFLAGS=
+-   INTROSPECTION_LIBS=
+-   INTROSPECTION_MAKEFILE=
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
++GOBJECT_INTROSPECTION_CHECK([1.46.0])
+ dnl we need to change the install directories for distcheck
+ AC_ARG_WITH([gir-dir],
+ 	AS_HELP_STRING(
+-- 
+2.7.0
+
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
index d7bbd3b..be79ec1 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
@@ -7,7 +7,9 @@ SECTION = "libs"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 
-inherit autotools pkgconfig gnome gconf
+inherit autotools pkgconfig gnome gconf gobject-introspection
+
+SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 SRC_URI[archive.md5sum] = "3056b94bb3281dbc8311371bfc23cf72"
 SRC_URI[archive.sha256sum] = "4d8bca33424eb711acdb6a060cb488b132063d699c4fa201db24c2c89c62529c"
-- 
2.7.0


