Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2659C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 15:14:39 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.293.1657293272400697632
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 08:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AtH18Kef;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 268FEVKA118725;
	Fri, 8 Jul 2022 10:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657293271;
	bh=brwE656rntXuNXIsTf0EmDcSMBZ8QzzDB10CpWVFc/A=;
	h=From:To:CC:Subject:Date;
	b=AtH18KefgRKAzlt6ZmsdB6gUsyORYDy1fbgm1O+kw6AfBTxavjtFmiAnVF1bwQbVA
	 I22M0MGNZ3l2MRX6aBMkKgXfzh4U/ZoOXfNWFI9ImAvnOAVCbzdmtoMXl8dN4GYJ8E
	 iHL3laysB6qmjdB/qq+y580KTlbwh87RuyFrC4JM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 268FEVH0006831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Jul 2022 10:14:31 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 8
 Jul 2022 10:14:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 8 Jul 2022 10:14:30 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 268FEUa5052433;
	Fri, 8 Jul 2022 10:14:30 -0500
From: Andrew Davis <afd@ti.com>
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-oe][PATCH] libsdl: The libsdl and libsdl2 are not virtual
Date: Fri, 8 Jul 2022 10:14:30 -0500
Message-ID: <20220708151430.22040-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 15:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97790

There is only one provider, these should not be virtual.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb                   | 4 ++--
 .../recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb         | 2 +-
 .../recipes-multimedia/pipewire/pipewire_0.3.50.bb            | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb          | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb        | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb        | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb           | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb          | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb        | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb        | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb          | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb         | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb              | 2 --
 13 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
index 64291bee5..913957c3a 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
@@ -38,8 +38,8 @@ PACKAGECONFIG[libraw] = "-Dlibraw=enabled,-Dlibraw=disabled,libraw"
 PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
 PACKAGECONFIG[pango] = "-Dpango=enabled -Dpangocairo=enabled,-Dpango=disabled -Dpangocairo=disabled,pango"
 PACKAGECONFIG[poppler] = "-Dpoppler=enabled,-Dpoppler=disabled,poppler"
-PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,virtual/libsdl"
-PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
+PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,libsdl"
+PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,libsdl2"
 PACKAGECONFIG[tiff] = "-Dlibtiff=enabled,-Dlibtiff=disabled,tiff"
 PACKAGECONFIG[webp] = "-Dwebp=enabled,-Dwebp=disabled,webp"
 
diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
index 700df2cef..47173d71d 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[mpg123]             = "--with-mpg123,--without-mpg123,mpg123"
 PACKAGECONFIG[ogg]                = "--with-ogg,--without-ogg,libogg"
 PACKAGECONFIG[portaudio]          = "--with-portaudio,--without-portaudio,portaudio-v19"
 PACKAGECONFIG[pulseaudio]         = "--with-pulseaudio,--without-pulseaudio,pulseaudio"
-PACKAGECONFIG[sdl2]               = "--with-sdl2,--without-sdl2,virtual/libsdl2"
+PACKAGECONFIG[sdl2]               = "--with-sdl2,--without-sdl2,libsdl2"
 PACKAGECONFIG[sndfile]            = "--with-sndfile,--without-sndfile,libsndfile1"
 PACKAGECONFIG[vorbis]             = "--with-vorbis,--without-vorbis,libvorbis"
 PACKAGECONFIG[vorbisfile]         = "--with-vorbisfile,--without-vorbisfile,libvorbis"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
index 0f527c0a5..c176c6eeb 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
@@ -100,7 +100,7 @@ PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled
 PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
 PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
 PACKAGECONFIG[raop] = "-Draop=enabled,-Draop=disabled,openssl"
-PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
+PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,libsdl2"
 PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
 PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=enabled,-Dsystemd-system-service=disabled,systemd"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
index b077a0bdf..666442fba 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d1de21f0b70830e299905eac3419084"
 
-DEPENDS = "virtual/libsdl"
+DEPENDS = "libsdl"
 
 SRC_URI = "http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${PV}.tar.gz"
 SRC_URI[md5sum] = "ea24ed4b82ff1304809c363494fa8e16"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
index 14f30e097..5a93dc19a 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 
-DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
+DEPENDS = "tiff zlib libpng jpeg libsdl"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz \
            file://configure.patch"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
index c83fcc8da..a470ee81d 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simple DirectMedia Layer mixer library"
 SECTION = "libs"
-DEPENDS = "virtual/libsdl flac libmikmod libvorbis"
+DEPENDS = "libsdl flac libmikmod libvorbis"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a37a47a0e579e461474cd03b9e05199d"
 
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
index b021e565e..49b1ef287 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9cf3de2d872bf510f88eb20d06d700b5"
 
 inherit autotools pkgconfig
 
-DEPENDS = "virtual/libsdl"
+DEPENDS = "libsdl"
 
 SRC_URI = " \
   https://www.libsdl.org/projects/SDL_net/release/SDL_net-${PV}.tar.gz \
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
index 6673ba3d4..797c38d8e 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
-DEPENDS = "virtual/libsdl freetype"
+DEPENDS = "libsdl freetype"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=22800d1b3701377aae0b61ee36f5c303"
 
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb
index 1218b6880..57f0f9979 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=822edb694b20ff16ceef85b27f61c11f"
 
-DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
+DEPENDS = "tiff zlib libpng jpeg libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
 SRC_URI[md5sum] = "f26f3a153360a8f09ed5220ef7b07aea"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
index 897a33f08..dbcb2a193 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simple DirectMedia Layer mixer library V2"
 SECTION = "libs"
-DEPENDS = "virtual/libsdl2 flac libmikmod libvorbis"
+DEPENDS = "libsdl2 flac libmikmod libvorbis"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=516daf7a177ad4c8874bb9efa1a69c1f"
 
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
index f09dc5efb..35369e873 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/SDL2_net-${PV}"
 
 inherit autotools pkgconfig
 
-DEPENDS = "virtual/libsdl2"
+DEPENDS = "libsdl2"
 
 SRC_URI[md5sum] = "5c1d9d1cfa63301b141cb5c0de2ea7c4"
 SRC_URI[sha256sum] = "15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
index 0951d721b..aae803f2e 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
-DEPENDS = "virtual/libsdl2 freetype virtual/egl"
+DEPENDS = "libsdl2 freetype virtual/egl"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e98cfd01ca78f683e9d035795810ce87"
 
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 9085c6d2f..e2992b5dd 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -10,8 +10,6 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-PROVIDES = "virtual/libsdl"
-
 PR = "r3"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
-- 
2.36.1


