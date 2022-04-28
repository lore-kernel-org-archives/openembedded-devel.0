Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27EAC4332F
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:02:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.6988.1651129351489790138
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pMo7XAO3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651129349; i=@fujitsu.com;
	bh=9mL1znZ2d4WzTSbMTmd7vOq3h2bojuET4+ENbykX1Ww=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pMo7XAO3Ehyhd2n/kEHSvmnaZZnmlTUQmy3xQ4yGNRDZRxYXut5TNJKkzC6CX9lVU
	 MZ6OjNAl29vECbgsncLwx1yakvVEGEPXVcheTIQPEwSQtfFifyLfLmj997c3CzCTBG
	 q9rJ2plxW+gcXHihBwr5xDGMkmXDDIrMMlCl1a1aHWs5N9D+50Sm+RLpy7IRSA+mXk
	 DBZZ0RpoJTMngXOW9md6vNOEYEzV2VMAqtSIp2A9Rn/DfS1fk4uAgHHdHaprIfAHcq
	 +6czxVzIaYm9JA7yTFQZgAwmTEM8HuVmoBM6HJTO2aHzN1iaKiYuX9gGvnKhVQgfty
	 fxdKbrXTkGN2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSZfVJiv
  JYNsybouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPZlDfMBTN4K3qb1jI3MPbzdDFycQgJPGGU
  mDN5OROEc4FJ4urkfnYI5ySjRPOpmaxdjJwcbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cw
  w5iCwuESCxeMosFxGYBit+bPRsszivgJrFq9hywXgkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNUoSJ1Z8ZIKwKyReH74EFVeTuHpuE/MERv5ZSNpnIWlfwMi0itEqqSgzPaMkNzEzR9fQwED
  X0NBUF0iamuglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGZUoxw6wdjLP6
  fuodYpTkYFIS5bUyzUoS4kvKT6nMSCzOiC8qzUktPsQow8GhJMGrYA2UEyxKTU+tSMvMAcYIT
  FqCg0dJhFfGGCjNW1yQmFucmQ6ROsWoKCXO6wrSJwCSyCjNg2uDxeUlRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK8ZiBTeDLzSuCmvwJazAS0eGVRJsjikkSElFQDU9rMEwd3i2ZsOPij5Oo
  TwbLgklVfJJzdzzf8uMZZ3Zs1a2NN7rGD+5V++dZ++Sa43y7gRt88xxChvXtctN7qev0Pb+3a
  KpRxMYv5ccJNiZNz8/bMqp8juX32vFyHg9VecsvXrNRxc999TZtrceHVGyb/JwryJ89lDij5v
  dRIRuPRxSt6tzPYU6zKzaSVf6ienrqgaUFiqson24OHvPsVz3csnSpSlLyEhe9i/O6z94Njwu
  9qv/mzt3opm/SzoDkxjEq314nkvPl+yVfTe95Gz/umm71z2Xeu2yF+8P+tyeHi7VnTFz5xuVF
  7k2nONdZT8j+OpFg0eKxOkf7iKa3LrJq3yunRr1/TcjNZ93da5SuxFGckGmoxFxUnAgB4XvHY
  RgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1651129348!6568!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12813 invoked from network); 28 Apr 2022 07:02:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:02:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B83581000F5
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:02:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AB736100446
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:02:28 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:02:06 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cachecontrol: upgrade 0.12.10 ->
 0.12.11
Date: Thu, 28 Apr 2022 15:02:30 +0800
Message-ID: <1651129350-8376-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:02:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96824

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Updated:
PKG-INFO changes from "SPDX-License-Identifier: Apache-2.0"
to "Classifier: Environment :: Web Environment"

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...achecontrol_0.12.10.bb => python3-cachecontrol_0.12.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.12.10.bb => python3-cachecontrol_0.12.11.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.10.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.11.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.12.10.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.12.11.bb
index 58c157bb3e..fc2b0ae75b 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.10.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.11.bb
@@ -1,13 +1,13 @@
 SUMMARY = "httplib2 caching for requests"
 HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=62d6ee40749ec0b76d8a1200a1562369"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=942a721dac34d073453642ffe5fcf546"
 
 # On PyPi, this is "CacheControl", rather than "cachecontrol", so we need to
 # override PYPI_PACKAGE so fetch succeeds.
 PYPI_PACKAGE = "CacheControl"
 
-SRC_URI[sha256sum] = "d8aca75b82eec92d84b5d6eb8c8f66ea16f09d2adb09dbca27fe2d5fc8d3732d"
+SRC_URI[sha256sum] = "a5b9fcc986b184db101aa280b42ecdcdfc524892596f606858e0b7a8b4d9e144"
 
 inherit pypi setuptools3
 
-- 
2.25.1


