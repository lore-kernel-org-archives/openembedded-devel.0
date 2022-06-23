Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBD7C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:09:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.4536.1655968192051149531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=poYf//8p;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968190; i=@fujitsu.com;
	bh=2UgMAanVRGoXecvLANoDOKKQGBXUPSjoP6tAqpQkC54=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=poYf//8pO3yf0Sqy+bvwdwUDYuxmYWsr2WiAzUItXb/BF0x7jGjNAN4jDkWNIt2gi
	 l7ngDhONivOv6tqdUHJ+lNdUS8lpRuAIhqaj3kyZNqm5LlLB2yYlZaytw2ZLuRCha2
	 gw3WB29/4nHKW2Y/M4XQjscPylvwgh+gCoKJQ6uM0cOMY8jRkuLGBRPmFzcKItWjNQ
	 3i5/OA8jkJpLzEy9fVEQi8qRlhCN52Bp7TwzBRXpXWJPjPRSrRhOAKlsDEJLyXRp/N
	 wpkM2uKyhxI1257agFYL55KeTVImHmPF7O1ZYUF8gQ01Dxx8Tch/BZQtiCjqyp43jd
	 XJKxnNQu9oPHA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWXev4JY
  kgwvrbCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyG/zcYCz5yV2xaO4+tgfEaVxcjF4eQwENG
  iU0rfjFBODeZJOa/3wXlnGSUeDhjAlsXIycHm4C6xOObrxlBbBEBfYmls/cwg9jMAqoS3RfXs
  IPYwgJeEqvbu1hBbBag+NP/28BqeAXcJWav72cBsSUEFCSmPHwPFReUODnzCQvEHAmJgy9eME
  PUKEmcWPGRCcKukHh9+BJUXE3i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUMDA11
  DQ1NdA10jQ1O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAsEwpZri+g3Fi
  30+9Q4ySHExKorzPeLckCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgvcQPlBMsSk1PrUjLzAHGC
  ExagoNHSYR3Dkiat7ggMbc4Mx0idYpRUUqct4ENKCEAksgozYNrg8XlJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvL4g43ky80rgpr8CWswEtPjJ8g0gi0sSEVJSDUzy6mcO/1q6XD2V/9v
  D5yIJxZuvc8xSc82S4rPts1W9mphY98TQKi52qcnucP0bJ59/KVvQe2jrJCePiyfjbMQnik4U
  8Gp8dfPA+Xt+rjNPRb+bOEFuf3Bjz8+6d0oatvkZv/rtnTbcLkqetEUrda1ch/C9VpeFq22eT
  p059xJ/8H0RoR1Zx1mC2X7PPXv0+LuXVr81ctbO56tn6tjgpZ/EkyIoXHcwb67nhT8stb/PHR
  XacV8sNtpt0XOHpYbKXds1bs7NvGvgfuE8m3vBgbj6rHvHH6Z/FBefc8DgYCi7DiOL25xYw48
  Ljpm/8vytx+rY/edjgNBVyb9X7nyq9Od8ZLvi5KfGCruvxSVpbhVKLMUZiYZazEXFiQA4R5tw
  RgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1655968189!41038!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17469 invoked from network); 23 Jun 2022 07:09:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:09:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 87F00153
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7B39B73
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:49 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:09:47 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.0.1 -> 9.1.1
Date: Thu, 23 Jun 2022 15:09:33 +0800
Message-ID: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97579

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pillow_9.0.1.bb => python3-pillow_9.1.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.0.1.bb => python3-pillow_9.1.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb b/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
index fb86322f7..00df22a3d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.0.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.1.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
-"
+           "
 SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
 inherit setuptools3
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "6deac9e3a23caffbfdd75c00d3f0a1cd36cdbd5d"
+SRCREV = "0f44136e720cd3b2db72bdf29614897b7aa3e868"
-- 
2.25.1


