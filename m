Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BE5C83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 13:30:04 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.18819.1751981403220348448
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 06:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id F0282E41B
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Jul 2025 15:30:00 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.68]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZ8OV-2fMRSj0; Tue, 8 Jul 2025 15:29:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][PATCH 1/2] pipewire: update 1.4.5 -> 1.4.6
Date: Tue,  8 Jul 2025 15:29:52 +0200
Message-ID: <20250708132953.198453-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1751981399-C17F85F1-D6070203/0/0 CLEAN NORMAL
X-TOI-MSGID: 80afc8f6-7f05-4edc-b639-0b19fc237554
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 13:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118311

PipeWire 1.4.6 (2025-06-27)

This is a bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Fix a crasher bug in filter-chain and one in the ALSA plugin.
  - Improve latency reporting in module-combine-stream.
  - Some smaller fixes and cleanups.

modules
  - Improve latency handling in module-combine-stream. (#4731)
  - Improve save activation/deactivation of the filter-graph in
    module-filter-chain to avoid crashes. (#4700, #4750)
  - Add an option to disable RAOP with a context.property.

SPA
  - Handle NULL io in alsa wakeup code. This can happen when there
    is negotiation happening. (#4734)
  - Enable interrupts after an ALSA error to keep the dataflow
    going.
  - Reset some stats better after an ALSA error.
  - Support the alsa.use-ucm property for the ALSA udev plugin.

pulse-server
  - Mark empty buffers. This improves some code paths in the mixer.

GStreamer
  - Fix a refcount issue in the device provider.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.5.bb =3D> pipewire_1.4.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.5.bb =3D=
> pipewire_1.4.6.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.6.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.6.bb
index e41cfd221c..34415c4444 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "83ada1e086f8fa49bf9652df2edd9ccee5efa48b"
+SRCREV =3D "83a155d0c09d703bdc95ed4558277784e9751bd3"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps"
=20
--=20
2.49.0


