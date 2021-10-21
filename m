Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF40BC433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:17:59 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.6805.1634807878428539187
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lofw5niy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807875; i=@fujitsu.com;
	bh=wVQGFmY5Cli3ReEQ4hzhXd3cvnz0VUn+8RqcQVWOW24=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lofw5niyNIRrlxmy2klCHQT7IQr7Fxg2WHmr3Q5iotqVDuCz/fjYXcEvLWy/egNpV
	 2Sxyj2MFPULJarKn4lOkrkJ8Rztcll0ZHUX7HpoSdGBU+GlYqs99BWOzWBUwSHZyap
	 Ogm+btWtlV1LIXlSsU0KLr9C9VfOMo9yi3aV0UsTXLMcGHNGJimwDNJnuv89/wbyOd
	 Jh3kMGroF57Oqkn/LlJq16vkCw67wy882SRwtpyLFWRgyoZUB/aax07MM72aot8PMB
	 rzN8gniJKKmmFkVQ/FGEYQYGGqoIELxbpROB+lD/JiJsCkYL6CPtL6yf8yhFame3LQ
	 vyuLlArkEkEow==
Received: from [100.113.7.241] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id AD/07-01506-34031716;
 Thu, 21 Oct 2021 09:17:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSdfZoDD
  RYMVRfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWwq9MBW2cFRuXvWVqYFzP0cXIxSEk8IRR
  4v/y6cwQzgUmictTPrFBOHsYJU5sagHKcHKwCehKnHu8lh3EFhHQl1g6ew9YXFjAR2L7ra1gN
  ouAqsTl6x+ZQGxeAQ+JlVufs4LYEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gVQnAOoRlFi9n
  R5iPIKideHLzFD2GoSV89tYp7AyDcLSfcsJN0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmus
  aGRvqJVbpJumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAkMvpZD9+Q7GVW8+6B1ilORg
  UhLl1flVkCjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnenemGikGBRanpqRVpmDjAOYNISHDxKI
  ryT9IDSvMUFibnFmekQqVOMilLivO/kgRICIImM0jy4NljsXWKUlRLmZWRgYBDiKUgtys0sQZ
  V/xSjOwagkzNulCzSFJzOvBG76K6DFTECLCywKQBaXJCKkpBqY1A1iF9e9nmWzspxRvic29vt
  Oz/nSO2/Fn9fvOSMzzS7A1H2u1LO5272NrrDLMTDkcS49ZmZyvJ3xSbXcJZOQlxomErMfNu5y
  r5VZzjTL1OWF8Z6p+oEGfgxCp0Pajnz6bHBGn+3HzZy5Uuts3Zat6o3lKe35Pdv8l3W7/MpGs
  /231s2V3lp0c1ERb+DW6UlvPhnb34hpuT238cPKl1+t1xodSLvgNvvlR9vZD+IXsstu2eKgq7
  1O7FNgq8PCL1/XL9n47ulRm5sWOvmzJnQbrlzwiOVVxcGcvQzb/aeXzjp4RtHIqzHgl7pc1NS
  o2f09CzdasvyI4rwTGPZDJunEBkb5wqM7TjxxWuKqZbGPWYmlOCPRUIu5qDgRAH4uQVc4AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-238.messagelabs.com!1634807874!665808!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12784 invoked from network); 21 Oct 2021 09:17:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:17:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A25AC10046E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:17:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 94237100456
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:17:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:17:45 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.4.0 -> 5.4.1
Date: Fri, 22 Oct 2021 02:17:11 +0800
Message-ID: <1634840231-44075-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93517

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-socketio_5.4.0.bb => python3-socketio_5.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.4.0.bb => python3-socketio_5.4.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.4.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.4.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.4.1.bb
index cd2c436a5..bf8ce4c7b 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.4.1.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "ca807c9e1f168e96dea412d64dd834fb47c470d27fd83da0504aa4b248ba2544"
+SRC_URI[sha256sum] = "ef4e273ddfebb421144a228cbab1e7e27ffe8d372514fa561e57d590ea6627b0"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


