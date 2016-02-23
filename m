Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8A73777354
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676927"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:49 +0200
Message-Id: <9a40bc3f5a95196e73c783227bc718ada5814a40.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/34] goffice: fix gobject introspection
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...igure.ac-fix-paths-to-introspection-tools.patch | 41 ++++++++++++++++++++++
 .../recipes-support/goffice/goffice_0.10.1.bb      |  2 ++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-gnome/recipes-support/goffice/goffice/0001-configure.ac-fix-paths-to-introspection-tools.patch

diff --git a/meta-gnome/recipes-support/goffice/goffice/0001-configure.ac-fix-paths-to-introspection-tools.patch b/meta-gnome/recipes-support/goffice/goffice/0001-configure.ac-fix-paths-to-introspection-tools.patch
new file mode 100644
index 0000000..a645978
--- /dev/null
+++ b/meta-gnome/recipes-support/goffice/goffice/0001-configure.ac-fix-paths-to-introspection-tools.patch
@@ -0,0 +1,41 @@
+From 8e158c16cd15fff08b42ed86edc55816d3387837 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 19 Feb 2016 16:04:24 +0200
+Subject: [PATCH] configure.ac: fix paths to introspection tools
+
+They need to be prefixed with $PKG_CONFIG_SYSROOT_DIR
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6d2b747..3b28463 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -706,9 +706,9 @@ if test "x$found_introspection" = "xyes"; then
+    dnl python where to find libgoffice, so you might also need to set
+    dnl LD_LIBRARY_PATH.
+ 
+-   INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-   INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-   INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++   INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++   INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++   INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+    if test "x$INTROSPECTION_GIRDIR" = x; then
+      INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+    fi
+@@ -717,7 +717,7 @@ if test "x$found_introspection" = "xyes"; then
+    fi
+    INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+    INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-   INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++   INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+ else
+    INTROSPECTION_SCANNER=
+    INTROSPECTION_COMPILER=
+-- 
+2.7.0
+
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
index 1e9ec4c..7408aff 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -9,6 +9,8 @@ inherit gnomebase pkgconfig perlnative
 
 GNOME_COMPRESS_TYPE = "xz"
 
+SRC_URI += "file://0001-configure.ac-fix-paths-to-introspection-tools.patch"
+
 SRC_URI[archive.md5sum] = "90fd17c6fe205b779571e00d9b0b4727"
 SRC_URI[archive.sha256sum] = "5c38f4e81e874cc8e89481b080f77c47c72bfd6fe2526f4fc2ef87c17f96cad0"
 
-- 
2.7.0


