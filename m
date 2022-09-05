Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D11C6FA8B
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:02:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.22552.1662368552852442953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MLKKvGTC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368556; i=@fujitsu.com;
	bh=XSOGvVEvFkKscL7gSO6BTwT+vIrGZfcE/p0Ks6cSSqs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MLKKvGTC6Fh7DR3DzXywmNLwcnL0uUOSL+/4jdZoI99OJskEle0VRGkd1VFqdR3Hp
	 WO69tvWOV/5hFGp1fUo6KD+zKW3MF2fmTwaadVs3yMhVxWVxYf+Oj7gfchJIdE7WtM
	 IuzEaOBLetEJ+kMMdeEj4kAotSSw+ybRECDRNnbYtqd1mQYX6D+n+L1fgtaMYJj2Bn
	 jE+RViFKphQqT1L3R2FQa/d0In5spC6g6TDgqjVNd10D5k/ajfDFOSu1hi2nrarCQ4
	 B53HBAq5h2alBUAgHOs7Hj506bY8dGWmxEM14Ug9DuM8b1wzZJ/LfHAVKEX9AXxuoY
	 /S+cXMsFYGBQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpKu9WzT
  Z4FOnisXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHncSdrwR+uik0nWRoYX3F2MXJxCAk8ZJQ4
  cOgIexcjJ5BzhUli0YcIiMRuRondK+eygCTYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHr
  FlYwFZiysXHYPUsQPFDnw4zgdi8Ak4Sx+Z9AYtLCChITHn4HqiXg4NTwFniSpMbxF4nicevXj
  BClAtKnJz5hAVivITEwRcvmCFaFSVmX26GGlMh0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo3VSUWZ6RkluYmaOrqGBga6hoamusYWukaGRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuc
  k6KXl1qyiREYwinFald2MO5Z9VPvEKMkB5OSKO/7OaLJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4V+4AygkWpaanVqRl5gDjCSYtwcGjJMLrvw4ozVtckJhbnJkOkTrFqMtx9cqVvcxCLHn5ea
  lS4rybQGYIgBRllObBjYDF9iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxcIFN4MvNK4Da
  9AjqCCegIuz5hkCNKEhFSUg1M4fcTNq6X2fL55XLOOz4zT1x6vfzuU51pl94ovJrddS2XZfK5
  rZvk/D89nZ40xexUuD7vPI+jM6w/Wf7W+pVr1f/sf6qu582mDfMv31xa9++TU8qLY+Hbf5kbl
  /ja/ZVSTb+udVXwgqXqxzfuG93uCU88nadl94vrXIzm6tsVJyt/zy5b3R1U9jzGycjNMGz7ub
  c8p6/sZ3t+iWlmoceSJdY1p+Kf3JgZvyZtNsv5624p915fuRySvOjNxvuvt6+zSXyZdcoqVMh
  18uardx7az16ydJeJyTX7MOHC/xemMCUmGL9nq7q5/GNY6rZLby7Ol7/heOOoK39vaeWHbfJN
  8yWirhRqKpwofua5ruuKzObnSizFGYmGWsxFxYkAEd8R2mgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1662368555!359992!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7014 invoked from network); 5 Sep 2022 09:02:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:02:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 40F491B8
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:35 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3528D1B9
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:02:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cli11: upgrade 1.9.1 -> 2.2.0
Date: Mon, 5 Sep 2022 17:02:08 +0800
Message-ID: <1662368529-32226-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
References: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 09:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98661

License-Update: Copyright year updated to 2022.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cli11/{cli11_1.9.1.bb => cli11_2.2.0.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_1.9.1.bb => cli11_2.2.0.bb} (67%)

diff --git a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
similarity index 67%
rename from meta-oe/recipes-support/cli11/cli11_1.9.1.bb
rename to meta-oe/recipes-support/cli11/cli11_2.2.0.bb
index 7de3335abd..a035c27a3d 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "C++11 command line parser"
 DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
-SRCREV = "5cb3efabce007c3a0230e4cc2e27da491c646b6c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ad746b5f49c0fd53c08ca1faff1922c"
+SRCREV = "b9be5b9444772324459989177108a6a65b8b2769"
 PV .= "+git${SRCPV}"
 
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=v1;protocol=https"
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


