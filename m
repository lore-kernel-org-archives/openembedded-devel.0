Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24CCC5AC75
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.8835.1649919705418771456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 00:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BC9qPg3I;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649919703; i=@fujitsu.com;
	bh=frywpGmiT3/cWSMwfSrk2jMdTSu0AVlw1KLRpfwS9qk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BC9qPg3IrZVQaCsu56UxyGVMe96mVyVBwBCH4eoNQ72f/BHUPIELsjSLGXyvirmij
	 zXvgIvk3UTL4iLxsOD4qUKNb3fOfT2E95A+AgTeWnrM5YdrRqsmPp8ALN55vI+Vbkx
	 1sa/W+if+kAOG4lPPFdxwz5miKKXfEwncRcc5enp1eKTBArjX7eqxqXVUHF4e6PvcC
	 VyDLjKAhhTcPPc+f4BeVic2Gtfoa8CGV2OgO6x/N/rC07Whwm5Tda5TggLc2PvUXVE
	 Zyj6wEVT4xNXfoDGB6N+nwTFhXH7pGWcamSPvMmcLEHoHjwb44bGBV2QgqnarY2vAt
	 9H2ZyHjUqselQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRonv9WHi
  SwcT9zBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bfq3tZCq5xVex62szWwPiBs4uRi0NIYDaT
  xKprG9i7GDmBnJOMErcvG4HYbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cA1YvLBAo8fDtL
  SYQmwUofmr1KjYQm1fATWLf+7tgcQkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8wQNUoSJ1Z8hK
  qvkHh9+BLzBEbeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQVNdE19JYL7FKN1EvtVS
  3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMMBSillidzBu7fupd4hRkoNJSZS36Wh4khBf
  Un5KZUZicUZ8UWlOavEhRhkODiUJ3v9HgHKCRanpqRVpmTnAYIdJS3DwKInw+oG08hYXJOYWZ
  6ZDpE4xKkqJ88aAJARAEhmleXBtsAi7xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtxVkCk
  9mXgnc9FdAi5mAFn9bFQqyuCQRISXVwJTxrmVigUjaT323d7Ghk7Y8abeYHCjJEHC2WExsyaG
  117j3a8SbWZ/f8bhIeUWjacW0dJZFcbNbpBcVrSuy3fVuNudphvS7svvmp1vff3u4x6FR80Tw
  VofZBpI/31506uSs+qQjtTYwtuwH1z6n5woimh985ht8urhpwl5G3ZceWneX8W2d/l9EJ/d70
  fS7O3W+xpgucGGayzZx56upomImLOtLf+6pal/y+qFazeekhKd9/5J8VDZrL557YJ36s17dWe
  qT21dzTHbNeq4mGSfoL3CxdOd3M1UuWcP/ZfxeHHObld9+nnLfb/bR1XmH5t47Zq2vevv8Eu1
  Si4y9fhcfv9diWCyQJLVedDtP7TslluKMREMt5qLiRABfIwt0KwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1649919702!65269!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20789 invoked from network); 14 Apr 2022 07:01:43 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 07:01:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23E71alW002687
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 08:01:42 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 08:01:34 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-graphviz: upgrade 0.19.1 ->
 0.19.2
Date: Thu, 14 Apr 2022 15:02:04 +0800
Message-ID: <1649919725-9565-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96648

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Updated:
years update to 2022

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-graphviz_0.19.1.bb => python3-graphviz_0.19.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.19.1.bb => python3-graphviz_0.19.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
index f1246b4b21..3cae19673f 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Graphviz protocol implementation"
 HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=87cd8818b7e63c6a9c580034e80d7521"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=951dd0868a9606c867ffda0ea3ea6da2"
 
-SRC_URI[sha256sum] = "09ed0cde452d015fe77c4845a210eb642f28d245f5bc250d4b97808cb8f49078"
+SRC_URI[sha256sum] = "7c90cebc147c18bcdffcd3c76db58cbface5d45fe0247a2f3bfb144d32a8c77c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


