Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F8BECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 12:54:22 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.48673.1661604856321809774
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id 2A91D50BA
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 14:54:14 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.154.166.171]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oRvKH-0E2aq90; Sat, 27 Aug 2022 14:54:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: improve runtime dependency
 settings
Date: Sat, 27 Aug 2022 14:54:04 +0200
Message-Id: <20220827125404.2399201-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661604853-0144C2AD-86BE0BAE/0/0 CLEAN NORMAL
X-TOI-MSGID: 0c4e846d-64a7-4e6a-baa4-c7599611d842
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 12:54:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98490

- set pipewire-jack to be runtime recommended if it is built
- make media-session and wireplumber conflicting each other

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/pipewire/pipewire_0.3.56.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
index 6c88e99f9..feefe7c15 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
@@ -109,10 +109,10 @@ PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3D=
disabled,jack,,,pipewire-jack"
 PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddisabl=
ed,libcamera libdrm"
 PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberra=3D=
disabled,libcanberra"
 PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,libusb=
"
-PACKAGECONFIG[media-session] =3D ",,,pipewire-media-session"
+PACKAGECONFIG[media-session] =3D ",,,pipewire-media-session,,wireplumber=
"
 PACKAGECONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,-Dlibpulse=3Ddisable=
d,pulseaudio,,pipewire-pulse"
 PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
-PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
,jack"
+PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
pipewire-jack,jack"
 PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
 PACKAGECONFIG[raop] =3D "-Draop=3Denabled,-Draop=3Ddisabled,openssl"
 PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,libsdl2"
@@ -129,7 +129,7 @@ PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddi=
sabled,udev"
 PACKAGECONFIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-headers vulkan-loader"
 PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing"
-PACKAGECONFIG[wireplumber] =3D ",,,wireplumber"
+PACKAGECONFIG[wireplumber] =3D ",,,wireplumber,,media-session"
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
 PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends "
--=20
2.34.1


