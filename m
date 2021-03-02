Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.82.1614708885743295609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 10:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AaJowXyj;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id ba1so12511744plb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4P+EFOHqDM6hwOVEEntBjXcMQp/WXh/1kcNZ7F/8KL8=;
        b=AaJowXyjx+XJlhfM+bARWTWyP9Tj4v32Pn90jxC5c4Q2EA8KvpTEtGWv1Te/kCXW87
         CX9KhiJGVq8hv8bSzo9y+0Jc3l0RutAjESskgQ8z2xjWQDBtdI+rMgHJbsqLf7qHIR5+
         Lb8X2dW080/IBbcX1fby5HjGon407PQX9OydP3TJYF3jwSHmUTmJGRDSA8LuT5/dy4VC
         mRuLKJ0k8hC+ve9ukxKCkEhbm5MjEUGg4jZaOy+m2G6JgiueEMlJ4HScYBqiMnLK1A0m
         7c+RjHTmdSmXTWYua4gavntlWoDe0YX6wQJpXmXpYRGscaiMBw1niuSA2nmfbftUvxOn
         qWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4P+EFOHqDM6hwOVEEntBjXcMQp/WXh/1kcNZ7F/8KL8=;
        b=i6kxDTZsK/OJpJKcV31C8PrmWzC9mag0Prv9c7tyalHmnXf0bOwpj8hszk/yvtJAPb
         3Rwj/jki5TZflglDi3jA9nV+kYHiMAjOT98bl9KhQkAjoOD1NLKCE6NHYuuLksklAKBO
         QI8g9HnMksZ9zcxTmyIJ+PZp3+dtDZuCwVufKVPYCobyJq12D3W1eBn6kwSWTWaKSrPN
         jIqs4FvzNmUElu3rlR3pMru4K7tfP8s+mQqDzIWOOBINSIMadvK9979+QyIEnhaRCiCj
         tCpBRkIfP5ZJNEpsfhN2ysEUGiE6ezABRshXQEpYRoOcqJgFktNH1TY//PIt2Zls8iB2
         bzJw==
X-Gm-Message-State: AOAM530RFi02BRa3reWCWAU9Xnvl5VSj432CEhXErChVj687JKElcsId
	b9c9ZJ5AYhG7y273hw/xTS+YJEqMVi+Jog==
X-Google-Smtp-Source: ABdhPJxSUGecEcI8SH4bPqSP/mTCZnzKw0N2OqKsTr9FNYXlMxoXQ5ny9Yw8PblRNQMn8IDk8U1k5w==
X-Received: by 2002:a17:902:a518:b029:e4:777d:33dd with SMTP id s24-20020a170902a518b02900e4777d33ddmr20316009plq.16.1614708884471;
        Tue, 02 Mar 2021 10:14:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id c11sm19559941pfl.52.2021.03.02.10.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 10:14:43 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Max Kellermann <max.kellermann@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH v2] mpd: Upgrade to 0.22 series
Date: Tue,  2 Mar 2021 10:14:42 -0800
Message-Id: <20210302181442.432464-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop the gcc10 patches the problem is fixed in newer versions
Migrate to use meson build system
Drop libwrap packageconfig, its dropped upstream too
Use systemd_user_unit_dir to match OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Max Kellermann <max.kellermann@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
v2: Use EXTRA_OEMESON instead of EXTRA_OECONF for meson

 ...ingBuffer-Include-cstddef-for-size_t.patch |  27 -----
 ...-Include-stdexcept-for-runtime_error.patch |  38 -------
 .../recipes-multimedia/musicpd/mpd_0.20.22.bb | 103 ------------------
 .../recipes-multimedia/musicpd/mpd_0.22.6.bb  |  96 ++++++++++++++++
 4 files changed, 96 insertions(+), 168 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch
