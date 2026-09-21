Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABD4C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:08 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47390.1789991765074128856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ilAUmCpO;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id 8A7BF38164
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc8-04X1yz0; Mon, 21 Sep 2026 13:55:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/24] python3-astroid: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:38 +0200
Message-ID: <20260921115500.53770-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991716-8E7FBA93-5E69AA99/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ce009e3-39e4-4c90-b619-ad3472537048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=agvGy6k8Lok7bUlWH9aNgOIPJXiYku51jPqFbYyMeac=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ilAUmCpO702qXECM9McdFz0E8ZYg3y2at+WvAI80vfFJ7E4bYAX8ZMXseLd+vbTBn
	 TLK6COFRpK+4jv2WRILY/7Hz2qGoaA1Hyl67yhhLRYTr5Jut97heUoao9fNuK0HeGy
	 6LK7kTif14s8NEQNeEnIpe6tPYoCCeIRZvOKOXCeg2blwjYR/fr9gIKzbP+VLxw1cv
	 aBaIy0O5+MD7qr1TWg+cQ56w6L7gKxNkLRMHfsydHr4yTKvFfkvqKekhYgSJEs7R2R
	 hBooVA2zU0S9Krd5XbCd8Yhh9yJROjt/kf2fqK2wtQaeaF37u6Mpz3VyxnYH0bFymu
	 xK7Hp+dR3VBRA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130137

astroid has not imported six since the 2.x series; the runtime dependency
is stale.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb=
 b/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
index f0a74e79b1..2e1932e88f 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
@@ -18,7 +18,6 @@ FILES:${PN}-tests +=3D " \
 RDEPENDS:${PN}:append:class-target =3D " \
     python3-lazy-object-proxy \
     python3-logging \
-    python3-six \
     python3-wrapt \
     python3-setuptools \
     python3-typing-extensions \
--=20
2.55.0


