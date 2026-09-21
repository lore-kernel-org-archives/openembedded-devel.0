Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E071C982FB
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47393.1789991766889489263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=n2A1RQPG;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id C36181C3F9
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc9-04X1z40; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/24] python3-nocasedict: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:43 +0200
Message-ID: <20260921115500.53770-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991717-E2FFAA93-72C58D94/0/0 CLEAN NORMAL
X-TOI-MSGID: 96e106e9-a205-4a17-b8d8-5389f477304b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=TfLiZg4YhuXp3SKuoZ13yBemn5jyeBlzdfte9my/thM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=n2A1RQPGawgxAo5rE7yOoJWCU+UI+hqQdUVjtm0enj9Y4hcoGtz8ql9fUVPulMmCP
	 ovGQv78Gv/y/MOdjfPxKsGtFFr5v+7k8oE5dJhxG4h+fVBFSrvmaS9CqCMERYokeTT
	 kHsAoyROvCL3vX+Kekg//ncsVuHpBYKOI9JBFWgcvoiBsdFGGDyTKjZJSeDvzwsTKz
	 RcaS5lXu4pTbPvMlLC/LH1GkBnziZybDWfsyA84ttOmaewWT0IysClsvcT5r9gZjaE
	 ka6kcPXjTKk479G41R3Zuti6PfYuoW3S0DENpy7S84GPMUbmf2f/qAQ6U4D8McHIVj
	 VWyEjZLk1DgXg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130142

nocasedict has not imported six since the 2.x series; the runtime
dependency is stale.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-devtools/python/python3-nocasedict_2.2.1.bb       | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.2.1=
.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.1.bb
index 027b61c8b3..5a57b8c651 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.1.bb
@@ -13,7 +13,3 @@ DEPENDS +=3D " \
     python3-setuptools-scm-native \
     python3-toml-native \
 "
-
-RDEPENDS:${PN} +=3D " \
-    python3-six \
-"
--=20
2.55.0


