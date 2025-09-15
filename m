Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C17CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 04:26:34 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.24925.1757910384595991121
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 21:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id D66FA38459
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 06:26:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.158]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uy0n2-0iOIVt0; Mon, 15 Sep 2025 06:26:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] pipewire: update 1.4.7 -> 1.4.8
Date: Mon, 15 Sep 2025 06:26:00 +0200
Message-ID: <20250915042601.167754-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757910368-BD7F9901-D31DDF2C/0/0 CLEAN NORMAL
X-TOI-MSGID: 287d0b3e-8fa4-434e-a0ab-111fd4c2ed83
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 04:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119399

PipeWire 1.4.8 (2025-09-11)

This is a bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Low latency for Firewire devices using the ALSA drivers.
  - Fix potential wrong pointers in memory mappings.
  - Improve compatibility with Apple Home Pod Minis.
  - JACK now implements the rename_callback.
  - Various improvements and bug fixes.

PipeWire
  - Make sure we can only queue buffers that were previously dequeued,
    to avoid some API misuse.
  - Fix potential wrong pointers in memory mappings. (#4884)
  - Improve the node unprepare function. (#4840)

Modules
  - Add fp_sap25 encryption to the ROAP module for compatibility with
    Apple Home Pod Minis.
  - Write a correct ALAC end tag in RAOP. (#4853)
  - Avoid VBAN problems with too long session names.
  - Fix a potential crash in the link-factory. (#4691)

SPA
  - Show correct values in the ALSA api.alsa.period-num property.
  - Add better support for Razer BlackShark v3.
  - Use only 3 periods in ALSA when in Pro-Audio mode. This gives
    better latency on some drivers. Also set the period count before
    the period size for improved compatibility. (#4785)
  - Force IRQ mode for firewire devices in pro-audio mode even if
    there are multiple capture and playback devices.
  - Add a new flag in the sync_timeline metadata to track if a
    release_point will be signaled or not. (#4885)

JACK
  - Support the rename_callback. (#4761)

Tools
  - Fix the -C option in pw-dump.
  - Log more info from sndfile when opening a file failed.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.7.bb =3D> pipewire_1.4.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.7.bb =3D=
> pipewire_1.4.8.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.7.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.7.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
index 31b6af503f..8687244f3e 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.7.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "1c542e9a0ca4226c9befb08fe9c19170aca3ce95"
+SRCREV =3D "8b43ed5c910e892d53de5a96aa01e9280a5b6650"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
=20
--=20
2.50.1


