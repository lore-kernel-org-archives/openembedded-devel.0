Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547ACC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 11:30:21 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.6239.1678793414442991748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 04:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id 2F24A73FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 12:30:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.63]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pc2r5-2E9QPp0; Tue, 14 Mar 2023 12:30:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] wireplumber: update 0.4.13 -> 0.4.14
Date: Tue, 14 Mar 2023 12:29:58 +0100
Message-Id: <20230314112958.492694-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678793411-177FB778-9106FF73/0/0 CLEAN NORMAL
X-TOI-MSGID: d44eb601-2eea-445a-8d9f-b241f0c03bf2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 11:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101519

WirePlumber 0.4.14
~~~~~~~~~~~~~~~~~~

Additions:

  - Added support for managing Bluetooth-MIDI, complimenting the parts th=
at
    were merged in PipeWire recently (!453)

  - Added a default volume configuration option for streams whose volume
    has never been saved before; that allows starting new streams at a lo=
wer
    volume than 100% by default, if desired (!480)

  - Added support for managing link errors and propagating them to the
    client(s) involved. This allows better error handling on the applicat=
ion
    side in case a format cannot be negotiated - useful in video streams
    (see !484, pipewire#2935)

  - snd_aloop devices are now described as being "Loopback" devices
    (pipewire#2214)

  - ALSA nodes in the pro audio profile now get increased graph priority,=
 so
    that they are more likely to become the driver in the graph

  - Added support for disabling libcamera nodes & devices with ``node.dis=
abled``
    and ``device.disabled``, like it works for ALSA and V4L2 (#418)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.4.13.bb =3D> wireplumber_0.4.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.1=
3.bb =3D> wireplumber_0.4.14.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.13.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4=
.14.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.13.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
14.bb
index 0203f8bf5..6f93b443d 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.13.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.14.b=
b
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "7cb1b8b92e96ebd1b7e632cda32715fed713d333"
+SRCREV =3D "6d0c7f7b7f484b3cd2aaf2e2b3cc902c095b4946"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.34.1


