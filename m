Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5708C44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 15:23:32 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.311.1783697006178363803
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 08:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=HCu1fMqs;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout04.t-online.de (Postfix) with SMTP id B937511E6
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 17:23:23 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.226]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wiD4O-0lzaE50; Fri, 10 Jul 2026 17:23:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.6.7 -> 1.6.8
Date: Fri, 10 Jul 2026 17:23:10 +0200
Message-ID: <20260710152310.39266-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1783696996-25FF895B-1314F114/0/0 CLEAN NORMAL
X-TOI-MSGID: debcd1dc-fec8-4c3e-ad39-35be4602117e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1783697003; i=f_l_k@t-online.de;
	bh=Tgm5sZblxQFqqGeZzxrv2XShEBAfGkazuVNtYkCbTmY=;
	h=From:To:Subject:Date;
	b=HCu1fMqsO4Hf8S98i/Ku7vg6puF5cQlBtDs0i9imbSaPIC/z83l8UA2wTxZdNVA37
	 unDP9eUQcVEgr2GhErUnR7BzCFFSxmS4y+WWmrijfkoO+z7iq1NlpWecQHTtX73XGP
	 ovXZjPjX1HudOJQ82j49CVa5ocN2niuY6t41AIpzV9qmSTmrW1BR741MJqToaLnDkn
	 K8mIX7dXMl5az0RSDZ2ChUBuFpCEk/+Ppjet7kcgD7bPhCPRRjapZmc+zszEolazp2
	 2RBKY/OKDh2f8DXfPLkudtMcprxF4cU2yqDSyD9Ah1iyAuQJ7P6E4wQWaRmFsZ7s+6
	 nN9yFYCLJRbiQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 15:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128129

PipeWire 1.6.8 (2026-07-09)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix a data race in JACK that could cause lost MIDI events in ardour.
  - Fix some unbounded memory allocations.
  - Various small fixes.

PipeWire
  - Avoid some graph recalcs, which fixes a bug when suspending a node
    while it is active.

Modules
  - Do Content-Length and allocation check in RAOP to avoid OOM errors.
  - Fix a potential memory leak in the error path of client-node. (#5348)

SPA
  - Fix filter-graph dynamic graph updates.
  - Avoid 100% when unplugging a card.
  - Fix filter-graph volumes when the filter is loaded inside a node with
    hardware volume. (#5344)
  - Add normalize and latency options to the SOFA filter. (#5322)

Bluetooth
  - Fix a potential leak when transport fails to start.

Pulse-server
  - Avoid stack exhaustion via unbounded alloca.

JACK
  - Fix a data race in jack_port_get_buffer() when called from concurrent
    threads, like in ardour. (#5324)

GStreamer
  - Skip invalid crop metadata.
  - Avoid crash because metadata listener was registered twice.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.6.7.bb =3D> pipewire_1.6.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.7.bb =3D=
> pipewire_1.6.8.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
index 90815ba012..7d1e801548 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus"
=20
-SRCREV =3D "3b2cb4fb037bf6033b87d3c87ee917b2f686d309"
+SRCREV =3D "b741e0c74f5436f0c925f7741140db0efd32cf4e"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
 SRC_URI +=3D "file://0001-pipewire-compress-offload.patch"
--=20
2.55.0


