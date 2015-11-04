Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id AEF0A76BD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:03:27 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so92756432wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 08:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=3uJ9eG9F1f5R3VXzrEFTq8l+ixtLEo8BbuNXw7PyJvg=;
	b=mvIlKXSFqoDi0btTzKfXX3q5WnqKoyE5M1jNTIVWRm49yKBnOtFvm/y/8lgtOhKCn2
	ZG+uXwwuQ5dTbl53VEQLHupSGZaPWH3lOc1KdEQauhQ6bBZFAd6J0m6uBXihL6NcYpsT
	6XrmZfceso8/64qt6CWvnPCkh2+TD/48oN/bDsBXsG4lyCpa8pejCKRLN1m9FiMYJqOs
	xGwqNFmdRINqkCYE/RrdEbA7pOpxTcBm12T+ao22bcJVtNY/9i/bBbnjo1v0TJdFbcB+
	hrTIJqCaIqwImGf+zCl9TyLQ1EAswdDJ5XJ86d+4eEzcSAMkvsCzIlQRrR+bMBoisdnm
	HQEA==
X-Received: by 10.194.187.14 with SMTP id fo14mr2813728wjc.104.1446653007295; 
	Wed, 04 Nov 2015 08:03:27 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	lf10sm2260206wjb.23.2015.11.04.08.03.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 08:03:26 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 17:03:18 +0100
Message-Id: <1446652999-24545-2-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1446652999-24545-1-git-send-email-funman@videolan.org>
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 2/3] VLC: make libnotify a configurable dependency
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
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index b989849..ad5c81d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
-   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
+   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
    libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms samba"
@@ -58,6 +58,7 @@ PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
 PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
+PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


