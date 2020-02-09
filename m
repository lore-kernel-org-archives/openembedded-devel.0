Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7E65D6028E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 11:42:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y17so4068764wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 03:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ey17y9nDUBGNG+J2+iR4pDmNlFGOKj9T4d+cwLb1Ieo=;
	b=qXwGvH+c9vKreJno3zWpqRecDdXQtpOlyHlyzjunrMMZFbPHQk+lqZDBlmKFE7HVwR
	oNdFu85euPcrQo5XajO7hj4SvhgL/721cAOCyxuKGsOVRa+yBfhYWCQHMaX3vwxkd80d
	rX6A0IbLbAozqRURQAj25MkvmO/YtcZo9EsuQxWQpMYiaXQgBGPoa4yOrCp1aAjJ1TVg
	MbiPBi8kx0D40O/5YrUnpmUqrpMV7JeOMPqUHOmqNJwvJ2gNPTHqemCv/8YKL8TJv4P7
	HWgYhhQEif/sabS6aHxRQVjn8HmFdAD10VVCKcT1Jtarvgdc9Ut18lXUyWvdSHuMDpbd
	U8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ey17y9nDUBGNG+J2+iR4pDmNlFGOKj9T4d+cwLb1Ieo=;
	b=UOncMx4SYYIosun8D+KyP3QoXrhb7Ln/hsw42uZccts2P4vbil4c/M5yx3+SFexIQ5
	Ld1A5h+sWwba8oeCBBtHaWgnP0kfDuqRN5N+8GLTaLNmcWJCOgPHZYhdz6L4kf4Bn+jN
	/kx9es5AapULy/0fqIVy6a6JoPZVI4RDZm5t7/lg4PoSAH2sqRcyU1JgfjPWnTgeXjWK
	IHXHnbZLtsckHRLo3S4n1fjvis+n9eWX1O8Jc/cJglDZCXwUYdPbU9hNC2n8HiZL+ymP
	zfM6QtP5cx3jQoOqKmjgSNFrGPw99Er7Z8eaw4BHGaFBicrT/cS3uYbsKSASuS3kmqpR
	Uiug==
X-Gm-Message-State: APjAAAXEAvcTn1QoZO2d+3btDvcpiGsisAUb+M6ax+ZAmVHMHR53oPaT
	2z5E2wyu5yt/cQrzZ9dFXVTky0xf
X-Google-Smtp-Source: APXvYqxFDiiFqW65n2o6Za8a4HW1XgZpR685C+h6Fv7MOJycJT92hc74ICMum0+1dSH8ed6lEIa44w==
X-Received: by 2002:a5d:5007:: with SMTP id e7mr10903821wrt.228.1581248555714; 
	Sun, 09 Feb 2020 03:42:35 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	a13sm11828426wrp.93.2020.02.09.03.42.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 03:42:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 12:42:22 +0100
Message-Id: <20200209114226.2584-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209114226.2584-1-schnitzeltony@gmail.com>
References: <20200209114226.2584-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] gegl: upgrade 0.3.18 -> 0.4.20
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
X-List-Received-Date: Sun, 09 Feb 2020 11:42:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* gegl is GPLv3 now
* gegl moved to meson build
* move to meta-gnome: latest gimp requires gexiv2 and nothing but gimp depends
  on gegl
* add more PACKAGECONFIGs and change defaults slightly: sdl->sdl2 / add gexiv2
  by default because gimp requires it anyway
* extend to native: latest gimp requires gegl for manipulation of pngs during
  build
* get sources from location gimp's homepage suggests

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...on.build-Give-note-if-sdl2-was-found.patch | 32 ++++++++++
 meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb   | 61 +++++++++++++++++++
 .../gegl/gegl/pkgconfig.patch                 | 21 -------
 meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb  | 34 -----------
 4 files changed, 93 insertions(+), 55 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch
 create mode 100644 meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb
 delete mode 100644 meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch
 delete mode 100644 meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb

