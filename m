Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFF7C48BD2
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2765.1649136985689992541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rM9/miMg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649136983; i=@fujitsu.com;
	bh=xacUuJ3KlvKaPYU4m10Y0c7X2De1Q0AGYuSbp9XZxx0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rM9/miMgUb+72sOX4LkHpIbd+N7ArrYuRj/D7EUaqhtnITHm5MqQJ0+OkVN/sD+n8
	 34rNkD/fFd7yeOu7KBX138pmIyf1tfgF8hexXxw5gouJ14qF3Kw8YpZA7WlPJrz1EM
	 Kh02xpcF18UWH9pVzUrxE/N8iuAIj7beATowKl83G2bsLTrCeNMAxifYKdb94AlYqK
	 aDuTkB7l41rDncppuhwYxPMwLHIAf5mEA4u9VA/DhVbUq+zZ3HB0ZYJXANENbn3OIA
	 l21J1Wxiz9hJA9DpRkbIq3PntFQrK46fnM9CYs2NXeN2Hw7SI83dE+vzifCOR5aLMq
	 XtoWxtRt1P31Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxRTf8qne
  SwZEX/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aLU6/ZCw5xVHyevIm1gfEOexcjF4eQwCwm
  iZNPLrBBOLsZJS6c6QXKcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPWI2wgJ1E76MtT
  CA2C1D814VpQDUcHLwCThIPlnmBhCUEFCSmPHwPFuYUcJY4vawOJCwEVPH061RGEJtXQFDi5M
  wnLBDTJSQOvnjBDNGqKDH7cjMLhF0hMWtWG9MERv5ZSFpmIWlZwMi0itE6qSgzPaMkNzEzR9f
  QwEDX0NBU19hU19DEUi+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAkU4qV
  p+5gPL3qp94hRkkOJiVR3jOu3klCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhPngXKCRalpqdWp
  GXmAOMDJi3BwaMkwnvkIlCat7ggMbc4Mx0idYrRmOPqlSt7mTlugEghlrz8vFQpcd6bV4BKBU
  BKM0rz4AbB4vYSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeHpApPJl5JXD7XgGdwgR0yrs
  zniCnlCQipKQamN4abuPmPb7d0HuB+ObXC0JPBgVM8fpXenxD3j19iYsGx/Yq3/tvLPeYVexg
  xI0UP+8gllXLM+7M/HrlzPRf+WluTiKJ12e7e83kdPjKcNSZ++LiV/O1ojZ2CBdblMZc9dOcd
  Dcq++EOvn1FVm0LnqULrTq/PHCOntruTH25p8JrI07tvXVBZdWdXZU66alSqvddFW6f1FhpuN
  m+J+pm6u7SvaeOM2n8UpETuLW6TNFmne6+7PzurT0hjp/bg5adLWxX/G/klZtaxfi76vw0l45
  IX4ljD86Em/bd0k+VKnuVb7Et8pnK/X/2L8w7ubLi6xlmuLTHP88pf/Fp7aRl0fk2vQo32aLZ
  JsyINuqaocRSnJFoqMVcVJwIAKmwO/JWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1649136983!368072!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5229 invoked from network); 5 Apr 2022 05:36:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:36:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2355aChE011600
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Apr 2022 06:36:23 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:36:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] grpc: upgrade 1.45.0 -> 1.45.1
Date: Sat, 2 Apr 2022 20:32:45 +0800
Message-ID: <1648902767-19756-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
References: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96400

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.45.0.bb => grpc_1.45.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.45.0.bb => grpc_1.45.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
index d25a01cf34..872bc6afcb 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "494b08ada4009ead0d0b70e44d354be72f9c283a"
+SRCREV_grpc = "1c159689ceda2c408f7f9d97d96a264c9521b806"
 BRANCH = "v1.45.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
-- 
2.25.1


