Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77403C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:42:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.8981.1648460536599830893
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CJymwjSG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460534; i=@fujitsu.com;
	bh=72Dt7KVBIx+xduDFQQnJBzdoekF8xs8wueQjKlHkwSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CJymwjSG0A2HaDA33mUFTdlQG09PZqA66/QT9EU/mq+6RXDbhlzF98I7jIijnB4xJ
	 yjRGjYUkFD9K2LIRztR0UoELzQdEWsGCKT1BxDamHWzoY+lsgRSQiMIg6mPuOYh+rG
	 +1eEmn7mJ9YBJ/g206c6pRV6aeMB/zwaSUt5WsA5uV9pFtAECpCDgRpSKQ+pXg1X3C
	 lCLRSnQhrA/2lqljGLKjO9o0zUEgXH0JJ5hRimGYhgyC/+9O3Zvb18g6eKUg/7mdHo
	 oahY39/38z/NRCDGM44yUebjq5Qkbo+7+v5TMOu7cBWglfit2IopZKulq7aqnl5pSz
	 4NB+0vTqXtANQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqPutyTH
  J4PBueYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP9zCeWgn3sFf+atrI2MD5n62Lk4hASeMIo
  8enLSyYI5wKTxL1ffxghnD2MErNXPWXuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897
  CC2sIC9xJ8P/8HiLAKqEuumnmEBsXkFnCT6js5nBLElBBQkpjx8D1bDKeAs8b1nHpgtBFQzc+
  9/Roh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGRrqGFpZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBgZxSrLB3B+PllT/1DjFKcjApifIaZTomCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgrWgAygkWpaanVqRl5gCjCiYtwcGjJMI7oQYozVtckJhbnJkOkTrFqCglzru2ESghAJ
  LIKM2Da4NF8iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxmIFN4MvNK4Ka/AlrMBLR47Tt
  bkMUliQgpqQamhi79or1BBQu3X2vd3f3YWHvr1Yne73zEW/m0850mrd3z5Wvxv0CP/c2XGm+3
  cWUe/dq20nC+fd17NWWv3rNC/2yq3mzYKjH1yZYjE9Tnxmp4PS95pdoQ/dU/Lk//wbqzLDlv6
  7andbOsSJLa3HCOMfCSp9s8u6At/2WeZDkE7ex9OSl5ZcuH3GkXpnZkCnH/93oW7Kbw/NMR+b
  O9TMfW17z9cZtr/iueNOPPJcVBZ170BAc/nKqzquGItnDaCu4VLzpP8QtnJcaL/Y45d/z1pk+
  P/s39WDljQ7VRXfXWLedPFs3doNUu3DprWWPZxm2dWmeEOycxyB501No/f3rbVp7Fut8/em05
  5HQ3cuoqBiWW4oxEQy3mouJEALwjBP9fAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1648460534!37774!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22571 invoked from network); 28 Mar 2022 09:42:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:42:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DAA651001AD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 80F1A10018A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:41:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] monit: upgrade 5.31.0 -> 5.32.0
Date: Mon, 28 Mar 2022 17:41:41 +0800
Message-ID: <1648460503-15630-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460503-15630-1-git-send-email-wangmy@fujitsu.com>
References: <1648460503-15630-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96232

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.31.0.bb => monit_5.32.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.31.0.bb => monit_5.32.0.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.31.0.bb b/meta-oe/recipes-support/monit/monit_5.32.0.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.31.0.bb
rename to meta-oe/recipes-support/monit/monit_5.32.0.bb
index 2b5e89420c..e4ec9d5262 100644
--- a/meta-oe/recipes-support/monit/monit_5.31.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.32.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "eae71f28941fb663eec74c1a59b69546c659529796550bd9c0c544e9b52ac055"
+SRC_URI[sha256sum] = "1077052d4c4e848ac47d14f9b37754d46419aecbe8c9a07e1f869c914faf3216"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.25.1


