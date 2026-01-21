Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0B7D4694D
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 15:40:02 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14549.1769009993318724749
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 07:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout07.t-online.de (Postfix) with SMTP id A2B9DDFE8
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 16:39:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.12]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viaJA-03Rw370; Wed, 21 Jan 2026 16:39:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.4.9 -> 1.4.10
Date: Wed, 21 Jan 2026 16:39:43 +0100
Message-ID: <20260121153943.2112080-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769009988-2EFFA9B6-B6C750D3/0/0 CLEAN NORMAL
X-TOI-MSGID: e0e96bd9-8102-4c48-92f5-77798bab83f6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 15:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123723

PipeWire 1.4.10 (2026-01-16)

This is a small bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Fix a regression in restoring volumes on nodes.
    - Clean up timed out stream on pulse-server.
      - Backport filter-graph channel support.
        - More small fixes and improvements.

PipeWire
  - Backport the timer queue from 1.5.

modules
  - Fix module leak in module-eq. (#5045)
    - Fix profiling of multiple drivers when profile.interval.ms is
        set. (#5061)
          - Allow both sink and source pulse tunnels with the same name.
              (#5079)

SPA
  - Emit props events in all cases. (#4610)
    - Backport some filter-graph changes to make it adapt better to the
        number of channels of the stream.
          - Fix some port errors in filter-graph. (#4700)
            - Avoid a memcpy in the convolver.
              - Handle some DBus errors better instead of crashing.
                - Fix AVX2 functions and flags. (#5072)
                  - Limit resampler phases to avoid crashes (#5073)
                    - Support some more channel downmix positions.

pulse-server
  - Clean up timed out streams. (#4901)
    - Add message to force mono mixdown.

GStreamer
  - Avoid scaling overflow in the clock.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.9.bb =3D> pipewire_1.4.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.9.bb =3D=
> pipewire_1.4.10.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
index 683d5f3ce0..a0b3848dd0 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "fd60e04525f3a04d90bf50085222e0cc9139b4a4"
+SRCREV =3D "ced36a5315135044a22c4b373be44368d312f9c8"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
=20
--=20
2.52.0


