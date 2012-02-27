Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S20qG-0001QS-Gt
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Feb 2012 14:42:16 +0100
Received: by eekc1 with SMTP id c1so405965eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 05:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.186.12 as permitted sender) client-ip=10.14.186.12; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.186.12 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.186.12])
	by 10.14.186.12 with SMTP id v12mr8117265eem.31.1330349630584 (num_hops
	= 1); Mon, 27 Feb 2012 05:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Empx5KNsgWuygHdSWxCAQa3x7mNBFRTm64HXjiKCUQM=;
	b=cw3dqSLBeuA6u5rQrEKH2uCVnbXaNnHul68MrUqCos/B0mKtP2/AixBRhSZaVGwhNf
	lrYz3wtwZzF67C7ISDntb4YlX6E8abWLJNo7rf5wgZTBVYXHQUf0ZxAqtXueH2NMlb0L
	QqI8jTvezPGALgftv+ZSQ+ecjoP1/M3d5Be6g=
Received: by 10.14.186.12 with SMTP id v12mr6103884eem.31.1330349630452;
	Mon, 27 Feb 2012 05:33:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm58097137eei.3.2012.02.27.05.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:33:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Feb 2012 14:33:41 +0100
Message-Id: <1330349621-32597-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH] pango: use pango.inc from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2012 13:42:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/pango/pango.inc           |   53 -------------
 .../recipes-graphics/pango/pango/no-tests.patch    |   15 ----
 .../pango/pango/pkgconfig_fixes.patch              |   79 --------------------
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    9 ++-
 4 files changed, 7 insertions(+), 149 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/pango/pango.inc
 delete mode 100644 meta-oe/recipes-graphics/pango/pango/no-tests.patch
 delete mode 100644 meta-oe/recipes-graphics/pango/pango/pkgconfig_fixes.patch

