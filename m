Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id EE6C5736B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 09:03:25 +0000 (UTC)
Received: by wmec201 with SMTP id c201so164960162wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AUemDWapb2SbuaIctALeRiqGRmGJak/q9WoCaKNGP7M=;
	b=g2LZcCLZMBB2eS3v8tHtimfNo0r1WlFch46M+3b3xOkzt2PI6/kFWaAavoVHTPqjx4
	I7l6fqbUPPcXOByDsgojNOXCf/jH5z3GBkW6mey8/XvYF9k8oSxWq8ba6Dm+fyVUTRwE
	1Z7qi+7yl3/PWtKaM9gC9j7tYEYKYv9uFem39fU9ippX6gVu/U7vDib4Qb/4Xt+wbfQG
	vmZv/2F7gVfKAMfhy2pVGYDgdWFhKWPSgR5voSUSCFjvxcgEWQHZXZCau8FunVGDfr8C
	DMeirs08wO1bz8niKs9OtO4L6syhK5O5l4oYgCcErcHpxwDBW8hIdprC46nq3Kg+V/g/
	j6UA==
X-Received: by 10.194.95.202 with SMTP id dm10mr36205431wjb.56.1447664605275; 
	Mon, 16 Nov 2015 01:03:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	om1sm33450020wjc.2.2015.11.16.01.03.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 01:03:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Nov 2015 10:03:27 +0100
Message-Id: <1447664607-30891-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCHv2][meta-multimedia] vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec
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
X-List-Received-Date: Mon, 16 Nov 2015 09:03:26 -0000

* hopefully fixes:
WARN: vlc: vlc rdepends on libavc1394, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libcroco, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libcrypto, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libdvdnav, but it isn't a build dependency?
WARN: vlc: vlc rdepends on librsvg, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libssh2, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libssl, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libupnp, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libvorbis, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libxml2, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index b0dad67..9adcdb1 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -11,7 +11,7 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    libdvdcss libdvdread lua-native lua libidn libnotify gtk+ \
    libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
-   tiff xcb-util-keysyms samba"
+   tiff xcb-util-keysyms"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
@@ -60,6 +60,16 @@ PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnomevfs, gnome-vfs"
+PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
+PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
+PACKAGECONFIG[dvdnav] = "--enable-dvdnav,--disable-dvdnav,libdvdnav"
+PACKAGECONFIG[sftp] = "--enable-sftp,--disable-sftp,libssh2"
+PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
+PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libvorbis libogg"
+PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
+PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libavc1394"
+PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
+PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.6.3


