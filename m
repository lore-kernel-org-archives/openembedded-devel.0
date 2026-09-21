Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0E7C982F9
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:09 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47171.1789991767341817899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=E6vydRP8;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id CEDFB38179
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc9-04X1z50; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/24] python3-nocaselist: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:44 +0200
Message-ID: <20260921115500.53770-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991717-057F9A93-87766C1D/0/0 CLEAN NORMAL
X-TOI-MSGID: 60cf0903-a463-4b66-b1ab-d48f1c547186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=3fbRnCeFBI7uQ1CJaW8p8IgiCfS1xoG44Ff0oR16/Ns=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=E6vydRP8TPwFjH5NOHfKKBOtqVG1emgqgSJHemtXSbZuAo+ism7dQ9rl2VycQ/eSs
	 k7D5M86ySUjTluIyPqaUdQXjQX6eyJi1bPgnS0JzR7qxGTI9zgNji9LlvzfC/qgcHi
	 r1Jy4R8rCjj5GrrrmUUpqCCiiqMbn14HvcWkZ+jSvZwfFYin3ERRacuaZsMgrGoFcj
	 iRAvQOUX0XjGmC9efYvzmaa7FvWqEqRgHA3O6L/BazxUPzk/ccAIrtV4w6sEHuAA8N
	 8z8YaEBR1D8RF///nYUlTVf0uorZ0xy46kiq04XNAKWgdJT6bqJ704b2LCK3OeyvEG
	 B0ydctptjRMEQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130146

nocaselist has not imported six since the 2.x series; the runtime
dependency is stale.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-devtools/python/python3-nocaselist_2.2.0.bb       | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0=
.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
index 038be6c73c..38d941d9be 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
@@ -13,7 +13,3 @@ DEPENDS +=3D " \
 	python3-setuptools-scm-native \
 	python3-toml-native \
 "
-
-RDEPENDS:${PN} +=3D " \
-	python3-six \
-"
--=20
2.55.0


