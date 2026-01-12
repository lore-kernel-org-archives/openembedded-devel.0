Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F7CCF45CE
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 20:16:16 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42554.1768248970768338226
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 12:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 6BEEE11ED;
	Mon, 12 Jan 2026 21:16:08 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.125]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vfOKb-38Vtvl0; Mon, 12 Jan 2026 21:16:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCHv2] btop: update 1.4.5 -> 1.4.6
Date: Mon, 12 Jan 2026 21:15:53 +0100
Message-ID: <20260112201553.114593-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768248965-2FFFC85C-A9CE1FA9/0/0 CLEAN NORMAL
X-TOI-MSGID: e1de5d9a-b029-4901-9c4b-1255668dc1f3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 20:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123392

Disable build-testing for now, as this would require 'googletest' depende=
ncy

v1.4.6

References | Description | Author(s)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/btop/{btop_1.4.5.bb =3D> btop_1.4.6.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/btop/{btop_1.4.5.bb =3D> btop_1.4.6.bb} (=
89%)

diff --git a/meta-oe/recipes-support/btop/btop_1.4.5.bb b/meta-oe/recipes=
-support/btop/btop_1.4.6.bb
similarity index 89%
rename from meta-oe/recipes-support/btop/btop_1.4.5.bb
rename to meta-oe/recipes-support/btop/btop_1.4.6.bb
index 0455da384b..29072522df 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.5.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.6.bb
@@ -6,11 +6,12 @@ SECTION =3D "console/utils"
=20
 SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "a1099d075fa914452366b28c67ff171e21a1f02e"
-
+SRCREV =3D "975e3951daa7d3114112d2cd4ee689cf5ee38745"
=20
 inherit cmake
=20
+EXTRA_OECMAKE +=3D "-DBUILD_TESTING=3DOFF"
+
 FILES:${PN} +=3D " \
     ${datadir}/icons \
     ${datadir}/icons/hicolor \
--=20
2.52.0


