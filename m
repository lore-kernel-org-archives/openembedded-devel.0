Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AF7EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:30:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.12865.1692801001237845354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout01.t-online.de (Postfix) with SMTP id DCBD11D8EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 16:29:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYoru-15EBKz0; Wed, 23 Aug 2023 16:29:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: upgrade 0.3.77 -> 0.3.78
Date: Wed, 23 Aug 2023 16:29:51 +0200
Message-ID: <20230823142951.220768-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692800998-2AFE3D37-3DE2E42B/0/0 CLEAN NORMAL
X-TOI-MSGID: e53d81b3-c168-431f-8889-7bb40774f893
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 14:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104550

This is a small bugfix release that is API and ABI compatible with previo=
us
0.3.x releases.

  - An old regression was fixed with where some nodes would not run.
  - A regression was fixed where removed events would not be shown in som=
e
    cases. This would result in duplicate entries in audio clients.
  - Fix an off-by-one in the vban audio receiver. Tweak the rate adaption
    a little.
  - ACP will now set a UCM verb before probing the pro-audio devices.
  - More bugfixes and improvements.

  - An old regression was fixed with where some nodes would not run. (#34=
05)
  - Suspend was improved a little to avoid races when the session manager=
 would
    suspend right when a driver was starting.

  - module-rtp-sap does not use the deprecated inet_aton anymore.
  - Fix an off-by-one in the vban audio receiver. Tweak the rate adaption
    a little. (#3380)

  - ACP will now set a UCM verb before probing the pro-audio devices. (#3=
407)
  - The mandatory flag will be set now on the video modifiers.
  - EVL was updated to Xenomai4 r46 and xbuf creation was improved.
  - An option was added to force colors in the log even when logging to !=
tty.
  - The return type of spa_pod_builder_control() was fixed.
  - inotify errors are handled better now. (#3439)

  - A regression was fixed where removed events would not be shown in som=
e
    cases. (#3414)

  - Improve compatibility with more devices, avoid reusing the same trans=
port
    for different media-sink instances to avoid encoder resets.
  - Improve enumeration of codec profiles for BAP and A2DP.

  - Ensure we can't iterate ports from a deactivated client. Also make su=
re
    the JACK clients with the node.always-process=3Dfalse always show the=
ir
    ports. (#3416)

  - A potential crash was fixed in the device provider when stopping.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.77.bb =3D> pipewire_0.3.78.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.77.bb =3D=
> pipewire_0.3.78.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.78.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.78.bb
index 34b372096a..cf2773ff49 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.78.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "31cd694602cc37ada3a6d02a5a381f4e3933ecef"
+SRCREV =3D "188f784430283afb08abb8e6540ddbc674e09399"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.41.0