diff --git a/meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch b/meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch
new file mode 100644
index 000000000..6a49f1d7c
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gegl/gegl/0001-meson.build-Give-note-if-sdl2-was-found.patch
@@ -0,0 +1,32 @@
+From 6bed199a73a7af39344cf8e799b665011553600c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 8 Feb 2020 14:29:52 +0100
+Subject: [PATCH] meson.build: Give note if sdl2 was found
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Configure output confused me a bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 9d5b484..296b5f3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -374,6 +374,7 @@ message('\n'.join(['',
+ '  OpenEXR:         @0@'.format(openexr.found()),
+ '  rsvg:            @0@'.format(librsvg.found()),
+ '  SDL:             @0@'.format(sdl1.found()),
++'  SDL2:            @0@'.format(sdl2.found()),
+ '  libraw:          @0@'.format(libraw.found()),
+ '  Jasper:          @0@'.format(jasper.found()),
+ '  av libs:         @0@'.format(avlibs_found),
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb
new file mode 100644
index 000000000..5e7a1bb84
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.20.bb
@@ -0,0 +1,61 @@
+SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f1a8bfcbc85304df454b65d378b299c7"
+
+DEPENDS = " \
+    intltool-native \
+    babl \
+    glib-2.0 \
+    pango \
+    cairo \
+    expat \
+    zlib \
+    \
+    json-glib \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit features_check gnomebase vala gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SHPV = "${@gnome_verdir("${PV}")}"
+
+SRC_URI = " \
+    https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
+    file://0001-meson.build-Give-note-if-sdl2-was-found.patch \
+"
+SRC_URI[md5sum] = "37433eb00f8a4b0d1ae9e975aaedfa26"
+SRC_URI[sha256sum] = "23bd8bb42b20de7c2a8c314eeb5301dc20141feda20a4b1ed455020b69b73dff"
+
+PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
+PACKAGECONFIG_class-native = "libpng librsvg"
+
+PACKAGECONFIG[jasper] = "-Djasper=enabled,-Djasper=disabled,jasper"
+PACKAGECONFIG[gexiv2] = "-Dgexiv2=enabled,-Dgexiv2=disabled,gexiv2"
+PACKAGECONFIG[graphviz] = "-Dgraphviz=enabled,-Dgraphviz=disabled,graphviz"
+PACKAGECONFIG[jpeg] = "-Dlibjpeg=enabled,-Dlibjpeg=disabled,jpeg"
+PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
+PACKAGECONFIG[libav] = "-Dlibav=enabled,-Dlibav=disabled,libav"
+PACKAGECONFIG[libpng] = "-Dlibpng=enabled,-Dlibpng=disabled,libpng"
+PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
+PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,virtual/libsdl"
+PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
+PACKAGECONFIG[tiff] = "-Dlibtiff=enabled,-Dlibtiff=disabled,tiff"
+PACKAGECONFIG[webp] = "-Dwebp=enabled,-Dwebp=disabled,webp"
+
+# There are a couple of non-symlink .so files installed into libdir, which need to go into main package
+FILES_${PN} += " \
+    ${libdir}/*.so \
+    ${libdir}/gegl-${SHPV}/*.json \
+    ${libdir}/gegl-${SHPV}/*.so \
+"
+FILES_SOLIBSDEV = "${libdir}/libgegl-${SHPV}${SOLIBSDEV}"
+
+# Fails to build with thumb-1 (qemuarm)
+# gegl-0.2.0/operations/common/matting-global.c: In function 'matting_process':
+# gegl-0.2.0/operations/common/matting-global.c:463:1: internal compiler error: in patch_jump_insn, at cfgrtl.c:1275
+ARM_INSTRUCTION_SET = "arm"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch b/meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch
deleted file mode 100644
index d145b625f..000000000
--- a/meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: gegl-0.2.0/configure.ac
-===================================================================
---- gegl-0.2.0.orig/configure.ac	2012-04-02 21:56:49.000000000 +0000
-+++ gegl-0.2.0/configure.ac	2014-07-17 21:34:15.312546602 +0000
-@@ -765,15 +765,7 @@
- 
- have_sdl="no"
- if test "x$with_sdl" != "xno"; then
--  AC_PATH_PROG(SDL_CONFIG, sdl-config, no)
--  if test "$SDL_CONFIG" = "no"; then
--    have_sdl="no  (SDL library not found)"
--    AC_MSG_RESULT([*** Check for SDL library failed.])
--  else
--    have_sdl="yes"
--    SDL_CFLAGS=`$SDL_CONFIG --cflags`
--    SDL_LIBS=`$SDL_CONFIG --libs`
--  fi
-+  PKG_CHECK_MODULES([SDL], [sdl], [have_sdl="yes"], [have_sdl="no  (SDL library not found)"])
- fi
- 
- AM_CONDITIONAL(HAVE_SDL, test "$have_sdl" = "yes")
diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
deleted file mode 100644
index 0db0f793d..000000000
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl json-glib intltool-native"
-
-EXTRA_OECONF = "--disable-docs"
-
-inherit features_check gnomebase vala gobject-introspection
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
-PACKAGECONFIG[avformat] = "--with-libavformat,--without-libavformat,libav"
-PACKAGECONFIG[lcms] = "--with-lcms,--without-lcms,lcms"
-PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
-PACKAGECONFIG[webp] = "--with-webp,--without-webp,webp"
-
-SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.3/${BP}.tar.bz2 \
-           file://pkgconfig.patch "
-SRC_URI[md5sum] = "6e5c6f229261478dc436a38c84405b2a"
-SRC_URI[sha256sum] = "d7858ef26ede136d14e3de188a9e9c0de7707061a9fb96d7d615fab4958491fb"
-
-LDFLAGS += "-lm"
-
-# There are a couple of non-symlink .so files installed into libdir, which need to go into main package
-FILES_${PN}_append = " ${libdir}/gegl-0.3/*.so ${libdir}/gegl-0.3/*.json ${libdir}/libgegl-npd-0.3.so ${libdir}/libgegl-sc-0.3.so"
-FILES_${PN}-dev_append = " ${libdir}/gegl-0.3/*.la ${libdir}/libgegl-0.3.so"
-FILES_${PN}-dev_remove = "${libdir}/lib*.so"
-
-# Fails to build with thumb-1 (qemuarm)
-# gegl-0.2.0/operations/common/matting-global.c: In function 'matting_process':
-# gegl-0.2.0/operations/common/matting-global.c:463:1: internal compiler error: in patch_jump_insn, at cfgrtl.c:1275
-ARM_INSTRUCTION_SET = "arm"
-- 
2.21.0


