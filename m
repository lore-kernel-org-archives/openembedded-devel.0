Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCB2CD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 17:34:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.34244.1694972050700073573
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 10:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout01.t-online.de (Postfix) with SMTP id 322FA202FF
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 19:34:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhvel-03vdKb0; Sun, 17 Sep 2023 19:34:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: upgrade 102.9.0 -> 102.15.0
Date: Sun, 17 Sep 2023 19:33:56 +0200
Message-ID: <20230917173356.1885696-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694972043-F7FEB704-5437EE95/0/0 CLEAN NORMAL
X-TOI-MSGID: 33abe417-a575-4a10-b293-153c36955917
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 17:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104916

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/{mozjs-102_102.9.0.bb =3D> mozjs-102_102.15.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-102_102.9.0.bb =3D> mozjs-1=
02_102.15.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.9.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-102_102.15.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-102_102.9.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
index e6ff379e9..08cfededa 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.9.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
            file://musl-disable-stackwalk.patch \
            file://0001-add-arm-to-list-of-mozinline.patch \
            "
-SRC_URI[sha256sum] =3D "31b074623f09ca821a8a7dee0b3d2df1a45f1164264d31c2=
6b4969a4d6a21dd1"
+SRC_URI[sha256sum] =3D "81fa590408f5a3af8f004d839ac47fb4121e05fe71733444=
5cec9ca55d8746af"
=20
 S =3D "${WORKDIR}/firefox-${PV}"
=20
--=20
2.41.0


