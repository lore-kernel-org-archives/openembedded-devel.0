Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AB8C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 13:14:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.10757.1648473290019320902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 06:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sKMob+lQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648473288; i=@fujitsu.com;
	bh=K5BttZE1rmsIp1TFCKpakWdTnU6C9YmvT3BHd0H+liQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sKMob+lQOXx7scf+dceLnkxKS0TTZHDzvbG62+gJ/eA7JYJ+WNmLppXs/mDS5dH9j
	 WnnpOHb8kNCDfp0PWHXUgj/jnKUX+yGPChlv2x0rS+KBmvbFAbYbaeaLTkxTML2c+C
	 EyAsW93GrpMhJTgV6Vl3fX941pVVPOvsEJoInh+iRsMtgbq9q+X1ZIC9INoo9gEE7I
	 bdXLLH0VhgE/U+sH5jD2t1oxFLFP985p/KOhDAxM1NU2RLkl8Xt+MyVEt659RwHEpE
	 JTm21VAthyH/xbckIDDZfPpLBfpmsmY+o8QbHKduJ7qx6n9ZovNIt18lnE/df3wW+t
	 q1pUFrYmDkXug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8ORqHt8i2O
  SwdXLuhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b75Ra2glscFS1bLrA0MLZwdDFycQgJPGGU
  aN//hRXCucAksfb4Q3YIZw+jxKWjL5i7GDk52ATUJKbfusEKYosI6Essnb0HLM4soCLx4ncPO
  4gtLOAl8ebnHbAaFgFVif7Pu1hAbF4BJ4m5q1qZQGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgC4
  hdEgKKErMvN7NA2BUSs2a1QfWqSVw9t4l5AiP/LCTts5C0L2BkWsVonVSUmZ5RkpuYmaNraGC
  ga2hoqmtsAaQM9RKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAgMzpVgtfwfj
  35U/9Q4xSnIwKYnyXpzrmCTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdlI1BOsCg1PbUiLTMHG
  CUwaQkOHiUR3oDZQGne4oLE3OLMdIjUKUZFKXHe4s1ACQGQREZpHlwbLDIvMcpKCfMyMjAwCP
  EUpBblZpagyr9iFOdgVBLmbdwENIUnM68EbvoroMVMQIvXvrMFWVySiJCSamCaf/T3ZKF030Y
  W4zdKvBpWGc1OeYJpNd1P9qTJ1m198eX5zyds4ZIvDy9IvzGh6BdDSQlT5eyLTZ+Enqy7vuLP
  Fqd7Z12/S96QFU7fJiFdFxj7Sy/33aSYlwXJ0/OzpY+z+ohueuiletoveMeeNum1sdkPbV9Lb
  vRd8dnoU9WStZxraxamVyfIZqdlPU8vsLo762NzaUPxJlUrv1/WH56unVF/QiRs1t0lWVKS/k
  3HWMTUbpz8+0KvhEvjeXrgzOZtfiuXurKVLXlzTyzr1vSGz1dNeZsuFL99nH4z4ZhdeOydJIW
  gT3ukdl54x3eyMPVO9n92be55jIWBgU3HfiRaMgS+2ROzXu9948IHrbeVWIozEg21mIuKEwFF
  DWNsRwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1648473287!204612!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3047 invoked from network); 28 Mar 2022 13:14:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 13:14:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 42E82100186
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:14:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 249D3100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:14:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 14:14:34 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.63.0 -> 4.63.1
Date: Mon, 28 Mar 2022 21:14:23 +0800
Message-ID: <1648473263-17082-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 13:14:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96243

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.63.0.bb => python3-tqdm_4.63.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.63.0.bb => python3-tqdm_4.63.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.63.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.63.1.bb
index 3810b10fbf..0fcd4d4575 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.63.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=1672e2674934fd93a31c09cf17f34100"
 
-SRC_URI[sha256sum] = "1d9835ede8e394bb8c9dcbffbca02d717217113adc679236873eeaac5bc0b3cd"
+SRC_URI[sha256sum] = "4230a49119a416c88cc47d0d2d32d5d90f1a282d5e497d49801950704e49863d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


