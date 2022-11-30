Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410B5C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 04:30:50 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3006.1669782646870807132
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 20:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fABCK0Wm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669782645; i=@fujitsu.com;
	bh=mf88WuUfZq6+RNrxE0p2KpyPfQUznJv57hbRfczMkRg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fABCK0WmfBOO6Mrj3yXe5ZVqTWlq8ZO+WH1vjGJ1X7PnkNseI/C+8LBjOkushkkXa
	 G/egiwSX9/G3c2dCsiF2WvrsStYjKx09RPLx2mkydpM5np5Ru8EnGGPgfCkdOMmmrL
	 uRCVzywkfn43kKR/AXeVaAutCe9k6OLcn0+SsWW7ZdMO40ZGwg4FCPjznBDOBhmab5
	 dmrcsD0EBn+TM69ulM8MoDX1egH67BbAUvXq/rAG9k3jO8vJTgw2X6zx00w67nxJ1j
	 SxkfNzpO47P0X7FJJvG21o3pIWwLiFj4SxDYIoe+BdyP8fXgZ8jkkhLPMencw06rmX
	 46bTeuNPqLORg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWbfkTlu
  ywetzchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aMxZNZCqZyVtxrvMjYwLiLo4uRi0NI4CGj
  RMO5nWwQzhUmiX1z90I5Bxglpv6aw9jFyMnBJqAgsXDrGVYQW0RAX2Lp7D3MILawgK/E/BsdL
  CA2i4CqxPwZ99hBbF4BD4mjFxaA2RJAvVMevmeGiAtKnJz5BKyeWUBC4uCLF0BxDqAaRYnZ0+
  UhyiskZs1qY4Kw1SSuntvEPIGRbxaS7llIuhcwMq1iNCtOLSpLLdK10EsqykzPKMlNzMzRS6z
  STdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAy6lOIU9x2Mx5f90TvEKMnBpCTK
  e/VoW7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV7xG0A5waLU9NSKtMwcYATApCU4eJREeLeCt
  PIWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpw34xZQkQBIUUZpHtwIWDReYpSVEuZlZGBgEO
  IpSC3KzSxBlX/FKM7BqCTMOw3kEp7MvBK4Ta+AjmACOiJSDOyIkkSElFQDU1TXB8kTfQe5frN
  Jp5a8ML5/cnn8+w9vf0ro+/iEZX6+uvfwozl3Pea5vtCpsV6VHL3j3NevtnerpkX2XV5hp3Vr
  UU7h1uVT7F5LXd1jN1vv4aHEq5skZ0x6fuzUovJZds9mHilVP6teuWDio3ca3BNizl9p27Ojh
  Mt4qvCdHNdD+t3bn1ReKw3Y9lWhZG/qtb8d3sHp58PYc3+XnTOcvuassTx7trv17uIbJ82bA5
  pD2qrTnXYGiH7+2frz8vu1H+NvTi9ojTDNktPI+3RRo8csUoHJabMR2+mrWnudXm1Yc63L5IT
  +zbsJbhP3y9g05PH/3W/tfM7w7obct69kt3/oPqp3ZEO/4pOmabNseVcpsRRnJBpqMRcVJwIA
  2cAbX0EDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1669782644!202618!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6232 invoked from network); 30 Nov 2022 04:30:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Nov 2022 04:30:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E94C9155
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:30:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DCF47154
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:30:43 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 30 Nov 2022 04:30:42 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-texttable: upgrade 1.6.4 -> 1.6.7
Date: Wed, 30 Nov 2022 12:30:39 +0800
Message-ID: <1669782639-11935-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99853

Changelog:
Get rid of stub file in wheel package (#84)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-texttable_1.6.4.bb => python3-texttable_1.6.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-texttable_1.6.4.bb => python3-texttable_1.6.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.4.bb b/meta-python/recipes-devtools/python/python3-texttable_1.6.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-texttable_1.6.4.bb
rename to meta-python/recipes-devtools/python/python3-texttable_1.6.7.bb
index 6916a72d3..e8024987c 100644
--- a/meta-python/recipes-devtools/python/python3-texttable_1.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.6.7.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9"
+SRC_URI[sha256sum] = "290348fb67f7746931bcdfd55ac7584ecd4e5b0846ab164333f0794b121760f2"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


