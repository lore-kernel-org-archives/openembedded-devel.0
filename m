Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCC0C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 00:29:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.5021.1642379357245313691
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 16:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qBA4vOp7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642379355; i=@fujitsu.com;
	bh=DZdfPcBCi21iEkAefBYkVKVvOVFIvjfuVIwlLBV7JD4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qBA4vOp7SPfVBSDQ5jFm4E8rwrRmYoDKU9B7sIx4x0hxZHxw9e4Xb0A/8ncxdqzFT
	 BodQtqGuVaiQTh4nECZk/rppRCIb76ilJ4WIUAn/VzhtWLLBrkHeecKamoxKzHier3
	 UAJVpsGjksnv/Y7m4NAISpj8wxwcTsVu1ZwYMzUv3w8xdPeQgUMmrev6SdvG0ka/k/
	 BjV1kqU4WtmUWl9ZSjIUy0JTa8PklTnu0IxugUbzGcwtPpElV5QX7XwJJohcpm4iWu
	 y97cH5VEWMCcxn6hcNmoCRu/MMqzRA9oTd527ZNJ5KcYzx1LVLN9T5l1vYVv18stGK
	 34LhIb/Tpqahw==
Received: from [100.115.34.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 3F/CA-28974-B58B4E16;
 Mon, 17 Jan 2022 00:29:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8ORqBu140m
  iwdmP2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ahxknsBY08FVveXWFpYHzA1cXIxSEk8IRR
  Yvv27ewQzgUmib3dM1khnBOMEhsnPWXrYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAXeLh0iVgcRYBVYlfB84xgdi8Ak4Sk/tngs2REFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo3VSUWZ6RkluYmaOrqG
  Bga6hoamusZGuoYWlXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYGCmFCvs
  3cF4eeVPvUOMkhxMSqK8IV8eJQrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4K3d9iRRSLAoNT21I
  i0zBxglMGkJDh4lEV627UBp3uKCxNzizHSI1ClGRSlx3nUgCQGQREZpHlwbLDIvMcpKCfMyMj
  AwCPEUpBblZpagyr9iFOdgVBLmXQAyhSczrwRu+iugxUxAi1d9fASyuCQRISXVwFS4fYcJf5D
  UDS4lCZNXe9gnyl/fzVibcjDp7ke/E0nl7g6ThNO4NPgvWW5cUpV/fEd12Su926aKCX8t3n5l
  NerdKPJ51r/NvD+qbjzd218ZuVZDybA0Su7/3GNh6Z+CpNNVqoJ109z2J9j/PHLW5+lqpelv+
  Tb/+3zyvJFU5jPLSu37zv4vepYuTUs04tON417D0FQROzv8ecxn9pblvheMuw8euSoTmrvnVs
  3ORDmrTWYBqSpPeQ9OUpOQsFy4ep7qSk2Oyikb7nVZ+T4LXBDd/EBn1hG3j5s+Lrtz91j0+Yy
  tTHuO/E0pf7t1QofF1zKzPaea5erX+1YxbnNkiZ85PTw3Umxe1PL63G/Cy5RYijMSDbWYi4oT
  Af/qAJ1HAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1642379354!156665!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18670 invoked from network); 17 Jan 2022 00:29:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 00:29:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5CA58100198
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4FFEA100187
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 00:29:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 36.0 -> 38.0
Date: Mon, 17 Jan 2022 08:28:53 +0800
Message-ID: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 00:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94890

Changelog:
=========
 Merge pull request #1085 from rleon/upgrade-fc35
 build: Update to clang 13
 build: Update to Fedora 35
 ci: Convert deprecated distutils
 Merge pull request #1084 from jgunthorpe/kernel-headers
 Update kernel headers
 build: Fix distutils deprecation warning during vuild
 pyverbs: Prepare code to Cython 3
 mlx5: Change pthread_yield to sched_yield
 Merge pull request #1083 from Wenpeng-Liang/fix_db

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_36.0.bb => rdma-core_38.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_36.0.bb => rdma-core_38.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_38.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_38.0.bb
index a32fee588..da1e013bd 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_38.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
-SRCREV = "d7a9dde2b164a1563c7a51e4ade8ea3b6cdea9ef"
+SRCREV = "02361e3b865995ce251923390df0d5a5c821195a"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1


