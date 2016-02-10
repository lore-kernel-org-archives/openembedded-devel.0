Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 526D973179
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:54:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c200so4036810wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=5oF/+UrpqHtWyrUuG+GFeBF6TPPFLasONmE9r62rQ4o=;
	b=NIRFmBYRX1NYFd8sPB43NSqjd1IJ3ZyUvMxkqJGEbXDQG1Z6gLxOulUEpYY1aJCkHA
	uQuDyFOEBGDOW6oUZ32LRbBaUCNexJXeS55AN3XpoOZS5mfVAp9aPbgTFrMFmGznGmqp
	dDAnpzWWXk9IqYa7xxzLy5LQNHlcw9DKZeKPBAqb1F5Q20Uunfc7M4vk3ps5Sfah96oz
	hsq5gJEbNkEccJhJd40Z2YdIBEcrezzwCbYe0ZTeAPggvBeGlSSZhEn2Hnno1iB3Lr2n
	2mAV2AZEtL/1b7SI0mAmEOpkt7tVtr7JvkLyqDTV5edcXofJmTinFEvB0zH07HtJKeAs
	vdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=5oF/+UrpqHtWyrUuG+GFeBF6TPPFLasONmE9r62rQ4o=;
	b=GMAZfYcQOMflW+mNycESjjrLfdiPfwhWHyieadDFRfq+KD8ol7JPER38JLDKCHWcId
	DVGdYz6vYs0Q9+AJBMkLkno7X4JEecin4QAT0yswqOLKZzlT0hbxwAMlllNaidLXOm3z
	DfW/1vg4Sf012qxJnYKokOSTLO/WvEdGCkcQikMOPo9E0JljPd0okozKiKMnIQaNaOGn
	DEdeQUnje/MUMrkBkbFGNuCdWh/e/a5Zo9mNm4vao2KnIBqSzYPAA7QJftCJGMy7Crub
	32D/YNR/eqkTjsSaKGntE5rFrJZdZHo1hUL0h9QDTLc4M3R+wKwFgtadn3EwrF5Hqy/F
	ZW3w==
X-Gm-Message-State: AG10YOTKwRNgkLfVIW1LmJKIzomjtibQuBn+3IOd1PK5JI6Qmb4sYmsi4RBb9vxnza4y6Q==
X-Received: by 10.194.87.201 with SMTP id ba9mr39770225wjb.128.1455108867816; 
	Wed, 10 Feb 2016 04:54:27 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id w66sm3347256wmd.2.2016.02.10.04.54.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 04:54:27 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2016 13:54:21 +0100
Message-Id: <1455108862-2507-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-multimedia][PATCH 1/2] vlc: make x11 DISTRO_FEATURE optional (enabled by default)
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
X-List-Received-Date: Wed, 10 Feb 2016 12:54:28 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 46dbd5d..2887a68 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -7,17 +7,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
-   tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
+   tremor faad2 ffmpeg flac fluidsynth alsa-lib \
    lua-native lua libidn \
    avahi jpeg xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
-   tiff xcb-util-keysyms"
+   tiff"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
 inherit autotools gettext pkgconfig distro_features_check
-# depends on libxinerama libxpm xcb-util-keysyms
-REQUIRED_DISTRO_FEATURES = "x11"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -41,7 +39,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -73,6 +71,7 @@ PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfi
 PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
 PACKAGECONFIG[vnc] = "--enable-vnc,--disable-vnc, libvncserver"
+PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util-keysyms libxpm libxinerama"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


