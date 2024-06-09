Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0D6C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 18:00:56 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.1870.1717956049702386111
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 11:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout11.t-online.de (Postfix) with SMTP id D35343A48
	for <openembedded-devel@lists.openembedded.org>; Sun,  9 Jun 2024 19:59:48 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.230]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGMpW-2029k90; Sun, 9 Jun 2024 19:59:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs-115: update 115.8.0 -> 115.11.0
Date: Sun,  9 Jun 2024 20:00:22 +0200
Message-ID: <20240609180022.2842829-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1717955986-45B96322-1AAAB5CB/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ee21e70-a29a-4706-afe9-1c5f40f1f6a1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 18:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110782

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/{mozjs-115_115.8.0.bb =3D> mozjs-115_115.11.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-115_115.8.0.bb =3D> mozjs-1=
15_115.11.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.11.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
index 1269795d2..b08828602 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
            file://0001-add-arm-to-list-of-mozinline.patch \
            file://armv5.patch \
            "
-SRC_URI[sha256sum] =3D "af8086f23efc8492d286671f6035b1a915de6f4ed5c7897e=
40be0e1cb6b895ea"
+SRC_URI[sha256sum] =3D "16be46f16a356a2b8bd3541805a24c8a2acf6f077cf8a658=
59689685c26025e0"
=20
 S =3D "${WORKDIR}/firefox-${PV}"
=20
--=20
2.45.1


