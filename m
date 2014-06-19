Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8FC6FD64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:59:54 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id u57so2118798wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9ZfUB+6zBKCrLJClWRflWa1B+eFGmnJYv9yOsAOrA3U=;
	b=M1pztKF33913X3Vul2fFHbkLaKLXLrmk2b+qfXr33PngapLKedfMWdh1SJ5JJq8DYf
	pbGPboEbZwP76l3Bfv6Ee6vxnRSJkyw6XJOi+Q1HVnNWoAYikv+sM62ztF1lgXJQEQCv
	UTOAbj0AHxY7uTs6AHA6bFLUMOkSJPIcFRKnUWhDv3zpjCyeUR0oOO9+ubnmeK2vt+mT
	7mEwY5/sWoEt/xiJ7XZvXQAWh2KGmTZr+V92P0CFhtLRgv3BWnUXkALpmLaTh3jglME4
	r+nxca4ZY/sDVPOG0HAYVBKOXm6sB1XD8Gw6loB+AcFtMQdkvpSG/dBQQXYkMCCMJjJV
	KTNA==
X-Received: by 10.180.184.36 with SMTP id er4mr5020059wic.37.1403171994624;
	Thu, 19 Jun 2014 02:59:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dt7sm9422550wic.6.2014.06.19.02.59.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:59:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:29 +0200
Message-Id: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH 01/25] libsdl-image, vlc, xbmc: Blacklist because of broken libsdl-image after libsdl2-config was removed
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
X-List-Received-Date: Thu, 19 Jun 2014 09:59:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb           | 2 ++
 meta-multimedia/recipes-multimedia/vlc/vlc.inc                 | 2 ++
 meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 4b65152..00806d9 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -3,6 +3,8 @@ SUMMARY = "XBMC Media Center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
 
+PNBLACKLIST[xbmc] = "BROKEN: depends on broken libsdl-image"
+
 DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml libmad"
 #require recipes/egl/egl.inc
 
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 58f5648..e773082 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -5,6 +5,8 @@ SECTION = "multimedia"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+PNBLACKLIST[vlc] = "BROKEN: depends on broken libsdl-image"
+
 DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl \
    libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutls tremor \
    faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib libdvdcss \
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index d8c56fb..b69b5f3 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -4,6 +4,8 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 
+PNBLACKLIST[libsdl-image] = "BROKEN: needs to be updated to use libsdl pkg-config instead of libsdl2-config"
+
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz"
-- 
2.0.0


