Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03523C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 08:59:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.65381.1680512339097336935
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 01:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qt1OJ5bA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512337; i=@fujitsu.com;
	bh=LR50Hsc7VkNHVN2rKLsvVr4EZ71+Mgl5MVaTGXJXnCo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Qt1OJ5bAf4jNmxp2sM1yxGJQgBn22xDmoSwZJHHZoNjhpYf2GqMDMhUaSdQe4ZxiZ
	 mTgLhZ35V3Mtv4pqqvIIdv0QcyATgUsa3X8DwgVB7vtmFi7BZxQULd2bOrPAp0MIHb
	 k3pORvuoH3L7RHsl0Ise+XV9l5x7CNn0nEEIJWsQnzF7KHUR8XqUv/CQo18IeUv6e1
	 KqL6LBaajI7URgD/lB7rFwJGrh4Sm+sVQxd3+pfIDtX3KODO/OoWNAieipZTgEwwEt
	 tVmPkzNCje1kuiCm/E4DSdxJHFAx05aNDki6cDZBdMUtDa3hnii/5rq2zdc25QoeCL
	 fPKawWWnIo9MQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWTdgqla
  Kwd+plhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Zzx0+mgl3sFbeXT2RvYLzM1sXIxSEk8IBR
  YtXsY+wQzhUmiYfvTzFCOLsZJWYemszcxcjJwSYgJXHj/n82EFtEQF9i6ew9YHFmARWJF7972
  EFsYQEfiY+XG5i6GDk4WIDirR18IGFeASeJxx/OgJVICChITHn4nhkiLihxcuYTFogxEhIHX7
  xghqhRlJh9uZkFwq6QaJx+iAnCVpO4em4T8wRG/llI2mchaV/AyLSK0aw4tagstUjX0EIvqSg
  zPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAYU4qVP+xgXNr3
  V+8QoyQHk5Ior2C9VooQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6DE4BygkWp6akVaZk5wMiAS
  Utw8CiJ8Ab3AqV5iwsSc4sz0yFSpxh1Oa5eubKXWYglLz8vVUqc128KUJEASFFGaR7cCFiUXm
  KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPtqItAUnsy8ErhNr4COYAI6ojVKA+SIkkSElFQ
  Dk4pKmPiWm8cvHedOaxas3q+1aJf/PVfhdV+qi+4uEM/NfPC6eptJ2qU3hx1Wcu9lOKQ3PWNZ
  84u48iW2cx85FcVmsTius718Z82WtVy8Ff26ekXf2ecKL/fcsPXFR5WFU14xqzZsEpLKv6p7z
  3l9wPt40wNd7AGfDY29r91kZw8vnxKwZEtny4lbYSaKplEBV2oTvbaH/DX2cAh6r3fUNPCkL1
  PEEtZU7UU3AqQurOv87uJ4pfGWusO7oIeqNsZrK5Nkxf4oe1wM+bVV1L9vaqjVU26ntrWSrhy
  rWbX+X2E7MmfuBfslipO/HWaK27d/ReonnrWsj4+6aETNyW5SdNq/q/78QVPvz+dk3rCtVGIp
  zkg01GIuKk4EAAd1WWdNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1680512336!190995!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32271 invoked from network); 3 Apr 2023 08:58:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 08:58:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A3F527C
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:58:56 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 970D5163
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:58:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 09:58:55 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] abseil-cpp: upgrade 20230125.1 -> 20230125.2
Date: Mon, 3 Apr 2023 16:58:39 +0800
Message-ID: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101892

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 08f2e264f..8617ba5c3 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,8 +7,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20230125.1"
-SRCREV = "c8a2f92586fe9b4e1aff049108f5db8064924d8e"
+PV = "20230125.2"
+SRCREV = "b971ac5250ea8de900eae9f95e06548d14cd95fe"
 BRANCH = "lts_2023_01_25"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
-- 
2.34.1


