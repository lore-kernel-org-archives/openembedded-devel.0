Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.2623.1596016148334127827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=R/z3Q46v;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id h19so24325660ljg.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb1mmAqY5eYUZe4CyuSb1PKpf03oQLHZrj19AoPtOO8=;
        b=R/z3Q46vi63qb+aqsvBNVkkr6kbJ03Z/EY88Ca9CTIUPOoDBy+mnMH3LdfkZFHzDoj
         qEA0TCBoHW7EYaDNNfREWiK6ji1HdsDEIcM+BXO37F5J5B0wBTI+WiGltVyt5RB+7fqP
         vJMJdP4BnL0hn8Z/xtKxfT10Us56ZO3isAVUaEKEa5zXgJ6G4lQiK8kkcwsVE4kI8KKQ
         mG2rP7c7Jro990CoMUGqaJ+yn4m5f4pGo08eMR0KVRGENTdwPQ86kODYjc/pbyR98vKb
         7PDfJ1g2lE4kLi5/hsXqXkSC2XEsKII5ymiVBzQWqnYgJR/OQBFyuLRdhkjWcollAmk3
         XTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb1mmAqY5eYUZe4CyuSb1PKpf03oQLHZrj19AoPtOO8=;
        b=Cpsua0GX+/TfbTfNYo/KxmfdzilNdKy3Z8ADdNJB9fn59nPPB/CG2p/sXcNn0pjnVS
         5Hq/TAg3Mm2h/Y1EZBHRN2ZSJfXFOIc5aFUuDa+YPmbNOOFf4rsSXL/RUelE6O9jkGGE
         tTXH/GjOkUWGgW8DnEFXP2zjeuYygCQ8JA2seb+SYnZ3HR9ooOwt8gm/fzNB6mkgy0RL
         Fdu0CeqZhsTiCdTZ1KmxMGpm/XDNAgNggZKO7kWgCdPnU0SKqAQv0r9y5mxunP36AHkH
         EI7szkKYudqH3yJUReymJaaCApXSNjaVoagyxOoXo88oOBexA2T0hvwrqyW2tF6Pb0Kk
         o7xg==
X-Gm-Message-State: AOAM5320fiJa3LIEjoqfqa6mfcD6ljDTn7+ZJl7QSgDoWv/HjQJ6LQSy
	NIoMjbrLI6phChBmXv1df4QEqJnstXI=
X-Google-Smtp-Source: ABdhPJyV6BXVy6XmgXDu8U4GVVudwdUKuHmYRe3TaHyfB7jVVjqGZYHPOqyvKfSm3g0mjeg/szXjCw==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr14343570ljg.201.1596016145839;
        Wed, 29 Jul 2020 02:49:05 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b26sm362494lji.36.2020.07.29.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 02:49:05 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] mpd: update to 0.21.25
Date: Wed, 29 Jul 2020 11:49:03 +0200
Message-Id: <20200729094903.3155985-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-multimedia/musicpd/mpd_0.20.22.bb | 101 ------------------
 .../recipes-multimedia/musicpd/mpd_0.21.25.bb |  96 +++++++++++++++++
 2 files changed, 96 insertions(+), 101 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
deleted file mode 100644
index 818b9271f..000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
+++ /dev/null
@@ -1,101 +0,0 @@
-SUMMARY = "Music Player Daemon"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
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
-PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
-PACKAGECONFIG_append = " ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
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
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb
new file mode 100644
index 000000000..7c65303a5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb
@@ -0,0 +1,96 @@
+SUMMARY = "Music Player Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
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
+    git://github.com/MusicPlayerDaemon/MPD;branch=v0.21.x \
+    file://mpd.conf.in \
+    file://0001-StringBuffer-Include-cstddef-for-size_t.patch \
+"
+SRCREV = "c67372f8af0419da2012bae743d96e272594b7f4"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+
+PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
+PACKAGECONFIG_append = " ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
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
2.25.1

