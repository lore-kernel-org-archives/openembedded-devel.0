Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3631C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:26:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.40207.1681115208365467406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EhLykpXQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115206; i=@fujitsu.com;
	bh=dIpRlN0upDcL2zDNFEwfHe/87x2MFipCs2ka0I9g2mw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EhLykpXQiFANslQJ5OblWKfY4Dt91a7KI3c1MaQrkFPEWi+dmuQce/98IteZyDvce
	 FW8qFNQbZIYA/b5vLCkBvPyOGwX2FJuFrMedT78iMtlcj9wVaZB8U3Bcu+7iK11fef
	 JUuK4Pi1pGc0PPQaQubbbCTtpU+/mYRk93SrmH06WtVYeHQxuky+qethwUnd7NQ6VA
	 AP0RXLNBUBaYQwT1xYea3JpaD+WqDi7BeJafvSuCFPgvPQWeh6j2Xi1lOwiolAAK4e
	 JO3EdvW+YceWFEMw5gCRAEuDqndrR4i1K6ZKimbEy6+gLgy+OFi7pckZLvJh7DOo4t
	 UGWcEHBYZwANQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpOt2wjj
  F4P8cbouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPqwia2gpM8FWcm7WFqYFzG3cXIxSEk8JBR
  4uaqUywQzhUmiaNzprNCOHsYJTae3sbexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgK2Eh17JoLFWQRUJT6f3c0EYvMKOElcurGbBcSWEFCQmPLwPVgNp4CzxOOTq8F6hYBqfs
  66wApRLyhxcuYTFoj5EhIHX7xghuhVlJh9uRlqToVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbqGeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBwZtSrDxxB+OK3r96hxglOZiURHm7uIxThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwL
  jwAlBMsSk1PrUjLzAFGEkxagoNHSYS34hhQmre4IDG3ODMdInWKUZdjbcOBvcxCLHn5ealS4r
  y9IEUCIEUZpXlwI2BRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+2w0BTeDLzSuA2vQI
  6ggnoCC4XA5AjShIRUlINTGa9pvvmTH6oPask+GjeRuE1HT491h9nnzVf5VgRmrut+cnnkInt
  YlNS2ZYdW+d7YuKiwuB9vy9e6olJmD57865r2ytuvpcok/iy0t2ptybrG2+7RLZv3Kow4wmKm
  6RLHy3ZsOJNe6CWz5QDl1/ITNe6yPrk/IuXNydxSNS3led5rf6XtZzXfyP/vG1nY+0lttXf/O
  JgUxrh1sATmMR0505a97SF9ddc1pl+4eS/5W0S05aQ3Or/VC3ysz2fZG3xlB25PJs4O5Wb33w
  8PV3SOGcpc/R+A6GKT6c3a2Zl3pIqu5b/YvexXQ82tHWo/db9F1YgfDhos9+1iftjNLdVn+B8
  7Jg+J9l9jfDNYr+D85VYijMSDbWYi4oTAeGY8mFlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1681115206!349914!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18269 invoked from network); 10 Apr 2023 08:26:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:26:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D08361CD
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:45 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C56761C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:45 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:26:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwloc: upgrade 2.9.0 -> 2.9.1
Date: Mon, 10 Apr 2023 16:26:05 +0800
Message-ID: <1681115165-24320-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
References: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102009

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Don't forget to apply object type filters to "perflevel" caches detected
  on recent Mac OS X releases, thanks to Michel Lesoinne for the report.
* Fix a failed assertion in hwloc_topology_restrict() when some NUMA nodes
  are removed because of HWLOC_RESTRICT_FLAG_REMOVE_CPULESS but no PUs are.
  Thanks to Mark Grondona for reporting the issue.
* Mark HPE Cray Slingshot NICs with subtype "Slingshot".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/hwloc/{hwloc_2.9.0.bb => hwloc_2.9.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hwloc/{hwloc_2.9.0.bb => hwloc_2.9.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.9.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_2.9.1.bb
index 51ceb4c26..7e8cd5f39 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.9.1.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
 SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2070e963596a2421b9af8eca43bdec113ee1107aaf7ccb475d4d3767a8856887"
+SRC_URI[sha256sum] = "7cc4931a20fef457e0933af3f375be6eafa7703fde21e137bfb9685b1409599e"
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.9/"
 
 inherit autotools bash-completion pkgconfig
-- 
2.34.1


