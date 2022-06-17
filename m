Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449CBC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:34:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.25569.1655429640115810885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l+URUEgj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429638; i=@fujitsu.com;
	bh=xaIDfMBW2AMqC7KpHdCo/t5RVlnor2mViBAqxz3PFHQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=l+URUEgjDU/A4UW/ghK5WbtRTgrwu0vgrHjt2mpviYPFv+sVlCJszdPxOe8CVbz6L
	 NBQ6bq4G+wLy6CHRPNYDdw6iHomCuDkpAxVJ5bgFJhBTyFv2CjQEms4XtzI5JzxrAm
	 uYBzWQRZOmQ6rUHWEUFFgzcsJjakw+XNgX+pMFB3CmOBZqMXyNm3xPkNgZaIWHNbR7
	 ss2fdqc2k1wP9wMuNEDEJhBT+R1NlZtTtVHJsnFXC1qfYNIRqgYusLgJnvHLVoOR9h
	 TUQ0C12Q0Q1bUypmlVukyLUWfLtgk1sLo1l3I1WIpTbV3sFLAuC8IOWCvRkfUVKouv
	 tPJusmacKF1Vg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8OxWZf11uo
  kg61zDC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozVOzaxF6zjqNj65y5rA+NV9i5GLg4hgYeM
  EjtbdrF2MXICOWeZJF6+j4OwTzJK3JuXC2KzCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENO
  4gtLOAh8fvuZiCbg4MFKL54BdgYXgF3idtHG8BKJAQUJKY8fM8MEReUODnzCQvEGAmJgy9eME
  PUKEmcWPGRCcKukHh9+BJUXE3i6rlNzBMY+WchaZ+FpH0BI9MqRuukosz0jJLcxMwcXUMDA11
  DQ1NdYwtdI0MjvcQq3US91FLd8tTiEl0gt7xYL7W4WK+4Mjc5J0UvL7VkEyMwJFOK1a7sYNyz
  6qfeIUZJDiYlUV6t46uThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwOlwFygkWpaanVqRl5gDjA
  yYtwcGjJMJrfxkozVtckJhbnJkOkTrFqCglzpt5AyghAJLIKM2Da4PF5CVGWSlhXkYGBgYhno
  LUotzMElT5V4ziHIxKwry9IFN4MvNK4Ka/AlrMBLS4cd8KkMUliQgpqQamvoU/2kpOS17n9t9
  amfyj97ETp2G8X9adWzwqp34Jv2nI7p7le/t5lUHnHE1X9zsCtsU1Ez2dXBYUPJ2wXPWrSMYf
  5pLJP4QEXFb/WLnS9FrroqhL0fFn0riuVB768Tr1SarvvfT+jXYP/67smTjX5p+ZdV3sMtMVT
  qIprm01PaIeHHbvlp3juP3sWcEbBZm/ytEK+bW39N4d+pTfttDC6uDu1BgD4Qcr3Xhdp+i9EP
  lR3KH8c+M7n3uCbz9u+7DU1vTTm4Q3P1bJCqx7wOfkarvAgl2t5vGKg8qH0/98mnDutfjMgKW
  b5jhtEn0h/MbGznLyubv/pI/fF4r/zn+xQUHymFH64auvN8R+letmUGIpzkg01GIuKk4EAHf3
  RyhEAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1655429637!38915!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23170 invoked from network); 17 Jun 2022 01:33:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:33:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6D32D155
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:33:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5DA5C150
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:33:57 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:33:41 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 0.960 -> 0.961
Date: Fri, 17 Jun 2022 09:33:30 +0800
Message-ID: <1655429612-19310-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 01:34:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97530

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-mypy_0.960.bb => python3-mypy_0.961.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.960.bb => python3-mypy_0.961.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.960.bb b/meta-python/recipes-devtools/python/python3-mypy_0.961.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_0.960.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.961.bb
index 5d99b6468..02f7cce4c 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.960.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.961.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d4fccf04c1acf750babd74252e0f2db6bd2ac3aa8fe960797d9f3ef41cf2bfd4"
+SRC_URI[sha256sum] = "f730d56cb924d371c26b8eaddeea3cc07d78ff51c521c6d04899ac6904b75492"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1


