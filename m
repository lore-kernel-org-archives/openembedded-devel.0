Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D60C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 18:39:23 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.90646.1705343955185691120
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 10:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id DE2C7296AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 19:39:12 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.169.126]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rPRrb-27Ocvh0; Mon, 15 Jan 2024 19:39:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: update 115.2.0 -> 115.6.0
Date: Mon, 15 Jan 2024 19:39:08 +0100
Message-ID: <20240115183908.133042-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705343951-477FD979-3A1D56B4/0/0 CLEAN NORMAL
X-TOI-MSGID: 213c9fc4-573a-4679-90ca-62d851004b94
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 18:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108296

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/{mozjs-115_115.2.0.bb =3D> mozjs-115_115.6.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-115_115.2.0.bb =3D> mozjs-1=
15_115.6.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.6.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-115_115.6.0.bb
index e1a547c33..6503747d8 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.6.0.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
            file://0001-add-arm-to-list-of-mozinline.patch \
            file://py3.12.patch \
            "
-SRC_URI[sha256sum] =3D "51534dd2a158d955a2cb67cc1308f100f6c9def0788713ed=
8b4d743f3ad72457"
+SRC_URI[sha256sum] =3D "66d7e6e5129ac8e6fe83e24227dc7bb8dc42650bc53b2183=
8e614de80d22bc66"
=20
 S =3D "${WORKDIR}/firefox-${PV}"
=20
--=20
2.43.0


