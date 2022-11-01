Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1CAFA3741
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:08:17 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.1634.1667268495884327372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q8MTwsf3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268493; i=@fujitsu.com;
	bh=01kgxmz4z67PAUAWbdwVpnNH2YPSZGS/viwewkYKNFw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=q8MTwsf3ZvlEgR2THl7X3RQX1NZdtd67P2EEJ9eqwfCMvfALY5Wr0AJY7GXTICT+7
	 M1FxWOigps1cN3fEew8CtpoZJoJYg/YtEVvKSn/uj/bDYLQTTSTPWRLyYbqGpWCt8q
	 M5Sw9dvXdthyvprpuMrFiyh1FeM6AZ1xESTVXvA4Xv1mNf9CKMGIB0wCankmhuHfCI
	 ZAYmz0mRqomDWVoTp4EHKKWD8D3P+IZWrobNHtmcmuTCooY8cBGolkbYpIdbwkd6pH
	 D3rScRa3Ymfejtu+Z/hU7+1pvRRiCDUg2j+9Fu3HCPTiopoedqfgWC4OaapHmP2Q+R
	 5dhzWek3tqMgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSbenPiH
  Z4M9jJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN3ZgNzwWaOiocb2pgaGG+xdzFycQgJPGGU
  +PboCyuEc51J4ub0CYxdjJxAzm5GiX1/bEFsNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQU8JDZ9mA4WZwGKT3t9l6WLkYODV8BJYsmNBJCwhICCxJSH78FKeAUEJU7OfMICMUZC4u
  CLF8wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6Roa6CU
  VZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhmJKsUrfDsa3
  y/7oHWKU5GBSEuX9L5GQLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN7IGKCdYlJqeWpGWmQOMC
  5i0BAePkgjvr2qgNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHmdaoGKBECKMkrz4EbAYv
  QSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeBpBLeDLzSuA2vQI6ggnoCLb2OJAjShIRUlI
  NTNmKJ2x0HgVMvP9WcGHmu/BsRuMTj++K2dpcav/wsC8zWk6eQyHnz/LpHA/4SviPnH+WlHQo
  8GJnVILpx8nTpRs6Mzxjcv0V3jif4ez9EPH+1X7B5LCTVdIbwu1fHuV+/3X7QWe//i/vjeMCC
  rdMCjS7NDfG/OKHD5fnv2LV+SPTnvk++diuj2+s53xkaxE0Pjz9UKrNC8F8pd5lJh8kupbMLy
  p9ez1mCctv2YQ7f/Z94Z4iJrZgc7hKJJ+TvDKn3PO5B/p/CKd+zCvs4eK65aKx49PcHT0znOJ
  cLy75fXJesfSrz1c1baOS7JfL+d9fmHpauEog+mfzy+BIKyn+aRHaD4Nvn7o52U9E6/i8NUos
  xRmJhlrMRcWJAGFJVSRMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1667268492!4738!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24026 invoked from network); 1 Nov 2022 02:08:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:08:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4C2EF1000DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3FF0F1000D7
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:08:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-nmap: upgrade 1.5.4 -> 1.6.0
Date: Tue, 1 Nov 2022 10:07:56 +0800
Message-ID: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99387

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-nmap_1.5.4.bb => python3-nmap_1.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.5.4.bb => python3-nmap_1.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.5.4.bb b/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-nmap_1.5.4.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
index 828d7089b2..0a6de2d6b6 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
@@ -8,7 +8,7 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[sha256sum] = "cd5b0180d4d8cfe96c33e5e7956fa011379af108e2e8291b84e933b6385856e9"
+SRC_URI[sha256sum] = "892b5091cde429fabfb8ba63382b2db8fd795193ba147558d0a7d5534c956255"
 
 inherit pypi setuptools3
 
-- 
2.25.1


