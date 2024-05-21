Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E6CC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:28:25 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.21080.1716301698629507634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 07:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id D28EA157F6
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 16:28:16 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.137]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9QTM-1WPY5h0; Tue, 21 May 2024 16:28:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] pipewire: update 1.0.5 -> 1.0.6
Date: Tue, 21 May 2024 16:28:43 +0200
Message-ID: <20240521142844.3101250-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716301692-977FDED6-35F5F816/0/0 CLEAN NORMAL
X-TOI-MSGID: 39c684e8-8d58-4a65-84e4-66b43acb5bd9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 14:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110446

PipeWire 1.0.6 (2024-05-09)

This is a bugfix release that is API and ABI compatible with previous
1.0.x releases.

Highlights
  - A bitfield race was fixed that could cause some crashes or undefined
    behaviour whem moving nodes between drivers.
  - Fix to some invalid memory access in the pw-mon and pw-dump.
  - A regression in kodi with IEC958 formats playback was fixed.
  - A race in the ALSA plugin was fixed when updating the eventfd.
  - Improvements and fixes to module-combine-stream.
  - Negotiation was improved in pipewiresrc.
  - Some more small fixes and improvements.

PipeWire
  - Context properties are now set early so that client properties can be
    matched with rules.
  - A bitfield race was fixed that could cause some crashes or undefined
    behaviour when moving nodes between drivers.

Tools
  - Fix failure to hide properties in pw-mon. (#3997)
  - Fix some memleaks and a crash in pw-dump. (#4001)

Modules
  - The combine-stream module now prevents resampling to avoid broken
    audio because of different samplerates.
  - Fix a potential double free in module-loopback when calculating the
    delay. (#3748)
  - The FFADO module now only starts when ports are negotiated to avoid
    startup races. (#3968)
  - The combine-stream module will now forward tags.

SPA
  - Monitor volumes are now also clamped to the min/max volumes. (#3962)
  - V4l2 and libcamera now encodes the device ids into a JSON array. This
    is part of the deduplication code of devices.
  - A regression in kodi with IEC958 formats playback was fixed.

Bluetooth
  - Improved buffer handling and queued data when stopping.

ALSA
  - A race was fixed when updating the eventfd. (#3711)

GStreamer
  - Handle some errors better instead of crashing. (#3994)
  - Fix a memleak in the stream params handling.
  - Negotiation was improved in pipewiresrc.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
0
---
 .../pipewire/{pipewire_1.0.5.bb =3D> pipewire_1.0.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.5.bb =3D=
> pipewire_1.0.6.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.6.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.6.bb
index c8ac04d59..f60ede537 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "a2287be601710eea0d073261223ec34b92384c8a"
+SRCREV =3D "1b8b683a6d7ee9f1c5dcef3fce5f93069f1357c4"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.44.0


