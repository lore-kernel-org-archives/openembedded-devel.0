Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 561D271A88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r126so9992987wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vgNYY8xTC0UXG6cKzE5qZLwaNLO/+OFF1sGgenrv9oA=;
	b=KF7LaLwIf7AGt2xfJnLDuNK9Nlh2DJeVO61Puw0kPswCZNYaFBkmpcj8izpu4g0+8/
	6Q+zZvGQjNcMA7zogURMvLBHYgQlJyDZeL2/1fJjoOJ1gwxhy8vbhkRm6bx7w2Yt7fNf
	tGDc+H8vmxsgmauad6YEZhxzkbVbwBW1k3tJi5xEx19ETkmBGRfpgvFaQrNL4F8Bu0Q1
	e6i6RIvHWv7fq+Qwuf6xkpxG793bJICnM8if31ia4yiJYVxH/7cZBawBAm3m5HJMEzT1
	/qYMd4HL1AZas+ZvAqVzXPjN/dGj6y5UaU55OyyYFYLgcBmMh/NIUfMFCyb8e8g2r31y
	VcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vgNYY8xTC0UXG6cKzE5qZLwaNLO/+OFF1sGgenrv9oA=;
	b=reLPBdBRYjFXERyP+Vl+XWArPa1e701PpWeghfIH0nwqj1glwI6uI37iCh2JRC1HfA
	RCwBYKs4anejP554JkYC9VyG6Ybpo4hDFgAcHZtJTjATyb2hCY61fnOQbM5loYtZwuBl
	JukOxXPbQWksIzWK8LjnBsAKILPE9ZVf1W+6jUZF646gBhF+Xa31TdKgvVd2Jj4gQsDo
	dGftM/hfI570CfDLefzDBG8FNAOZ1nDd/Chj5fKsHtJDrd/NzyJE5W4nxHr/radZDm4x
	DKeouc1Wl+pUPMEmMK4RNrkOZxJb7cyYlc2/wHmMyPvA0GIOeXPQnT0Ex+MjTxy5f4KF
	24lQ==
X-Gm-Message-State: AIkVDXKWUgJDvmcr8KwIO0DLWmjL2W/w0UFwJ18g0TSNwYAb1Y4so0/QyatrC+TkFfTqkg==
X-Received: by 10.223.152.210 with SMTP id w76mr6995175wrb.72.1484812422903;
	Wed, 18 Jan 2017 23:53:42 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:26 +0100
Message-Id: <1484812412-26806-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] fltk: update 1.3.3 -> 1.3.4-1
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* fix-boolean-issue-with-jpeg9.patch was applied upstream
* rebased fltk-no-freetype-config.patch and add Upstream-Status
* fix reconfigure by disabling autoheader

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fltk/fltk/fix-boolean-issue-with-jpeg9.patch   | 40 ----------------------
 .../fltk/fltk/fltk-no-freetype-config.patch        | 40 ++++++++++++++++------
 .../fltk/{fltk_1.3.3.bb => fltk_1.3.4-1.bb}        | 18 +++++-----
 3 files changed, 38 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
 rename meta-oe/recipes-support/fltk/{fltk_1.3.3.bb => fltk_1.3.4-1.bb} (74%)

