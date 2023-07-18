Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EA2C3DA41
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.729.1689654365794287060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124342493"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124342493"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23826CD7E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 58671D946F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DDC4520077821;
	Tue, 18 Jul 2023 13:25:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iperf3: upgrade 3.13 -> 3.14
Date: Tue, 18 Jul 2023 12:25:08 +0800
Message-Id: <1689654348-30702-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--0.803900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4BRzUPAqhCjtg+TAEhU/xSFdMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJoghqh+u1IaR7SHCU59h5KrGUpb//ZJZA4sEguqiGeZ5Jo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJhIM8Dc+sPZ+BjuSPePxJG3R1Ojy1NKijze2
	qjpGDRbWAEAF+tw1cmwChzj4nHBx46MQVrdM3YAs53SMyWA+mFTqTTD0KY30n+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103898

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-benchmark/iperf3/{iperf3_3.13.bb => iperf3_3.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.13.bb => iperf3_3.14.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index 62a95b303c..d181eb3b02 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "f48e7fa92b8932814f3d92f36986d51be9efe6e0"
+SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


