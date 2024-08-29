Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1AFC87FC5
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:40:26 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.24366.1724949620258878839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 09:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 262A47FFD
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 18:40:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.56]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sjiBy-3MpGkr0; Thu, 29 Aug 2024 18:40:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.2.2 -> 1.2.3
Date: Thu, 29 Aug 2024 18:41:49 +0200
Message-ID: <20240829164149.101882-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1724949614-75FF88AE-B4F71C36/0/0 CLEAN NORMAL
X-TOI-MSGID: b6e6a16d-be59-4478-9133-34f957930f10
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 16:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112037

PipeWire 1.2.3 (2024-08-22)

This is a bugfix release that is API and ABI compatible with the
previous 1.2.x and 1.0.x releases.

Highlights
  - Implement freewheeling support in the FFADO driver. Also improve
    buffersize and samplerate handling.
  - Improve some locking on spa_loop. Remove a possible deadlock when
    the queue was full.
  - Allocate more space for the libcamera devices string to properly
    deduplicate libcamera and v4l2 devices.
  - Some more bugfixes and improvements.

PipeWire
  - Improve activation state changes and xrun detection some more.
    (#4182)
  - Avoid a memory leak when a link in error is destroyed.

Modules
  - Improve samplerate and buffersize handling in FFADO driver so that
    it is possible to force a rate and buffer size.
  - Implement freewheeling support in the ffado driver.
  - Always set the server side clock.quantum-limit on nodes. This fixes
    a buffer size problem in Midi-bridge. (#4005)

SPA
  - Improve some locking on spa_loop. Remove a possible deadlock when
    the queue was full. (#4114)
  - Allocate more space for the libcamera devices string to properly
    deduplicate libcamera and v4l2 devices.
  - Fix a potential race when enumerating v4l2 udev devices. (#3960)

Bluetooth
  - Improve compatibility with some devices (Soundcore Motion 300).

Tools
  - pw-cli can now handle arbitrarily large input and params. (#4166)
  - Avoid some compiler warnings in pw-top.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.2.2.bb =3D> pipewire_1.2.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.2.bb =3D=
> pipewire_1.2.3.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.2.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.2.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.bb
index ab9f0c19d..0a2088a3c 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "e224ccdcb7514bc7417f46c75d137fbee231e7fc"
+SRCREV =3D "e2a76824e2b112b15ae4a1a3d444696d5526f8d8"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.45.2