diff --git a/meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch b/meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
deleted file mode 100644
index 014184d..0000000
--- a/meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 14c22398f8370e33a798360ed0dad513af8f1470 Mon Sep 17 00:00:00 2001
-From: AlbrechtS <AlbrechtS@ea41ed52-d2ee-0310-a9c1-e6b18d33e121>
-Date: Sun, 15 Mar 2015 19:32:33 +0000
-Subject: [PATCH] Fix 'boolean' issue with jpeg-9 library compatibility (STR
- #2920).
-
-According to comments in STR #2920 and my own tests this is also
-compatible with older jpeg libraries (at least jpeg-8).
-
-Upstream-Status: Backport
-
----
- src/Fl_JPEG_Image.cxx |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Fl_JPEG_Image.cxx b/src/Fl_JPEG_Image.cxx
-index 47120a7..6cebe88 100644
---- a/src/Fl_JPEG_Image.cxx
-+++ b/src/Fl_JPEG_Image.cxx
-@@ -155,7 +155,7 @@ Fl_JPEG_Image::Fl_JPEG_Image(const char *filename)	// I - File to load
-   
-   jpeg_create_decompress(&dinfo);
-   jpeg_stdio_src(&dinfo, fp);
--  jpeg_read_header(&dinfo, 1);
-+  jpeg_read_header(&dinfo, TRUE);
-   
-   dinfo.quantize_colors      = (boolean)FALSE;
-   dinfo.out_color_space      = JCS_RGB;
-@@ -337,7 +337,7 @@ Fl_JPEG_Image::Fl_JPEG_Image(const char *name, const unsigned char *data)
-   
-   jpeg_create_decompress(&dinfo);
-   jpeg_mem_src(&dinfo, data);
--  jpeg_read_header(&dinfo, 1);
-+  jpeg_read_header(&dinfo, TRUE);
-   
-   dinfo.quantize_colors      = (boolean)FALSE;
-   dinfo.out_color_space      = JCS_RGB;
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch b/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
index 4d13ffc..2a9915b 100644
--- a/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
+++ b/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
@@ -1,20 +1,40 @@
---- a/configure.in.orig	2015-11-26 14:30:17.893426966 +0800
-+++ b/configure.in	2015-11-26 14:33:00.285424099 +0800
-@@ -969,12 +969,12 @@ case $host_os_gui in
-         AC_ARG_ENABLE(xft, [  --enable-xft            turn on Xft support [[default=yes]]])
+From 699420d306cadbb5285942e09f4383d84b01985d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 13 Jan 2017 13:21:23 +0100
+Subject: [PATCH] replace freetype-config by pkg-config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f0efd48..3af5ecb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1006,12 +1006,12 @@ case $host_os_gui in
  
+ 	xft_found=no
  	if test x$enable_xft != xno; then
--            AC_PATH_PROG(FTCONFIG,freetype-config)
-+            AC_PATH_PROG(PKGCONFIG,pkg-config)
+-	    AC_PATH_PROG(FTCONFIG, freetype-config)
++	    AC_PATH_PROG(PKGCONFIG,pkg-config)
  
 -	    if test "x$FTCONFIG" != x; then
--	        CPPFLAGS="`$FTCONFIG --cflags` $CPPFLAGS"
--	        CFLAGS="`$FTCONFIG --cflags` $CFLAGS"
--	        CXXFLAGS="`$FTCONFIG --cflags` $CXXFLAGS"
+-		CPPFLAGS="`$FTCONFIG --cflags` $CPPFLAGS"
+-		CFLAGS="`$FTCONFIG --cflags` $CFLAGS"
+-		CXXFLAGS="`$FTCONFIG --cflags` $CXXFLAGS"
 +	    if test "x$PKGCONFIG" != x; then
 +	        CPPFLAGS="`$PKGCONFIG --cflags xft` $CPPFLAGS"
 +	        CFLAGS="`$PKGCONFIG --cflags xft` $CFLAGS"
 +	        CXXFLAGS="`$PKGCONFIG --cflags xft` $CXXFLAGS"
  
- 	        AC_CHECK_LIB(fontconfig, FcPatternCreate)
+ 		AC_CHECK_LIB(fontconfig, FcPatternCreate)
  		AC_CHECK_HEADER(X11/Xft/Xft.h,
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/fltk/fltk_1.3.3.bb b/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
similarity index 74%
rename from meta-oe/recipes-support/fltk/fltk_1.3.3.bb
rename to meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
index efba3a9..f08d547 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
@@ -6,17 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
 
 DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
-SRC_URI = "http://fltk.org/pub/fltk/${PV}/${BP}-source.tar.gz \
-           file://disable_test.patch \
-           file://fltk-no-freetype-config.patch \
-           file://fix-boolean-issue-with-jpeg9.patch \
+SRC_URI = " \
+    http://fltk.org/pub/fltk/1.3.4/${BP}-source.tar.gz \
+    file://disable_test.patch \
+    file://fltk-no-freetype-config.patch \
 "
 
-SRC_URI[md5sum] = "9ccdb0d19dc104b87179bd9fd10822e3"
-SRC_URI[sha256sum] = "f8398d98d7221d40e77bc7b19e761adaf2f1ef8bb0c30eceb7beb4f2273d0d97"
+SRC_URI[md5sum] = "d7fcd27ab928648e1a1366dd2e273970"
+SRC_URI[sha256sum] = "7fb2c8882433ce694e6900c94fda505e8f4ed3fa9c7e597007098a33b85c53f4"
 
 inherit autotools-brokensep binconfig pkgconfig lib_package
 
+EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
+
 TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
 
 EXTRA_OECONF = "--enable-shared \
@@ -32,10 +34,6 @@ PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 PACKAGECONFIG[xfixes] = "--enable-xfixes,--disable-xfixes,libxfixes"
 PACKAGECONFIG[xcursor] = "--enable-xcursor,--disable-xcursor,libxcursor"
 
-do_configure() {
-    oe_runconf
-}
-
 do_install_append_class-target() {
     sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/fltk-config
 }
-- 
2.7.4


