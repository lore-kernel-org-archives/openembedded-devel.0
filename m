Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 5C11C79620
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:35:58 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id F254422089E;
	Tue, 18 Sep 2018 10:26:14 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 10:26:05 +0200
Message-Id: <20180918082608.1088-6-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180918082608.1088-1-max+openembedded@blarg.de>
References: <20180918082608.1088-1-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 6/8] [meta-oe] mpd: make lots of plugins optional
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
X-List-Received-Date: Tue, 18 Sep 2018 08:35:58 -0000

From: Max Kellermann <max.kellermann@gmail.com>

The new options are enabled by default to avoid breaking existing
configurations.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/mpd_0.20.21.bb | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index 67a0c9ff8..b9c6d62d6 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -6,37 +6,15 @@ HOMEPAGE ="http://www.musicpd.org"
 inherit autotools useradd systemd pkgconfig
 
 DEPENDS += " \
-    alsa-lib \
-    libsamplerate0 \
-    libsndfile1 \
-    libvorbis \
-    libogg \
-    faad2 \
-    ffmpeg \
     curl \
     sqlite \
-    bzip2 \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
     tcp-wrappers \
-    openal-soft \
     yajl \
-    jack \
-    faad2 \
-    flac \
-    libao \
-    fluidsynth \
-    libcdio \
-    wavpack \
-    libopus \
-    mpg123 \
-    libmms \
-    libmodplug \
     boost \
     icu \
     dbus \
     expat \
-    zlib \
-    libupnp \
 "
 
 # While this item does not require it, it depends on mpg123 which does
@@ -52,12 +30,34 @@ SRC_URI[sha256sum] = "8322764dc265c20f05c8c8fdfdd578b0722e74626bef56fcd8eebfb01a
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
+PACKAGECONFIG ??= "aac alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
+
+PACKAGECONFIG[aad] = "--enable-aac,--disable-aac,faad2"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[ao] = "--enable-ao,--disable-ao,libao"
 PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
+PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[cdioparanoia] = "--enable-cdio-paranoia,--disable-cdio-paranoia,libcdio-paranoia"
+PACKAGECONFIG[ffmpeg] = "--enable-ffmpeg,--disable-ffmpeg,ffmpeg"
+PACKAGECONFIG[flac] = "--enable-flac,--disable-flac,flac"
+PACKAGECONFIG[fluidsynth] = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
+PACKAGECONFIG[iso9660] = "--enable-iso9660,--disable-iso9660,libcdio"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
+PACKAGECONFIG[libsamplerate] = "--enable-lsr,--disable-lsr,libsamplerate0"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
+PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
 PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
+PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
+PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
+PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
+PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
+PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
+PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
 do_configure_prepend() {
     sed -i -e 's|libsystemd-daemon|libsystemd|' ${S}/configure.ac
-- 
2.18.0


