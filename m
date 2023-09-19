Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BC3CD5481
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:32:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2257.1695108767719414808
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132120094"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132120094"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:32:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 20C09DB4C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:32:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 59647D5EA6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:32:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 79A3A2FC6B2A;
	Tue, 19 Sep 2023 16:32:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iperf3: upgrade 3.14 -> 3.15
Date: Tue, 19 Sep 2023 15:32:31 +0800
Message-Id: <1695108751-7108-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--0.796500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfO6pZ/o2Hu2Yc7F
	l0igGfZUzhfv/1R9tn3G04KgnWpcvz13WcdbGR6Q8t4fUUGeErQgKggaKNIx/QfxTM57BPHD7P0
	f4RQxQyUi+t+0AiFaYscG+qFF0Dyylwt7DABrvp86N/cDgNNi4a4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcn+31FV4eNUZc6s/cImJVago12KvcTE/NWAWM
	rpvuYQYdRETCYsZOX5LKiYlYvwKrNW1W6Xv6UixfTxwUx4xzUZeKLPPSQikLf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104966

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Several bugs that could allow the iperf3 server to hang waiting
  for input on the control connection has been fixed.

  A bug that caused garbled output with UDP tests on 32-bit hosts
  has been fixed (PR #1554, PR #1556). This bug was introduced in
  iperf-3.14.

  A bug in counting UDP messages has been fixed (PR #1367, PR
  #1380).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-benchmark/iperf3/{iperf3_3.14.bb => iperf3_3.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.14.bb => iperf3_3.15.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
index 13f620f633..156bb5a3e4 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
+SRCREV = "917d2f02188f6f4cdc443df7923a4bde72017d92"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


