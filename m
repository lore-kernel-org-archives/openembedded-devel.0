Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDA9C3F6B0
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 05:48:03 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.1670.1659592072374954993
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 22:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i+lmUW52;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659592070; i=@fujitsu.com;
	bh=V00Nx7hkU8mRMbfoAg1RKsiPLxWXCoaKZy76sBShVKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=i+lmUW52Zu/VpjXCLz45iysk+CcqmFaxa8xEqsa5x5VjZ9VyR2mIt97ts8t0IClni
	 ZYI+ttZZlcHtpmiiXJXaOZwtUwTnWlDzvMwAE29T7mM9olIrTqAUsPCka441dPEe13
	 f3XZc1UCHpXqXOfoEJ2+wsj4DSPecTGM137RuheK4oqViKGYpoyUdMHS6/fAvwJoXR
	 g/2wVApmJnMhpsTjC8cF8rY2wszXlXrVk/E2xy2nudIlG+xzLsUIf0rzlVIEYwaFQP
	 YUW4VwG91v8SwTUlbtHI8gZ/mQ8I6HdXAOQTr4KJWlmRKpHrV66S9JNxMqdWLDTatv
	 +iOwLECBVbWDA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWbc19nW
  Swc0P1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bfyw9MBdd4KubuW83awDiHu4uRi0NI4CGj
  xOLne9kgnMtMEo/2TGCEcE4wSkz+cIW9i5GTg01AXeLxzdeMILaIgL7E0tl7mEFsZgFVie6La
  8BqhAV8JJYdmMIEYrMIqEg8m7oCzOYVcJNoaD4O1ishoCAx5eF7sF5OAXeJvmlzWEBsIaCaI1
  1NjBD1ghInZz5hgZgvIXHwxQtmiF4liRMrPjJB2BUSrw9fgoqrSVw9t4l5AqPgLCTts5C0L2B
  kWsVolVSUmZ5RkpuYmaNraGCga2hoqmuqa2RsrJdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjGKcWsL3cwTu/7qXeIUZKDSUmUtz3qdZIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd6CaKCcYFFqempFWmYOMKZg0hIcPEoivA8igNK8xQWJucWZ6RCpU4yKUuK8kTFACQGQRE
  ZpHlwbLI4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmvQRyGU9mXgnc9FdAi5mAFutwvQB
  ZXJKIkJJqYFoW8dd5oo3bxDUx4SuP+ikXaouyRLiI1/r0KPG4vO15t/ZOzZUWOcHj9veU15x6
  c6f6+NUNU6ZEJ97aPet7ftf2N8bFhwovqnw7c4g/7nlIyNc12klzfthULXkZrDnLlu3H64ldY
  n5y2qdkWxjOxrad/yM0w7Nls/yxE/dSYmw2/FIJ5K82KjF53PXNaO1Juae/VvypOli6X/eo2M
  c15z68/p0+OTWN8UPgnbxv/S/tvc4r89sEy5/fvGJBPfvi1LX19YUGoZZ8gpekG67yu7/UuLx
  f/pvNPtWWb5MWxHx5NuXGiTLRl1onDT9+bP924sesOa+meK9ezHfu8MnJl9OCHVsqdmXoeD9Q
  mx/iPUVBiaU4I9FQi7moOBEAsKGH0V4DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-585.messagelabs.com!1659592069!117188!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18604 invoked from network); 4 Aug 2022 05:47:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 05:47:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 96EDF153
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8AB3975
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:49 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 06:47:47 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyflakes: upgrade 2.4.0 -> 2.5.0
Date: Thu, 4 Aug 2022 13:48:50 +0800
Message-ID: <1659592133-4137-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 05:48:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98126

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
===========
    Drop support for EOL python 2.7 / 3.4 / 3.5
    Ignore __all__ when not directly assigned
    Handle TypeAlias annotations as aliases (PEP 613)
    Assignment expressions (:=) target outer scope in comprehensions
    Add support for new python 3.11 syntax
    Unify output so it is always filename:lineno:col: message
    Properly report SyntaxError from stdin in python < 3.9
    Fix offsets of "SyntaxError"s in pypy

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pyflakes_2.4.0.bb => python3-pyflakes_2.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.4.0.bb => python3-pyflakes_2.5.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.5.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_2.5.0.bb
index 827ff0b292..5c75ea48aa 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "05a85c2872edf37a4ed30b0cce2f6093e1d0581f8c19d7393122da7e25b2b24c"
+SRC_URI[sha256sum] = "491feb020dca48ccc562a8c0cbe8df07ee13078df59813b83959cbdada312ea3"
 
 inherit pypi setuptools3
 
-- 
2.25.1


