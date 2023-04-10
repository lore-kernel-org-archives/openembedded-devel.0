Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E5EC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:26:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.39417.1681115180416903435
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iqEEuCUt;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115178; i=@fujitsu.com;
	bh=3GwPWLgCruCFUQe1NaRCVHib0l1rdZ3aKA6ZBXnMpxI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iqEEuCUtCjexf6d8BbNKaOi6esi19CTcCyUaG3901MEdeoI2uxeFdc+zil8m1vK3r
	 OCQDjBHPFQZO2qKhzagziCXQDERw2ruZCXb6Oyrd4+21dvC9DJIUNYk7xKtTcQz8lP
	 J1jfpLrj+Wx6COgjVQqGNJc2L1u5V7JJtdHs3F2VqjQgjR15lAbEc/D9UCOvedaA2J
	 uiPb9vz8ND1CyywfmBuPsK+Frj0KMz4HUiw83SLv2lRP2I7u3T1pTe547T2DG95LMz
	 zpB8kdUK21UV1EaKfL8LgQ7SbQuJLmA52ut2NnHzwlhXyChu4KC0kfZXDQMKdcRsQ5
	 BQJU2w3EN7hnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqKt1wjj
  F4PwZDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePdJ8mCTs6KT53drA2Mczm6GLk4hASeMEpc
  bl7MBOFcZ5K4MHslI4Szh1Hi6Ol2li5GTg42ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBZwlGj9A1LAIqEo8etLNCGLzCjhJnLm/CWyOhICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaRYnZl5uh6iskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1iNC1OLSpLLdI11UsqykzPKMl
  NzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMWUYrVdOxgn9P3VO8Qo
  ycGkJMrbxWWcIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd+EBoJxgUWp6akVaZg4wLmDSEhw8S
  iK8FceA0rzFBYm5xZnpEKlTjIpS4ry9IAkBkERGaR5cGywWLzHKSgnzMjIwMAjxFKQW5WaWoM
  q/YhTnYFQS5t12GGgKT2ZeCdz0V0CLmYAWc7kYgCwuSURISTUwRVxZ+H5VsuhPcf/O9CzO8Jc
  XJ79+wX0077z/35hCEZG7lTeSPfbVnHsvmuJwrbrqUVNs9qVLzkLHYpkuRTGci+euEr05k7vt
  7Zf2+6t1b+yR83HzLG5nbf0je8X5p6Uao+6hv32VjDvnzL+3s+t+1spfpw6k5Oj90pSQv7aLU
  +Gcne71m7+tDY7EJ7BdrExa6vmDwWLFhHyF38Jr/b+47Pt3Ydq9qKzdh8S4r2t7r7R+a/9oe9
  YSy57omxVvln2+9Nh0rtT30D9btLKf+S894hoZ9X5FT0tnfcC5CxdvB7CvMf1fV9308nTQ0Vb
  ZKy7Fc7cm/dvaNs856JXk6pOfp8YY3restdOYOvWZk5jTOyWW4oxEQy3mouJEADPUT1tAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1681115178!348739!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8180 invoked from network); 10 Apr 2023 08:26:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:26:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D4C561001B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:17 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C83661001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:26:16 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-periphery: upgrade 2.3.1 -> 2.4.0
Date: Mon, 10 Apr 2023 16:26:01 +0800
Message-ID: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102005

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* GPIO
        * Add support for gpio-cdev v2 ABI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-periphery/{c-periphery_2.3.1.bb => c-periphery_2.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.3.1.bb => c-periphery_2.4.0.bb} (91%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.3.1.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.0.bb
similarity index 91%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.3.1.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.4.0.bb
index b5bdcd5b1..be8d18765 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.3.1.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master"
-SRCREV = "23bfa4ab481edbad82a69ee385fc58ce03b63084"
+SRCREV = "e9799b893ec77f97045544279f0cabd28323b0a3"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


