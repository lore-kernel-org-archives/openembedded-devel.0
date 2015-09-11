Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9493373D27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 04:54:29 +0000 (UTC)
Received: by ykdg206 with SMTP id g206so80272819ykd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 21:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CfUCUt8zKusXdwjnmEdma85Rh48ZTGdspNgEMvNzIo8=;
	b=LQ2+zhfWgMBi8soZLKRxujgoan8PFJ97aCVL5r5VAHgzLKtEO4bo+aYHz5s8dlIPYX
	HL71aef4PZyFYtgGClddiPk9hiYoqsIslpzrB2THKTtuytTRaSzuSTiMdeD7n0aDpJth
	TrOHQBilf3GJw+heKQL8szIEkVp6O34gb4y8CjkeQAmbrywaRMvCNg/gCrWufNFKRz3o
	FCMAiUftwKMkY9x3XJelUms7mUEo3puxhPVDL+9UXEqeJbajIG3mczXAZ+gMEY9OzTJl
	I/eT8fBoXKSi9zbRtYgzzH+LaIwEyUqJ17pURCvoL6GUObLpngZAhiVV1V0wPlVCEsla
	+ToA==
X-Received: by 10.170.147.2 with SMTP id o2mr51714632ykc.2.1441947269356;
	Thu, 10 Sep 2015 21:54:29 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	u79sm11709546ywf.21.2015.09.10.21.54.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 21:54:28 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2015 21:54:09 -0700
Message-Id: <1441947249-18500-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-multimedia][PATCH] vlc: add PACKAGECONFIG for qt4
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
X-List-Received-Date: Fri, 11 Sep 2015 04:54:29 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index bf7ce0c..592b9e5 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native gst-plugins-bad \
-   virtual/libsdl libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutls \
+   virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
    libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
    libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
@@ -56,6 +56,7 @@ PACKAGECONFIG[libva] = "--enable-libva --enable-avcodec,--disable-libva --disabl
 PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
+PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.1.0


