Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AD9C54EE9
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 01:25:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.1435.1662686715841644539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 18:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oC4hF+s0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662686713; i=@fujitsu.com;
	bh=VUsyY8nIpMdoZ/xJddTfhYOxNJdwn1ce61ppHoSE1RQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oC4hF+s0qx50SkHceBkoxAK+cL8vCVaAe2aZX5joxmabAmPvwwg5cZy8HVNEX2Xpc
	 glGzZuqW1YeNaaCwuRKlC7qyeN8SDgjHMJBpGVaGWVYot1zQe4HTViKZ6j4yzNXe+Z
	 6uaQTQu80KaOKGUo6Zey01KtnuMPDV8Q7YoRPB/srUmno+Q8UgiXDyVQopwDsJwHj1
	 V8ngFla7JkJh2lC/PxnrS3rltbLIQfh415YNmzYuAlZZK1ItQEvhG3P8/hN/T+F7g0
	 tt0TnP7Zykk6LVmXivrU/+jCieg0VqU+V7onRdEikwh9udSdwkS2QB4c6XT5DjG3nn
	 TwIHfWSq45pJg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORpPtzqlS
  ywfQnAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZx+tYCuZxVazcup2pgXELZxcjF4eQwENG
  iQXfN7JBOFeYJH5tn8vSxcgJ5OxnlHi0gx/EZhPQlXjxYzFYXERAX2Lp7D3MILawgLfEo8kL2
  UFsFgEVibk9x1lBbF4Bd4lT77YzgtgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKEr
  Ony0OUV0g0Tj/EBGGrSVw9t4l5AiPfLCTds5B0L2BkWsVok1SUmZ5RkpuYmaNraGCga2hoCqQ
  NdY0N9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2MQLDL6U4VW4H44F9v/QO
  MUpyMCmJ8j7tl0oW4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7eRJQTrAoNT21Ii0zBxgLMGkJD
  h4lEV7byUBp3uKCxNzizHSI1ClGS46ps//tZ+ZYDiZnfm07wCzEkpeflyolznt2ClCDAEhDRm
  ke3DhYvF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMybD4x+IZ7MvBK4ra+ADmICOmhroDj
  IQSWJCCmpBqapZ7X0q3yyyw5PCXOeUnKl9ZSQNqu+d/um1pX16RckVy3Ll4g8tHPKPgXfJrFA
  b6vet37Mj+8siZz1j3HFinW1tyc2vitdyavu6nTuieryhxtnXs1qXPi99uf1gOBqcf0FP+Nm9
  C9S9V4XviC+mpf5q0NU4XmTGT8WzA6t62OLt6y4uWPncSGJyEn/zG7OmXMv9fIBUw/zD8XlhQ
  cmzg1Y8OlJXZ/s1wk7vmoKejdarDfSVmt9//fnlOQzQgrXxR8qCvxd3rzWruKHs9/2Nan/9Kr
  sj/748OC7ru0Ww+LbR1JUD0hwpXnOt8q3XPpTROJWsKP7neP+TZ+0Xf6LNr04+OzYPJcbJ7I/
  yVtW/nBTYinOSDTUYi4qTgQAwnR7qFIDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1662686712!118285!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6402 invoked from network); 9 Sep 2022 01:25:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Sep 2022 01:25:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B15811AC
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:25:12 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A646A1AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:25:12 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 9 Sep 2022 02:25:11 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sympy: upgrade 1.10.1 -> 1.11.1
Date: Fri, 9 Sep 2022 09:25:03 +0800
Message-ID: <1662686703-2458-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Sep 2022 01:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98726

License-Update: Copyright year updated to 2022.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-sympy_1.10.1.bb => python3-sympy_1.11.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.10.1.bb => python3-sympy_1.11.1.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.10.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.11.1.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-sympy_1.10.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.11.1.bb
index d8ac23dd5e..4e32936384 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.11.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Computer algebra system (CAS) in Python"
 HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=42976c55ba05d15b32a7b4757dee5e64"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9f6c7fdc2d69e31ad7abaea029c8ac16"
 
-SRC_URI[sha256sum] = "5939eeffdf9e152172601463626c022a2c27e75cf6278de8d401d50c9d58787b"
+SRC_URI[sha256sum] = "e32380dce63cb7c0108ed525570092fd45168bdae2faa17e528221ef72e88658"
 
 inherit pypi setuptools3
 
-- 
2.25.1


