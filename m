Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D2DC54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 06:51:07 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.17527.1709794260557828173
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 22:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id 868BF5FF9
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Mar 2024 07:50:58 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.43.184]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ri7ai-1Obr3x0; Thu, 7 Mar 2024 07:50:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs-115: fix reproducibility issue
Date: Thu,  7 Mar 2024 07:51:18 +0100
Message-ID: <20240307065118.9164-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709794256-5201F95D-D8F2621F/0/0 CLEAN NORMAL
X-TOI-MSGID: e33c4cff-08e2-4857-93c4-c71b1f4a8737
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 06:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109192

mozjs inserts lines with ${S} in many cpp files. Although required for
compilation, it affects reproducibility for the mozjs-115-src package.

Fix this by simply not packaging the modified source code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.8.0.bb
index 4e36acabb..1269795d2 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb
@@ -93,5 +93,6 @@ do_install:append() {
     rm -f ${D}${libdir}/libjs_static.ajs
 }
=20
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
 PACKAGES =3D+ "lib${BPN}"
 FILES:lib${BPN} +=3D "${libdir}/lib*"
--=20
2.44.0


