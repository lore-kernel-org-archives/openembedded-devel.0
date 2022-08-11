Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A2CC25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:31:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.24176.1660703482325438013
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qv1+0v1T;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703480; i=@fujitsu.com;
	bh=EEMIH2j8Qb5lRB/hRUIBaDP2hP4id87H1RFJ8Ci6vr8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qv1+0v1TYpzI6ETqhIP5Z+cnAVXBHD7SYTSI2QCieX6K9dKmqcBu+qh511gOHQlZi
	 /m37vx4YiukTu6xlFPwv1rC/ghZTUwc7OZJJVRNG50VA3BajnClJccnsu0azpFThMv
	 08Djvyl9yPRvNy7eo9vyQj88rNMspCdvi8R9lnm6946U7TuVJ7QvJwEcvAc4wxcKNJ
	 W4WTR+iH6oPv3qJaREk9DKFwi+EIvHxbfaV5FXfrRH5yUoFVFV4TL/G1Ufm8W8ph6V
	 kFWEz8/2dHrUyobRSNGwNFHMBwLBG0W5P+wImSgFIsJ3EQEf5oz2VE6jM4Jx3XGQqg
	 EILlk3TPUNvJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8OxWfdH0J8
  kg4uxFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxpMLExkLZnBV3H55nK2B8RhnFyMXh5DAA0aJ
  C//XMEE4l5kk3q3oYOxi5ARyDjBK7HnrA2KzCehKvPixmAXEFhHQl1g6ew8ziC0sECfxe+kBM
  JtFQFXizbmlYDavgIfEzU8P2UBsCQEFiSkP30PFBSVOznwCNodZQELi4IsXQHEOoBpFidnT5S
  HKKyReH77EDGGrSVw9t4l5AiPfLCTds5B0L2BkWsVonVSUmZ5RkpuYmaNraGCga2hoqmtspGt
  oYamXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYeinFCnt3MF5e+VPvEKMk
  B5OSKG8/058kIb6k/JTKjMTijPii0pzU4kOMMhwcShK89/yBcoJFqempFWmZOcA4gElLcPAoi
  fDKBgCleYsLEnOLM9MhUqcYjTnuLty7l5lj5te2A8xCLHn5ealS4rxvfYBKBUBKM0rz4AbB4v
  MSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHefd5AU3gy80rg9r0COoUJ6JRjF3+DnFKSiJC
  SamCadqg1cvUui2Of8vIazTqCtrN4WWVZPFrbfVKqJDJse7zDy4BdVh+mZagamc6pZb6002dC
  SPcO74kfli3MbbJVtw282Z24Ky3zymP+xtt3r287qzOXZa5vLPM0p+VyFc5v0xOj8pqDqvRCE
  7XuLdszOUP5+6G6hLtKAcVNmrqW39K5bjX76W/c/NZa7bFKUSE7a1/o0ivbHESv7ZM6WVNldC
  HEI/ffzb+/f89mNbZNZFk2W2NNuennwoluXD8cjGzKnywVEtjhr6HfI+YWcbOa61xDU5PjRol
  bKeknNLk2XJ4ivf597rfX4R90etfX5PDYfjOJ47X0+7UoTWe7WvOr1s4VakIsijpLGiSqlFiK
  MxINtZiLihMBHOnWhkoDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1660703479!201748!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2834 invoked from network); 17 Aug 2022 02:31:20 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:31:20 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B48067B
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A755A73
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:19 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:31:18 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.55.0 -> 2.56.0
Date: Fri, 12 Aug 2022 04:17:48 +0800
Message-ID: <1660249068-20295-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:31:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98275

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.55.0.bb => python3-google-api-python-client_2.56.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.55.0.bb => python3-google-api-python-client_2.56.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.55.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.56.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.55.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.56.0.bb
index e32bebe172..b8f7ff97b2 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.55.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.56.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "1766c700eee14809ca1f7f52868c937755153289ea77ecdfd73dea6910e9a34d"
+SRC_URI[sha256sum] = "70d33203a4752bf4144b33fc689e997a2b5ed42c696d57149e4b3f5082682436"
 
 inherit pypi setuptools3
 
-- 
2.25.1


