Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B70C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:04:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.85483.1677485038308020272
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B/qYO/tq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485036; i=@fujitsu.com;
	bh=TTIN9vEL/4WSormd5wrcEl9QVKwMNL/ore0MY3jdyw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B/qYO/tqNmiTlZHlJdkyo7D0AZaY6vgJx7c8HPg3R6EGFTopiRo2boIDBUr+uk1q7
	 7ECXjoWGP0f3R9KOxQEKP3a9hTCZbYiE53a12h7IkrjA+vZuis7ogw1ib8k8uh86TK
	 rt98o9LFakywQPnABRIuL0RNDCTMCL+50DC10ESufg0vqPBnzsI8/mQ3iVLdkH/0OV
	 rbFrOdONDaxHxgJ1aLEwavmGWqFcoYBoF+IqlzdmkdhrxgLdqjkvnvE2uR9tad7LVe
	 wVGXKdGxL2yYWIUX2wMUKJDHwjnCfcnrWHXvKDTfHW4oJXeDHXQ5nTouYp8rXzoXB1
	 lQ8rucpo5Gk9w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWfd18p9
  kg299xhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bJxf3MBX3cFbv2XmZvYJzM1cXIxSEk8JBR
  4tzSw+wQzhUmiWPvTjNCOHsZJboengXKcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgLfEzyUvweIsAqoSLVevsXYxcnDwCjhJtN2sAAlLCChITHn4HqyEU8BZ4uKlOWCtQkAlz1
  9eARvPKyAocXLmExaI8RISB1+8YIboVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0FAvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB4U4qZqnYwvuj7q3eIUZKDSUmUd5HTn2QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwHk4BygkWp6akVaZk5wEiCSUtw8CiJ8DIbAaV5iwsSc4sz0yFSpxgVpcR5+RKBEgIgiYzSPL
  g2WPReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMG5UANIUnM68EbvoroMVMQIu3P/wBsrg
  kESEl1cAUIzV/lcuhXTP283ltmt9+7Y5IUc+8ld2Gcf+O1wud3L//6pFCfe8G7lufJQ9Xmm61
  CL7FLHvo8cUJ5bVec/sUp6Sm/zjy/nvbcZOs/PilDuvfnvgXcPP5vg//uqRNTeaWrHrJxiP7Q
  XmZ3MuLYvPvRW0r6cgW0DupIicdHyflw1omVrjYq4r9a6BMeNPbUwZHFI26d7Cy1R6XkLvrca
  LKNLx4iZbATZHTDlqJczJkbiX/Ug5aXZmx5vjRBwEVLYdyPUX3nzyR+XXNx7KdfsbPFqROWpN
  qOHN3W17IR704Adc36Y4nTDc+W+JlkV4+53lbd/3W29EfQ7U0rspLH2K4ph91TipMzSutQWJG
  7DUlluKMREMt5qLiRABaS+5zWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1677485035!213229!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12910 invoked from network); 27 Feb 2023 08:03:55 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:03:55 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 74CA3150
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:03:55 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 688C373
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:03:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:03:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohttp: upgrade 3.8.3 -> 3.8.4
Date: Mon, 27 Feb 2023 16:03:38 +0800
Message-ID: <1677485021-11417-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
References: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101264

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Fixed incorrectly overwriting cookies with the same name and domain, but different path.
 Fixed ConnectionResetError not being raised after client disconnection in SSL environments.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.8.3.bb => python3-aiohttp_3.8.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.3.bb => python3-aiohttp_3.8.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.8.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.4.bb
index b233b3ac9..926801dc7 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "3828fb41b7203176b82fe5d699e0d845435f2374750a44b480ea6b930f6be269"
+SRC_URI[sha256sum] = "bf2e1a9162c1e441bf805a1fd166e249d574ca04e03b34f97e2928769e91ab5c"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


