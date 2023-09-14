Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85965CA553F
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 13:06:59 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.11805.1694696811361481168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 06:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 6E936211E0
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 15:06:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.167.3]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qgm3T-2BfR1l0; Thu, 14 Sep 2023 15:06:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] webrtc-audio-processing: add recipe for 1.x
Date: Thu, 14 Sep 2023 15:06:30 +0200
Message-ID: <20230914130631.182859-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694696807-47FFE5E3-EFBBAC27/0/0 CLEAN NORMAL
X-TOI-MSGID: c66df595-c1e6-4a3d-a4a7-4d7e374d7399
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 13:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104867

Starting with 0.3.80 pipewire has a minimum requirement on
webrtc-audio-processing-1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../webrtc-audio-processing-1_1.3.bb            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-1_1.3.bb

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webr=
tc-audio-processing/webrtc-audio-processing-1_1.3.bb
new file mode 100644
index 000000000..d07772f1b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-1_1.3.bb
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "Audio processing bits of the WebRTC reference implement=
ation"
+HOMEPAGE =3D "https://www.freedesktop.org/software/pulseaudio/webrtc-aud=
io-processing/"
+SECTION =3D "audio"
+
+DEPENDS =3D "abseil-cpp"
+DEPENDS:append:libc-musl =3D " libexecinfo"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dda08a38a32a340c5d91e13ee86a11=
8f2"
+
+SRC_URI =3D "http://freedesktop.org/software/pulseaudio/webrtc-audio-pro=
cessing/webrtc-audio-processing-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0=
838ad6ec2e86f1b9"
+S =3D "${WORKDIR}/webrtc-audio-processing-${PV}"
+
+LDFLAGS:append:libc-musl =3D " -lexecinfo"
+
+inherit meson pkgconfig
--=20
2.41.0


