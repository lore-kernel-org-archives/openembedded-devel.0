Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8447FC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:36:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.37710.1670830583680104233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DmV0auTi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830581; i=@fujitsu.com;
	bh=c51Nb9ic3qkLe63sHIB8N+vHuQhbCdRGQYMqVrABpHM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DmV0auTi5Lv/zbL54iOscwkquecHduDUyPbywzp8aX+ZKg4B2vXKf4ZeRkgedKvl+
	 MBFptT+cL/p4ZMSTgTRLRk52QYQ3nkPNMXMFxrRhtwgxfkemGe3JI+fokg51oa9u5/
	 JDfl1eR/Qj4lEheRKKzA/1QM9/8ITh+kTODznfsMhSBWuJXPFUL8V1Lo3H4jN38pxp
	 VjZ0qa//BM5wLAmP2/1Tys/YPydearNbWJLkL6kVGQbsZi8kImXWJY2+Y8bBt0Z5Yc
	 F8xFMDrZVKbJjAJkos6CdAhlELoY7F2X+1j+6B7qF1mJhW+h+WVGn83Tlj2vrjJRXD
	 Lsz4HRDUz6OjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqPv15rR
  kg2MrZCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox1j+4yFxznrDj4cAVrA+Ntji5GLg4hgSeM
  EuuatrBBONeZJCb1PGDqYuQEcvYwStz65AFiswlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJdG38gNYDYuAqsT6PZNYQWxeAUeJO/1HweISAgoSUx6+B+vlFHCSuLe5mxlil6NE0/
  4NjBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYtTi8pSi3QNjfWSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQLDN6U4VWIHY8PyP3qHGCU5mJREeSuvTEsW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MG74RpQTrAoNT21Ii0zBxhLMGkJDh4lEV43kFbe4oLE3OLMdIjUKUZLjrUNB/Yyc1y9cgVIzv
  zadoBZiCUvPy9VSpyX/QZQgwBIQ0ZpHtw4WLxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCT
  Ma3MdaApPZl4J3NZXQAcxAR0U9XIqyEEliQgpqQam3KgTfQ+2eXGxCu7d8qmOo1M5YXPGGban
  vRocB586GgpPvPlsZWAYl9E+7mUybbuvKbBk+sz93Wi8807TkuqZ/Rc3lCoESfct3NA468aJ3
  hObtkRfuqaz8eaFaVqPYmN33Pd0X2upV7TrpPjCfd9UFE4ey/OMyemft5pt0bItzOmrDmtPMm
  zzve6zYsbZ56l5PVue3C5ZOWP2D2aW/ks1e5gv3lvs+6vqffch1ZluZwMrtvU84YzcHOjC09O
  XutSyc6p+G4PihusvUhym9J0/6yWuNOdb09k3Tzdwc08tySw7+Ub7pK7TZWEmNb4VC97MDlqi
  cs1XUPf43n03m5cUrGuf/mj+3AWLb3nN0lv5W1mJpTgj0VCLuag4EQC3sciIcgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1670830581!138785!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2550 invoked from network); 12 Dec 2022 07:36:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:36:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DF027100192
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:20 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D276D10018D
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:36:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xfstests: upgrade 2022.11.06 -> 2022.11.27
Date: Mon, 12 Dec 2022 15:35:45 +0800
Message-ID: <1670830548-3059-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
References: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100041

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.11.06.bb => xfstests_2022.11.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.11.06.bb => xfstests_2022.11.27.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.06.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.06.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb
index 1c1a176a6..8c791a7e6 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.06.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "41f2bbdec5faa5d6522e86e63c1f30473a99dbfe"
+SRCREV_xfstests = "1e8502082ca94addc20b7cb0e86cbc6af397ebe0"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


