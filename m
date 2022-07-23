Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA31DC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:31:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.2556.1658806254517837954
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CA0DRDn4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806252; i=@fujitsu.com;
	bh=QATUNe5x3+uR/+ZXv9xm+FI/7EydBxW+QD75sP0gHOc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CA0DRDn4JCIdcrmx404/q4D6B1Xv0qG1/TvQHQXE/uwnR1+hIFCrChagV69TuVA0r
	 gsXsF+tcRIbLuJWy6yYIQLirrTBtaWBIyNcLm9RiZxI9inMBGmhWqISsDreORbPQhG
	 NVWM8v99iJB9bK9mCcCrWu6GpV2gn7wJz/2g3UBTqIQfIuDAwWrQzVrHiPHwrcpWVg
	 rutcCBSZRsvLeRhJhG6iYNVo7IHPQ/yFPAsWUMWXT/rr0pQmc6KedPbm5PSj4np42r
	 LKajxwD1qLPEeXNAwK/ivknxj/BXgS/QK/4mBAVa5xOYr7xO36sdH6zmgN9ql/ukws
	 3YMQfc2UONIKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqPs6/n6
  SwbLz+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aCFUfZCp6yV/zatom1gbGHvYuRi0NI4Amj
  xM7VX5i7GDmBnOtMEtd7AyASexglHiyayAqSYBNQk5h+6waYLSKgL7F09h6wBmYBFYkXv0Emc
  XIIC7hIfPz4jwXEZhFQldj/uYuxi5GDg1fAUWLf1SSQsISAgsSUh+/BWnkFBCVOznzCAjFGQu
  LgixfMEDWKErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIGRfxaS9llI2hcwMq1itE4qykzPKMlNzMz
  RNTQw0DU0NNU1ttQ1MjTWS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMqU
  YvWrOxg3r/qpd4hRkoNJSZR3S+e9JCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvK/j7icJCRalp
  qdWpGXmACMEJi3BwaMkwlsaA5TmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ47wqQGQIgRR
  mleXAjYNF6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwbyow9oV4MvNK4Da9AjqCCeiIT9p
  3QI4oSURISTUwSXVN3mahU/s6pmmfnvw9RrtpN7f/c7zdxWLZNfcTM1e7BrvsbtP8H4cXXfnz
  M10/cjvn7vvnFl2t1lvKGJcp47E36LYUv8TCjFC1G5cmnVh77fyVVKvux09sM0/MvLKnfOKqw
  nk7dftCVu/+JZZeuGG1Q4914zalQxXuvte9+mQ6HmY4fX2XuMTb26zbzbg/4ODEHW9mtAeESf
  hp2rfainAG/pzTcC5s1lTTpDu7mRcGxYe/WbUh5sSrxkvLT9rsi3R4tcWCmWcdb+zZ90sPzvr
  0ayvbZK68w6s99YPZ9HYvm/6RzcZt0rnKT1uMmP2mys1fkzFb7P/RsN5ojqndJ3kzTnS7fnq5
  brvgU269DiWW4oxEQy3mouJEAK4J9UpRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1658806251!161010!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17214 invoked from network); 26 Jul 2022 03:30:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:30:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 75DCA100193
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:30:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 69DE5100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:30:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:30:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] atkmm-2.36: upgrade 2.36.1 -> 2.36.2
Date: Sat, 23 Jul 2022 13:36:04 +0800
Message-ID: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:31:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97973

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{atkmm-2.36_2.36.1.bb => atkmm-2.36_2.36.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/atk/{atkmm-2.36_2.36.1.bb => atkmm-2.36_2.36.2.bb} (85%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
similarity index 85%
rename from meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb
rename to meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
index 0342b8a9f8..a152ff2d2b 100644
--- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
@@ -14,7 +14,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458"
+SRC_URI[archive.sha256sum] = "6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.25.1


