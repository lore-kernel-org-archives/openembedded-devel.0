Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD760C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 13:05:44 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.10640.1648472742937935586
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 06:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DQqCVRyh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648472741; i=@fujitsu.com;
	bh=Toi9xw2p+4YaxnrARf9rSZ75Jzs2lmjH2KkwZoAvX7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DQqCVRyh+ac6mL7eB8N8ZjWvsECI1LZPwfapoNsjIMrbxDpukdHdhSlpoQlAxm/PG
	 QorgD5fhEmNdzrMIlg4z8A5ta+wcg2kLusBCw0OAE7uxckMVh0k6o5LwkyCZnZFXhS
	 nJ8sP9Qv+r1LtLFPwWUOrWvMsFPbtS6rXwrE2N5VgLgtVX10iwsroZEmjdgueOcuoa
	 traCxvQkPSAcE2/i58lrg37k2Y4uwrmODPFP6lrDZwLYwDxUNHm5nsvgxg5glaTP0e
	 INDaxtUjNRvNYjHKLEIq7scKybfYHUiVT02XJIgUO00CGljKYYioU9aXah63WmZdOx
	 S2ZJ0u410uuTQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqLtkk2O
  SwYwtuhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aE+V8YC25xVPw+voGxgbGNo4uRi0NI4Amj
  xKu7V1ggnAtMEk9/zWOHcPYwSkzfswHI4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAU+J+dtfM4LYLAKqEhdbV7B1MXJw8Ao4SbT8yAIJSwgoSEx5+B6slVdAUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjZVJRZnpGSW5iZo6
  uoYGBrqGhqa6JrqWxXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYEimFLPE
  7mDc2vdT7xCjJAeTkijvxbmOSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeF02AuUEi1LTUyvSM
  nOA8QGTluDgURLhDZgNlOYtLkjMLc5Mh0idYlSUEufVBekTAElklObBtcFi8hKjrJQwLyMDA4
  MQT0FqUW5mCar8K0ZxDkYlYd4QkCk8mXklcNNfAS1mAlq89p0tyOKSRISUVAOTwKJs5jPNf5T
  zEuOUmW2f3nWfNV/J7dvmFIGjeu8uP1eSPWakN33Xj4IiZvMEL4llUt1fkr4wbd3Z1vQz4Eb1
  RovLkl5B6lldkgXx005G/NIuTSrdU/tKQmxun2FQ23Tpd3NeWeydt84icuuskGXvfv1SXqddJ
  8Y2VTx52/m9QXXxB541KHXtepf5xMRd4yxL7H2RyRJcq28e++c0rylvI/d6nZWLFsSYqIoI2E
  97erONa93nurgvOQZfb9s0GXJrm7zi7F7HNtNpWdb+bQ8TRBV09rB9uDi/dNtLo1ZbzZY3v3q
  DDhfdC+a875nbYeTiclXi28ZIww+P5mZzP5u9RUth56TaN6HnTecEey1UYinOSDTUYi4qTgQA
  d0mkkkQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1648472740!152473!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17997 invoked from network); 28 Mar 2022 13:05:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 13:05:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 27244100197
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:05:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EE605100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:05:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 14:05:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.1.4 -> 4.2.0
Date: Mon, 28 Mar 2022 21:05:10 +0800
Message-ID: <1648472710-16968-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 13:05:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96241

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.1.4.bb => python3-redis_4.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.1.4.bb => python3-redis_4.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.1.4.bb b/meta-python/recipes-devtools/python/python3-redis_4.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-redis_4.1.4.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.2.0.bb
index 5b5e144a9c..d4fc98817d 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "1d9a0cdf89fdd93f84261733e24f55a7bbd413a9b219fdaf56e3e728ca9a2306"
+SRC_URI[sha256sum] = "6758d01dec81af191b98a35cce3402675d115456584c39b500ab485a5e386bbb"
 
 inherit pypi setuptools3
 
-- 
2.25.1


