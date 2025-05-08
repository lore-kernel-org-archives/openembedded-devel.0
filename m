Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90C3C3ABC6
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 19:52:16 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.5220.1746733929133410806
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 12:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id D82EC113F
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 May 2025 21:52:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.121]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uD7Hp-2S7LQP0; Thu, 8 May 2025 21:52:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.4.1 -> 1.4.2
Date: Thu,  8 May 2025 21:52:00 +0200
Message-ID: <20250508195200.928090-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1746733925-EB7FC49F-8C8D5395/0/0 CLEAN NORMAL
X-TOI-MSGID: ed53240b-c766-4fe8-bb7b-5d5ba680b8e3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 19:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117368

PipeWire 1.4.2 (2025-04-14)

This is a bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Do extra checks for MIDI to avoid 100% CPU usage on older kernels.
  - Fix some potential crashes in POD builder.
  - pw-cat streaming improvements on stdout/stdin.
  - Small fixes and improvements.

PipeWire
  - Make the service files depend on DBus to avoid startup races.

SPA
  - Do extra checks for MIDI to avoid 100% CPU usage on older kernels.
  - Use Header metadata by default in videoadapter.
  - Handle set_format result from v4l2 better.
  - Handle crash when POD builder overflows in the filter.
  - Work around a libebur128 bug. (#4646)

Tools
  - pw-cat prefers AU format when streaming on stdout/stdin. (#4629)
  - Improve pw-cat verbose sndfile format debug.
  - Add the missing --channel-map long option to pw-loopback.

GStreamer
  - Fix a leak in the deviceprovider. (#4616)
  - Fix negotiation and make renegotiation better.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.1.bb =3D> pipewire_1.4.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.1.bb =3D=
> pipewire_1.4.2.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
index e1cf2a55ba..2af16aad3e 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "2eb8cf5dc780ca22b94545f1254497a428c412f5"
+SRCREV =3D "d20a1523b6770dfa93a270bdda5d7c800d7ec191"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps"
=20
--=20
2.49.0


