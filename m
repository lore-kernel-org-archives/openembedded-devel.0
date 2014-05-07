Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id ABB7160702
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 17:47:06 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kq14so1467925pab.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 10:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1JkLcAhYPxjz6bZTjDULiplCZbzcjt58fbQcfgsUKmY=;
	b=ZaCd2nGqwZHc7JkVeFA+fCdlETgS6CCVR9yzCLh/pflcc9rtcgs+aL2TG34+vmU3Ga
	/46+n9FAXwEkRUV8ptouu8LLbzNGq4TPgJBCDhzLa54gTsp77M7MwaI6iRWqfbOt59NI
	plZD4hiDPGgxxFWHOp7dEifb14H6vCJXRB2OVkpVUKVBu2CiLakrmWZQGy13jrcEnQwp
	E24MXMV5ntx23L4CQqm/vzv8cT9I4HNzy1LgOcBtRDDqRxgL2wUk/Q9B/geJhXxFT2QP
	YDHJY15c1GbBcvKRuGOPUJHwPTCJHlbldzitVO0vWkd7oClFdPl8K2HbcLB6oMNHHbLt
	X3Lw==
X-Received: by 10.66.140.6 with SMTP id rc6mr21218373pab.87.1399484827369;
	Wed, 07 May 2014 10:47:07 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	gr10sm4274639pbc.84.2014.05.07.10.47.04 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 10:47:05 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 10:47:37 -0700
Message-Id: <1399484857-22483-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][WIP][PATCH v2] vlc: add dependencies, drop unrecognized options
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
X-List-Received-Date: Wed, 07 May 2014 17:47:06 -0000

From: Tim Orling <TicoTimo@gmail.com>

  First version had no "PATCH] on subject line and wrong layer [meta-perl]

  * add PKGCONFIG for libass, mkv
  * drop PKGCONFIG for id3tag, mpeg2dec
  * drop unrecognized options:
  	--enable-v4l,
  	--disable-opengl,-id3tag,-mpeg2dec
  * add dependencies from JaMa builds / configure.ac

  NOTE: requires fluidsynth >= 1.1.2 (will work on that next)

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 1b2490b..58f5648 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -5,9 +5,13 @@ SECTION = "multimedia"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free \
-   dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-lib \
-   libdvdcss libdvdread lua-native lua"
+DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl \
+   libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutls tremor \
+   faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib libdvdcss \
+   libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs libdc1394 \
+   libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
+   libmtp opencv libopus orc libusb1 schroedinger taglib \
+   tiff xcb-util-keysyms samba"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
@@ -26,11 +30,11 @@ EXTRA_OECONF = "\
     --enable-sdl \ 
     --enable-png \
     --enable-live555 --enable-tremor \
-    --enable-v4l2 --enable-v4l --disable-aa --disable-faad \
+    --enable-v4l2 --disable-aa --disable-faad \
     --enable-dbus \
     --without-contrib \
     --without-kde-solid \
-    --disable-opengl --disable-glx \
+    --disable-glx \
     --enable-realrtsp \
     ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
     ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
@@ -38,11 +42,11 @@ EXTRA_OECONF = "\
 "
 
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
-PACKAGECONFIG[id3tag] = "--enable-id3tag,--disable-id3tag,libid3tag"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
-PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
+PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
+PACKAGECONFIG[mkv] = "--enable-mkv,--disable-mkv,libmatroska libebml"
 
 do_configure() {
     cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ 
-- 
1.8.3.2


