Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10D1C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 14:03:22 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.39749.1742825002109136224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 07:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id 331879BC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 15:03:20 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.23]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1twiOc-2aVbxR0; Mon, 24 Mar 2025 15:03:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.4.0 -> 1.4.1
Date: Mon, 24 Mar 2025 15:03:53 +0100
Message-ID: <20250324140353.2905738-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742824998-0F7FEA92-B38F5AF8/0/0 CLEAN NORMAL
X-TOI-MSGID: 637b1a13-854a-4b9c-9cc8-0ce085b42a3e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 14:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116208

This is a quick bugfix release that is API and ABI compatible with
previous 1.x releases.

  - Handle SplitPCM wrong channels specifications. This fixes some
    problems with disappearing devices.
  - Add backwards compatibility support for when the kernel does not
    support UMP. Also fix UMP output. This restores MIDI support for
    older kernels/ALSA.
  - Fix a crash in audioconvert because the resampler was not using the
    right number of channels.
  - Some compilation fixes and small improvements.

  - Don't emit events when disconnecting a stream. (#3314)
  - Fix some compilation problems. (#4603)

  - Bump the ROC requirement to version 0.4.0

  - Handle SplitPCM too few or too many channels. Add an error string
    to the device names when the UCM config has an error.
  - Add backwards compatibility support for when the kernel does not
    support UMP.
  - Configure the channels in the resampler correctly in all
    cases. (#4595)
  - Fix UMP output.
  - Use the right samplerate of the filter-graph in audioconvert in
    all cases.

  - Fix a crash with an incomming call.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.0.bb =3D> pipewire_1.4.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.0.bb =3D=
> pipewire_1.4.1.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
index a57fbca229..2bd7739433 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "df1c36aec2aaf9e2eb1596b6b55e72c15fb2088a"
+SRCREV =3D "2eb8cf5dc780ca22b94545f1254497a428c412f5"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.49.0


