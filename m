Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7B8C04A68
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 15:26:15 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.3913.1659194767987983537
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 08:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id C054D145B3
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 17:26:05 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.44.237]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oHoLl-2NFPiz0; Sat, 30 Jul 2022 17:25:57 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] ibus.inc: fix after branch renaming
Date: Sat, 30 Jul 2022 17:25:45 +0200
Message-Id: <20220730152545.294982-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659194757-0144746C-06932959/0/0 CLEAN NORMAL
X-TOI-MSGID: 1288ef48-52f4-4def-9ec2-438a0ff761a9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Jul 2022 15:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98058

this fixes:
ERROR: ibus-native-1.5.26-r0 do_fetch: Fetcher failure: Unable to find re=
vision 6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3
in branch master even from upstream

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-support/ibus/ibus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipe=
s-support/ibus/ibus.inc
index 37a490abe..b21a5e528 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -10,7 +10,7 @@ PV =3D "1.5.26"
 DEPENDS =3D "unicode-ucd"
=20
 SRC_URI =3D " \
-    git://github.com/ibus/ibus.git;branch=3Dmaster;protocol=3Dhttps \
+    git://github.com/ibus/ibus.git;nobranch=3D1;protocol=3Dhttps \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
 "
 SRCREV =3D "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
--=20
2.34.1


