Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E70B77350
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676876"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:41 +0200
Message-Id: <3f996133bdd535a06debe33dd769941319f31eec.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/34] evince: update to 3.18.2
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is done to enable gobject introspection support.
Drop obsolete patches.
Add a patch that disables yelp m4 macro (which we don't have).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../evince/0001-help-remove-YELP-macro.patch       | 24 +++++++++++++++
 .../evince/0001-tiff-fix-compile-warning.patch     | 33 --------------------
 ...ove-pkg-config-check-for-gnome-icon-theme.patch | 35 ----------------------
 .../evince/evince/cross-compile-fix.patch          | 25 ----------------
 .../evince/{evince_2.32.0.bb => evince_3.18.2.bb}  | 29 ++++++++++--------
 5 files changed, 40 insertions(+), 106 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
 rename meta-gnome/recipes-gnome/evince/{evince_2.32.0.bb => evince_3.18.2.bb} (60%)

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch b/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
new file mode 100644
index 0000000..592f466
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
@@ -0,0 +1,24 @@
+From 40921037d8e7205a3889d529fb4e06f79e1e88b0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 19 Feb 2016 16:52:18 +0200
+Subject: [PATCH] help: remove YELP macro
+
+Upstream-Status: Inappropriate [embedded-specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ help/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/help/Makefile.am b/help/Makefile.am
+index 7835810..37c88ce 100644
+--- a/help/Makefile.am
++++ b/help/Makefile.am
+@@ -1,5 +1,3 @@
+-@YELP_HELP_RULES@
+-
+ SUBDIRS = reference
+ 
+ HELP_ID = evince
+-- 
+2.7.0
+
diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch b/meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
deleted file mode 100644
index ebc8976..0000000
--- a/meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 00b5e55c90477eeac02bec58f032cb6916a1eb5c Mon Sep 17 00:00:00 2001
-From: Hib Eris <hib@hiberis.nl>
-Date: Mon, 20 Feb 2012 21:36:16 +0100
-Subject: [PATCH] tiff: fix compile warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- backend/tiff/tiff2ps.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/backend/tiff/tiff2ps.c b/backend/tiff/tiff2ps.c
-index c0dc0bf..fc63c2e 100644
---- a/backend/tiff/tiff2ps.c
-+++ b/backend/tiff/tiff2ps.c
-@@ -1127,8 +1127,8 @@ PS_Lvl2page(TIFF2PSContext* ctx, TIFF* tif, uint32 w, uint32 h)
- 	}
- 	buf_data = (unsigned char *)_TIFFmalloc(chunk_size);
- 	if (!buf_data) {
--		TIFFError(ctx->filename, "Can't alloc %u bytes for %s.",
--			chunk_size, tiled_image ? "tiles" : "strips");
-+		TIFFError(ctx->filename, "Can't alloc %u bytes for %s.",
-+			(uint) chunk_size, tiled_image ? "tiles" : "strips");
- 		return(FALSE);
- 	}
- 
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch b/meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch
deleted file mode 100644
index 6368a31..0000000
--- a/meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f4051f27aee7cbe88f206783461784c936d7f5db Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 15 Sep 2015 16:17:50 +0300
-Subject: [PATCH] Remove pkg-config check for gnome-icon-theme
-
-Theme is not required for building and the icons are provided by
-adwaita-icon-theme anyway
-
-Upstream-Status: Inappropriate [Current versions are fixed]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d061c2e..7856410 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -175,13 +175,6 @@ case "$with_platform" in
-           SHELL_PLATFORM_PKGS="hildon-1 hildon-fm-2 libosso"
-           ;;
-   gnome)
--        # Evince has a rather soft run-time dependency on hicolor-icon-theme.
--        # If the hicolor theme is not available, Evince fails to display some
--        # icons. Because we cannot check for it at run-time, we instead
--        # would like to require the icon theme at compile-time. But, because
--        # the hicolor-icon-theme does not have a pkgconfig file, on gnome we
--        # require the gnome icon theme instead.
--        SHELL_PLATFORM_PKGS="gnome-icon-theme >= $GNOME_ICON_THEME_REQUIRED"
-         # The totem-screensaver and egg_smclient code use x11 directly.
-         SHELL_PLATFORM_PKGS="$SHELL_PLATFORM_PKGS x11"
-         ;;
--- 
-2.1.4
-
diff --git a/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch b/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
deleted file mode 100644
index 6f5420a..0000000
--- a/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: evince-2.30.0/gnome-doc-utils.make
-===================================================================
---- evince-2.30.0.orig/gnome-doc-utils.make	2010-03-29 11:52:47.000000000 -0700
-+++ evince-2.30.0/gnome-doc-utils.make	2010-08-17 15:20:22.597646001 -0700
-@@ -132,13 +132,12 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
- 
- _xml2po ?= `which xml2po`
- _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
--
--_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
--_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
--_malrng  ?= `$(PKG_CONFIG) --variable malrng gnome-doc-utils`
--_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
--_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
--_ids ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
-+_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
-+_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
-+_malrng  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable malrng gnome-doc-utils`
-+_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
-+_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
-+_ids ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
- 
- if ENABLE_SK
- _ENABLE_SK = true
-
diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
index 2d91075..3d90764 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
@@ -2,27 +2,24 @@ SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
-DEPENDS = "gnome-doc-utils-native libgnome-keyring tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
+DEPENDS = "gtk+3 libsecret gnome-desktop3 poppler gstreamer1.0-plugins-base orc"
 PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings
 
-SRC_URI += " \
-    file://cross-compile-fix.patch \
-    file://0001-tiff-fix-compile-warning.patch \
-    file://Remove-pkg-config-check-for-gnome-icon-theme.patch \
-"
+SRC_URI[archive.md5sum] = "c39af6b8b1c44d4393ef8ac9dab99c0b"
+SRC_URI[archive.sha256sum] = "42ad6c7354d881a9ecab136ea84ff867acb942605bcfac48b6c12e1c2d8ecb17"
 
-SRC_URI[archive.md5sum] = "ebc3ce6df8dcbf29cb9492f8dd031319"
-SRC_URI[archive.sha256sum] = "2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7"
-GNOME_COMPRESS_TYPE="bz2"
+SRC_URI += "file://0001-help-remove-YELP-macro.patch"
 
 EXTRA_OECONF = " --enable-thumbnailer \
-                 --disable-scrollkeeper \
-                 --enable-pixbuf \
-                 --disable-help \
 "
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/libdocument/.libs"
+}
+
+
 do_install_append() {
     install -d install -d ${D}${datadir}/pixmaps
     install -m 0755 ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}/pixmaps/
@@ -30,12 +27,17 @@ do_install_append() {
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
+PACKAGECONFIG[browser-plugin] = "--enable-browser-plugin,--disable-browser-plugin,"
 
 RDEPENDS_${PN} += "glib-2.0-utils"
 RRECOMMMENDS_${PN} = "adwaita-icon-theme"
 
 PACKAGES =+ "${PN}-nautilus-extension"
-FILES_${PN} += "${datadir}/dbus-1"
+PACKAGES =+ "${PN}-browser-plugin"
+FILES_${PN} += "${datadir}/dbus-1 \
+                ${datadir}/appdata \
+                ${datadir}/thumbnailers \
+               "
 FILES_${PN}-dbg += "${libdir}/*/*/.debug \
                     ${libdir}/*/*/*/.debug"
 FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
@@ -43,3 +45,4 @@ FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
 FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
                           ${libdir}/evince/*/backends/*.a"
 FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
+FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
-- 
2.7.0


