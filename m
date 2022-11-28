Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45864C4167D
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:21:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.111506.1669616473600327004
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NF6TMuKt;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616472; i=@fujitsu.com;
	bh=DE3c2afTSSg/OhCaKySRQneDJXrLRuWHaxBH13NXEj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NF6TMuKtDhDYtbpQ/wyaAk7QSNO8JRfzwiLCinEYXhyTPWYz3rrFiXRPVfmt6q6SU
	 U+JTBQVo1+Zs1ILpmWQeTuHebXM0XTocQPMPI1vS2PY4LASUc0Kn/IO3T209IP0F3f
	 /NvkeIXbm6rSR9oUJujStFGMB27A9kEqJWYnCPLKpwCxKrQlQ72MlU9Ln2N7FzNENJ
	 DnisAiSDSxu0YKggPMlY96RnWMht02QouMvKZ0JHNqxDTios8wwKU9tj94y9x2EyTa
	 YGQs1ZaLK63CeMjwl4vGd5fLHrF85CNYKcaaV7LV8C/M9jPmwAzOVEdbob9m7egEuw
	 zdJDm6Q31Yrsg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqBse3JJ
  scKJJzOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzZj2qpm1YC1nRW/LReYGxtMcXYycHEICTxgl
  dkyu7WLkArKvM0n8+72ZDcLZwyhxb/cFVpAqNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQV8Jdpf/garZxFQlVg66R9YnFfASeLJxLlg9RICChJTHr4HszkFnCW2/5nIAnGFk8TrlZ
  1MEPWCEidnPmGBmC8hcfDFC6heRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGE2LU4vKUot0jfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJS
  SzYxAkM3pZhl9g7GnqV/9A4xSnIwKYnyfgxsSRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwTsXJ
  CdYlJqeWpGWmQOMI5i0BAePkgjvYnugNG9xQWJucWY6ROoUoy7H1StX9jILseTl56VKifOGgM
  wQACnKKM2DGwGL6UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkvg0zhycwrgdv0CugIJqA
  jNik2gRxRkoiQkmpgUhUsXqTurafn9v6Ew7c9Tm2Tl36oDGU2C+A//GZmlYitGas0g62QQjpn
  6GyGpIaOwLV7j69+daRRq367p1l16stQ/ReSjxTrzeZ/cFkqKfVStzb1ZPAkCQ7Wd10XRKb+X
  7D92P5VYnF+1z8f1CrdtL5I6dX+C8YvBaNnvg21O3Z6V/zVho5T94/tFl9z+5LsXUMWkWe5q0
  9cSUpVjbi96fWa/A0XcmfLmGZJsZxPWhLwu+Du+W3yK/nOpV042XeqLvblD0ULjkaLBKVbF3c
  4Wk0U0ua6fF0k+LKUcdqfB9dbXh2QD3/26+C0jvlx+y2c74bsKtNUuWPfM++mwpHcK7s3lH05
  uV7+7N68qBnnbiqxFGckGmoxFxUnAgDqvB9WZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-585.messagelabs.com!1669616471!222287!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28440 invoked from network); 28 Nov 2022 06:21:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:21:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0107110019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E8A43100197
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:21:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyatspi: upgrade 2.38.2 -> 2.46.0
Date: Mon, 28 Nov 2022 14:20:41 +0800
Message-ID: <1669616444-13316-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
References: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99812

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyatspi_2.38.2.bb => python3-pyatspi_2.46.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyatspi_2.38.2.bb => python3-pyatspi_2.46.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
rename to meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
index 7c822ac23..4595eafc6 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
 
 SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master"
-SRCREV = "141a53029b3e16bfa5f100ae54a77234a9bf3426"
+SRCREV = "c9cb2a2289a6eb1fb95b66c25d5351bfea54c47e"
 
 S = "${WORKDIR}/git" 
 
-- 
2.25.1


