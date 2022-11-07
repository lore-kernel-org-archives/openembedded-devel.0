Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CE5C4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:34:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.1245.1667810039881459033
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c/+Lt7e8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810038; i=@fujitsu.com;
	bh=ol3LWxQKA+DM37Xu7y2rXJMxKf5FX9UJzuBj0E8NwFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=c/+Lt7e8281883+mG8jGVrLF6sXZMh873XADSyHgM9GlWo+QwV+OB0PQ/jvqC1Z4f
	 8jCwCThLFFGTWihGyqI3A5m/f69qj1XhKHoxxaVMD3iZzyXN9ym52dXb+ZYBdOY1M5
	 U36EBykAME1VPmRT0T7BKlAizLutfUfs5bjDvc5ppL3qvNES+Xws2HwEdvb9WErg/h
	 MdGPGuKcKBnJPgyS+o7ueZzW6syFmY06dO0yY4zpd5cm2MyM7MPedY+k6z8j/czIw1
	 jflTIz2hCq2xVuL3n3FZV+KtmA1t3VVtXzxYBeudz+j6qHOb7ibey1+ZhufTLi7T4P
	 WowWzYQj9GJ0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWffroYx
  kgyWXlSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz5i94xFWzkrJh4pYu1gXEDRxcjF4eQwENG
  ifm3/jJBOJeZJB5N/McK4exmlNj6vIWli5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBc4mtO04xgdgsQPFvq28CDeLg4BVwkrj9zwckLCGgIDHl4XuwVl4BQYmTM5+wQIyRkD
  j44gUzRI2ixOzLzSwQdoXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMZsWpRWWpRbomekl
  FmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgcGYUpxks4Px
  79I/eocYJTmYlER5fy/PSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXtjI1BOsCg1PbUiLTMHG
  BkwaQkOHiUR3rB9QGne4oLE3OLMdIjUKUZFKXHea7uBEgIgiYzSPLg2WDReYpSVEuZlZGBgEO
  IpSC3KzSxBlX/FKM7BqCTMy7wHaApPZl4J3PRXQIuZgBZXF6SBLC5JREhJNTCp6l8SWRh0IKj
  KszHyStHq0g8sAVEyHvMkD17Onb3sfGx512SupYwlIQu6O6aIKX5Qbo4OutFUZ7XAKu30o19f
  6+49bF1fZHVX/Ya+09YFTapm//g2NVR0/r+XP3u53p2gRT0ZDbZdkarCDodK6sT046SnHN2l8
  +2Ug9/TZrvrXyPST65YIG651a+TPf7z96qwB39UnoaXlcecb9f4+8Lp2J7I15pP1hY1ukxPCR
  DWVvKJMLfUV2N5PPvGtXsBB08Zf+HP3VAo/H7T1VVxS28lJR2Mv2tgV7qvb74O49RpnTEWL3/
  +f5upl5aV7/bLyJjjaMdNro5qvwX+P3mNOdOnr/v9Y+a/ayUSIfOr7yuxFGckGmoxFxUnAgDg
  VELjQQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1667810037!244513!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27078 invoked from network); 7 Nov 2022 08:33:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:33:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 11EF2151
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:33:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 057F273
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:33:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:33:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tio: upgrade 2.2 -> 2.3
Date: Mon, 7 Nov 2022 16:33:39 +0800
Message-ID: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99457

From: Wang Mingyu <wangmy@fujitsu.com>

Changes since tio v2.2:
=======================
Add mute feature
This will make tio go fully silent and not print anything.
Rename config variable 'tty' to 'device'
Deprecate tty config keyword but keep it around for now
Update show config
Update example tiorc

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_2.2.bb => tio_2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.2.bb => tio_2.3.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.2.bb b/meta-oe/recipes-support/tio/tio_2.3.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.2.bb
rename to meta-oe/recipes-support/tio/tio_2.3.bb
index 8bfebc777..665c8462f 100644
--- a/meta-oe/recipes-support/tio/tio_2.2.bb
+++ b/meta-oe/recipes-support/tio/tio_2.3.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-SRCREV = "eaab692d4d6be1ef41c0f6950977cf9054520cb7"
+SRCREV = "845e683fc9e2d2da686fe0c8e4b19b1245e9904b"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


