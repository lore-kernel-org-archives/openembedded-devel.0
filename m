Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AD4C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:17:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.191029.1673939829366786331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RGlpfNhh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939831; i=@fujitsu.com;
	bh=ouWFTtwd/2ie4e5kH58BoxL00Iz7TERf0IRPzEo5jr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RGlpfNhhQhoabUbtpjDqbnbfTU39m4BLo2TwnetzWr11I1JdhqpBkbmfHlArDf7D1
	 UQYCWG0Mu9gkv8+Y/1JXoHckPk4MN4KhAMbPAW7+ISEwejWFY3WkfhmlRI/NnitjBK
	 UClsO10mJKc7qfqi6+Z4zzgMsS0RWx1iXyXSmQN5SaksRh7jiXA34vDRXhbTn9+kmB
	 Cd/30GmyGBUmuvneChwjU29xqnkTsBAm6Hw7yhzrbw2VwGcg/EX3fNatNPeERdkXH+
	 Nki98eUPBpTFgxUyrF5kVP7//YrnuBDbxdixpZDnxkRtp4hGb7k0NvyUrc7RyiR5Z9
	 WOtvmyQa1YO2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSbfM+1i
  ywfY/JhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bbHOGCA5wVd9YcY29gPM3RxcjFISTwhFFi
  1/VDrBDODSaJjgftQA4nkLOXUaLrZzSIzSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfPewgt
  rCAk8STrSuAajg4WARUJX7uDwQJ8wKFn+7cDzZSQkBBYsrD98wgJZwCzhJtb80gNgF1TutjhS
  gXlDg58wkLxHQJiYMvXjBDtCpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQvYGRaxWh
  enFpUllqka2iql1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5da
  sokRGLgpxQncOxgfLfujd4hRkoNJSZT3pOmxZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvKe8g
  HKCRanpqRVpmTnAKIJJS3DwKInwhlsCpXmLCxJzizPTIVKnGBWlxHkjQfoEQBIZpXlwbbDIvc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPeJB9AUnsy8Erjpr4AWMwEt9ig5CrK4JBEhJdX
  AFPFIbOmn55e+6ATzqmRUPWQOUk1ScHh0SsRfyYc5XvrIpxkhvfN2OMud3ux8KfPXtDQ+5kNy
  uY3Jmg78ly97npmd3mV27YhU/JvVq7+/XyL3Ys3GnbaLHlgn3n8YWMnaNlW5Rtju65GcgIX/Q
  6evi8teEPWavdM4WvZ9taG+keJNpRiDorhnE+sEKneretrE5ofJpPfLVO3/7GKw0mlj8/f0OB
  cVeampDg1r3rNcLgi5IXZsY9W0mJ521o3zjmzQyp78nVFAY+KaXXw7dGOMiq+lNJT8/FrYHJU
  h99HQtvy+2fsX2rZSnYvi7v06y/e3cdr8FK7J+yY1CYpOjWKzOl2u9TVc6/dT5UNv808rsRRn
  JBpqMRcVJwIA6zC1j1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1673939830!378640!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28884 invoked from network); 17 Jan 2023 07:17:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:17:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 530F81000F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:10 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3645B1000D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:17:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libtracefs: upgrade 1.6.3 -> 1.6.4
Date: Tue, 17 Jan 2023 15:16:25 +0800
Message-ID: <1673939785-20072-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
References: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100603

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtracefs/{libtracefs_1.6.3.bb => libtracefs_1.6.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.6.3.bb => libtracefs_1.6.4.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.3.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.3.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb
index fbb6b76d1..73620f37a 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.3.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "3395d484eadfd8ab38311032f28e7f79c4f0e33b"
+SRCREV = "af49d832f46631597e0aabb2302bd0f56a9cad29"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            "
-- 
2.25.1


