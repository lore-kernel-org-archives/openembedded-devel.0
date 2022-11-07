Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A482C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:27:20 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.1216.1667809638357225200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kH+v9h52;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809636; i=@fujitsu.com;
	bh=F+fhQ4pBFZB3RxVtS23KeIsV1tl1+qL2TbIBhyOskx0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kH+v9h52Z3JlNJ+qPluRWkschGwqiylEweVogkgjQsheSgsy9RZlhxorvuRNc/06r
	 pcwZgkF8ycYhJb2e+D6IA6ew9Xe9LrEnAGNJHdLNN2JRbTJdzXa4RVf3HMxKEBb7ot
	 KnrRYxDHi1gj1x6bk/mXHrUsVjcn97PCG6DtCPo/96koilFVypyDbnLsOTSIQU6AgI
	 7gjnrTz9q64rVc+yAIa/yO34xDYH2AXPhJfuTpJfqGFy8lJeFulcSJ66bqvR4679Et
	 sTgZX/+BA8IxXwZ397YBSzrIwWgxUPWGaxIupFYLoHCSZ5ZlmjgH9JRsCYMyohJi6K
	 ZkaBzYCt5wEeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSTflYEa
  ywZyLrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZze3sBUs5Kv4vPsvYwHiKvYuRi0NI4Amj
  RNPfP2wQznUmid8zL7BCOLsZJbZvnwiU4eRgE5CSuHH/P5gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwE7i2suvrCA2C1B8579JTCA2r4CTxPXLaxhBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFqcWlaUW6ZrrJRVlpme
  U5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGY0oxY+4Oxp3L/ugd
  YpTkYFIS5f29PCNZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvjY1AOcGi1PTUirTMHGBkwKQlO
  HiURHjD9gGleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolznttN1CRAEhRRmke3AhYlF5ilJ
  US5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLvAdoCk9mXgncpldARzABHVFdkAZyREkiQkqqgUm
  yv+OZq5XcQyPvyZm/b0344RZxRcM3e9HxmPmP886a+XDdKCo7eE9tRYiIP7fszbNsPVUduy9l
  yPHvfRh97qh0TiJrJDf33uqnG2e9O3PvGOM3lVV6p9N2zGwL8fdMe3RE+6v5wZpdW9N9ClfFc
  7xIO/tS73GSq/Drr0JbLtQwKbKyuX7wK4w/8yP9K8u5W4Jd5bPrVWe9v+bDd5fLxophc7BkUO
  UVvfCQbzY6PPyvlp7wcb3Vs7pb9pL+uvg7Z+w/BJ1NTjXZEOfgvuC7R7H/0nduD26m+BoUZtx
  +MvP20cPtLYmrX1bItn05Z3HVQ/7VsiPmTj2mV9yr1vwU/9+751hm9uMr13sDbksY7VBiKc5I
  NNRiLipOBAAQkhAsTQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-30.tower-585.messagelabs.com!1667809635!321630!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4796 invoked from network); 7 Nov 2022 08:27:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-30.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:27:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B61981000C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:27:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AA0E61000D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:27:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:27:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.363 -> 0.364
Date: Mon, 7 Nov 2022 16:26:58 +0800
Message-ID: <1667809618-30748-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99441

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.363.bb => hwdata_0.364.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.363.bb => hwdata_0.364.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.363.bb b/meta-oe/recipes-support/hwdata/hwdata_0.364.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.363.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.364.bb
index ddfce3f39..6499db24f 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.363.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.364.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "75df73ae53e2bb878b5dc62036679efb69210222"
+SRCREV = "3ac83cecf56f299e7390e5afeab2808632719243"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


