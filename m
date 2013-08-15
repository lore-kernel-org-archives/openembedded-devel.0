Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA486B80B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:07 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so179982eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XqXKzwDdFsrtp3p6FLL2eUze8knVgachUyjVH9r/YZc=;
	b=mLGRdvA4InKAFmPzmh4wl8NW8hy8P+QYEWQ4N9CVSaEPDtMggNjLUryOH8sNP4lUGk
	teMeO/1rnnjCmyk3DiQnYfx615x6t5CigOURmg7/P62j9v+eMygXXj+YiC/F45T5sFtL
	vPhNp9rRQeeSD8Zhjk24dgBv1OcQXh6stXVCjVyTX8EMlNhvWiSCGxHge4b5W3ibU9Ve
	h6ZnE2vEzm9aC4XvcNTtlMQtKckrf6+OhOQ62NJjfr7EOtS5LTKgAWYKXpTkUV2n4hZk
	yuAMVMF4WsDm3Dh52EAWdvZr9VFxZ/hGtmBcsEMlkaYgWjVb11/e6K7XC8n1JAaPxGr5
	t5Qg==
X-Received: by 10.14.251.10 with SMTP id a10mr228756ees.76.1376551207871;
	Thu, 15 Aug 2013 00:20:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm4982317eez.3.2013.08.15.00.20.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:36 +0200
Message-Id: <056c3d2d0b4e17445cd8365082ccff5628748fc6.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 56/60] libgphoto2: add configure option for gd and add PACKAGECONFIG
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:07 -0000

* it's autodetected and pulls couple of other dependencies
  freetype gd libpng lockdev zlib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgphoto2-2.4.11/allow.to.disable.gd.patch    | 33 ++++++++++++++++++++++
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |  6 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/allow.to.disable.gd.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/allow.to.disable.gd.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/allow.to.disable.gd.patch
new file mode 100644
index 0000000..aa1a124
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/allow.to.disable.gd.patch
@@ -0,0 +1,33 @@
+--- libgphoto2-2.4.11.orig/configure.ac	2013-07-19 21:59:10.857223729 +0200
++++ libgphoto2-2.4.11/configure.ac	2013-07-19 22:06:13.873233928 +0200
+@@ -270,15 +270,21 @@
+ dnl ---------------------------------------------------------------------------
+ dnl check for libgd
+ dnl ---------------------------------------------------------------------------
+-LIBGD=""
+-libgd_msg="no"
+-AC_SUBST(LIBGD)
+-AC_CHECK_LIB(gd,gdImageCreateTrueColor,[
+-	AC_CHECK_HEADER(gd.h,[
+-		AC_DEFINE(HAVE_GD,1,[define if we have LIBGD and its headers])
+-		LIBGD="-lgd"
+-		libgd_msg="yes"
+-	])
++AC_ARG_ENABLE([gd],
++[AS_HELP_STRING([--enable-gd],
++                [enable gd support])],[
++        LIBGD=""
++        libgd_msg="no"
++        AC_SUBST(LIBGD)
++        if test "x$enableval" != "xno"; then
++                AC_CHECK_LIB(gd,gdImageCreateTrueColor,[
++                        AC_CHECK_HEADER(gd.h,[
++                                AC_DEFINE(HAVE_GD,1,[define if we have LIBGD and its headers])
++                                LIBGD="-lgd"
++                                libgd_msg="yes"
++                        ])
++                ])
++        fi
+ ])
+ GP_CONFIG_MSG([GD conversion support],[${libgd_msg}])
+ 
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index fd547d9..ae783b8 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://10-camera-libgphoto2.fdi \
            file://40-libgphoto2.rules \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
+           file://allow.to.disable.gd.patch \
 "
 
 SRC_URI[libgphoto2.md5sum] = "16a22b9739e45a95980ed62705fe7333"
@@ -25,6 +26,9 @@ inherit autotools pkgconfig gettext lib_package
 
 EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gd] = "--enable-gd,--disable-gd,gd"
+
 do_configure_append() {
     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
     cd ${S}/libgphoto2_port/
@@ -44,7 +48,7 @@ PACKAGES =+ "libgphotoport libgphoto2-camlibs"
 FILES_libgphoto2-camlibs = "${libdir}/libgphoto2*/*/*.so*"
 RRECOMMENDS_${PN} = "libgphoto2-camlibs"
 
-FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*" 
+FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 
 FILES_${PN} += "${base_libdir}/udev/* ${datadir}/hal"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
-- 
1.8.3.2


