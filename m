Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B40FC6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:08:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.3730.1675843733047940038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f787EVxR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843731; i=@fujitsu.com;
	bh=gEk3zxZWmEGOgsVm8QJFOxzRhPXzFDK/qTboiEylDlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f787EVxR6JSpK1JtbpkzmvV7m9rbo2Lh3NQHnOr3VPXrUMe6kvw0PKAozpmtlX3mM
	 3Nw6jhkWfPhGik5uipOBD67kNzdo2+IjU30fMof2Gc52v/E/FGoPuDtrUJpxRQl/hJ
	 F+ZVXdzCis7dw6JZ/wwwAaECCG0zwLW2654egZZxdLY0jM9jjQj3AFFCSoSz3ZQO3I
	 5UqB7NR9k5PTkYSuTwZUyJmybsrb35ifcqdZeFl79HtcIXGqJ7h65YWbeL/6yDXy+V
	 RuSuorolkxKJtMGosOaH2Len7dO2uXKUHSGO6uQRPIH5E2cwTrHcotFRbHRlo9IMgJ
	 pCzAxCcA7sZmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXdSxON
  kgxPnRC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ox5Jy+xFnziqvg78Q5bA+M/zi5GLg4hgSeM
  Eh/+djFCODeYJJ5vWMUG4exhlFh/bStrFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICARILdjQzgtgsQPEFbRNYQGxeASeJd2+Xg/VKCChITHn4HqyXU8BZ4lLfWbD5QkA1Ey
  9CzOcVEJQ4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGukl1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOi
  l5dasokRGL4pxcmfdjCu6/2rd4hRkoNJSZTXU+xxshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  ohwoJxgUWp6akVaZg4wlmDSEhw8SiK8kaFAad7igsTc4sx0iNQpRkUpcd5HYUAJAZBERmkeXB
  ssfi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYNAJnCk5lXAjf9FdBiJqDFIaoPQRaXJCK
  kpBqYDnxwenqhr3v17pTcSgEpaYeXi31D1wc1fFrV9y3yXQDPvDipmHNqu/KuSlw3YQ+fIHJW
  9qps9b3lPWJvG28rHVRmvLN23ZWw/BMWh5S5s1zNOj4GbJPJkw+uq1vAriNkt4txgbPDT5PVB
  tde7Kn8Zh3Ln/0u5l9ds4S7/8mnFz+df+I2ieXhhriWnr9TOapdpwXG+6dUm1/gl7K9zHrlrE
  Tw5OXW1yXil3pe4G8Tj+v8dVLwt9akZ3srvmeYzv0UZvL2S+XsJ+79VxOiFaq2iK1Wu2rJG31
  W0PoHb+y9HXM2aRo9fnegcU4l35tDfrc2Sj/u3bd3ZdrMzTt4477yKuRvcjg5sztq6xP5moVp
  SizFGYmGWsxFxYkA7071d1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1675843729!176272!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8105 invoked from network); 8 Feb 2023 08:08:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:08:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C83C01000D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:49 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BC6791000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:08:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohttp-jinja2: upgrade 1.5 -> 1.5.1
Date: Wed, 8 Feb 2023 16:08:33 +0800
Message-ID: <1675843716-11186-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
References: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100969

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for Python 3.11.
- Drop support for decorating non-async functions with @template (deprecated since 0.16).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-aiohttp-jinja2_1.5.bb => python3-aiohttp-jinja2_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp-jinja2_1.5.bb => python3-aiohttp-jinja2_1.5.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
index c86ec092a..68cbb265f 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "jinja2 template renderer for aiohttp.web (http server for asyncio)"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=29dca541e03964615590ca7b50392d97"
 
-SRC_URI[sha256sum] = "7c3ba5eac060b691f4e50534af2d79fca2a75712ebd2b25e6fcb1295859f910b"
+SRC_URI[sha256sum] = "8d149b2a57d91f794b33a394ea5bc66b567f38c74a5a6a9477afc2450f105c01"
 
 inherit pypi setuptools3
 
-- 
2.34.1


