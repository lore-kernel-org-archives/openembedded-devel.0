Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9084FC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 17:16:50 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.144613.1673803003506808812
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jan 2023 09:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id C3A89FFAD
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 18:16:41 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.227]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pH6cb-4AoazR0; Sun, 15 Jan 2023 18:16:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] freerdp: build the rdp server
Date: Sun, 15 Jan 2023 18:16:34 +0100
Message-Id: <20230115171634.6765-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-MSGID: 77245aed-b4e1-4b05-aace-83a17b017e5b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 17:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100573

gnome-remote-desktop requires the freerdp server as a build dependency

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.9.0.bb
index cd7b2165b..0856a60be 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
@@ -32,7 +32,7 @@ EXTRA_OECMAKE +=3D " \
=20
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayla=
nd x11', d)}\
-    gstreamer cups pcsc \
+    gstreamer cups pcsc server \
 "
=20
 X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor libxv libxi =
libxrender libxfixes libxdamage libxrandr libxkbfile"
@@ -44,6 +44,7 @@ PACKAGECONFIG[pcsc] =3D "-DWITH_PCSC=3DON,-DWITH_PCSC=3D=
OFF,pcsc-lite"
 PACKAGECONFIG[pulseaudio] =3D "-DWITH_PULSEAUDIO=3DON,-DWITH_PULSEAUDIO=3D=
OFF,pulseaudio"
 PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER_1_0=3DON,-DWITH_GSTREAMER=
_1_0=3DOFF,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[cups] =3D "-DWITH_CUPS=3DON,-DWITH_CUPS=3DOFF,cups"
+PACKAGECONFIG[server] =3D "-DWITH_SERVER=3DON,-DWITH_SERVER=3DOFF"
=20
 PACKAGES =3D+ "libfreerdp"
=20
--=20
2.34.1


