Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23432C4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:26:13 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.29497.1652084771762956112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gVyso1cQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084770; i=@fujitsu.com;
	bh=nSok5K9WO+1qqJJMFJOcr0pskd0jMObscTkjTRWd194=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gVyso1cQVC8ghfUueagb2n+AQG03TPlcgrZXHyDJsrsLMstickUPagoCQycjYNW+9
	 O+EOFCEWOqmfBvesMrWGGDaE8RjJM/NP4EZbEugo/3F6+gS3b6/ANlutdyi8mZCJ+F
	 pVJ4iEHCrKVF4xBlSmCnNSkop0PKTFqjMUzuViIykdxAvHx7i6gAcCZQ7sRvLdqTUA
	 lWuoGz0axLTugAOrB+3AAnaZJPcFRPdphYvQwoGUVFgpw/D9b9Uv11iGmKH2SYMv69
	 Wgu1gIstczPVilk3SVA7EWeRFBtS1xpHMfFPOWyoBvzkV0dSgzUlV6P/471e4iKR+j
	 yV68P+nBZe5dw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORqKt4oSL
  J4PIPdYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPZm3nMBU0cFcserWNvYFzM3sXIxSEk8IRR
  4tzU/1DOBSaJGxuXsUE4uxklJsxaC+RwcrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CHR+eAXC4jNIqAq8WXhejCbV8BJ4k/rIrBeCQEFiSkP3wP1cnBwCjhL7DhcCRIWAio5e/
  oBVLmgxMmZT1ggxktIHHzxghmiVVFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKka7pKLM9IyS3MTMHF1DAwNdQ0NTXTMzXUNLQ73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5qcbFe
  cWVuck6KXl5qySZGYDCnFDvt38H4tO+n3iFGSQ4mJVHeyqaKJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvCHngHKCRanpqRVpmTnAyIJJS3DwKInw3j0BlOYtLkjMLc5Mh0idYtTluLtw715mIZ
  a8/LxUKXHeYpAZAiBFGaV5cCNgUX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCv0nmgKTy
  ZeSVwm14BHcEEdMTHgFKQI0oSEVJSDUwFU60uXHmRwLMm+qaF/sJ2/z4BQ57vU9w3GbzW6yyR
  iRc4Gjzh96KupWah02beC6lb9n/RDfG1b4MSHngKXrt4moHPSVvDy2Vv7RzrYMX1JWpV/z4a3
  5xhy95z9yF3mmKgCt8D20f/bPfqMC6a5DR7/YU9LlOP8R68w3AxLmndZMms2XwXp3JX/2Tb0N
  Ox+tvymzoCLlc6DTYHn1UOrK47lL3g/d9Y9TP3l+7uF594NjplS+VHM65mOWUpr9hnjjen/Ju
  cndewwEkprdD8+2/jWSe07NZbMCdd38V4W7T64fao4Fiztfuf26S6/JDSvyLbnegj3/bWK/S8
  z868V8pO6xTubl8rPv3+tRjZWXuUWIozEg21mIuKEwHNxMbkbQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-545.messagelabs.com!1652084769!459968!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30124 invoked from network); 9 May 2022 08:26:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:26:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0751D10019E
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C1E5A100195
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:25:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.1 -> 1.31.2
Date: Fri, 29 Apr 2022 16:08:09 +0800
Message-ID: <1651219689-27457-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
References: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96999

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.1.bb => nbdkit_1.31.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.1.bb => nbdkit_1.31.2.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.1.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.2.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.1.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.2.bb
index 1fea2f593..16e29a2fd 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.1.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
 
-SRCREV = "ff4bc950c336477de1765ab1f0826c199f013ffd"
+SRCREV = "4a5e55f798beb922dd4bbfd7c40837e35a9754b6"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


