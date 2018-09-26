Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 905CE79567
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:21:25 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 62F122209BD;
	Wed, 26 Sep 2018 15:21:26 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 15:21:12 +0200
Message-Id: <20180926132115.10455-4-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180926132115.10455-1-max+openembedded@blarg.de>
References: <20180926132115.10455-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 4/7] mpd: make more plugins optional
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
X-List-Received-Date: Wed, 26 Sep 2018 13:21:26 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/mpd_0.20.21.bb            | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index 12ed06cd7..e23c8d523 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -9,7 +9,6 @@ DEPENDS += " \
     curl \
     sqlite3 \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
-    tcp-wrappers \
     yajl \
     boost \
     icu \
@@ -27,7 +26,7 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "aac alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
+PACKAGECONFIG ??= "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
 
 PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
@@ -35,20 +34,26 @@ PACKAGECONFIG[ao] = "--enable-ao,--disable-ao,libao"
 PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[cdioparanoia] = "--enable-cdio-paranoia,--disable-cdio-paranoia,libcdio-paranoia"
+PACKAGECONFIG[daemon] = "--enable-daemon,--disable-daemon"
 PACKAGECONFIG[ffmpeg] = "--enable-ffmpeg,--disable-ffmpeg,ffmpeg"
+PACKAGECONFIG[fifo] = "--enable-fifo,--disable-fifo"
 PACKAGECONFIG[flac] = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[fluidsynth] = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
+PACKAGECONFIG[httpd] = "--enable-httpd-output,--disable-httpd-output"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
 PACKAGECONFIG[iso9660] = "--enable-iso9660,--disable-iso9660,libcdio"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
 PACKAGECONFIG[libsamplerate] = "--enable-lsr,--disable-lsr,libsamplerate0"
+PACKAGECONFIG[libwrap] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
 PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
 PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
+PACKAGECONFIG[oss] = "--enable-oss,--disable-oss,"
+PACKAGECONFIG[recorder] = "--enable-recorder-output,--disable-recorder-output"
 PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
 PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
-- 
2.19.0


