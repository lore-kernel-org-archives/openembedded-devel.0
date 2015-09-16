Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AB7FC76F58
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:34:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2015 07:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,539,1437462000"; d="scan'208";a="770276897"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2015 07:34:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Sep 2015 17:35:55 +0300
Message-Id: <1442414158-15694-3-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
References: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [meta-oe][PATCH 2/5] evince: Remove pkg-config check for specific icon theme
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
X-List-Received-Date: Wed, 16 Sep 2015 14:34:27 -0000

Also rrecommend adwaita-icon-theme instead of gnome-icon-theme
(as latter is removed from oe-core).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ove-pkg-config-check-for-gnome-icon-theme.patch | 35 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |  5 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch b/meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch
new file mode 100644
index 0000000..6368a31
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch
@@ -0,0 +1,35 @@
+From f4051f27aee7cbe88f206783461784c936d7f5db Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 15 Sep 2015 16:17:50 +0300
+Subject: [PATCH] Remove pkg-config check for gnome-icon-theme
+
+Theme is not required for building and the icons are provided by
+adwaita-icon-theme anyway
+
+Upstream-Status: Inappropriate [Current versions are fixed]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d061c2e..7856410 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -175,13 +175,6 @@ case "$with_platform" in
+           SHELL_PLATFORM_PKGS="hildon-1 hildon-fm-2 libosso"
+           ;;
+   gnome)
+-        # Evince has a rather soft run-time dependency on hicolor-icon-theme.
+-        # If the hicolor theme is not available, Evince fails to display some
+-        # icons. Because we cannot check for it at run-time, we instead
+-        # would like to require the icon theme at compile-time. But, because
+-        # the hicolor-icon-theme does not have a pkgconfig file, on gnome we
+-        # require the gnome icon theme instead.
+-        SHELL_PLATFORM_PKGS="gnome-icon-theme >= $GNOME_ICON_THEME_REQUIRED"
+         # The totem-screensaver and egg_smclient code use x11 directly.
+         SHELL_PLATFORM_PKGS="$SHELL_PLATFORM_PKGS x11"
+         ;;
+-- 
+2.1.4
+
diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index e742ede..2d91075 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -2,8 +2,7 @@ SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
-DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
-
+DEPENDS = "gnome-doc-utils-native libgnome-keyring tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
 PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings
@@ -11,6 +10,7 @@ inherit gnome pkgconfig gtk-icon-cache gsettings
 SRC_URI += " \
     file://cross-compile-fix.patch \
     file://0001-tiff-fix-compile-warning.patch \
+    file://Remove-pkg-config-check-for-gnome-icon-theme.patch \
 "
 
 SRC_URI[archive.md5sum] = "ebc3ce6df8dcbf29cb9492f8dd031319"
@@ -32,6 +32,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
 
 RDEPENDS_${PN} += "glib-2.0-utils"
+RRECOMMMENDS_${PN} = "adwaita-icon-theme"
 
 PACKAGES =+ "${PN}-nautilus-extension"
 FILES_${PN} += "${datadir}/dbus-1"
-- 
2.1.4


