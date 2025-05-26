Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94044C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:48:40 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.24309.1748245715895191440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 00:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 7A9E047E
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 09:48:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.109]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uJSZN-0cP4UL0; Mon, 26 May 2025 09:48:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] pipewire: update 1.4.2 -> 1.4.3
Date: Mon, 26 May 2025 09:48:17 +0200
Message-ID: <20250526074818.43887-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1748245705-F7FFD541-502B8158/0/0 CLEAN NORMAL
X-TOI-MSGID: 6a9c92db-025d-4438-8258-0f5f2fbc6e3f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 07:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117622

PipeWire 1.4.3 (2025-05-22)

This is a bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Many netjack2 improvements. The driver/manager roles were fixed,
    MIDI is written correctly and errors are handled better.
  - Improvements to UMP sysex handling.
  - More small bug fixes and improvements.

PipeWire
  - Let all commands go to the node. This makes it possible to send
    custom commands.

Modules
  - Many netjack2 improvements. The driver/manager roles were fixed,
    MIDI is written correctly and errors are handled better.
  - Improve the filter-graph state management in filter-chain.

SPA
  - Use default value of filter. (#4619)
  - Fix UMP program change conversion to MIDI 1.0. (#4664)
  - Skip only the first buffer for raw formats in v4l2 to avoid
    dropping important headers when dealing with encoded formats.
  - Fix ebur128 port name. (#4667)
  - Only convert UMP/MIDI, pass other controls. Fixes OSC and other
    control types in the mixer. (#4692)
  - Improve UMP sysex handling in alsa seq.
  - Improve ALSA audio.channels support. Only use this when the value
    is within the valid range.

Tools
  - debug UMP SysRT messages correctly in pw-mididump.

JACK
  - Handle sysex in UMP better by appending the converted midi1
    sysex.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.2.bb =3D> pipewire_1.4.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.2.bb =3D=
> pipewire_1.4.3.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.3.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.3.bb
index e554d8737a..5fe8a1c105 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "d20a1523b6770dfa93a270bdda5d7c800d7ec191"
+SRCREV =3D "331d5e03516a99c56b3064dbbbd639a3ae848d36"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps"
=20
--=20
2.49.0


