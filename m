Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B897C4708E
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:40:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.37748.1670830808994025034
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xgWPtLMv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830807; i=@fujitsu.com;
	bh=3D0Vf2wSDt2fnuA4xXQqE60+IBdR3JQaCemRo7EGx4U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xgWPtLMvte1/UDw8LfLEA71ME/sPv0kSaspFh5npFxBmXPuxmMjbopUP8KOTR+qJi
	 VHkTT6TdKqu/zQwJYe/5CW+6ml7viDzd0ZFirfEwJHn5HXnFrZzodi7Kv7giGTNyrN
	 zejRlC2QnhCUOFMFcpEVN5/AcCis293qO24zYpyMttwEQZt3DbP8XLOW7XlS1sAeY7
	 qLHt1LOLmjP5QFb75J4sdBJOxBiSw+dEQ/N2Jx6IiahBW3GntjF9feXJ0OziD29cbm
	 LChFw6hMYvulwQ4hZLqgdvgroDjnMNjv5zBiYoDA9GJcpfKptxQ9S9j9AHRZDQdv2A
	 Eq2RqaEYZNpaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpHv91rR
  kg0P7mCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owzf4+zFNzmrDjbc5epgfEfRxcjF4eQwENG
  iTuHvjBBOFeYJE6v/MsG4exhlDh+uBPI4eRgE5CSuHH/P5gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwE+ise0aI4jNIqAqsXDfcjCbV8BR4s6/12C2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGE2LU4vKUot0LfSSijLTM0p
  yEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAoMxpVh96w7Gw8v+6B1i
  lORgUhLlrbwyLVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/Bm0A5waLU9NSKtMwcYGTApCU4e
  JREeFWA0SHEW1yQmFucmQ6ROsVoyTF19r/9zBzLweTMr20HmIVY8vLzUqXEedeCzBMAacgozY
  MbB4veS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeXlB1vJk5pXAbX0FdBAT0EFRL6eCHFS
  SiJCSamCa2GMeeMKZO0ZV4UPmhhox95C2+g/vbNQYl1vs0u97teJz79LwT6mNS5K36AoUPmX+
  X8T1K+LYMWs5t+BI6enzrM082f+2lQlG5qmE7ZI+8vEm29wfxo97eW98D2n6LXWbwaFK4sDV3
  wa2cguz/Bk0g3bfEttn7LP8jvbq78eqr53cxPen1ORx/fuClfqqa7t3vvVepmqTsqvP8cSaN6
  8v3rw1/ZWT6M46rn+H7m15wWsyoZo53tFnB4Ofq8+1rHUijGvq0h0LY55+tIg5dil/l7jNopV
  6S/O3vFrBu3NWrmOmbLiQXpiQ78v7BQv93705q75r7p7E7k2/71w+v1bwvPCtM1Zv7j8x49zw
  N9FbiaU4I9FQi7moOBEAQZpdH1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1670830806!316580!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25464 invoked from network); 12 Dec 2022 07:40:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:40:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B9A221B6
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AE3F21AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:40:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-yamlloader: upgrade 1.1.0 -> 1.2.2
Date: Mon, 12 Dec 2022 15:39:35 +0800
Message-ID: <1670830778-3178-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100055

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
add Python 3.11 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-yamlloader_1.1.0.bb => python3-yamlloader_1.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.1.0.bb => python3-yamlloader_1.2.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
index 0deb1b7dd..9fdba4911 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "8a297c7a197683ba02e5e2b882ffd6c6180d01bdefb534b69cd3962df020bfe6"
+SRC_URI[sha256sum] = "35669fd7b9f8c6b38db861a51701542c42672b46e8ab63253486a8cb8377b687"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


