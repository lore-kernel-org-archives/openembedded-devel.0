Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id AFEAC65D4C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 16:47:56 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so2473932eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 09:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5i2vwy5/qAM9LfUZJ1O4SNiCTX24UanHOOiqFXXndtY=;
	b=WThjgvziTV6/lv3Cuoz+jvd+3Af3XIslAXq1RTYVRXMEI3QjQMKcFKj9h/aaeE9Z7t
	gMsZicVoyYEzxwVoal5ridqGuz5IKFav8Ga5JHR30JVdp2Y+0KganXxc+BHlEWzxBVPG
	T366CLLmI1hYOg4jT3zY2sQM5lJf94tlswz9zYA+o3Q/IjscIbb4Mvy2O4sdA0WkxuwZ
	uH8MwYIj31/+Lbv+yj8/ePu5x1bNI5gOQznWES0RRiy1ej61ydUnpAmtOfVABCW6kFBh
	67rG3+2JHM+0fJxF00tnTwuj6OsifFJaXl+MvLRbHknzoRUBtMF8Tk3Vy1w0ZrscwZxy
	o+Ng==
X-Received: by 10.14.94.5 with SMTP id m5mr31749803eef.23.1397926076624;
	Sat, 19 Apr 2014 09:47:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	45sm87028987eeh.9.2014.04.19.09.47.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 09:47:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Apr 2014 18:47:48 +0200
Message-Id: <1397926070-7453-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
References: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] efl: explicitly depend on lua5.1
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
X-List-Received-Date: Sat, 19 Apr 2014 16:47:58 -0000

* even with luajit in DEPENDS, old lua5.1. was referenced from pkg-config
  and other recipes were failing when trying to use edje without lua5.1
  in sysroot, e.g. cpu, e-tasks, e-wm, e-wm-config-illume2-shr, diskio

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 56b3cd2..929fc20 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -2,8 +2,8 @@ SUMMARY = "EFL"
 LICENSE = "MIT BSD LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1809a807e39dd48ddcf7be98477d130"
 
-DEPENDS_class-native = "lua5.1-native freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
-DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 luajit dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
+DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
+DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
 
 inherit efl gettext pkgconfig
 
@@ -42,8 +42,8 @@ EXTRA_OECONF_append_class-native = " \
     --disable-image-loader-xpm \
 "
 
-PACKAGECONFIG ?= "opengl-es gstreamer1 pulseaudio"
-PACKAGECONFIG_class-native = ""
+PACKAGECONFIG ?= "opengl-es gstreamer1 pulseaudio lua-old"
+PACKAGECONFIG_class-native = "lua-old"
 
 # sort of tri-state
 PACKAGECONFIG[opengl-full] = "--with-opengl=full,,virtual/libgl"
@@ -53,8 +53,14 @@ PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
 PACKAGECONFIG[gstreamer1] = "--enable-gstreamer1,--disable-gstreamer1,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-# we don't have luajit-native now, so use old lua for -native
+# we don't have luajit-native now, so use old lua for -native and
+# for target it's also currently failing with luajit
+# | /OE/build/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/core2-64-oe-linux/gcc/x86_64-oe-linux/4.8.2/ld: /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libluajit-5.1.a(lj_err.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
+# | /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libluajit-5.1.a: error adding symbols: Bad value
+# | collect2: error: ld returned 1 exit status
+# | Makefile:12007: recipe for target 'lib/edje/libedje.la' failed
 PACKAGECONFIG[luajit] = "--disable-lua-old,--enable-lua-old,luajit"
+PACKAGECONFIG[lua-old] = "--enable-lua-old,--disable-lua-old,lua5.1"
 
 # new efl doesn't have option to disable eeze build and we don't want to provide udev-native just to build eeze-native we don't need
 do_configure_prepend_class-native() {
-- 
1.9.1


