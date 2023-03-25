Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3718C7EE20
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.17463.1679731399519865179
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 5722E22357
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrq-0RoPhm0; Sat, 25 Mar 2023 09:03:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 30/32] surf: build with webkitgtk-4
Date: Sat, 25 Mar 2023 09:02:54 +0100
Message-Id: <20230325080256.923752-30-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731394-85D6DC08-4A4CFD19/0/0 CLEAN NORMAL
X-TOI-MSGID: 78b75102-256f-4475-944c-920b46147a0b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101739

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/surf/surf_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-=
graphics/surf/surf_2.1.bb
index 7523ed587..a3c270e0e 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -5,7 +5,7 @@ SECTION =3D "x11/graphics"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2a6f86d002ae9ae1eb1ccc466289f=
146"
=20
-DEPENDS =3D "webkitgtk gtk+3 glib-2.0 gcr3"
+DEPENDS =3D "webkitgtk-4 gtk+3 glib-2.0 gcr3"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
--=20
2.34.1


