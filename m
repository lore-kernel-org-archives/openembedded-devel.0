Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22A3CD98DB
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87399.1781338748413157063
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sDeDkZ8P;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c3543590so12226885ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338748; x=1781943548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXflELhiQUoPZ3xwLXLOqSJw79nJNt/x7t2XtdSTTAw=;
        b=sDeDkZ8Pkzy8V0XRa6yqTObQp8skZuU2kfS/8Vf7aqyCW+F5+oIchU5CbDHkIfpORy
         44yL9m+e1UPaA359HDpMzs55PZmr8mpiXT/Rd+j2Mh/lUZgE6fY1Ci3FeMgSFnXrODxh
         9fCrC1XOkA50XkF7XVfyWSzJolui49paHwUDpVtWt3rVJ+PiiLGPWkgPmC2g+bJZuFTD
         HV1pbDxu3DEp4C1v0QIr1PhdwgbE6Tkgtrh7doyCVsHCfqIDHZFYYswNeT+ZJ/GllB9K
         2CnfaT4Kw0aIZAN16P2UMl58GIHk7kr02oMqU7sMmZLhCudlSrhnHTnOtHtkpi1N/kqw
         GlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338748; x=1781943548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXflELhiQUoPZ3xwLXLOqSJw79nJNt/x7t2XtdSTTAw=;
        b=ak03/xCJ0ndYL/QMiTql3AV7DKhj+TsOjh0pfsTD9/QzFYJF38iImMtzuX85WWYjjW
         Z+rE4EPpBIxzqpWcMFA7nsrfSvO+gWeDAqZnSRNIIl7CFZNg+WqFG/bhwnt3xXZqAQGV
         iUnVF/k6nzFX3pIgVXH3ZIkgLxMdP9L39QIoLu06k69TrjGfQUTaOafvi1vDZSNfPpFO
         Z373X/Rn/BIMq3JtNoX1bhI1UBmerFEicUkbDWiMECPV9CW9hVi9o1yXOr/TWWuV/4QL
         4fj+dylXRxddcdF54ktXtgyjlI+jFSEN71cJoZ7TTPif4M1I1g7Ch9ei/wASu33BUHTH
         Eb3Q==
X-Gm-Message-State: AOJu0YzgzQRyHtL6OlUTLZKT8cyDwfcMMp5VaUk3IqkIAKGhrFe0R/5L
	F8DZHAbl8g9QelBa2tFX/WtHyf+gUmVqYO9wrBfsY5ufA1dptdg9MyGUt07ry3j4
X-Gm-Gg: Acq92OGAYlE6Aise97PkyUQcV0zWIrgiKkSvxWMv4glZiUH/idyGWPw1J1K+hYFmkhg
	071Upf8VpociewQ+8uHkmd7wvktpAZup0cCD3fvrR8cSPZuceG3sCc5EGc58uBzpFuJOMrN7WYh
	5byvoXfF+y5Gb2tWk9gdVnd8ZaAYb7XswififjY1PxZMkr5eYK4+BeCXl0Hz6oxem44iTdX0WOa
	5J9ne3vhK2M+G4WsmimAxa3WH5WHKXmhOvIh3uwbgFTHZjqPJUbgslVdxyxdpOsIT1FlXq85InQ
	XjsK6bINlaY1Qb6IvJpbGfngk7BKh5SQttmxykt5jou7X5OUZ1PvezU3BpMW71WGbTREFKfKYo0
	lYCVP+KBw7yVxr2QsbaH+/V0KffLyPfkWf8GDf0tjIpidxDtw1EtJprdSldfHnPIcDPlB4YuA6r
	76P1yJ3QmC4Ut4MybsPaqnDd4U3nbIcDfxIn7F
X-Received: by 2002:a17:902:e545:b0:2c0:b9a1:6493 with SMTP id d9443c01a7336-2c41178c6femr64443005ad.10.1781338747781;
        Sat, 13 Jun 2026 01:19:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:19:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 12/16] pipewire: update 1.6.5 -> 1.6.6
Date: Sat, 13 Jun 2026 20:18:20 +1200
Message-ID: <20260613081824.1223609-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127564

From: Markus Volk <f_l_k@t-online.de>

- ncurses is not a required dependency -> make it a PACKAGECONFIG

PipeWire 1.6.6 (2026-05-26)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix a bug in the server code that could leave snap clients without
    sound. (#5270)
  - Relax LADSPA path loading again, absolute paths are only blocked in
    unsafe cases.
  - Fix a volume restore issue in filter-graph when using custom volume
    controls.
  - Small fixes and improvements.

PipeWire
  - Fix the meta permission check on metadata.
  - Make sure we don't accept too many fds.
  - Fix potential race with buffer allocation and Suspend. (#3547)

SPA
  - Relax LADSPA path loading. Absolute paths are allowed when loading
    modules from a config file. They are now only blocked when loading
    the pulse ladspa modules and filter-chains in nodes because those
    can load ladspa plugins in other processes. (#5222)
  - Fix a regression in the dither noise that was silent when no input
    was available. (#5260)
  - Fix volume initialization in filter-graph. (#5192)

Pulse-server
  - Fix a bug in the server code that could leave snap clients without
    sound. (#5270)
  - Be more careful with the stream suspend messages and only send them
    when the stream is monitoring. (#5273)
  - Fix monitor mode in pavucontrol.

Tools
  - Fix midifile SysEx writing in pw-cat and ensure the header is written
    correctly on close.
  - Make sure pw-cat does not try to convert Midi to UMP.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d712bc991a274974ca60cad706fb317c7a3e48ec)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pipewire/{pipewire_1.6.5.bb => pipewire_1.6.6.bb}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.5.bb => pipewire_1.6.6.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
index 5d610f5172..c8631904ff 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
 "
 
-DEPENDS = "dbus ncurses"
+DEPENDS = "dbus"
 
-SRCREV = "55848f4260a2d2302f9f6bd304d82616976ef9af"
+SRCREV = "a1c1d9f9f128ec987f23a0140a1704b8f8781787"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
 SRC_URI += "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"
@@ -91,7 +91,8 @@ PACKAGECONFIG:class-target ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
     ${PIPEWIRE_SESSION_MANAGER} \
-    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera readline \
+    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling \
+    libcamera readline ncurses \
 "
 
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -121,6 +122,7 @@ PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera l
 PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
 PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
 PACKAGECONFIG[media-session] = ",,,pipewire-media-session,,wireplumber"
+PACKAGECONFIG[ncurses] = ",,ncurses"
 PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio,,${MLPREFIX}pipewire-pulse"
 PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
 PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,${MLPREFIX}pipewire-jack,jack"

