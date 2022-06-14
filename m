Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24537C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:31:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.25546.1655429481949719685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DhfAu8qj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429480; i=@fujitsu.com;
	bh=P1jwJJJlEyjluOaQtJV09aTGxhrRcp1nRMor6/CI4u8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DhfAu8qjHJRejjQZX6LxqOEm1L0LjZsvn/Bs9Ap6AElTnKvWN8QgI5cD2K21KnLwI
	 XHQFZIz5PWTMT9trUUBgVlTr0ztYt6JyQjsh6h0ZISTqybLieUyAF1J6KxPIlNm9bW
	 +uiL9M5PQIxDVkGVaPq4K72no6oDQFOwuUfBVXGDRu/ePkpA13PwD9WLTfjJsoJjIo
	 edevOexXuEGLqq7GSV4VOGVCX+VSGDAlN27G3OjbsDo/CXTP8llIrtJ78sUAMaH+Kl
	 ypGsGOtZxFuZWa2ldmiCsFgpZbOP0styOxpQvVlqv8fXPJh9af59kRfCwU0nLaSLs0
	 h/tNuMqOdHXrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSTf95uo
  kgxln9S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owjh6+zFNzhqrjw+QpbA2MDVxcjF4eQwBNG
  iXmXXrJDOBeYJI4+3s4C4RxglHj+9DtTFyMnB5uArsSLH4tZQGwRAX2JpbP3MHcxcnAIC8RJ7
  GwEK2ERUJV419DACmLzCnhIvFhwghnElhBQkJjy8D0zRFxQ4uTMJ2BjmAUkJA6+eAE2RkJAUW
  L2dHmI8gqJ14cvQbWqSVw9t4l5AiPfLCTds5B0L2BkWsVonVSUmZ5RkpuYmaNraGCga2hoqmt
  spGtoYamXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYfCnFCnt3MF5e+VPv
  EKMkB5OSKK/W8dVJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4Ha4C5QSLUtNTK9Iyc4CRAJOW4
  OBREuG1vwyU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOG/mDaAiAZCijNI8uBGwqLzEKC
  slzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3F2QKT2ZeCdymV0BHMAEd0bhvBcgRJYkIKakGJqG
  rsuzrlG2u+bczi1y4+YAnyPnHlcMPhc6FVeenltb0P52qmrnab2Hf9Ckfv65RDou1Sf6TXZy3
  RfM+m07G/gMJLf9nGaaqhoduNoxQM342s1Jkj+iik8/sdSUtKqq1jH/OfcF78JxtkO6tqTECm
  eJ3uZacL1yjtWTFgcWRJ1MNHULDnMRb76ivSM/fyXFBUcFm2wGDICE5zpYGvrONa1IUj3U3p1
  SVhQj8fGdicufM3OYU35Xzil4qHHn+wOpvutapAoNr702WqXhuSVLr5q857vFw4SOR7xunnw7
  mEuvx+DBb4oTYjy5tXnXfBbn/VZWdFNSYOe/3KtRJ8KgtbuCJu+4/Qdy9yP/wKSElluKMREMt
  5qLiRABT6QPFRQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1655429479!149584!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31126 invoked from network); 17 Jun 2022 01:31:19 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:31:19 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 64D7E1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:31:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 57489100077
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:31:19 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:30:58 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.49.0 -> 2.50.0
Date: Tue, 14 Jun 2022 17:15:04 +0800
Message-ID: <1655198104-24362-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 01:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97528

Changelog:
fix changelog header to consistent size (#1818) (b698f9c)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.49.0.bb => python3-google-api-python-client_2.50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.49.0.bb => python3-google-api-python-client_2.50.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.49.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.50.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.49.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.50.0.bb
index 660262e62..c6e82f5c0 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.50.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "629bbde991ce2d9697c6da37f2416f7aeb01ba01505b166066a415b3c3ce1dfc"
+SRC_URI[sha256sum] = "159aa2d5f67998f39b06f28f38d6621389dda099c56f0fde46e9070dabdd5b40"
 
 inherit pypi setuptools3
 
-- 
2.25.1


