Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5F51A731D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498917"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:56:59 +0300
Message-Id: <9b8c1ff28b105001b94ea2b45063c40e3038938b.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/8] python-pygobject: add a recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:56:08 -0000

oe-core provides only python3-pygobject now, and a few recipes in meta-oe
still need the version built against Python 2.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 41 ++++++++++++++++++++++
 .../python/python-pygobject_3.18.2.bb              | 31 ++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb

diff --git a/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
new file mode 100644
index 0000000..a391f7e
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
@@ -0,0 +1,41 @@
+From 5e5350d730f85957a42c6d846d347d080e7dd996 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 23 Oct 2015 12:40:34 +0300
+Subject: [PATCH] configure.ac: add sysroot path to GI_DATADIR; don't set
+ introspection scanner and compiler paths
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2c0cfbd..cfcb3bf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -194,7 +194,7 @@ PKG_CHECK_MODULES(GI,
+     gobject-introspection-1.0 >= introspection_required_version
+ )
+ 
+-GI_DATADIR=$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
++GI_DATADIR=$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
+ AC_SUBST(GI_DATADIR)
+ 
+ if test "$enable_cairo" != no; then
+@@ -219,12 +219,6 @@ AC_ARG_WITH(common,
+     with_common=yes)
+ AM_CONDITIONAL(WITH_COMMON, test "$with_common" = "yes")
+ 
+-INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-
+-AC_SUBST(INTROSPECTION_SCANNER)
+-AC_SUBST(INTROSPECTION_COMPILER)
+-
+ # compiler warnings, errors, required cflags, and code coverage support
+ GNOME_COMPILE_WARNINGS([maximum])
+ AC_MSG_CHECKING(for Gnome code coverage support)
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
new file mode 100644
index 0000000..e4eeafb
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Python GObject bindings"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+
+inherit autotools pkgconfig gnomebase distutils-base gobject-introspection
+
+DEPENDS += "python glib-2.0"
+
+SRCNAME="pygobject"
+SRC_URI = " \
+    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
+    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
+"
+
+SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
+SRC_URI[sha256sum] = "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF = "--disable-cairo --with-python=python2.7"
+
+RDEPENDS_${PN} += "python-setuptools python-importlib"
+
+do_install_append() {
+    # Remove files that clash with python3-pygobject; their content is same
+    rm ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig/pygobject-3.0.pc
+}
+
-- 
2.8.1


