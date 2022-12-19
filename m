Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309C3C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:11:26 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.21066.1671455484648551243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id 572D529909
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvN-2FOh9t0; Mon, 19 Dec 2022 14:11:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 01/10] pipewire: update 0.3.62 -> 0.3.63
Date: Mon, 19 Dec 2022 14:10:32 +0100
Message-Id: <20221219131041.452949-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455481-68DE2991-AE936850/0/0 CLEAN NORMAL
X-TOI-MSGID: 948caa37-94ea-41c7-9680-b3c48df28edb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100096

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.62.bb =3D> pipewire_0.3.63.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.62.bb =3D=
> pipewire_0.3.63.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.62.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.62.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.bb
index a358ea417..f7acb8db4 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.62.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "3a443b4e1c9730675c7de0453a6279ab9ee263fd"
+SRCREV =3D "5ff00f40b9d3ecfc38305edc27e9c2b01629802c"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -88,7 +88,7 @@ PACKAGECONFIG:class-target ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio gtk', 'gsettings=
', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
     ${PIPEWIRE_SESSION_MANAGER} \
-    ${FFMPEG_AVAILABLE} gstreamer jack libusb pw-cat raop sndfile v4l2 u=
dev volume \
+    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer jack libusb pw-cat raop =
sndfile v4l2 udev volume webrtc-echo-cancelling \
 "
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -103,6 +103,7 @@ PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Den=
abled,-Dbluez5-codec-aac=3Ddisabl
 PACKAGECONFIG[bluez-opus] =3D "-Dbluez5-codec-opus=3Denabled,-Dbluez5-co=
dec-opus=3Ddisabled,libopus"
 PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve graphviz-native"
 PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,ffmpeg=
"
+PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Denabled,-Dflatpak=3Ddisabled,gli=
b-2.0"
 PACKAGECONFIG[gsettings] =3D "-Dgsettings=3Denabled,-Dgsettings=3Ddisabl=
ed,glib-2.0"
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,gstreamer1.0-pipewire=
"
 PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack,,,pipew=
ire-jack"
--=20
2.34.1


