Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8E3C636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:11:45 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3796.1675843895417818749
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=w5IVmSMF;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843893; i=@fujitsu.com;
	bh=SX+sHlt6yTHOY76vdjLQX9wGi897LP83ccxSkzk1Rvs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=w5IVmSMF7LzSvehOkYWNCdVh1KhbMrL0q26BpVoMBhFQNesZTuTseVZhM1Ox7MbQA
	 oxHdHsG+69oq+6QlS6rUyMd2cdMNFGplD/ku6OcLkW54Lzy3rlZggJcTD4mAreN795
	 KEN0+TrQ9dUSqD7Shdt8Kl9h5XhBWOhJ+wotPsv/Scqe3Aaxi+3Ais1ChS26OhtFUc
	 aU4Sej4whKjOgcQ0xgWZlVmTDrA4dAaZ6C/nJLrUFXgD84XOX3GbhM9vDLGwVKRGVA
	 It4L8rMqwEWwfpmoI3Kaotz6NJZBHqsna8ZeR3oYJ9D2XUWx/gVITYWlCYcXGOlfmr
	 LB+q/HgZCTYMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSdc08nG
  ywa9P0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bquwtYCi5zV8zay9nAeJyri5GTQ0jgCaPE
  vOMOEPYNJonDO8q7GLmA7D2MEvsWXGEGSbAJSEncuP+fDcQWEdCXWDp7D1icWUBF4sXvHnYQW
  1ggUOLG2i2MIDYLUHzvpz9gNbwCThLbv58EsyUEFCSmPHwPZnMKOEu0fZrGCrHYSWLHrgNQ9Y
  ISJ2c+YYGYLyFx8MULqF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYxMqxjNilO
  LylKLdA3N9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjEC
  AzelWN19B+ORvr96hxglOZiURHk9xR4nC/El5adUZiQWZ8QXleakFh9ilOHgUJLgjQgHygkWp
  aanVqRl5gCjCCYtwcGjJMIbGQqU5i0uSMwtzkyHSJ1iVJQS570K0icAksgozYNrg0XuJUZZKW
  FeRgYGBiGegtSi3MwSVPlXjOIcjErCvAFhQFN4MvNK4Ka/AlrMBLQ4RPUhyOKSRISUVAOT5yX
  DOVEKk6cesDySvTDdS3WNdYLvibCM3ACfW4YO9aXrDlX+tDmxYJU5u835/vMqQtfPaSzkl7hp
  /i7S+w+35sp+htAjp1SeqFg0zWjjZcls3HX+1okHbAXs/1Y+6k6V/S3z1t7+CPcR35XS5stMX
  shPVhBNmi9r46UdGfxAtlDlZs7p2ulXm3lrHopm6Rce9Tjdenbh4c+f+v/Ehixc3lp9OHnhgd
  SGilq3TfKLTXK37bi9yDbrTp/T48Xn1tzQKLZ77tquwXsk4t50FnfmvEPuH2abc127vvWB2fN
  PM7R2NaezVgVdu5nxPnfSv3217JFXZncnv3tdvzx5tVLZ0evGXCXmclEXY3tzj5YqsRRnJBpq
  MRcVJwIAkXTbM1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1675843893!366555!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15515 invoked from network); 8 Feb 2023 08:11:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:11:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3028B1000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:33 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2431B1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:11:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-migrate: upgrade 4.0.1 -> 4.0.4
Date: Wed, 8 Feb 2023 16:11:16 +0800
Message-ID: <1675843877-11285-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
References: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100980

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Correctly obtain database URL with SQLAlchemy 2.0
  Remove legacy future import in Alembic templates
  Add SQLAlchemy 1.4 and 2.0 to the test matrix
  Switch to pytest as test runner
  Support "check" command #502

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-flask-migrate_4.0.1.bb => python3-flask-migrate_4.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_4.0.1.bb => python3-flask-migrate_4.0.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_4.0.4.bb
index 7d3ac9e32..d9df2a427 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "f62b51f9cd2c4f444deac111726a2335d0b846dcf51909a97e261d2098b816f7"
+SRC_URI[sha256sum] = "73293d40b10ac17736e715b377e7b7bde474cb8105165d77474df4c3619b10b3"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.34.1


