Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D778C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:42:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.1208.1667810554109788488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wjbG6dSF;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810552; i=@fujitsu.com;
	bh=aXohS2RnWJ5q5i/KZeClNCJ5LLIOs7Ge0CJlw4sZcHg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wjbG6dSF16CbOahBVYSin6z/RrO2KtLU6s2/mn3xX8MHh8xQsV5R4NtvHqGX6DpUa
	 Ruwc27FyOH3mM8Ah4EnCfWroq0VGL2DK+yEHX089B6GCU7lcuniKGkeztd7AOqS3Fv
	 b0WzMQfzAZYrVOMWj5AB4+bi38IV6MOaIzAS/gkLlj+nPdxS1OhhPxz5ew37R6waTh
	 YO1Ms99TNKB6q36qxh1E9D7m33NKTJZio70IBpABdZZv9B1y7yLydptCi5CCYkD80t
	 yWhyZSc8i9rAecKZ5CwkUK+VUzYpP1dhMyvV3LiXQ0AUCmJgmMcCBefBD+av0gttwF
	 4wQ4qTQepN7Aw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqPvjSEa
  ywaWFvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aLiXMZCyZyV2zd69XAOJ2ri5GTQ0jgCaPE
  8qWMXYxcQPZ1Jokl7+9DObsZJZb87GAGqWITkJK4cf8/G4gtIqAvsXT2HrA4s4CKxIvfPexdj
  BwcwgJ+EjeOi4OEWYDCXz9MYQGxeQWcJKat/MkEYksIKEhMefgerJVTwFniwdnpLBBHOEk8+r
  WEDaJeUOLkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExa1Yb1Ew1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdI30kooy0zNKchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkpenmp
  JZsYgWGbUqzwfQdj99I/eocYJTmYlER5fy/PSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXtjI
  1BOsCg1PbUiLTMHGEMwaQkOHiURXhNgHAnxFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqc99
  puoCIBkKKM0jy4EbB4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNcaZBVPZl4J3KZXQEc
  wAR1RXZAGckRJIkJKqoFpXUGZ1K5vn+/uWtB84IREl8rX+yJfXzpxTNj16m21+47eHTuUZynd
  Ctf+p5PksUY/uXAFc/mk3+XX19Uu/p3Lp3ejOL+zPs6NtXqSPNeO5Ucd5j1dUHe+/YNrTerLG
  pl+9am+WbLfD2X+3nUxUGW958K1qz2cMxp6vjws/v2xyTb847Yz3DN2Hp3cy8xodmXeOeGfD1
  OvVs56UsySUtQxLzvgovIe/Tze0gnNospd23JetDKsc457y/F27iSDsAtr7df16L9b8LZnT33
  ugdiiRW37guv39yjxfih5fWlarGPy75Oy83ddMjY8ycyxSHyjpe33X2fn1i24198U8qx736qw
  rGatG1vMLQ7vP/q/VYmlOCPRUIu5qDgRAAEW9+RiAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1667810552!296830!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18377 invoked from network); 7 Nov 2022 08:42:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:42:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E9D09100198
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE40D100194
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:42:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-paramiko: upgrade 2.11.0 -> 2.12.0
Date: Mon, 7 Nov 2022 16:41:54 +0800
Message-ID: <1667810514-31107-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810514-31107-1-git-send-email-wangmy@fujitsu.com>
References: <1667810514-31107-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99470

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
[Feature] #2125: (also re: #2054) Add a transport_factory kwarg to
SSHClient.connect for advanced users to gain more control over early
Transport setup and manipulation. Thanks to Noah Pederson for the patch.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_2.11.0.bb => python3-paramiko_2.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.11.0.bb => python3-paramiko_2.12.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.11.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.12.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.12.0.bb
index 5c0cb1e1a..6295c66a2 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "003e6bee7c034c21fbb051bf83dc0a9ee4106204dd3c53054c71452cc4ec3938"
+SRC_URI[sha256sum] = "376885c05c5d6aa6e1f4608aac2a6b5b0548b1add40274477324605903d9cd49"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


