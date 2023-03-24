Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437EFC74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:29:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.89920.1679617783760168924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xygRSag/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617782; i=@fujitsu.com;
	bh=JNCC9sGQZQ236h3sXh6BQ5F4BPFEOCUmQi5Bd+YQUtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xygRSag/YiE2aTaT8cycwr07AMu1kE5wwCw4eWy5ubvlCJbZDjL3wCEiRE8mq1PDv
	 2EiK7xvZ1oaXUWFd90vTTMZaTLVWs/peC/aIYx7zTkaABzCiIOQKMoz/YWsGZa6EEO
	 lc5Dwznonjcz4V7MA5fqlzYyj4pSxJV6UWRpBgsG+/sWlnS5uQ6MN3x9BZ/vq0aCts
	 rWNldll+R/1QMYJS7ZmsTTS1PzydOmwz/LrKBsEsemB03I3WhNrMq0tdSlimo2JQ6A
	 Lj0nxJ6e0X4Z+wsxqivEkwOrAh2mTbColkQqPRmMHEStt4gXZBeg62+Z9U6iyrhihm
	 LivJWL86zNN1g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWffrO5k
  Ug/eHBCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozTG1IKjghVzDyxnL2BcYVAFyMXh5DAQ0aJ
  k6+3MEM4l5kk9mz9BORwAjl7GCWevvQDsdkEpCRu3P/PBmKLCOhLLJ29B6yGWUBF4sXvHnYQW
  1jAXWL3vJlgNouAqsT7nmNgNq+Ak8TydT8ZQWwJAQWJKQ/fg/VyCjhLbLjTBLXLSWL/w7lsEP
  WCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYxMqxh
  Ni1OLylKLdC31kooy0zNKchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2
  MQIDN6WY1WkH4/G+v3qHGCU5mJREeSVCpVOE+JLyUyozEosz4otKc1KLDzHKcHAoSfB+fiOTI
  iRYlJqeWpGWmQOMIpi0BAePkgjvobNAad7igsTc4sx0iNQpRl2Oq1eu7GUWYsnLz0uVEudNfA
  tUJABSlFGaBzcCFtGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzCgPTgxBPZl4J3KZXQEc
  wAR3hXAN2REkiQkqqgYlp4kNWvRDbCtvtrTNn6xwO45GxUHLszb6+57/cr0zVE2yO+m8FBVNF
  fKxyL/dKKP5+ZT/ddYXXswXbPaeu8qnJNu8PPLaS33zqP8kn6k6tRzgDO7e5fJNYYd4ouODX+
  Rf+S986xE5eov1T9pzhg3dnQ11NL+2KYr4Wtbi2pMEzylKyKypzJtfNh0envkoqNd3cwuP6ao
  2S59NHyx9ExGnEOUyqNo9cz3Y94WGOgcrrM6unxrFcVG+TVa5xfRbuGaL6s6EmK112RoNsJE+
  CiFeyU5d9iQqj8Z3kpG7J9MkpjFdq47lC3ndHvD706PYtr4YDU7eEr+X/0ytafPGbfqmx65v2
  JlmuCS5/OncqsRRnJBpqMRcVJwIA+pfTTWMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1679617781!254450!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25944 invoked from network); 24 Mar 2023 00:29:41 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:29:41 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id DD15A153
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:40 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D0A8B73
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:29:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] can-utils: upgrade 2021.08.0 -> 2023.03
Date: Fri, 24 Mar 2023 08:29:21 +0800
Message-ID: <1679617764-27268-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
References: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101684

From: Wang Mingyu <wangmy@fujitsu.com>

Support of new kernel features:
-----------------------------------
j1939: make use of new RX UAPI
isotp: rework FRAME_TXTIME handling and buffer size (Linux v5.18+)
isotp: add support for transmission without flow control (Linux v5.19+)
mcp251xfd-dump: add support for dumps created with Linux kernel >= v5.18
can-calc-bit-timing: import bit timing calculation algorithm from v5.19
cangen: add support for SO_TXTIME
includes: update to Linux 6.2 upstream (with CAN XL data structures)

Improvements and features:
--------------------------------
canfdtest: Add extended frame format / message length / FD / BRS support
can-calc-bit-timing: add support for calculation of CAN-FD bit timings
cangen: add option for absolute timeouts
cangen: new generation mode - partially randomized payload (-D)
slcan: increase BTR char limit to 8 for 32bit BTR
log asc converter: support len8_dlc for Classical CAN frames
candump: handle individual logfile name for stdout
cansniffer: add CAN FD support
cansniffer: make ASCII output switchable in CAN FD mode
canplayer: introduce option to limit the number of processed frames

Fixes:
-----------------------
candump: print number of dropped frames as unsigned values
candump: reserve enough space for ctrlmsg
candump: fix accidentally disabled traffic timeout feature
lib: fix seperator in snprintf_error_data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../socketcan/{can-utils_git.bb => can-utils_2023.03.bb}      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-extended/socketcan/{can-utils_git.bb => can-utils_2023.03.bb} (95%)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
similarity index 95%
rename from meta-oe/recipes-extended/socketcan/can-utils_git.bb
rename to meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
index 07b80a5307..ca6cb7db58 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
@@ -6,9 +6,7 @@ DEPENDS = "libsocketcan"
 
 SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master"
 
-SRCREV = "3615bac17e539a06835dcb90855eae844ee18053"
-
-PV = "2021.08.0"
+SRCREV = "cfe41963f3425e9adb01a70cfaddedf5e5982720"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


