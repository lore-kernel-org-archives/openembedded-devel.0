Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3366FF76
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 03:27:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB23R8tZ005617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Dec 2015 19:27:08 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 1 Dec 2015 19:27:08 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Dec 2015 11:27:01 +0800
Message-ID: <0f1967a13a9eca2b179be9eb42e2fedcac02824e.1449026404.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449026404.git.yi.zhao@windriver.com>
References: <cover.1449026404.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 1/1 V2] fltk: upgrade from version 1.1.10 to 1.3.3
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
X-List-Received-Date: Wed, 02 Dec 2015 03:27:09 -0000
Content-Type: text/plain

- backport patch from trunk to fix build failure with jpeg-9 library
- add PACKAGECONFIG for opengl, xinerama, xfixes, xcursor to fix [build-deps] qa warnings
- rebase patches against the new version and drop the useless patches
- cleanup the host buildpaths from fltk-config

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../fltk/fltk-1.1.10/disable_test.patch            |   13 -----
 .../recipes-support/fltk/fltk-1.1.10/dso-fix.patch |   13 -----
 .../fltk/fltk-1.1.10/libpng15.patch                |   61 --------------------
 .../recipes-support/fltk/fltk/disable_test.patch   |   11 ++++
 .../fltk/fltk/fix-boolean-issue-with-jpeg9.patch   |   40 +++++++++++++
 .../fltk-no-freetype-config.patch                  |   14 +++--
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |   41 -------------
 meta-oe/recipes-support/fltk/fltk_1.3.3.bb         |   49 ++++++++++++++++
 8 files changed, 108 insertions(+), 134 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/disable_test.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
 rename meta-oe/recipes-support/fltk/{fltk-1.1.10 => fltk}/fltk-no-freetype-config.patch (57%)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk_1.1.10.bb
 create mode 100644 meta-oe/recipes-support/fltk/fltk_1.3.3.bb

diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
deleted file mode 100644
index 8c01a1f..0000000
--- a/meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: fltk-1.1.9/Makefile
-===================================================================
---- fltk-1.1.9.orig/Makefile	2008-06-06 16:14:11.936736201 +0200
-+++ fltk-1.1.9/Makefile	2008-06-06 16:14:22.526357637 +0200
-@@ -27,7 +27,7 @@
- 
- include makeinclude
- 
--DIRS	=	$(IMAGEDIRS) src fluid test documentation
-+DIRS	=	$(IMAGEDIRS) src fluid documentation
- 
- all: makeinclude fltk-config
- 	for dir in $(DIRS); do\
diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
deleted file mode 100644
index 867e9ef..0000000
--- a/meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-src/fl_set_fonts_xft.cxx is using fontconfig symbols
-
---- a/makeinclude.in	2012-01-26 18:09:58.628799060 +0100
-+++ b/makeinclude.in	2012-01-26 18:08:58.115801758 +0100
-@@ -81,7 +81,7 @@
- AUDIOLIBS	= @AUDIOLIBS@
- DSOFLAGS	= -L. @DSOFLAGS@
- LDFLAGS		= $(OPTIM) @LDFLAGS@
--LDLIBS		= @LIBS@
-+LDLIBS		= @LIBS@ -lfontconfig
- GLDLIBS		= @GLLIB@ @LIBS@
- LINKFLTK	= @LINKFLTK@
- LINKFLTKGL	= @LINKFLTKGL@
diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
deleted file mode 100644
index b2eb8d6..0000000
--- a/meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Imported from gentoo
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-libs/fltk/files/fltk-1.1.10-libpng15.patch
-
---- a/src/Fl_PNG_Image.cxx
-+++ b/src/Fl_PNG_Image.cxx
-@@ -66,7 +66,8 @@ Fl_PNG_Image::Fl_PNG_Image(const char *png) // I - File to read
-   png_structp	pp;			// PNG read pointer
-   png_infop	info;			// PNG info pointers
-   png_bytep	*rows;			// PNG row pointers
--
-+  png_byte     color_type;             // PNG color type
-+  png_byte     bit_depth;              // PNG bit depth
- 
-   // Open the PNG file...
-   if ((fp = fopen(png, "rb")) == NULL) return;
-@@ -75,7 +76,7 @@ Fl_PNG_Image::Fl_PNG_Image(const char *png) // I - File to read
-   pp   = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
-   info = png_create_info_struct(pp);
- 
--  if (setjmp(pp->jmpbuf))
-+  if (setjmp(png_jmpbuf(pp)))
-   {
-     Fl::warning("PNG file \"%s\" contains errors!\n", png);
-     return;
-@@ -86,28 +87,24 @@ Fl_PNG_Image::Fl_PNG_Image(const char *png) // I - File to read
- 
-   // Get the image dimensions and convert to grayscale or RGB...
-   png_read_info(pp, info);
-+  color_type = png_get_color_type(pp, info);
- 
--  if (info->color_type == PNG_COLOR_TYPE_PALETTE)
-+  if (color_type == PNG_COLOR_TYPE_PALETTE)
-     png_set_expand(pp);
- 
--  if (info->color_type & PNG_COLOR_MASK_COLOR)
--    channels = 3;
--  else
--    channels = 1;
--
--  if ((info->color_type & PNG_COLOR_MASK_ALPHA) || info->num_trans)
--    channels ++;
-+  channels = png_get_channels(pp, info);
- 
--  w((int)(info->width));
--  h((int)(info->height));
-+  w((int)(png_get_image_width(pp, info)));
-+  h((int)(png_get_image_height(pp, info)));
-   d(channels);
- 
--  if (info->bit_depth < 8)
-+  bit_depth = png_get_bit_depth(pp, info);
-+  if (bit_depth < 8)
-   {
-     png_set_packing(pp);
-     png_set_expand(pp);
-   }
--  else if (info->bit_depth == 16)
-+  else if (bit_depth == 16)
-     png_set_strip_16(pp);
- 
- #  if defined(HAVE_PNG_GET_VALID) && defined(HAVE_PNG_SET_TRNS_TO_ALPHA)
diff --git a/meta-oe/recipes-support/fltk/fltk/disable_test.patch b/meta-oe/recipes-support/fltk/fltk/disable_test.patch
new file mode 100644
index 0000000..1f5fd25
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/disable_test.patch
@@ -0,0 +1,11 @@
+--- a/Makefile.orig	2015-11-26 15:35:31.485357862 +0800
++++ b/Makefile	2015-11-26 15:35:37.037357764 +0800
+@@ -18,7 +18,7 @@
+ 
+ include makeinclude
+ 
+-DIRS = $(IMAGEDIRS) src $(CAIRODIR) fluid test documentation
++DIRS = $(IMAGEDIRS) src $(CAIRODIR) fluid documentation
+ 
+ all: makeinclude fltk-config
+ 	for dir in $(DIRS); do\
diff --git a/meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch b/meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
new file mode 100644
index 0000000..014184d
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
@@ -0,0 +1,40 @@
+From 14c22398f8370e33a798360ed0dad513af8f1470 Mon Sep 17 00:00:00 2001
+From: AlbrechtS <AlbrechtS@ea41ed52-d2ee-0310-a9c1-e6b18d33e121>
+Date: Sun, 15 Mar 2015 19:32:33 +0000
+Subject: [PATCH] Fix 'boolean' issue with jpeg-9 library compatibility (STR
+ #2920).
+
+According to comments in STR #2920 and my own tests this is also
+compatible with older jpeg libraries (at least jpeg-8).
+
+Upstream-Status: Backport
+
+---
+ src/Fl_JPEG_Image.cxx |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Fl_JPEG_Image.cxx b/src/Fl_JPEG_Image.cxx
+index 47120a7..6cebe88 100644
+--- a/src/Fl_JPEG_Image.cxx
++++ b/src/Fl_JPEG_Image.cxx
+@@ -155,7 +155,7 @@ Fl_JPEG_Image::Fl_JPEG_Image(const char *filename)	// I - File to load
+   
+   jpeg_create_decompress(&dinfo);
+   jpeg_stdio_src(&dinfo, fp);
+-  jpeg_read_header(&dinfo, 1);
++  jpeg_read_header(&dinfo, TRUE);
+   
+   dinfo.quantize_colors      = (boolean)FALSE;
+   dinfo.out_color_space      = JCS_RGB;
+@@ -337,7 +337,7 @@ Fl_JPEG_Image::Fl_JPEG_Image(const char *name, const unsigned char *data)
+   
+   jpeg_create_decompress(&dinfo);
+   jpeg_mem_src(&dinfo, data);
+-  jpeg_read_header(&dinfo, 1);
++  jpeg_read_header(&dinfo, TRUE);
+   
+   dinfo.quantize_colors      = (boolean)FALSE;
+   dinfo.out_color_space      = JCS_RGB;
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.patch b/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
similarity index 57%
rename from meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.patch
rename to meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
index 5dbb054..4d13ffc 100644
--- a/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.patch
+++ b/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
@@ -1,18 +1,20 @@
---- a/configure.in.orig	2015-03-01 16:00:35.956432907 +0100
-+++ b/configure.in	2015-03-01 16:04:23.269580093 +0100
-@@ -865,11 +865,11 @@
-         AC_ARG_ENABLE(xft, [  --enable-xft            turn on Xft support [default=no]])
+--- a/configure.in.orig	2015-11-26 14:30:17.893426966 +0800
++++ b/configure.in	2015-11-26 14:33:00.285424099 +0800
+@@ -969,12 +969,12 @@ case $host_os_gui in
+         AC_ARG_ENABLE(xft, [  --enable-xft            turn on Xft support [[default=yes]]])
  
- 	if test x$enable_xft = xyes; then
+ 	if test x$enable_xft != xno; then
 -            AC_PATH_PROG(FTCONFIG,freetype-config)
 +            AC_PATH_PROG(PKGCONFIG,pkg-config)
  
 -	    if test "x$FTCONFIG" != x; then
 -	        CPPFLAGS="`$FTCONFIG --cflags` $CPPFLAGS"
+-	        CFLAGS="`$FTCONFIG --cflags` $CFLAGS"
 -	        CXXFLAGS="`$FTCONFIG --cflags` $CXXFLAGS"
 +	    if test "x$PKGCONFIG" != x; then
 +	        CPPFLAGS="`$PKGCONFIG --cflags xft` $CPPFLAGS"
++	        CFLAGS="`$PKGCONFIG --cflags xft` $CFLAGS"
 +	        CXXFLAGS="`$PKGCONFIG --cflags xft` $CXXFLAGS"
  
+ 	        AC_CHECK_LIB(fontconfig, FcPatternCreate)
  		AC_CHECK_HEADER(X11/Xft/Xft.h,
- 		    AC_CHECK_LIB(Xft, XftDrawCreate,
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
deleted file mode 100644
index 1404961..0000000
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
-HOMEPAGE = "http://www.fltk.org"
-SECTION = "libs"
-LICENSE = "LGPLv2 & FLTK"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1c0b73db66884b6a925e727400315130"
-
-DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
-
-PR = "r2"
-
-SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fltk-${PV}-source.tar.bz2 \
-           file://disable_test.patch \
-           file://dso-fix.patch \
-           file://libpng15.patch \
-           file://fltk-no-freetype-config.patch \
-"
-
-S = "${WORKDIR}/fltk-${PV}"
-
-inherit lib_package autotools-brokensep binconfig pkgconfig
-
-TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
-
-EXTRA_OECONF = "--enable-shared \
-                --enable-threads \
-                --enable-xdbe --enable-xft --enable-gl \
-                --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}"
-
-do_configure() {
-    oe_runconf
-}
-
-python populate_packages_prepend () {
-    if (d.getVar('DEBIAN_NAMES', 1)):
-        d.setVar('PKG_${BPN}', 'libfltk${PV}')
-}
-
-LEAD_SONAME = "libfltk.so"
-
-SRC_URI[md5sum] = "a1765594bc427ff892e36089fe1fa672"
-SRC_URI[sha256sum] = "37ada22bf2586b8dd30d84209b8b58bdcb864627e5d02ae3f2c323a29261b19a"
diff --git a/meta-oe/recipes-support/fltk/fltk_1.3.3.bb b/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
new file mode 100644
index 0000000..117ecc3
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
@@ -0,0 +1,49 @@
+SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
+HOMEPAGE = "http://www.fltk.org"
+SECTION = "libs"
+LICENSE = "LGPLv2 & FLTK"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
+
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
+
+SRC_URI = "http://fltk.org/pub/fltk/${PV}/${BP}-source.tar.gz \
+           file://disable_test.patch \
+           file://fltk-no-freetype-config.patch \
+           file://fix-boolean-issue-with-jpeg9.patch \
+"
+
+SRC_URI[md5sum] = "9ccdb0d19dc104b87179bd9fd10822e3"
+SRC_URI[sha256sum] = "f8398d98d7221d40e77bc7b19e761adaf2f1ef8bb0c30eceb7beb4f2273d0d97"
+
+inherit autotools-brokensep binconfig pkgconfig lib_package
+
+TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
+
+EXTRA_OECONF = "--enable-shared \
+                --enable-threads \
+                --enable-xdbe \
+                --enable-xft \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)}"
+
+PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
+PACKAGECONFIG[xfixes] = "--enable-xfixes,--disable-xfixes,libxfixes"
+PACKAGECONFIG[xcursor] = "--enable-xcursor,--disable-xcursor,libxcursor"
+
+do_configure() {
+    oe_runconf
+}
+
+do_install_append_class-target() {
+    sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/fltk-config
+}
+
+python populate_packages_prepend () {
+    if (d.getVar('DEBIAN_NAMES', 1)):
+        d.setVar('PKG_${BPN}', 'libfltk${PV}')
+}
+
+LEAD_SONAME = "libfltk.so"
+
-- 
1.7.9.5


