Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f41.google.com (unknown [209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 73F7661FE4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 06:49:48 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id e16so1049746lan.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 23:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FZKez7rV8eauUel7eJkrpcPBkjI8ZhBbSzyOqXI8yAI=;
	b=NOOoHoO8X/vt+iihcDj0X+wadAUHtsgrh6rU6gglQDX7tTmEH2XtGmRjCi9GFVov7A
	MkDxoF2Iah9pUl4sPmDhvPifxdXwYE3ishn9pF3FpUitCOnEOErZCtvgigxAWUwaQgsV
	TZK0gk+X7317XH63A5lNztpjIn+B0ElprTrULX1hJpKSEaONvmRyn3KMJbSTjw9U/jLM
	e/gujV4IJ/NKsNy8bR/CDZERCBCCAGyX0jkDTS5lnNXCX9TyE+GCrLgJq8yLXRYRGdFU
	N9j5ZNQSiwgpHAaJVi3vIaskj7fhu9ewh/ZBmHCDv7XU+WULdhcxR1Xz+GJke/SOW2AA
	SZag==
X-Received: by 10.112.13.72 with SMTP id f8mr443587lbc.40.1399790989246;
	Sat, 10 May 2014 23:49:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	zx3sm9583099lbc.2.2014.05.10.23.49.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:49:48 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 08:50:06 +0200
Message-Id: <1399791009-2718-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] navit: add PACKAGECONFIG for imlib2, qt, gtk, sdl
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
X-List-Received-Date: Sun, 11 May 2014 06:49:52 -0000

* fixes following issues from test-dependencies report:
  navit/navit/latest lost dependency on  fribidi
  navit/navit-graphics-gtk/latest lost dependency on  imlib2
  navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit.inc               | 11 ++++++++---
 .../navit/navit/configure.add.imlib2.option.patch        | 16 ++++++++++++++++
 meta-oe/recipes-navigation/navit/navit_svn.bb            |  1 +
 3 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch

diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index 8b63bba..eb8f43a 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed539d099d6ce08de6ea0dfed9ecb333 \
 "
 
 SECTION = "x11/applications"
-DEPENDS = "glib-2.0 gtk+ qt4-x11-free gd gypsy librsvg-native"
+DEPENDS = "glib-2.0 gd gypsy librsvg-native"
 RDEPENDS_${PN} = " ${PN}-icons ${PN}-config "
 RDEPENDS_${PN}-gui-qml = "qt4-plugin-imageformat-svg"
 RRECOMMENDS_${PN} = "gpsd ${PN}-dbus ${PN}-speech-cmdline ${PN}-gui-internal ${PN}-graphics-gtk"
@@ -17,12 +17,17 @@ INC_PR = "r11"
 
 inherit autotools gettext
 
+PACKAGECONFIG ?= "qt"
+PACKAGECONFIG[fribidi] = "--enable-fribidi,--disable-fribidi,fribidi"
+PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
+PACKAGECONFIG[sdl] = "--enable-graphics-sdl,--disable-graphics-sdl,libsdl"
+PACKAGECONFIG[gtk] = "--enable-graphics-gtk-drawing-area --enable-gui-gtk,--disable-graphics-gtk-drawing-area --disable-gui-gtk,gtk+"
+PACKAGECONFIG[qt] = "--enable-graphics-qt-qpainter --enable-gui-qml,--disable-graphics-qt-qpainter --disable-gui-qml,qt4-x11-free"
+
 EXTRA_OECONF += " \
     --disable-binding-python \
     --disable-samplemap \
     --enable-avoid-unaligned \
-    --enable-graphics-qt-qpainter \
-    --enable-gui-qml \
     --enable-svg2png-scaling-flag=32 \
     --disable-speech-speech-dispatcher \
     --enable-cache-size=20971520 \
diff --git a/meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch b/meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch
new file mode 100644
index 0000000..be41792
--- /dev/null
+++ b/meta-oe/recipes-navigation/navit/navit/configure.add.imlib2.option.patch
@@ -0,0 +1,16 @@
+--- a/configure.in.orig	2014-05-10 15:57:18.146362110 +0200
++++ b/configure.in	2014-05-10 15:59:27.859358845 +0200
+@@ -498,10 +498,13 @@
+ AC_SUBST(FRIBIDI_CFLAGS)
+ AC_SUBST(FRIBIDI_LIBS)
+ 
++AC_ARG_ENABLE(imlib2, [  --disable-imlib2  disable imlib2 support], imlib2=$enableval;imlib2_reason="configure parameter", imlib2=yes)
++if test x"${imlib2}" = "xyes"; then
+ PKG_CHECK_MODULES(IMLIB2, [imlib2], [imlib2_pkgconfig=yes], [imlib2_pkgconfig=no])
+ if test "x$imlib2_pkgconfig" = "xyes"; then
+    AC_DEFINE(HAVE_IMLIB2, 1, [Define to 1 if you have imlib2])
+ fi
++fi
+ AC_SUBST(IMLIB2_CFLAGS)
+ AC_SUBST(IMLIB2_LIBS)
+ 
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index 2661507..eff1eb3 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -7,4 +7,5 @@ PR = "${INC_PR}.3"
 S = "${WORKDIR}/${PN}"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
     file://freetype-include-path.patch \
+    file://configure.add.imlib2.option.patch \
 "
-- 
1.9.2


