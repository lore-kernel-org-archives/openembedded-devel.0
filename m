Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.4478.1614661813873843256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 21:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mGJ7Ulen;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id t25so13101777pga.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Mar 2021 21:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6Lkl0Ic68+CuB4lnj09i+ExUQqU6wybZ2gADMXdmd0=;
        b=mGJ7Ulenv9Cu/Pqn3D7oHdtxp3pE8XXa5SbK4S2OAhcZ8N+ASNRqk20axiBDRa728n
         hNCX3m2VchPKxuuOI7NO3mejH7j5ne2AeHF4/yI1rkHAQhHfD0OgRIMNKEjYI9jnCgka
         eh0ONWjm+n5YRZhzY7A8j84bjFQ84OOhs5JFlFMPAPpSonhFQLe+qnQe+CPt+XJAONKD
         sTqwm7QW/iuJwCHV+5pVhyz1/veQZmpfkNet9FRPfVeZf8a6jtLhTKYlxIwxskyEiFJ/
         uNsqWewcsGZ/+cjZUDT3is/hbRwin7x0sgOUOev48Uiou9VTVsJlVatxgCisgGmKso6Z
         +hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6Lkl0Ic68+CuB4lnj09i+ExUQqU6wybZ2gADMXdmd0=;
        b=TyVhgTiEev7CTVuajx8/eQLuzvYYAVCT0eBroqW8q7vXhbGFrqFz5WfYJzR/FZEZRE
         tpM67hzSI4X1KWSB0CVCyIqlsRuE18lnjhFGcRuFX9LL8sXenTwMGyJSKw4O4uNRxO0s
         gt/i/xjm3elORBc3MGFNklPU7gNl+Hz2NJazxO5yagYytJrIg15yCP84zEHtVn7lqScR
         d1/bagQUdknMkvZJckmGeJzdrsdgXVjeuawsZ58u0c0qUlEY8R+b68mIgJ1ecNd+fhps
         6uQ2cK/9uZHt0A2VmnNAVy2qQcxO2pJqL+kud45PxjH4J/p+LNRY92KnYKuIi3Xwk8uA
         m2LA==
X-Gm-Message-State: AOAM532gWmtYDFWBXZUSJNNogVqMw71YwgpOJxSVHK60qv0ulcYdWr4s
	JBCDC0FZKIf2iRWOrL5g2Dryyod1QZrzCQ==
X-Google-Smtp-Source: ABdhPJyYp2zeYngsodTJGDgk/6TF3z6Ps2MaGZdDOdVhmYvhlgmRLAkAXAtj/VJXYxzWuglgbyectA==
X-Received: by 2002:aa7:9636:0:b029:1ee:50e3:31dc with SMTP id r22-20020aa796360000b02901ee50e331dcmr1745421pfg.21.1614661812818;
        Mon, 01 Mar 2021 21:10:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id p190sm4470195pga.78.2021.03.01.21.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 21:10:12 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Max Kellermann <max.kellermann@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] mpd: Upgrade to 0.22 series
Date: Mon,  1 Mar 2021 21:10:08 -0800
Message-Id: <20210302051009.292001-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302051009.292001-1-raj.khem@gmail.com>
References: <20210302051009.292001-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop the gcc10 patches the problem is fixed in newer versions
Migrate to use meson build system
Drop libwrap packageconfig, its dropped upstream too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Max Kellermann <max.kellermann@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
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
index 0000000000..5a9593b61f
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
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_unitdir}/system/', '-Dsystemd=disabled', d)}"
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

