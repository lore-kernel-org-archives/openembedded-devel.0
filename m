Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 109C36057A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:15:09 +0000 (UTC)
Received: by wmww144 with SMTP id w144so238050538wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=qzKU3JCVMxVVkMZ0wft55/ro6K3/mD6pvnaSKgDDxyI=;
	b=eiCF9fXUrMQJCuAmf8i56EoLcnS//BNmOgIJWZUOZJgJVLjbhOgjyQH6fFf2L+7/I1
	HmBD5Sf4/7AbkSknplhVTJLtFaki9JMvxr1d1PqhNCILtwLhZl5ex8S+YhYFRb8gA8h1
	gOoYt+BtAjfOqgj6JgoIT22gdnQQIE53B/7pUANiO+SsKOMBdY9JkKqT8rBqXLXWWMaD
	jw/7l9MBoxWVZs+h3AnfN8+AzN3+PzBZQrPzD8Pc9yCU4tyBWeArCjQ3lgfMIQbQECf4
	0ZWuzCU0rIoXWdIdOLudff3ioMc4bncD86sb06qGmAvafkUmkYmCWwVgva3Fl9dCgwfN
	YQ4A==
X-Received: by 10.28.212.84 with SMTP id l81mr10966266wmg.50.1447938910249;
	Thu, 19 Nov 2015 05:15:10 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	m135sm3169617wmb.0.2015.11.19.05.15.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 05:15:08 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:14:56 +0100
Message-Id: <1447938897-26171-5-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1447938897-26171-1-git-send-email-funman@videolan.org>
References: <564DC01B.4000103@videolan.org>
	<1447938897-26171-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 5/6] VLC: make libdvdread PACKAGECONFIG
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
X-List-Received-Date: Thu, 19 Nov 2015 13:15:12 -0000

Enable it by default.
Make both dvdread and dvdnav also depend on libdvdcss
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index af39ae6..99a6c66 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
-   libdvdcss libdvdread lua-native lua libidn \
+   lua-native lua libidn \
    avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms"
@@ -22,7 +22,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 ARM_INSTRUCTION_SET = "arm"
 
 EXTRA_OECONF = "\
-    --enable-dvdread \
     --with-contrib \
     --enable-run-as-root \
     --enable-xvideo \ 
@@ -43,7 +42,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -62,7 +61,7 @@ PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnomevfs, gnome-vfs"
 PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
 PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
-PACKAGECONFIG[dvdnav] = "--enable-dvdnav,--disable-dvdnav,libdvdnav"
+PACKAGECONFIG[dvdnav] = "--enable-dvdnav,--disable-dvdnav,libdvdnav libdvdcss"
 PACKAGECONFIG[sftp] = "--enable-sftp,--disable-sftp,libssh2"
 PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
 PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libvorbis libogg"
@@ -73,6 +72,7 @@ PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
 PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
 PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
 PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
+PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