diff --git a/meta-oe/recipes-graphics/pango/pango.inc b/meta-oe/recipes-graphics/pango/pango.inc
deleted file mode 100644
index 341d0e3..0000000
--- a/meta-oe/recipes-graphics/pango/pango.inc
+++ /dev/null
@@ -1,53 +0,0 @@
-DESCRIPTION = "The goal of the Pango project is to provide an \
-Open Source framework for the layout and rendering of \
-internationalized text."
-LICENSE = "LGPL"
-
-inherit gnome
-EXTRA_AUTORECONF = ""
-
-SECTION = "x11/libs"
-
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv virtual/libx11 libxft gtk-doc cairo"
-
-DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
-BBCLASSEXTEND = "native"
-
-PACKAGES_DYNAMIC = "pango-module-*"
-PACKAGES_DYNAMIC_virtclass-native = ""
-
-RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
-
-INC_PR = "r2"
-
-# seems to go wrong with default cflags
-FULL_OPTIMIZATION_arm = "-O2"
-
-SRC_URI += "file://no-tests.patch \
-           "
-
-EXTRA_OECONF += "--disable-glibtest \
-                 --enable-explicit-deps=no \
-                 --disable-debug"
-
-LEAD_SONAME = "libpango-1.0*"
-LIBV = "1.6.0"
-
-FILES_${PN} = "/etc ${bindir}/* ${libdir}/libpango*.so.*"
-FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
-FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
-
-postinst_prologue() {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-}
-
-python populate_packages_prepend () {
-	prologue = bb.data.getVar("postinst_prologue", d, 1)
-
-	modules_root = bb.data.expand('${libdir}/pango/${LIBV}/modules', d)
-
-	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules > /etc/pango/pango.modules')
-}
diff --git a/meta-oe/recipes-graphics/pango/pango/no-tests.patch b/meta-oe/recipes-graphics/pango/pango/no-tests.patch
deleted file mode 100644
index b382126..0000000
--- a/meta-oe/recipes-graphics/pango/pango/no-tests.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- pango-1.2.5/Makefile.am~no-tests	2003-01-30 22:43:47.000000000 +0100
-+++ pango-1.2.5/Makefile.am	2004-03-11 11:31:25.000000000 +0100
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango modules examples docs tools tests
-+SUBDIRS= pango modules examples docs tools 
- 
- EXTRA_DIST = 		\
- 	pango.pc.in	\
diff --git a/meta-oe/recipes-graphics/pango/pango/pkgconfig_fixes.patch b/meta-oe/recipes-graphics/pango/pango/pkgconfig_fixes.patch
deleted file mode 100644
index f021591..0000000
--- a/meta-oe/recipes-graphics/pango/pango/pkgconfig_fixes.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Index: pango-1.18.1/configure.in
-===================================================================
---- pango-1.18.1.orig/configure.in	2007-08-28 00:29:54.000000000 +0000
-+++ pango-1.18.1/configure.in	2007-11-12 19:21:22.000000000 +0000
-@@ -226,13 +226,9 @@
-   #
-   # Checks for FreeType
-   #
--  FREETYPE_LIBS=
--  FREETYPE_CFLAGS=
--  AC_PATH_PROG(FREETYPE_CONFIG, freetype-config, no)
--  if test "x$FREETYPE_CONFIG" != "xno" ; then
--    FREETYPE_CFLAGS=`$FREETYPE_CONFIG --cflags`
--    FREETYPE_LIBS=`$FREETYPE_CONFIG --libs`
-+  PKG_CHECK_MODULES(FREETYPE, freetype2 >= 1.0.1, have_freetype=true, AC_MSG_RESULT([no]))
- 
-+  if $have_freetype ; then
-     pango_save_ldflags=$LDFLAGS
-     LDFLAGS="$LDFLAGS $FREETYPE_LIBS"
-     AC_CHECK_LIB(freetype, FT_Get_Next_Char, have_freetype=true, :)
-Index: pango-1.18.1/pangoft2-uninstalled.pc.in
-===================================================================
---- pango-1.18.1.orig/pangoft2-uninstalled.pc.in	2007-07-05 21:30:28.000000000 +0000
-+++ pango-1.18.1/pangoft2-uninstalled.pc.in	2007-11-12 19:23:44.000000000 +0000
-@@ -1,7 +1,7 @@
- Name: Pango FT2 Uninstalled
- Description: Freetype 2.0 font support for Pango, Not Installed
- Version: @VERSION@
--Requires: pango
--Libs: ${pc_top_builddir}/${pcfiledir}/pango/libpangoft2-@PANGO_API_VERSION@.la @FREETYPE_LIBS@
--Cflags: -I${pc_top_builddir}/${pcfiledir}/@srcdir@ @FREETYPE_CFLAGS@
-+Requires: pango freetype2
-+Libs: ${pc_top_builddir}/${pcfiledir}/pango/libpangoft2-@PANGO_API_VERSION@.la
-+Cflags: -I${pc_top_builddir}/${pcfiledir}/@srcdir@
- 
-Index: pango-1.18.1/pangoft2.pc.in
-===================================================================
---- pango-1.18.1.orig/pangoft2.pc.in	2007-07-05 21:30:28.000000000 +0000
-+++ pango-1.18.1/pangoft2.pc.in	2007-11-12 19:27:05.000000000 +0000
-@@ -6,7 +6,7 @@
- Name: Pango FT2
- Description: Freetype 2.0 font support for Pango
- Version: @VERSION@
--Requires: pango
--Libs: -L${libdir} -lpangoft2-@PANGO_API_VERSION@ @PKGCONFIG_FREETYPE_LIBS@
--Cflags: -I${includedir}/pango-1.0 @FONTCONFIG_CFLAGS@ @FREETYPE_CFLAGS@
-+Requires: pango freetype2 fontconfig
-+Libs: -L${libdir} -lpangoft2-@PANGO_API_VERSION@
-+Cflags: -I${includedir}/pango-1.0
- 
-Index: pango-1.18.1/pangoxft-uninstalled.pc.in
-===================================================================
---- pango-1.18.1.orig/pangoxft-uninstalled.pc.in	2007-07-05 21:30:28.000000000 +0000
-+++ pango-1.18.1/pangoxft-uninstalled.pc.in	2007-11-12 19:22:24.000000000 +0000
-@@ -1,7 +1,7 @@
- Name: Pango Xft Uninstalled
- Description: Xft font support for Pango, Not Installed
- Version: @VERSION@
--Requires: pango
--Libs: ${pc_top_builddir}/${pcfiledir}/pango/libpangoxft-@PANGO_API_VERSION@.la @XFT_LIBS@
--Cflags: -I${pc_top_builddir}/${pcfiledir}/@srcdir@ @X_CFLAGS@ @FREETYPE_CFLAGS@
-+Requires: pango xft
-+Libs: ${pc_top_builddir}/${pcfiledir}/pango/libpangoxft-@PANGO_API_VERSION@.la
-+Cflags: -I${pc_top_builddir}/${pcfiledir}/@srcdir@ @X_CFLAGS@
- 
-Index: pango-1.18.1/pangoxft.pc.in
-===================================================================
---- pango-1.18.1.orig/pangoxft.pc.in	2007-07-05 21:30:28.000000000 +0000
-+++ pango-1.18.1/pangoxft.pc.in	2007-11-12 19:21:57.000000000 +0000
-@@ -6,6 +6,6 @@
- Name: Pango Xft
- Description: Xft font support for Pango
- Version: @VERSION@
--Requires: pango pangoft2
--Libs: -L${libdir} -lpangoxft-@PANGO_API_VERSION@ @PKGCONFIG_XFT_LIBS@
--Cflags: -I${includedir}/pango-1.0 @XFT_CFLAGS@
-+Requires: pango pangoft2 xft
-+Libs: -L${libdir} -lpangoxft-@PANGO_API_VERSION@
-+Cflags: -I${includedir}/pango-1.0
diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
index 70f8815..65c4028 100644
--- a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
+++ b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
@@ -1,9 +1,14 @@
-require pango.inc
+require recipes-graphics/pango/pango.inc
+
+BBCLASSEXTEND = "native"
+DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SRC_URI[archive.md5sum] = "a5ee785f4f31d6bdd8625a09ea3f8b4b"
 SRC_URI[archive.sha256sum] = "f15deecaecf1e9dcb7db0e4947d12b5bcff112586434f8d30a5afd750747ff2b"
 
-PR = "${INC_PR}.1"
+SRC_URI += "file://no-tests.patch"
+
+PR = "r3"
 
-- 
1.7.8.4



