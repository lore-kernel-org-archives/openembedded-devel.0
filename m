Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962D5EB8FA2
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:07:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2604.1693966015120303518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="132258714"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="132258714"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:06:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9163DDB3C3
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:06:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DEE86D9684
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:06:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 578652007684B;
	Wed,  6 Sep 2023 11:06:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] traceroute: upgrade 2.1.2 -> 2.1.3
Date: Wed,  6 Sep 2023 10:06:41 +0800
Message-Id: <1693966001-15193-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10-2.643800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysZ80RiFHbW3Xt9
	w3NN+CM84CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0544jqjGwEhbwShEz
	I3+mkzieIBobZi+wI4kWrptXytpK7oc50oBUFVx+eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZAEIKbOeU8WTzc2somk2YKeyuUX41kGd/16rTbgg3bLfbyMBNIDq0tZDd6KYEhmS0NbP
	NqcQI8tUFww8takJNxE+OrdGGuG+QQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104767

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix command line parsing in wrappers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../traceroute/{traceroute_2.1.2.bb => traceroute_2.1.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.2.bb => traceroute_2.1.3.bb} (94%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
similarity index 94%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
index 51b581a4c6..ed75ba34de 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "507c268f2977b4e218ce73e7ebed45ba0d970a8ca4995dd9cbb1ffe8e99b5b1f"
+SRC_URI[sha256sum] = "05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.34.1


