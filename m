Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 40C7D7737C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:17:51 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so83021873wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wL37wAA9HEogPCHHyakNIIw5gbgYzgH8AYbBJjSuEqs=;
	b=1HxjvFEAMBGg+Cb1tMU40787ld6+DpqE5vfY3cW/2A+J6MdRbjSKo3JvNayf49kZmW
	aVdpuapXu/YmxwYlIruk7SbiIG6u3NTeM8K365V7QdUE5Smmfc4TmRsTNqKYY7j+Q/fR
	+p7EgxHYJcECG7TIsa7nlDdS0tndfAT1zAiRaT79S/kYZdLJxQewaS7/aJeDeBFYyKxy
	nEOPjXg83d2xS1cpu+hn6Nj6+ni5OyytmY2HBpsqewgr0LqA6DnzDD90GK8O75X9VhC2
	XCVG6k6i6/ki+lFBThCcNazSARi+1NT1lXFweAf7IqlUg7OeNXJNlzBM4qRoDBLYErcO
	rFbQ==
X-Received: by 10.194.109.2 with SMTP id ho2mr26109650wjb.40.1447604271664;
	Sun, 15 Nov 2015 08:17:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wh10sm4301804wjb.45.2015.11.15.08.17.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 08:17:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Nov 2015 17:17:40 +0100
Message-Id: <1447604260-5460-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 8/8] vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec
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
X-List-Received-Date: Sun, 15 Nov 2015 16:17:52 -0000

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
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index b0dad67..b4fc5ac 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -11,7 +11,7 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    libdvdcss libdvdread lua-native lua libidn libnotify gtk+ \
    libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
-   tiff xcb-util-keysyms samba"
+   tiff xcb-util-keysyms"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
@@ -60,6 +60,15 @@ PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnomevfs, gnome-vfs"
+PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
+PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
+PACKAGECONFIG[dvdnav] = "--enable-dvdnav,--disable-dvdnav,libdvdnav"
+PACKAGECONFIG[sftp] = "--enable-sftp,--disable-sftp,libssh2"
+PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis"
+PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
+PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libavc1394"
+PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
+PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.6.3


