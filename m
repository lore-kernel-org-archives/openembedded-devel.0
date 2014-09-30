Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E153A71648
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 03:49:20 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y10so3862728pdj.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 20:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CM2lrwuunRKO3a5/ZKiAhPpDut5TFO67sP8Y5mcDutk=;
	b=HxohWWvTQAqfar2BQlr3P5X4LxWqYXFMMYuaUGiDzc7JmaDEOktm4LUNTc6gaYs8oz
	sfJtqFxMtz0B5iisHrRmCpm1Nd8ulznNcdNYOpbCxlh0x8wYMurPhFlE0mrPigRpFymp
	cduMfLSN6innmxRCg3tToa1ld2idIparuUVZ7g5+VUQXJpGaI4l0VxfOwNExCRyoHU2k
	ycpm+TsHO96yAqd698RBp+rsu4E+zWgA5JaYh64GnNhvrJsX7P/PbH9kxI1FpvXSvHx0
	tPCusNw6Lb9rQ/MQwG43qSPkMf7MpTCT3TNtL+nsS3FXHcjxUtY5Z/oi7IqJuIPvO6aP
	Oi9A==
X-Received: by 10.68.238.137 with SMTP id vk9mr531059pbc.165.1412048950925;
	Mon, 29 Sep 2014 20:49:10 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225]) by mx.google.com with ESMTPSA id
	ad6sm13652887pac.30.2014.09.29.20.49.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Sep 2014 20:49:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Sep 2014 20:52:59 -0700
Message-Id: <1412049179-30493-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412049179-30493-1-git-send-email-raj.khem@gmail.com>
References: <1412049179-30493-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] imagemagick: Update recipe 6.8.8 -> 6.8.9
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
X-List-Received-Date: Tue, 30 Sep 2014 03:49:39 -0000

Fix fetch failures
Remove automate patch we have 1.12+ automake in
OE-Core now

Change-Id: I2ba1f6fb173613774f29f87c621ad3ca10f4e872
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-install-magick-baseconfig.h-repeatedly.patch | 49 ----------------------
 .../imagemagick/imagemagick/remove.dist-lzip.patch | 17 --------
 .../{imagemagick_6.8.8.bb => imagemagick_6.8.9.bb} | 19 +++------
 3 files changed, 6 insertions(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/remove.dist-lzip.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.8.8.bb => imagemagick_6.8.9.bb} (75%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch b/meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch
deleted file mode 100644
index 114fb5e..0000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From bbdd42384d0b5f3ccb11465f63d90097579a1897 Mon Sep 17 00:00:00 2001
-From: Konrad Scherer <konrad.scherer@windriver.com>
-Date: Tue, 10 Jun 2014 15:43:16 +0800
-Subject: [PATCH] imagemagick: do not install magick-baseconfig.h repeatedly
-
-Both targets install-data-local & install-includeHEADERS will install
-header file magick-baseconfig.h to the same location, and they might
-be run in the same time while enabling parallel build:
-
-* target dependencies:
-  + install-data-am: ... install-data-local ... install-includeHEADERS
-
-* make install error:
-  /usr/bin/install: cannot create regular file \
-  `.../usr/include/ImageMagick-6/magick/magick-baseconfig.h': \
-  File exists \
-  make[3]: *** [install-magickincarchHEADERS] Error 1
-
-* reproduce the error:
-  $ /usr/bin/install test /tmp & /usr/bin/install test /tmp
-  [1] 4052
-  /usr/bin/install: cannot create regular file `/tmp/test': File exists
-  [1]+  Exit 1                  /usr/bin/install test /tmp
-
-Just disable the one from install-data-local to remove this race issue.
-
-Upstream-Status: pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- magick/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/magick/Makefile.am b/magick/Makefile.am
-index 2f72461..e45466c 100644
---- a/magick/Makefile.am
-+++ b/magick/Makefile.am
-@@ -468,7 +468,7 @@ MAGICK_EXTRA_DIST = \
- 	magick/xwdfile.h_vms 
- 
- # Install magick-baseconfig.h
--MAGICK_INSTALL_DATA_LOCAL_TARGETS = magick-install-data-local
-+MAGICK_INSTALL_DATA_LOCAL_TARGETS =
- magick-install-data-local:
- 	$(mkinstalldirs) $(DESTDIR)$(magickincarchdir)
- 	$(INSTALL_HEADER) magick/magick-baseconfig.h $(DESTDIR)$(magickincarchdir)/magick-baseconfig.h
--- 
-1.8.2.1
-
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/remove.dist-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick/remove.dist-lzip.patch
deleted file mode 100644
index 559aa24..0000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/remove.dist-lzip.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Our automake-1.11.2 doesn't support it yet, see:
-http://lists.gnu.org/archive/html/automake/2011-12/msg00081.html
-
-Upstream-Status: Inappropriate [fix or upgrade oe-core automake]
-
-diff -uNr ImageMagick-6.7.5-6.orig/configure.ac ImageMagick-6.7.5-6/configure.ac
---- ImageMagick-6.7.5-6.orig/configure.ac	2012-02-12 18:07:28.000000000 +0100
-+++ ImageMagick-6.7.5-6/configure.ac	2012-02-15 12:55:47.668813474 +0100
-@@ -128,7 +128,7 @@
- # Ensure that make can run correctly
- AM_SANITY_CHECK
- 
--AM_INIT_AUTOMAKE([1.11 color-tests foreign parallel-tests silent-rules subdir-objects dist-bzip2 dist-lzip dist-xz dist-zip])
-+AM_INIT_AUTOMAKE([1.11 color-tests foreign parallel-tests silent-rules subdir-objects dist-bzip2 dist-xz dist-zip])
- 
- # Enable support for silent build rules
- m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
similarity index 75%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
index 847ab34..9b15f62 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
@@ -5,22 +5,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
-PATCHSET = "10"
-SRC_URI = "http://www.imagemagick.org/download/legacy/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
-           file://remove.dist-lzip.patch \
-           file://do-not-install-magick-baseconfig.h-repeatedly.patch \
+PATCHSET = "8"
+SRC_URI = "http://www.imagemagick.org/download/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
 "
-SRC_URI[md5sum] = "a3a0fa301965d6fde68fccd066f62b0b"
-SRC_URI[sha256sum] = "8c0982b2bc0c1cea8ac9627b4e1e5d37f8171ef8282ee09aef32529cf68e1820"
+SRC_URI[md5sum] = "7e96f55156d72ce59c76ec93362ec72a"
+SRC_URI[sha256sum] = "51e0eb0b56e2f16be11c29086a97d474ffd07fe4eb5a9858d8a9c8e9c054c99a"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-inherit autotools binconfig pkgconfig
+inherit autotools pkgconfig
 
 # xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
 # if someone needs xml support then fix it first
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
 
+CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
@@ -40,9 +39,3 @@ FILES_${PN}-dev += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
 FILES_${PN}-dbg += "${libdir}/ImageMagick-${PV}/modules-Q16/*/.debug/*"
 
 BBCLASSEXTEND = "native"
-
-LEAD_SONAME = "libMagickCore.so.*"
-
-do_configure_prepend() {
-    export ac_cv_sys_file_offset_bits=yes
-}
-- 
2.1.1


