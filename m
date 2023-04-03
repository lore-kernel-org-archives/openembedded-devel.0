Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB5AC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:00:23 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.65400.1680512420728753144
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PnhhFv0+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512419; i=@fujitsu.com;
	bh=Or9Jtlk87y4dBTOXHLmeQAjrNYHuWIteBvHMm78KB2Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PnhhFv0+cpdiEY1PrurACrQPUGMv2ALyigUTTGTPLyikS0rmXFs8/uva9SOnjiQse
	 9GX/3Z0H1cIT5ihHuDn6Kxvavtsw0uJIIQS5JhNiEUCLp8ejjgP0YD8D0hSM3XbsCL
	 S5oDs40/5OE9gLboajX/SXiZcvGDJIO+DHTrhAuXoqt/4DwTHm/SsH62lx9PUAogYU
	 jAsFNmmdmSCa+BB9mCX9weqgetITtfKRdmamHxfxysI2P8cX7eYzrqCppkq0+A13yz
	 440ZOWZ7w8xcBRsX9Ofb/Tzn5Z73HosxV7COMzU17WP4WMf40gP07vz9kkoDMsue9c
	 Xf1h+GOmHJ4jA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSXfRVK0
  Ug7O/VCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox7S6exFyzmqpg1dQ1LA+NUzi5GLg4hgSeM
  Ej23u5kgnOtMEv2XHrFDOLsZJb4uambtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jATaJj3h0wmwUofnLvYSYQm1fASWLPn31gcyQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGukl1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYjCnFbN07GNf3/tU7
  xCjJwaQkyitYr5UixJeUn1KZkVicEV9UmpNafIhRhoNDSYL34ASgnGBRanpqRVpmDjAyYNISH
  DxKIrzBvUBp3uKCxNzizHSI1ClGRSlxXr8pQAkBkERGaR5cGywaLzHKSgnzMjIwMAjxFKQW5W
  aWoMq/YhTnYFQS5n01EWgKT2ZeCdz0V0CLmYAWt0ZpgCwuSURISTUwyUbLaTTHv39neGGRzoG
  ECan2x95X5zqHlTE+yp0h7vm7qP65wmnGc+YPO/fUMS+wf/5594KazAuPAw6espqZ4hVQqvzi
  /uyEtyXCR1Ymh3/aOPvZ7IdNZ6Pb0k52C2+wFHk+L8iy7syi9+/jXvZYHioLe3vbjkXLsXOyx
  sarF0RnP3ycuKJ6Q7gZ4/mF6fI2G+QDj32P3iTuGeJhbLrm6oX7LkUNlYWet3Rl+RfMKFq17+
  iZToaDfpd1Un+LJkw9Nc3nk28jc/9prcydvxKX+krtWTwp43tTy67lb2QcJq7W1M6P2nAkc7d
  jQpHME63muadEk6SsKjV+tdz6Yyx2xLDw8SPz6e8cCh8lL4pcosRSnJFoqMVcVJwIAJEckg1B
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1680512418!1033657!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17831 invoked from network); 3 Apr 2023 09:00:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:00:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3682B1009B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:18 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2872D10047F
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:00:16 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libldb: upgrade 2.7.1 -> 2.7.2
Date: Mon, 3 Apr 2023 17:00:04 +0800
Message-ID: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101897

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libldb/{libldb_2.7.1.bb => libldb_2.7.2.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.7.1.bb => libldb_2.7.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.7.1.bb b/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.7.1.bb
rename to meta-networking/recipes-support/libldb/libldb_2.7.2.bb
index d13bd37cc..daf0f73b8 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
@@ -35,8 +35,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "e443a8da17758479c3b5c542e8e3ff1a"
-SRC_URI[sha256sum] = "c4632c9a7f81f8a45ed46fc14d18eb507edf4e79f6e88d16977478ef95ed5b7f"
+SRC_URI[sha256sum] = "26ee72d647854e662d99643eb2b2d341655abf31f4990838d6650fb5cf9209c8"
 
 inherit pkgconfig waf-samba
 
-- 
2.34.1


