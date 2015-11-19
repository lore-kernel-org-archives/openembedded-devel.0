Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C5DC960670
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 12:27:09 +0000 (UTC)
Received: by wmww144 with SMTP id w144so236377183wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=9J0dlSglqel7LXBEHZb+AipenpGdYkbxuX4GgqCskHs=;
	b=F1ka9hnkogfnY82G483MqXCtfX5eLI6rMJIH1EqxvgwW8YDxtGgObQrDtfBkmyaqi2
	xRCqTxnzCGC8vrF4xC/r3VIau/OSQyvQp12Yz22wrxVM6XhXI7rHimWwaAdpXjkkgdJc
	O/LLEV8IhuOvSovhscKh6X2WhMlNG+L/tYx0rgjgCuRphNkusAAPn5k8GNFOy9OySQW1
	OjDELfnDgtfwQPIVHmRi7b5O2+dz/hSiu3Z/BhOPMqfLnD4vGBixqaMJ2ByCXPnOPoiJ
	zVPk4ninjMuYFJL9/g89/VOQ6GrxhB5JRK7Lm5jO1VJo8SwlWf6DluxcokXtecezhQhr
	uU+A==
X-Received: by 10.194.114.105 with SMTP id jf9mr7807467wjb.102.1447936029918; 
	Thu, 19 Nov 2015 04:27:09 -0800 (PST)
Received: from [192.168.0.10] (lns-bzn-47f-81-56-255-191.adsl.proxad.net.
	[81.56.255.191]) by smtp.googlemail.com with ESMTPSA id
	143sm6099943wmv.18.2015.11.19.04.27.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 04:27:08 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <564DC01B.4000103@videolan.org>
Date: Thu, 19 Nov 2015 13:27:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: [meta-multimedia][PULL REQUEST]
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
X-List-Received-Date: Thu, 19 Nov 2015 12:27:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The following changes since commit ea319464b673cbf9a416b582dc4766faeb998430:

  vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394,
dv1394, svg, svgdec (2015-11-16 21:50:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib funman/vlc

for you to fetch changes up to f36d074464df24595882c68743e43b7d57af448f:

  VLC: do not use --with-contrib (2015-11-19 13:22:16 +0100)

----------------------------------------------------------------
Rafaël Carré (6):
      vlc: remove libdc1394 libraw1394 from DEPENDS
      VLC: make libnotify a configurable dependency
      VLC: explicit PACKAGECONFIG for fontconfig
      VLC: explicit PACKAGECONFIG for freetype
      VLC: make libdvdread PACKAGECONFIG
      VLC: do not use --with-contrib

 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 9adcdb1..ce3601d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
-   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ \
-   libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
+   lua-native lua libidn \
+   avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms"

@@ -22,8 +22,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 ARM_INSTRUCTION_SET = "arm"

 EXTRA_OECONF = "\
-    --enable-dvdread \
-    --with-contrib \
     --enable-run-as-root \
     --enable-xvideo \
     --disable-screen --disable-caca \
@@ -43,7 +41,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "

-PACKAGECONFIG ?= " live555"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype
dvdread"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -62,7 +60,7 @@ PACKAGECONFIG[dvbpsi] =
"--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnomevfs,
gnome-vfs"
 PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
 PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
-PACKAGECONFIG[dvdnav] = "--enable-dvdnav,--disable-dvdnav,libdvdnav"
+PACKAGECONFIG[dvdnav] = "--enable-dvdnav,--disable-dvdnav,libdvdnav
libdvdcss"
 PACKAGECONFIG[sftp] = "--enable-sftp,--disable-sftp,libssh2"
 PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
 PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libvorbis libogg"
@@ -70,6 +68,10 @@ PACKAGECONFIG[dc1394] =
"--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394
libavc1394"
 PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
 PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
+PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
+PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig,
fontconfig"
+PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
+PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread,
libdvdread libdvdcss"

 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true

