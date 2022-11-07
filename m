Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF9C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:30:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.1218.1667809805098264136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YBKnaPvb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809803; i=@fujitsu.com;
	bh=B8eEiNTUSGUAzAoSDIMU05Nl54vIbIqFlc6ZebpKwok=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YBKnaPvblZh7r2V0iyAfudx3pNiIlDhudvd7W1zlZjUAgDnJJb7ovSgAjfVyVj7XJ
	 S8XDjanBl8MB7g3B40JLg4/rpDyD4g3Wo18QSsy38EhRLX23YpErDsjVgqljsRvupv
	 zFUUQAWhVhIwueevG91sAJSkLh3sldrJr0th4Q4oA/DDigQRkxz9tmkOACs99rJSbQ
	 xnhzE74ffFv0qmt0VLXujQdNaiG2hJ6wTUxG4YoN77jmHWLal/ySKoTRnQKlMrQRkp
	 0TqZSvaXv2yC96AWdf8nfWkuFv5ePf35RBf5MOTCuTjLIxwIYB0+l6S5uATB2iV2gm
	 aWrfD3DsWPiRQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqMt9KCP
  ZYP8zDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePDzC/MBZu5Kh5smcnSwLiSs4uRi0NI4Amj
  xNHpz5khnOtMEkdmdbBCOLsZJTovvwVyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFrCVmNPXwghiswDFOxb8BIvzCjhJrJ3XDmZLCChITHn4nhkiLihxcuYTFog5EhIHX7xghq
  hRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0aw4tagstUjX0EwvqSgzPaM
  kNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAcU4qZnu9gPLvsj94h
  RkkOJiVR3t/LM5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfDe2AiUEyxKTU+tSMvMAcYGTFqCg
  0dJhDdsH1Cat7ggMbc4Mx0idYrRmOPqlSt7mTlmfm07wCzEkpeflyolznttN1CpAEhpRmke3C
  BYzF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLvAdoCk9mXgncvldApzABnVJdkAZySkk
  iQkqqgWm7X4v7x/0dXsFOocKNO/3r76nVOK94dfNy2W/RdNZLFXtemxl/5e3a8flh/oxSycl3
  JTtFChMV63dopFn0XJvve2CyR5lYqlSO+oJSEe9P23t/Jy09LRrFpfFoBt+dyuSvj8KOn/T7u
  iB09v6EPEWZ93/Ztk/edy7ijdnuWpM9cVdbWt5NKd4z5ayNefy36B1Wk8XmG7zgnTd3/tLGvU
  v9f3D//asj63ToePvsWDdxtx7PCz/nLrow+cL1H+ef27l5h2189UAywOj8yZ4FuWmPmtiijA8
  puq/mDWawCS4vuy3SrmvUsdZlzpxFiQdq3po+aFfdfelsd4k389pI+aV7P99OM94zUao/+/ny
  YCMlluKMREMt5qLiRAB7djxxVAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1667809802!321156!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3327 invoked from network); 7 Nov 2022 08:30:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:30:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BDB89100198
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B1FD5100182
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:30:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cli11: upgrade 2.3.0 -> 2.3.1
Date: Mon, 7 Nov 2022 16:29:44 +0800
Message-ID: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99447

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Bugfix: App::get_option_group implementation missing #793
  Bugfix: Fix spacing when setting an empty footer #796
  Bugfix: Address Klocwork static analysis checking issues #785

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/cli11/{cli11_2.3.0.bb => cli11_2.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cli11/{cli11_2.3.0.bb => cli11_2.3.1.bb} (94%)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.0.bb b/meta-oe/recipes-support/cli11/cli11_2.3.1.bb
similarity index 94%
rename from meta-oe/recipes-support/cli11/cli11_2.3.0.bb
rename to meta-oe/recipes-support/cli11/cli11_2.3.1.bb
index 53ae95b68..cdba31e70 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.3.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich f
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9ad746b5f49c0fd53c08ca1faff1922c"
-SRCREV = "a66ae4145779c56dc0f9f98a631656417dd77de8"
+SRCREV = "c2ea58c7f9bb2a1da2d3d7f5b462121ac6a07f16"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
-- 
2.25.1


