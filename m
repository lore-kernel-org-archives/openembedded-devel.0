Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD99C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 06:19:43 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.12560.1721629168420505893
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jul 2024 23:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 219923EB64
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 08:19:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.233.103]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sVmOK-4bhGPx0; Mon, 22 Jul 2024 08:19:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.2.0 -> 1.2.1
Date: Mon, 22 Jul 2024 08:20:22 +0200
Message-ID: <20240722062022.140894-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721629164-5DFEB06B-37DFD9C7/0/0 CLEAN NORMAL
X-TOI-MSGID: b55315c3-73ca-4fc2-8c6a-51b4c0790df4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 06:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111424

PipeWire 1.2.1 (2024-07-12)

This is a bugfix release that is API and ABI compatible with previous
the previous 1.2.0 release and the 1.0.x releases.

Highlights
  - Fix a regression in the node activation counters that would break aud=
io
    when using KODI.
  - Fix a regression in ardour export because of mishandling of sync grou=
ps.
  - Fix a regression in KDE screen preview because of the new async
    scheduling.
  - Fix a regression in context.exec argument parsing that would break so=
me
    existing scripts.
  - More small bug fixes and improvements.

PipeWire
  - Fix a regression in the node activation counters that would break aud=
io
    when using KODI. (#4087)
  - Fix a regression in ardour export because of mishandling of sync grou=
ps.
    (#4083)
  - Fix a regression in KDE screen preview because of the new async
    scheduling. Disable async for driver nodes. (#4092)
  - Slightly improve node shutdown to cause less xruns.
  - Fix a regression in context.exec argument parsing that would break so=
me
    existing scripts.
  - Support custom thread create functions.

Modules
  - Improve snapcast address parsing. (#4093)

SPA
  - Fix multiple %f parsing in ACP for the new plug+a52 profiles.
  - Improve v4l2 param generation. Improve recovery when framesize or rat=
es
    are unknown, support vivid. (#4063)

JACK
  - Use the custom thread create function to correctly let module-rt kit
    manage threads so that we don't end up with priorities on the wrong
    threads. (#4099)

GStreamer
  - Fix a crash when destroying a stream.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.2.0.bb =3D> pipewire_1.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.0.bb =3D=
> pipewire_1.2.1.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.1.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.1.bb
index 12c0fbfa5..a938ca632 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "7b4c0dd5ecb40e4d2c153699a85c51e1460361e1"
+SRCREV =3D "d55f5ef60869fcd0b8ea4879b51607efab2eef33"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.45.2


