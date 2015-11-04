Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE2B76BD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:03:25 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so35277770wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 08:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=/MWczdBP8GAw4cNcGTdEle/ueNhCUz9km1JRhm/lvHI=;
	b=Q29P4RHR2pJ2McvCsYUVYi1G0f+aCOFP8BaTnHn9ndYvCPtHHPVZwaY8R0bEppDGxW
	gTDmhHGTc7sNbJ9tXIZLVwRO6+6eeZaWfwhNQzGRp/AG1fItdwpipQ8RNHeXBRkc59dJ
	B0i6dMlHJqoCmgegCKqYgVjlVqfQ1c5iaSHEZ9C4RIhjuk96UVIqGQ6mkTMs/5XJbZn1
	1wbxGz9uQ+qi2b+qKps3PkF4PjCXy21N+GRMjumg7jFTKbTM6d5VfvSR6iloVNuhzFhN
	t1HG2BGGlNFxOXxNevZb9bfLVPtloLXyyxoqMzFXGZPmHDmiInqQiIbGqW4dbhiS6Cao
	Q5VQ==
X-Received: by 10.194.175.164 with SMTP id cb4mr2908676wjc.72.1446653005570;
	Wed, 04 Nov 2015 08:03:25 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	lf10sm2260206wjb.23.2015.11.04.08.03.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 08:03:24 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 17:03:17 +0100
Message-Id: <1446652999-24545-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-multimedia][PATCH 1/3] VLC: depends on gst-plugins-bad only if gst is enabled
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
X-List-Received-Date: Wed, 04 Nov 2015 16:03:29 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index ee90ac8..b989849 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native gst-plugins-bad \
+DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
    libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
@@ -54,7 +54,7 @@ PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
 PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[libva] = "--enable-libva --enable-avcodec,--disable-libva --disable-avcodec,libva libav"
 PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
-PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
 PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
-- 
2.5.0


