Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BA4C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 14:47:00 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.39712.1681915614082690892
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Apr 2023 07:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 9945DE334
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 16:46:37 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.175.220]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pp94t-4X19ov0; Wed, 19 Apr 2023 16:46:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH 1/2] pipewire: remove 'inherit gsettings'
Date: Wed, 19 Apr 2023 16:46:23 +0200
Message-Id: <20230419144624.143792-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681915595-93FFCC17-E1227FC5/0/0 CLEAN NORMAL
X-TOI-MSGID: ffa2b012-d559-452c-8db7-cb40d787ac05
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 14:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102139

 - remove duplicated PACKAGECONFIG

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb
index 2f854236b..9e0142d94 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipe=
wire.git;branch=3Dmaster;prot
=20
 S =3D "${WORKDIR}/git"
=20
-inherit gsettings meson pkgconfig systemd gettext useradd
+inherit meson pkgconfig systemd gettext useradd
=20
 USERADD_PACKAGES =3D "${PN}"
=20
@@ -85,7 +85,6 @@ PACKAGECONFIG:class-target ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}=
 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez bluez-op=
us ${BLUETOOTH_AAC}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio gtk', 'gsettings=
', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
     ${PIPEWIRE_SESSION_MANAGER} \
     ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw=
-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera \
--=20
2.34.1


