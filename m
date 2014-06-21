Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 997336FFA8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:11 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so4666469wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mKU0lAxJ4IgqDJcX12eT43yFdukgobRjTLBLu4Caldw=;
	b=SKy1DK3Ot8+CmRKOvuwonQ0FTDTbkNwjqJiz0PUWPXO/uwO6cq3Etf4ZN+cBg4O+EB
	ohqjZ2CUWy2gHGMUF1H1P2wQ9lgywgoGf0p8vuB0Fh6STinsijvbVDxdBHooB3lgiZ7p
	KYDWZleOeFx/v/Q6WStALBcjF4piMqv4/iLM/NEk8JjEWrrE2p8PUjMSfQt/X5Pw5LfP
	N0TrU3TAu1IAaVyM20s256mHlZRtGSvBzIUXxIfMdAORpa9d8O8f2z/q2RNvHeNeibsS
	dr7WJaZVF6CzUy/dtxQ1EurSlC2GyNwWU6w4hTLKqpbKy/7NOt3eIy3YSnIxYtVKWsBW
	SaBQ==
X-Received: by 10.194.110.10 with SMTP id hw10mr10844173wjb.81.1403342352091; 
	Sat, 21 Jun 2014 02:19:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gc5sm12456593wic.6.2014.06.21.02.19.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:00 +0200
Message-Id: <1403342349-11180-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 03/12] recipes: add missing gtk-doc class dependencies
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:16 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

* These recipes all use gtk-doc m4 macros but were missing
  dependencies on the class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc              | 12 +-----------
 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb        |  2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb |  8 +-------
 meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb         |  2 +-
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb  |  2 +-
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb         |  2 +-
 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb    |  2 +-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb             |  2 +-
 meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb              |  2 +-
 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb |  2 +-
 10 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index b876db4..8b6007e 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -5,11 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/gnome/libs"
 DEPENDS = "glib-2.0 orbit2 intltool-native libxml2 dbus dbus-glib"
 
-inherit gnomebase
-
-SRC_URI += "file://gtk-doc.m4 \
-            file://gtk-doc.make \
-"
+inherit gnomebase gtk-doc
 
 ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
@@ -23,12 +19,6 @@ LEAD_SONAME = "libbonobo-2.so"
 
 PARALLEL_MAKE = ""
 
-do_configure_prepend() {
-    install -d m4
-    install ${WORKDIR}/gtk-doc.m4 m4/
-    install ${WORKDIR}/gtk-doc.make ./
-}
-
 do_compile() {
     oe_runmake ORBIT_IDL="${ORBIT_IDL_SRC}"
 }
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
index 6cf1e3f..5b367de 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
 
 DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native"
 
-inherit gnomebase pkgconfig autotools-brokensep gettext
+inherit gnomebase pkgconfig autotools-brokensep gettext gtk-doc
 
 SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
 SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index b33fc85..22b3bf4 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 SECTION = "x11/gnome/libs"
 
-inherit gnome
+inherit gnome gtk-doc
 
 # intltool to provide IT_PROG_INTLTOOL
 # configure: line 12654: syntax error near unexpected token `0.35.0'
@@ -13,13 +13,7 @@ DEPENDS = "gtk+ libglade libart-lgpl xineramaproto intltool-native"
 SRC_URI[archive.md5sum] = "ffcbb719c671ff5cd86e59aeba8d0b92"
 SRC_URI[archive.sha256sum] = "859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40"
 
-EXTRA_OECONF = "--disable-gtk-doc"
-
 FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
 FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
 FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas*.la"
 FILES_${PN}-staticdev += "${libdir}/libglade/*/libcanvas*.a"
-
-do_configure_prepend() {
-    sed -i -e s:docs::g ${S}/Makefile.am
-}
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
index d2fedfc..69a0f5c 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "LibGTop2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
 
-inherit gnomebase lib_package
+inherit gnomebase lib_package gtk-doc
 SRC_URI[archive.md5sum] = "ed44d736efd97d062b77621de6aff439"
 SRC_URI[archive.sha256sum] = "49958d7da1f76b257bfd0d557d8ed2b218a5ab0d31b59fed1c32ddf2a1529f5d"
 
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
index c864276..e512419 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c4f38aef94828f6b280e00d1173be689"
 
 DEPENDS = "glib-2.0 libcheck openssl libidn"
 
-inherit gnomebase
+inherit gnomebase gtk-doc
 
 PR = "r2"
 
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 48a80e5..2d7cff3 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -16,7 +16,7 @@ DEPENDS = "glib-2.0 gstreamer"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index b10c3fd..cb171ac 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS = "gstreamer gtk+ gtk+3 libtool libvorbis"
 
-inherit autotools
+inherit autotools gtk-doc
 
 SRC_URI = " \
     http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz \
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 2138e7d..e306e89 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -17,7 +17,7 @@ SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5
 
 PR = "r9"
 
-inherit autotools systemd
+inherit autotools systemd gtk-doc
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
index 7eea2f9..44ae51f 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
 DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util intltool-native"
 PR = "r1"
 
-inherit xfce
+inherit xfce gtk-doc
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
 SRC_URI[md5sum] = "c3cf89c836be0ddb281c81e4808fb68b"
diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
index b4e15e8..4a79f82 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
-inherit xfce
+inherit xfce gtk-doc
 
 SRC_URI[md5sum] = "11eec87e8eda2bc62512c2416cb807a1"
 SRC_URI[sha256sum] = "e82cd1ad715c02a385b3cf6646cb89aa3c4724446dac1d7e424971df12f6cfbb"
-- 
2.0.0


