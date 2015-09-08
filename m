Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF4F873232
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 08:22:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Sep 2015 01:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,488,1437462000"; d="scan'208";a="800473141"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 01:22:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:24:19 +0300
Message-Id: <1441700659-4234-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gnome-icon-theme: add a recipe from oe-core
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
X-List-Received-Date: Tue, 08 Sep 2015 08:22:47 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gnome-icon-theme/files/pkgconfig-native.patch  | 28 ++++++++++++++++++++++
 .../gnome-icon-theme/gnome-icon-theme_2.31.0.bb    | 22 +++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-icon-theme/files/pkgconfig-native.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-icon-theme/gnome-icon-theme_2.31.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-icon-theme/files/pkgconfig-native.patch b/meta-gnome/recipes-gnome/gnome-icon-theme/files/pkgconfig-native.patch
new file mode 100644
index 0000000..6139eab
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-icon-theme/files/pkgconfig-native.patch
@@ -0,0 +1,28 @@
+icon-naming-utils is a native dependency so we need to use the native pkg-config
+to find it.  Simply perform the old switcheroonie on $PKG_CONFIG so
+pkg-config-native is used temporarily.
+
+Upstream-Status: Inappropriate (OE-specific)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 6074f2c..3d38e49 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,6 +40,8 @@ if test "x$enable_mapping" != "xno"; then
+    UTILS_REQUIRED=0.8.7
+ 
+    AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
++   save_PKG_CONFIG=$PKG_CONFIG
++   PKG_CONFIG=pkg-config-native
+    PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
+                     have_utils=yes, have_utils=no)
+    if test "x$have_utils" = "xyes"; then
+@@ -51,6 +53,7 @@ if test "x$enable_mapping" != "xno"; then
+       AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
+                     and install gnome-icon-theme])
+    fi
++   PKG_CONFIG=save_PKG_CONFIG
+ else
+    ICONMAP="false"
+ fi
diff --git a/meta-gnome/recipes-gnome/gnome-icon-theme/gnome-icon-theme_2.31.0.bb b/meta-gnome/recipes-gnome/gnome-icon-theme/gnome-icon-theme_2.31.0.bb
new file mode 100644
index 0000000..a6a3afa
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-icon-theme/gnome-icon-theme_2.31.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "GNOME 2 default icon themes"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/gnome"
+
+LICENSE = "LGPLv3+ | CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e7e289d90fc8bdceed5e3f142f98229e"
+
+PR = "r5"
+
+DEPENDS = "icon-naming-utils-native intltool-native libxml-simple-perl-native"
+
+inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
+           file://pkgconfig-native.patch"
+
+SRC_URI[md5sum] = "8e727703343d4c18c73c79dd2009f8ed"
+SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982"
+
+FILES_${PN} += "${datadir}/*"
+RRECOMMENDS_${PN} += "librsvg-gtk"
-- 
2.1.4


