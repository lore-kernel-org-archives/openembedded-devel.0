Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B33C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:14:31 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.85565.1677485662248033710
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=w+9J8jXs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485660; i=@fujitsu.com;
	bh=blb/WuodMrEg/Yr5IRQhaG5hCeW/jGno7zRNwBE5svg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=w+9J8jXsDhzHFoYZ5Q3Z+v0X0JYNh6U15cR0W2AhSI1ruSLgTaOidaWXlZXaJp6Vd
	 h0jybS17NtJQQWlABIx9Ln3VGLwkNJqtbBrsoA34Nn4cbj9KqASU2pwFFFMGqxJRqZ
	 NWwskMp60Cf5LImPUzF45Gry3eJvhNYdxkDCTZXcCa0mkB8IY46/VE6L0Q6YBz/kf+
	 yiySitlDaaMiUP3QYRYx0Tz88wYlf3GMuNIEHJs76v+g4K/EPqe9x6x4M++P6gagkT
	 WPeDeJesXl3NFNHNLpvmeWqQYUUMu8d8tIcfVECP2+s71w0rpgtZdl7vIeyL5vzMq1
	 n2wL14oCntZwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTcm7U+
  ywfljkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aXpz/ZC/bzVJy/s5a5gXEddxcjF4eQwBNG
  iSk/brBAODeYJF6f3MHYxcgJ5OxllJi3yBvEZhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAR2Le8U0sIDaLgKrE5M/dYDW8Ak4S27b9BOuVEFCQmPLwPVicU8BZ4v2nXewQu5wkbn
  ZuZYeoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGuol1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYuinFyhN3MK7o/at3iFGSg0lJlHeR059kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8B
  5OAcoJFqempFWmZOcA4gklLcPAoifAyGwGleYsLEnOLM9MhUqcYFaXEefkSgRICIImM0jy4Nl
  jsXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBuVADSFJzOvBG76K6DFTECLtz/8AbK4JBE
  hJdXAtGh/97/Mc5PfXmJleOE2ZRfLW/695v9S+9/M0E+IKOKaylu/cf4/JtWdC9bf/j9tr734
  K76JnqJ2Ng5Cn05sVJsl2rN6+oSbl/b8MUpIPOhRz7D1oD/L523PLz0IuTvterSV9sQVD4snH
  VncLBppxi/cbR0fmr514ZQr7HOmPol6UPlA84j/mU8dz19prTLKUXRTqmDUEv20eltn9uLPXN
  dLAle1BipMnfis64TSCg1Bi2Sx6TMU0rie5Sk96TLS7d9xpLr8T0V6r5WsLudV0YcPTn3SeLb
  1xvsVnX6LtjZsLLp3ovz8mUMK/y28jz0P23yswrnKRN5m3a3F08/pJ7vJNOT8sqk9toh/qvv9
  o6JKLMUZiYZazEXFiQDOHlrDWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1677485660!409918!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10802 invoked from network); 27 Feb 2023 08:14:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:14:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 21F001000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:20 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 162841000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:14:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.2.1 -> 2.3.0
Date: Mon, 27 Feb 2023 16:13:59 +0800
Message-ID: <1677485641-11740-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
References: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101290

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
[inotify] Add support for IN_OPEN events: a FileOpenedEvent event will be fired
[watchmedo] Add optional event debouncing for auto-restart, only restarting once
if many events happen in quick succession (--debounce-interval) (#940)
[watchmedo] Exit gracefully on KeyboardInterrupt exception (Ctrl+C) (#945)
[watchmedo] Add option to not auto-restart the command after it exits
(--no-restart-on-command-exit) (#946)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.2.1.bb => python3-watchdog_2.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.2.1.bb => python3-watchdog_2.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.3.0.bb
index b76c6de0e..8b4cdbb3e 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.3.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "cdcc23c9528601a8a293eb4369cbd14f6b4f34f07ae8769421252e9c22718b6f"
+SRC_URI[sha256sum] = "9d39effe6909be898ba3e7286a9e9b17a6a9f734fb1ef9dde3e9bb68715fca39"
 
 inherit pypi setuptools3
 
-- 
2.34.1


