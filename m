Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59343CCA47A
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:34:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.25467.1655429640278794984
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gbujQ42c;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429638; i=@fujitsu.com;
	bh=jDBCOHKlZrK4yx7qsBA4HumeStzEHeoFFCR/fPywMW4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gbujQ42cYOq8fANCszUr+INJ/w1cXWZKtojQyJfe+Xze4DYj0CzJHkXgMM/3LZiDO
	 sPnxC1kCxSrMjKL1wFcJYO4UAsUusrUqngSZHv9raAcqRxCHMkg0h+iK88nXXtQWNP
	 JzeeQx82o01g4bR3g+9CCyGqsKYWhzfSYEHO8vslx45Ag+Ucg+o/DhO6qY7O9y9Z2S
	 AbDJ2nh0GZTDESW2rAK4+JrxkIwMyzSyG1LZUVX4PnEPEnqnUF2D5iho73ZAennKQT
	 0LD+T5SWJTF+bSC0+tgsS2ZZ0xcDs0UG9XeQJmaAxodazQhrF6BoO5sygHjtLfLrIc
	 K+mWbr9cdwZjA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWZf11uo
  kg6czTC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyeU8UFjVwVr459Ym5g7OHsYuTkEBJ4wCjR
  +Cesi5ELyD7LJHH1cicbhHOSUeLGhecsIFVsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDD
  mILC3hJ3Oo9ARZnAYo3HmkEi/MKuEs0XrwEZksIKEhMefgerIZTwENi17yz7BBXuEu8/LCQBa
  JeUOLkzCcsEPMlJA6+eMEM0askcWLFRyYIu0Li9eFLUHE1iavnNjFPYBSchaR9FpL2BYxMqxi
  tk4oy0zNKchMzc3QNDQx0DQ1NdY2NdA0tLPUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDOKVYYe8Oxssrf+odYpTkYFIS5dU6vjpJiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSvw1WgnGBRanpqRVpmDjCiYNISHDxKIrz2l4HSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5
  US5828AVQkAFKUUZoHNwIW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfP2gkzhycwrgdv
  0CugIJqAjGvetADmiJBEhJdXA5L/Y9C2n99JLsXmMj52qp3cXii3teFHiETNB0M75zsWz1bO2
  hWtYcp68IXTmypUJS98b/r33OMQsVVZC6u+BbbcFmpuMEk7v1hVWWxm+65vnsjqufU5r/F/pe
  i+baKP5wYVNpUjiQpGWj4aY2wLPKxd99885lPWsYs6ON3tzBOrE50iKfLL7p/NO18bKL/u2R2
  pUSYtjQfoeJVnraMv4OZFeFquEyq5s+X6Gm32P2vQn7ZJy/z3Dr3z0Z0gyW53mXnvAuKo4X+j
  KhCmWxXt8pl3OYW3J3vLQJ0zqzf8m3oyHKfNePTiVdUzKXuiMwxmdL4fOf3gkX8Q7/cD8s0HH
  WQMutO4L++F8b9YaT+ZdSizFGYmGWsxFxYkAhndB3mkDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1655429637!304902!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 316 invoked from network); 17 Jun 2022 01:33:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:33:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 84CFF75
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:33:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 62107152
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:33:57 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:33:45 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-smbus2: upgrade 0.4.1 -> 0.4.2
Date: Fri, 17 Jun 2022 09:33:32 +0800
Message-ID: <1655429612-19310-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655429612-19310-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1655429612-19310-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 01:34:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97531

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
*  Explicitly export from top level of package #69.
*  Transitioned pipelines from Travis-CI to GitHub Actions.
      Python 3.10 added.


Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-smbus2_0.4.1.bb => python3-smbus2_0.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.4.1.bb => python3-smbus2_0.4.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.2.bb
index a27793012..f22a402df 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6276eb599b76c4e74372f2582d2282f03b4398f0da16bc996608e4f21557ca9b"
+SRC_URI[sha256sum] = "634541ed794068a822fe7499f1577468b9d4641b68dd9bfb6d0eb7270f4d2a32"
 
 CLEANBROKEN = "1"
 
-- 
2.25.1


