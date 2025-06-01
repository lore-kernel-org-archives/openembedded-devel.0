Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05BBC54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 11:37:22 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.25505.1748777833540774099
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Jun 2025 04:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout04.t-online.de (Postfix) with SMTP id A6EE15F7
	for <openembedded-devel@lists.openembedded.org>; Sun,  1 Jun 2025 13:37:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.141]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uLh00-05jYEj0; Sun, 1 Jun 2025 13:37:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: updatre 1.4.3 -> 1.4.4
Date: Sun,  1 Jun 2025 13:37:02 +0200
Message-ID: <20250601113702.2583559-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1748777828-FAFFA9E1-A42EA8D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 40920253-06d1-4bc1-a06f-095d193e6f3d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jun 2025 11:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117693

PipeWire 1.4.4 (2025-05-29)

This is a quick bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Provide better compatibility with 1.2 for MIDI.
  - Fix mpv buffer negotiation regression.
  - Improve GStreamer compatibility with libcamera.

SPA
  - Provide conversions to old style midi in the ALSA sequencer.
  - Negotiate only to UMP when using a newer library.
  - Fix negotiation direction for buffers, prefer the converter
    suggestion instead of the application until we can be sure
    applications make good suggestions.

GStreamer
  - Allow a minimum of 1 buffers again instead of 8. libcamera will
    allocate only 4 buffers so we need to support this.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.3.bb =3D> pipewire_1.4.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.3.bb =3D=
> pipewire_1.4.4.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.3.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.4.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.3.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.4.bb
index 5fe8a1c105..5eefb07532 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.3.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "331d5e03516a99c56b3064dbbbd639a3ae848d36"
+SRCREV =3D "3f79bcae5d4415f82907b49221ca05241a7f263c"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps"
=20
--=20
2.49.0


