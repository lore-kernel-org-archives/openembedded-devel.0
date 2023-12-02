Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A517EC4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 15:20:37 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.19798.1701530431962953156
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Dec 2023 07:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 84610C0E5
	for <openembedded-devel@lists.openembedded.org>; Sat,  2 Dec 2023 16:20:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.124]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r9RnA-1IeHKb0; Sat, 2 Dec 2023 16:20:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libdecor: update 0.2.0 -> 0.2.1
Date: Sat,  2 Dec 2023 16:21:05 +0100
Message-ID: <20231202152105.2058-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701530428-39FF895D-14C07516/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e5d968a-a2f0-438d-8318-e75af658377e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Dec 2023 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107196

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libdecor/{libdecor_0.2.0.bb =3D> libdecor_0.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.0.bb =3D> libdeco=
r_0.2.1.bb} (94%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.0.bb b/meta-o=
e/recipes-graphics/libdecor/libdecor_0.2.1.bb
similarity index 94%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.2.0.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.2.1.bb
index 7c1ebc159..4c9c64c28 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.0.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.1.bb
@@ -15,7 +15,7 @@ DEPENDS =3D " \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "ad320fc0e0ec2cd75a87fed454a9c7d6d1921464"
+SRCREV =3D "060fe7611aedb5779929e6b1468419c2d4e7168f"
=20
 PACKAGECONFIG ?=3D "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', =
d)}"
=20
--=20
2.42.1


