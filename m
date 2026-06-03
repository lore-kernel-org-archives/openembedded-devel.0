Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8003ACD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 21:07:13 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30603.1780520831184806558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 14:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=JMt/KDHV;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id CBC681CAE2
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jun 2026 23:07:08 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.172.112]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wUsnr-3RRniT0; Wed, 3 Jun 2026 23:07:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.6.5 -> 1.6.6
Date: Wed,  3 Jun 2026 23:07:00 +0200
Message-ID: <20260603210700.55840-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1780520827-57FFD426-272BCE23/0/0 CLEAN NORMAL
X-TOI-MSGID: 5f22c3d0-5eff-411c-b611-adb6ade4f34d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780520828; i=f_l_k@t-online.de;
	bh=HUwPBQDZzUJ3Oo+sihdyKsC1RZb9AdUz4vf9LkfmqEQ=;
	h=From:To:Subject:Date;
	b=JMt/KDHVRqtCKPdAqql2AHoTRms+Sw5nlj0bA24OD8+UXHlAnUJqCkY5TwU6/cvxS
	 YCP/ggQ9imsoYOX5pKtl2ROue81YNqyCsIwEiokVzHQWxdeMdEJYErOw9pamYDSFMm
	 LCH0tAVil0Zl9pkcCkRlDnKzTrdGYFWgKgWfKiAO+Iqvahow35mXqlrZ72fmL8Fw74
	 rZKUXCxtGPCBuq24Nqv+Xnyr7wZ7xVFSF+3E1C04oTRWoB94SJ5irqBOjHyHqi8p2o
	 2lXnURUox6vrK7A7dVaLCnKvr88+mxAjjHeUSv/pAIQf6apZRRNKnGnDPzppcneJmL
	 NeL2VOqrx9OfA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 21:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127388

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
---
 .../pipewire/{pipewire_1.6.5.bb =3D> pipewire_1.6.6.bb}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.5.bb =3D=
> pipewire_1.6.6.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
index 5d610f5172..c8631904ff 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
 "
=20
-DEPENDS =3D "dbus ncurses"
+DEPENDS =3D "dbus"
=20
-SRCREV =3D "55848f4260a2d2302f9f6bd304d82616976ef9af"
+SRCREV =3D "a1c1d9f9f128ec987f23a0140a1704b8f8781787"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
 SRC_URI +=3D "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-con=
st-do-.patch"
@@ -91,7 +91,8 @@ PACKAGECONFIG:class-target ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
     ${PIPEWIRE_SESSION_MANAGER} \
-    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw=
-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera readl=
ine \
+    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw=
-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling \
+    libcamera readline ncurses \
 "
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -121,6 +122,7 @@ PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-=
Dlibcamera=3Ddisabled,libcamera l
 PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberra=3D=
disabled,libcanberra"
 PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,libusb=
"
 PACKAGECONFIG[media-session] =3D ",,,pipewire-media-session,,wireplumber=
"
+PACKAGECONFIG[ncurses] =3D ",,ncurses"
 PACKAGECONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,-Dlibpulse=3Ddisable=
d,pulseaudio,,${MLPREFIX}pipewire-pulse"
 PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
 PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
${MLPREFIX}pipewire-jack,jack"
--=20
2.54.0


