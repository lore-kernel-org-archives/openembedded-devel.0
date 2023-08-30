Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90D1C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 05:39:30 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.7839.1693373969162322076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 22:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id 6426D1AB8C
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:39:27 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.217]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qbDvK-0aMZzV0; Wed, 30 Aug 2023 07:39:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: upgrade 0.3.78 -> 0.3.79
Date: Wed, 30 Aug 2023 07:38:48 +0200
Message-ID: <20230830053848.41484-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693373966-1381E931-FFF03FE6/0/0 CLEAN NORMAL
X-TOI-MSGID: 344f219a-bd3c-41da-813e-429dd6eb4ed2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 05:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104644

This is a quick bugfix release that is API and ABI compatible with previo=
us
0.3.x releases.

  - Fix a regression in suspend that could cause silence.
  - Fix a regression in JACK port registration that could cause all kinds=
 of
    JACK problems. (#3485)
  - Fix a typo in the neon sample conversion functions that could cause
    distortion.
  - Add BAP broadcast source and sink support.
  - pw-top now has a batch mode to dump the output to stdout.
  - Many more bugfixes and improvements.

  - Fix a regression in shutdown where a node might not first suspend
    properly. This cause loss of sound in some cases. (#3378)
  - Failure to compile a regular expression in the config file will now
    be reported and ! can be used to negate the match. (#3460)
  - Fix a regression where some nodes might not set running in some
    cases.
  - Nodes are now suspended before the format is cleared, which might
    fix some crashes.

  - pw-top now has a batch mode to dump the output to stdout.

  - The queued samples in audioconvert are now correctly reported in the
    delay. (#3454)
  - Make it easier to add a custom profile in ACP.
  - Fix a typo in the neon sample conversion functions that could cause
    distortion. (#3463)
  - device.profile.pro=3Dtrue is added for pro audio nodes.
  - An xrun counter was added to spa_io_clock to detect and track skipped
    data because of xruns.

  - Add alsa-sink and alsa-source modules. (#3456)

  - Fix a regression where only the BAP off profile is shown.
  - Add BAP broadcast source and sink support.

  - Also emit a latency notify when the buffer size changes.
  - Fix a regression in JACK port registration. (#3485)
  - jack_port_tie() is now supported.

  - Improve property handling, support lists and ranges in addition to
    fixed values. (#3451)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.78.bb =3D> pipewire_0.3.79.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.78.bb =3D=
> pipewire_0.3.79.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.78.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.79.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.78.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.79.bb
index cf2773ff4..1304c0ac8 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.78.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.79.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "188f784430283afb08abb8e6540ddbc674e09399"
+SRCREV =3D "b5c3f217926f9066a1afbee7eb20967dd6896c56"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.41.0


