Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DFF8676F9D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:34:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2015 07:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,539,1437462000"; d="scan'208";a="770276914"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2015 07:34:27 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Sep 2015 17:35:56 +0300
Message-Id: <1442414158-15694-4-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
References: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [meta-oe][PATCH 3/5] gnome-system-monitor: Remove pkg-config check for specific icon theme
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
X-List-Received-Date: Wed, 16 Sep 2015 14:34:28 -0000

Also rrecommend adwaita-icon-theme instead of gnome-icon-theme
(as latter is removed from oe-core).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ove-pkg-config-check-for-gnome-icon-theme.patch | 30 ++++++++++++++++++++++
 .../gnome-system-monitor_2.28.2.bb                 |  5 +++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/files/Remove-pkg-config-check-for-gnome-icon-theme.patch

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/Remove-pkg-config-check-for-gnome-icon-theme.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/files/Remove-pkg-config-check-for-gnome-icon-theme.patch
new file mode 100644
index 0000000..3c5169e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/files/Remove-pkg-config-check-for-gnome-icon-theme.patch
@@ -0,0 +1,30 @@
+From 36fd2aa23e712f05f0cce4a1be3453fcf405d026 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 15 Sep 2015 16:28:18 +0300
+Subject: [PATCH] Remove pkg-config check for gnome-icon-theme
+
+Theme is not required for building, and the icons are provided by
+adwaita-icon-theme anyway
+
+Upstream-Status: Inappropriate [Fixed in current versions]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 3600823..42262f2 100644
+--- a/configure.in
++++ b/configure.in
+@@ -37,7 +37,7 @@ LIBXML_REQUIRED=2.0
+ RSVG_REQUIRED=2.12
+ DBUS_REQUIRED=0.7
+ 
+-PKG_CHECK_MODULES(PROCMAN, glib-2.0 >= $GLIB_REQUIRED gconf-2.0 >= $GCONF_REQUIRED libgtop-2.0 >= $LIBGTOP_REQUIRED libwnck-1.0 >= $LIBWNCK_REQUIRED gtk+-2.0 >= $GTK_REQUIRED gnome-icon-theme >= $GNOME_ICON_THEME_REQUIRED gtkmm-2.4 >= $GTKMM_REQUIRED libxml-2.0 >= $LIBXML_REQUIRED librsvg-2.0 >= $RSVG_REQUIRED glibmm-2.4 >= $GLIBMM_REQUIRED giomm-2.4 >= $GIOMM_REQUIRED dbus-glib-1 >= $DBUS_REQUIRED)
++PKG_CHECK_MODULES(PROCMAN, glib-2.0 >= $GLIB_REQUIRED gconf-2.0 >= $GCONF_REQUIRED libgtop-2.0 >= $LIBGTOP_REQUIRED libwnck-1.0 >= $LIBWNCK_REQUIRED gtk+-2.0 >= $GTK_REQUIRED gtkmm-2.4 >= $GTKMM_REQUIRED libxml-2.0 >= $LIBXML_REQUIRED librsvg-2.0 >= $RSVG_REQUIRED glibmm-2.4 >= $GLIBMM_REQUIRED giomm-2.4 >= $GIOMM_REQUIRED dbus-glib-1 >= $DBUS_REQUIRED)
+ 
+ 
+ AC_ARG_ENABLE(more-warnings,
+-- 
+2.1.4
+
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index dd2e63d..55778f7 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11/gnome"
 PR = "r2"
 
-DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwnck gtk+ dbus-glib librsvg intltool-native"
+DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils libwnck gtk+ dbus-glib librsvg intltool-native"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
@@ -13,12 +13,15 @@ GNOME_COMPRESS_TYPE="bz2"
 SRC_URI += " \
     file://0001-Fix-glib-includes.patch \
     file://0002-src-procman.cpp-include-main-gtkmm.h.patch \
+    file://Remove-pkg-config-check-for-gnome-icon-theme.patch \
 "
 
 do_configure_prepend() {
     sed -i -e s:help::g ${S}/Makefile.am
 }
 
+RRECOMMENDS_${PN} = "adwaita-icon-theme"
+
 FILES_${PN} += "${datadir}/icons \
                 ${datadir}/dbus-1 \
                 ${datadir}/gnome/autostart \
-- 
2.1.4


