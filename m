Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6208C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 03:51:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.58392.1742874657988244189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 20:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id F1AB6DF3
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 04:50:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.137]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1twvJT-3CRXGL0; Tue, 25 Mar 2025 04:50:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] pipewire: update 1.4.0 -> 1.4.1
Date: Tue, 25 Mar 2025 04:51:41 +0100
Message-ID: <20250325035141.3459-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742874652-1B7EBC15-10D72D7B/0/0 CLEAN NORMAL
X-TOI-MSGID: c27016a4-6742-45ed-8ac1-46fb01c3181f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116216

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
 .../pipewire/{pipewire_1.4.0.bb =3D> pipewire_1.4.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.0.bb =3D=
> pipewire_1.4.1.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
index a57fbca229..27f2db1210 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "df1c36aec2aaf9e2eb1596b6b55e72c15fb2088a"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
+SRCREV =3D "2eb8cf5dc780ca22b94545f1254497a428c412f5"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.4;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.49.0


