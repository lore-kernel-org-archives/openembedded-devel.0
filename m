Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5A66C6BDA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:17 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so343162eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Iwe1KRJ/32+69haIp/XxyCwBlTZgguhDLBfHLkyDLD0=;
	b=FY9HVgNpI6MRBVCq9aiX0zNFurEJpLEWp6QHOMEp6EoYxlhDgEamv50jU3MgcmbVXp
	MwaKc7Gro2Gs07m9yyLrZKDebBGIugw77sQDpXkA6aR2zOujWPoS9+W/4ko+EM4o/0zE
	y/yJVydwonNMRg7rdxsldjnOdl2X9j001S4/wJ5GIntYiVR04o8coLbI7fIjWlhvK7mb
	doIXtqvwxLUIUsN4FnIHtXHDUOQHD9gZAYpc1659fG9mjyOPfydieZoT8GZk5mf45f+p
	kb9Qqyw7+VgxBROv2cPJw/pqP0raNy/24GATGwRX59n5Gn/yFG5mXbsX65dyaCYiZUEQ
	1jqA==
X-Received: by 10.14.9.72 with SMTP id 48mr5284416ees.42.1377791477813;
	Thu, 29 Aug 2013 08:51:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm47158279eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:14 +0200
Message-Id: <58dc1e31a8235e414a5e18d9d5039f554b0baf3b.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 21/66] vlc: Add PACKAGECONFIG for undeterministic dependencies
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index f3d8a03..db303be 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.videolan.org"
 LICENSE = "GPLv2"
 SECTION = "multimedia"
 
-DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-lib"
+DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-lib"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
 
@@ -56,7 +56,6 @@ EXTRA_OECONF = "\
     --enable-png \
     --enable-live555 --enable-tremor \
     --enable-v4l2 --enable-v4l --disable-aa --disable-faad \
-    --enable-dbus \
     --without-contrib \
     --without-kde-solid \
     --disable-opengl --disable-glx \
@@ -66,10 +65,27 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
+# keep libv4l enabled by default, otherwise v4l2 enabled in EXTRA_OECONF fails with:
+# | v4l2.c:521:18: error: 'V4L2_CID_HCENTER' undeclared here (not in a function)
+PACKAGECONFIG ??= "libv4l"
+
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3tag,--disable-id3tag,libid3tag"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
+PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnomevfs,gnome-vfs"
+PACKAGECONFIG[portaudio] = "--enable-portaudio,--disable-portaudio,portaudio-v19"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[libv4l] = "--enable-libv4l,--disable-libv4l,libv4l"
+PACKAGECONFIG[mtp] = "--enable-mtp,--disable-mtp,libmtp"
+PACKAGECONFIG[mkv] = "--enable-mkv,--disable-mkv,libmatroska"
+PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,samba"
+PACKAGECONFIG[libsdl-image] = "--enable-libsdl-image,--disable-libsdl-image,libsdl-image"
+PACKAGECONFIG[ncurses] = "--enable-ncurses,--disable-ncurses,ncurses"
+PACKAGECONFIG[taglib] = "--enable-taglib,--disable-taglib,taglib"
+PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 
 do_configure() {
     cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ 
-- 
1.8.3.2


