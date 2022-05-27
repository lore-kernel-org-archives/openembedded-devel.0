Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EBAC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:39:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.2722.1653615537702088786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Unul90FB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615536; i=@fujitsu.com;
	bh=shsvJg59sK+MdLMB82+ajrYIVi/OddBxOYEFBsAtwWE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Unul90FBIh0J57X48qVr5qJNHxygGfjp8phd6jlbZnBmreFR9VS3h3DWhgtitGO2l
	 U1L5RE/ZB47T5v/t86xHqxhxNWVOyVQXs23N11XlNEAn3E9UjR/O0a3AqauI6x+TAV
	 XKdR5HBKfvxqsTEEhbxla7efCcB7QT6B46GLZJsAm/+Lpdwf4ZExgqLwHpLmDdPjen
	 JyDLoeV3giVSWC8kqrwWoWi8upCGHJEdLFgXjUPQ7rKKP98Nl/4PgLoXEi7wVgelMT
	 0fqFH60ysak5M3btNGDLDFkf7VVkXCnVepjL0GH0KCH9Vc2lJFJjSRo4M/6pWJc3ho
	 oECjvWPqD5seg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORpLtee0K
  SwYtJIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a/xd/YCzo5Ky7c+s3UwLiNo4uRi0NI4CGj
  xL+Z05ghnLNMEhu+zGaFcA4wSvz/vom9i5GTg01AV+LFj8UsILaIgL7E0tl7mEFsYQE/iV2P9
  jGC2CwCqhIf3y0Dq+cVcJe4duQRK4gtIaAgMeXhe2aIuKDEyZlPwOYwC0hIHHzxAijOAVSjKD
  F7ujxEeYXE68OXmCFsNYmr5zYxT2Dkm4WkexaS7gWMTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXW
  NLXWNDI31Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECwy+lWP3qDsbNq37q
  HWKU5GBSEuXNvNefJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd4vWhCQhwaLU9NSKtMwcYCzAp
  CU4eJREeJVkgNK8xQWJucWZ6RCpU4yKUuK8PiB9AiCJjNI8uDZY/F1ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMz7VBNoCk9mXgnc9FdAi5mAFufz9oIsLklESEk1MDWk9hmsUDI4XuMY3ib
  66M8/Wb3TWbeCDX/LZFt/TQq/cICjVk2mbM7qjA9C9ZubvVSms30P+Ktl63BvSYtfVuAc/mdB
  /9d9WLUzcF9XxP6O5wyz9V9uXvUmzX/e+e884brSRZO1Bas3Hq1blfGZY/nza3suHxRty+tye
  nJOInHFdK8NBoIGTUp1n/x/5wuvnsXS+G+3X1KETMapr8ErLS+9XcU23a+p1+KXQsrdfbc55x
  q90P4UqTpxhY+is+v21XdD1fmumf5c0/hu03c+/gh32T3X7gutqI2Ynnh50ZICUVFd1h9+C9x
  6Nk+/Yn7rfIqZa4TFpIlMB5pe3+BKWnr5SurWf5ur1q9b1XtK8KASS3FGoqEWc1FxIgAK7EGz
  OgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1653615535!163900!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24872 invoked from network); 27 May 2022 01:38:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:38:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F3967B43
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:38:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D8BBFB4D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:38:54 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:38:27 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-paramiko: upgrade 2.10.4 -> 2.11.0
Date: Fri, 27 May 2022 09:38:00 +0800
Message-ID: <1653615480-2485-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97299

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-paramiko_2.10.4.bb => python3-paramiko_2.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.10.4.bb => python3-paramiko_2.11.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.10.4.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.11.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.10.4.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.11.0.bb
index 317368772..5c0cb1e1a 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "3d2e650b6812ce6d160abff701d6ef4434ec97934b13e95cf1ad3da70ffb5c58"
+SRC_URI[sha256sum] = "003e6bee7c034c21fbb051bf83dc0a9ee4106204dd3c53054c71452cc4ec3938"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


