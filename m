Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD4FC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:14:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.19917.1656555261266774077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aFmnYlcz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555266; i=@fujitsu.com;
	bh=zRTdH60HRgrRPg7yo9IoXjWki70g34+LfhaxpNWdVhk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aFmnYlczRsBdW/VwKx6Sb7ysBoleBHiaK2z4OE4PTLsyRQ46C28d01oXYG+lJGX+Q
	 uEK3hxNa6qas29VL/xsYYIs+yg7ER2rPGrgu8avXjJ6KGGOrDFWqcihMoDbgq0CLYw
	 BjHGFcJ4ThTJVsz33w5oftc3sXR4fjvf6wFZol2VSXQVdiUV7urswNB+aUFVdx9QBW
	 cTkjacvpgIBFlyBFks4o5R3K7nxK/Z9/PNq9OsJKMUanZWhlSUseOs/GhunrUUh3Nv
	 52RdV8xj8emeMrzmwtuy1A7M8IwGd6arR8/wrp1cxHa3JNleBp3G0pQ3DzM8da4LoB
	 sDmStHjEXZx6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqMvIvjf
  JYN1/ZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePdsq3sBb2cFRvn32dsYNzB0cXIxSEk8IRR
  Ysf9M2wQznUmiWWfLzBDOCcZJXZNXMvaxcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  ewgtrCAn8Suj+/B6lmA4r+Pzwer4RVwl2h7N4kJxJYQUJCY8vA9UJyDg1PAQ+LNMRWQsBBQya
  zfl1kgygUlTs58wgIxXkLi4IsXzBCtShInVnyEGlMh8frwJai4msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprpA0shYL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIhTihmqdzD+7/2pd4hRkoNJSZT36bQ9SUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeNcz7E0SEixKTU+tSMvMAUYUTFqCg0dJhPfGd6BW3uKCxNzizHSI1ClGXY6ZX9sOMAux5O
  XnpUqJ865kAZohAFKUUZoHNwIW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMysAFN4cn
  MK4Hb9AroCCagI3ZOAzuiJBEhJdXAZOpyb5rl3VeevctcZeQuR1Xvv1OnO3FH7A3pMtP3S47b
  1St9tJb6oxrR9N7Z8lX8yn0Zju9usqy7cnjlldsMlcK5j1J/5t7gt2Pjj+1I2PnD67Hu2s/TZ
  ioJG0ztVNkhwvi8+OjEm++SyowXsn7niOKX9bthMzO859bMxnkPJlUz8H/dOT1ksqj8O/XF8c
  Wt+kZ3vpq7zfTaetxN6OTvHdq5m6vfbQ/sCfW5JDxrxvMlaS+v/WYzfSXy9kH5hYIJYZLxD9J
  bjgQ9vxj18NwEZZ8z+Y0XGSVldLSZWdKfi0cL7go+s1za4VnVxMm/Pjse2ntHu3OB0LUytun7
  5auzFY+49jqK/KpoV9m1cO72FUosxRmJhlrMRcWJAIZId2ppAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1656555265!486204!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2023 invoked from network); 30 Jun 2022 02:14:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:14:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 29F9510018D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1DE7C100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:25 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:14:23 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.0.0 -> 3.1.0
Date: Thu, 30 Jun 2022 10:14:04 +0800
Message-ID: <1656555244-20637-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97627

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-eth-typing_3.0.0.bb => python3-eth-typing_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.0.0.bb => python3-eth-typing_3.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_3.1.0.bb
index a500d5b52..0e274c25d 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.1.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
 
-SRC_URI[sha256sum] = "079e4c41e98cf2635d3830a99f3cbd7b1d73d2368464d4493c002bece545184a"
+SRC_URI[sha256sum] = "92698268be83c75f65a028d47421f7c0aed459be76dd7ce916af166dca8bc53e"
 
 inherit pypi setuptools3
-- 
2.25.1