deleted file mode 100644
index 1d869aa833..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-StringBuffer-Include-cstddef-for-size_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c14877071f14b218835f7fb034dea11bd1ba56f5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Dec 2019 09:40:16 -0800
-Subject: [PATCH] StringBuffer: Include cstddef for size_t
-
-Fixes
-a.cpp:3:1: error: 'size_t' does not name a type
-    3 | size_t s;
-      | ^~~~~~
-a.cpp:2:1: note: 'size_t' is defined in header '<cstddef>'; did you forget to '#include <cstddef>'?
-
-Upstream-Status: Submitted [https://github.com/MusicPlayerDaemon/MPD/pull/697]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util/StringBuffer.hxx | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/util/StringBuffer.hxx
-+++ b/src/util/StringBuffer.hxx
-@@ -31,6 +31,7 @@
- #define STRING_BUFFER_HPP
- 
- #include <array>
-+#include <cstddef>
- 
- /**
-  * A statically allocated string buffer.
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch
deleted file mode 100644
index 1f11867191..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/0002-Include-stdexcept-for-runtime_error.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 06f78ced45f6622a2e02cd09e6a2c0c22a98b89e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Dec 2019 09:41:55 -0800
-Subject: [PATCH 2/2] Include <stdexcept> for runtime_error
-
-Fixes
-
-../git/src/LocateUri.cxx:65:14: error: 'runtime_error' is not a member of 'std'
-   65 |   throw std::runtime_error("Unsupported URI scheme");
-      |              ^~~~~~~~~~~~~
-
-Upstream-Status: Inappropriate [ Fixed differently upstream ]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/LocateUri.cxx      | 1 +
- src/pcm/PcmConvert.cxx | 1 +
- 2 files changed, 2 insertions(+)
-
---- a/src/LocateUri.cxx
-+++ b/src/LocateUri.cxx
-@@ -17,6 +17,7 @@
-  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-  */
- 
-+#include <stdexcept>
- #include "config.h"
- #include "LocateUri.hxx"
- #include "client/Client.hxx"
---- a/src/pcm/PcmConvert.cxx
-+++ b/src/pcm/PcmConvert.cxx
-@@ -17,6 +17,7 @@
-  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-  */
- 
-+#include <stdexcept>
- #include "config.h"
- #include "PcmConvert.hxx"
- #include "ConfiguredResampler.hxx"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
deleted file mode 100644
index b214672c62..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY = "Music Player Daemon"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-LICENSE_FLAGS = "${@bb.utils.contains_any('PACKAGECONFIG', ['ffmpeg', 'aac'], 'commercial', '', d)}"
-
-HOMEPAGE ="http://www.musicpd.org"
-
-inherit autotools useradd systemd pkgconfig
-
-DEPENDS += " \
-    curl \
-    sqlite3 \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
-    yajl \
-    boost \
-    icu \
-    dbus \
-    expat \
-"
-
-SRC_URI = " \
-    git://github.com/MusicPlayerDaemon/MPD;branch=v0.20.x \
-    file://mpd.conf.in \
-    file://0001-StringBuffer-Include-cstddef-for-size_t.patch \
-    file://0002-Include-stdexcept-for-runtime_error.patch \
-"
-SRCREV = "9274bc15bc41bbe490fde847f8422468cc20375d"
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-
-PACKAGECONFIG ??= "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
-
-PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
-PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-PACKAGECONFIG[ao] = "--enable-ao,--disable-ao,libao"
-PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
-PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
-PACKAGECONFIG[cdioparanoia] = "--enable-cdio-paranoia,--disable-cdio-paranoia,libcdio-paranoia"
-PACKAGECONFIG[daemon] = "--enable-daemon,--disable-daemon"
-PACKAGECONFIG[ffmpeg] = "--enable-ffmpeg,--disable-ffmpeg,ffmpeg"
-PACKAGECONFIG[fifo] = "--enable-fifo,--disable-fifo"
-PACKAGECONFIG[flac] = "--enable-flac,--disable-flac,flac"
-PACKAGECONFIG[fluidsynth] = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
-PACKAGECONFIG[httpd] = "--enable-httpd-output,--disable-httpd-output"
-PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
-PACKAGECONFIG[iso9660] = "--enable-iso9660,--disable-iso9660,libcdio"
-PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
-PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
-PACKAGECONFIG[libsamplerate] = "--enable-lsr,--disable-lsr,libsamplerate0"
-PACKAGECONFIG[libwrap] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
-PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
-PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
-PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
-PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
-PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
-PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
-PACKAGECONFIG[oss] = "--enable-oss,--disable-oss,"
-PACKAGECONFIG[recorder] = "--enable-recorder-output,--disable-recorder-output"
-PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
-PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
-PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
-PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
-PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
-PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
-
-do_configure_prepend() {
-    sed -i -e 's|libsystemd-daemon|libsystemd|' ${S}/configure.ac
-}
-
-do_install_append() {
-    install -o mpd -d \
-        ${D}/${localstatedir}/lib/mpd \
-        ${D}/${localstatedir}/lib/mpd/playlists
-    install -m775 -o mpd -g mpd -d \
-        ${D}/${localstatedir}/lib/mpd/music
-
-    install -d ${D}/${sysconfdir}
-    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
-    sed -i \
-        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
-        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
-        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
-        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
-        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
-        ${D}/${sysconfdir}/mpd.conf
-
-    # we don't need the icon
-    rm -rf ${D}${datadir}/icons
-}
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "mpd.socket"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = " \
-    --system --no-create-home \
-    --home ${localstatedir}/lib/mpd \
-    --groups audio \
-    --user-group mpd"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
new file mode 100644
index 0000000000..e91bb5d978
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
@@ -0,0 +1,96 @@
+SUMMARY = "Music Player Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+LICENSE_FLAGS = "${@bb.utils.contains_any('PACKAGECONFIG', ['ffmpeg', 'aac'], 'commercial', '', d)}"
+
+HOMEPAGE ="http://www.musicpd.org"
+
+inherit meson useradd systemd pkgconfig
+
+DEPENDS += " \
+    curl \
+    sqlite3 \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
+    yajl \
+    boost \
+    icu \
+    dbus \
+    expat \
+"
+
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/MPD;branch=v0.22.x \
+    file://mpd.conf.in \
+"
+SRCREV = "938728820b11d4544a071994fe3c63c6ab710e8e"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
+
+PACKAGECONFIG ??= "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
+
+PACKAGECONFIG[aac] = "-Dfaad=enabled,-Dfaad=disabled,faad2"
+PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
+PACKAGECONFIG[ao] = "-Dao=enabled,-Dao=disabled,libao"
+PACKAGECONFIG[audiofile] = "-Daudiofile=enabled,-Daudiofile=disabled,audiofile"
+PACKAGECONFIG[bzip2] = "-Dbzip2=enabled,-Dbzip2=disabled,bzip2"
+PACKAGECONFIG[cdioparanoia] = "-Dcdio_paranoia=enabled,-Dcdio_paranoia=disabled,libcdio-paranoia"
+PACKAGECONFIG[daemon] = "-Ddaemon=true,-Ddaemon=false"
+PACKAGECONFIG[ffmpeg] = "-Dffmpeg=enabled,-Dffmpeg=disabled,ffmpeg"
+PACKAGECONFIG[fifo] = "-Dfifo=true,-Dfifo=false"
+PACKAGECONFIG[flac] = "-Dflac=enabled,-Dflac=disabled,flac"
+PACKAGECONFIG[fluidsynth] = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
+PACKAGECONFIG[httpd] = "-Dhttpd=true,-Dhttpd=false"
+PACKAGECONFIG[id3tag] = "-Did3tag=enabled,-Did3tag=disabled,libid3tag"
+PACKAGECONFIG[iso9660] = "-Diso9660=enabled,-Diso9660=disabled,libcdio"
+PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
+PACKAGECONFIG[lame] = "-Dlame=enabled,-Dlame=disabled,lame"
+PACKAGECONFIG[libsamplerate] = "-Dlibsamplerate=enabled,-Dlibsamplerate=disabled,libsamplerate0"
+PACKAGECONFIG[mad] = "-Dmad=enabled,-Dmad=disabled,libmad"
+PACKAGECONFIG[mms] = "-Dmms=enabled,-Dmms=disabled,libmms"
+PACKAGECONFIG[modplug] = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
+PACKAGECONFIG[mpg123] = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
+PACKAGECONFIG[openal] = "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
+PACKAGECONFIG[opus] = "-Dopus=enabled,-Dopus=disabled,libopus libogg"
+PACKAGECONFIG[oss] = "-Doss=enabled,-Doss=disabled,"
+PACKAGECONFIG[recorder] = "-Drecorder=true,-Drecorder=false"
+PACKAGECONFIG[smb] = "-Dsmbclient=enabled,-Dsmbclient=disabled,samba"
+PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
+PACKAGECONFIG[upnp] = "-Dupnp=enabled,-Dupnp=disabled,libupnp"
+PACKAGECONFIG[vorbis] = "-Dvorbis=enabled,-Dvorbis=disabled,libvorbis libogg"
+PACKAGECONFIG[wavpack] = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
+PACKAGECONFIG[zlib] = "-Dzlib=enabled,-Dzlib=disabled,zlib"
+
+do_install_append() {
+    install -o mpd -d \
+        ${D}/${localstatedir}/lib/mpd \
+        ${D}/${localstatedir}/lib/mpd/playlists
+    install -m775 -o mpd -g mpd -d \
+        ${D}/${localstatedir}/lib/mpd/music
+
+    install -d ${D}/${sysconfdir}
+    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
+    sed -i \
+        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
+        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
+        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
+        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
+        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
+        ${D}/${sysconfdir}/mpd.conf
+
+    # we don't need the icon
+    rm -rf ${D}${datadir}/icons
+}
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "mpd.socket"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = " \
+    --system --no-create-home \
+    --home ${localstatedir}/lib/mpd \
+    --groups audio \
+    --user-group mpd"
-- 
2.30.1

