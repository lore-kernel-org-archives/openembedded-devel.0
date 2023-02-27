Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BBCC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:04:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.85482.1677485036549644530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l0S6I3tq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485034; i=@fujitsu.com;
	bh=BWn3CRHhxMtyjtxCqJT7rnrVL6TswPOvtE0+y1nokRw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=l0S6I3tqbFmURkCTk9eN2Y5By7ard+k6pbBEp12bhvc8sxIrVLID6tqsUUFUpc8Qw
	 WobIichi8vmnlyF39c07pkTYoeyt/8tVwf53jAIbJ6t4UN3hFPmM0yPO+E8M+QhjY4
	 L+zAs9wK+lk1WYHHsuuDSZh2Rf6uiIR5v/aPqZbgGoPsDgON3TQCvW2XTkcTX8Lyxy
	 2O0i8fIZTPKzWjz7lJD2rVD+BTS/zlSN9sqk7tv87ujNNMyfEEP4N5aCZx7epOmZkn
	 3I4oWC+Rq3C1KCp9cKUuDUkjQ6tAqTy6LLZB6lBdY8UHnrrSNt9noPqs63zMLjV3E5
	 TWKOXKqI3Qh2w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqPsq+U+
  ywZeHLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bGlXuYCk5wV7yY9Za1gfEqVxcjF4eQwBNG
  ias7lrNBODeYJF62T2GHcPYySvzp7gDKcHKwCUhJ3Lj/H8wWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CexpW0DmM0ioCqxduNSMJtXwEmi694UMFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44gUzRI
  2ixOzLzSwQdqVE64dfULaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFuhZ6SUWZ6RkluYm
  ZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZhSnPxjB+Ouvr96hxgl
  OZiURHkXOf1JFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB+zYeKCdYlJqeWpGWmQOMDZi0BAePk
  ggvsxFQmre4IDG3ODMdInWKUVFKnJcvESghAJLIKM2Da4PF4yVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrxRCUBTeDLzSuCmvwJazAS0ePvDHyCLSxIRUlINTB6SWl+bmvgbjdSf6HU76Yr
  W6x+9+kE1/Uz4m/gJQUm79l671X03ubyfXSfwFfd7bQPJ3Vem7fVeqH51Y3/YglAF1y5+11Mv
  tjnyLjjuJ3D69imF+cLuNS6vzp1MuKaQP1XdIPZ4RO2ml+qrGyI8m/IZDY6ufvhk37EX0+6KT
  ogVCHL6FRDXPD1+qdfpyGXPbkz1uG18UMPq2JGp2u16het/833N3hslt/rMwuUeC+SOzEnp3j
  Xd0ZO3oG6uhOX24F3JHe8mmu82Oycd5HX/6gv/jwLxSzNfxawNWvnV8NLESwrl1c8my7z54Mj
  IW7tpd/2KS49XHbk2+cVUnUsq+esVM8+miaiefeN8dZKzxwQlluKMREMt5qLiRACiWlClQgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1677485033!210124!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6256 invoked from network); 27 Feb 2023 08:03:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:03:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 70538100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:03:53 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 638D5100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:03:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:03:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiofiles: upgrade 22.1.0 -> 23.1.0
Date: Mon, 27 Feb 2023 16:03:37 +0800
Message-ID: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101263

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Added aiofiles.os.access. #146
 Removed aiofiles.tempfile.temptypes.AsyncSpooledTemporaryFile.softspace. #151
 Added aiofiles.stdin, aiofiles.stdin_bytes, and other stdio streams. #154
 Transition to asyncio.get_running_loop (vs asyncio.get_event_loop) internally.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiofiles_22.1.0.bb => python3-aiofiles_23.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_22.1.0.bb => python3-aiofiles_23.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_22.1.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_23.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiofiles_22.1.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_23.1.0.bb
index 40ac76efd..c06f09fb6 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_22.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_23.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "9107f1ca0b2a5553987a94a3c9959fe5b491fdf731389aa5b7b1bd0733e32de6"
+SRC_URI[sha256sum] = "edd247df9a19e0db16534d4baaf536d6609a43e1de5401d7a4c1c148753a1635"
 
 PYPI_PACKAGE = "aiofiles"
 
-- 
2.34.1


