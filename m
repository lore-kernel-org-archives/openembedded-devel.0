Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC68C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7619.1690875751491869790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126603510"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126603510"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92369DE636
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BBED5D5D15
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 497172FBBD4;
	Tue,  1 Aug 2023 16:42:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 46.0 -> 47.0
Date: Tue,  1 Aug 2023 15:41:56 +0800
Message-Id: <1690875717-21608-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.929200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8slUsRs8270qXOjf3A4DTYuFLGPRv0WdxQkHDfOylHeWPlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSznBi9T+cLbUDjZs
	vXM2g+AQXKz1b01aiY6FN/GZu3IyAWTQeXC2BhyUBpqJPC9VKdhO6vufJN/GOcbVb9sjEzelRW8
	eKzPlHWiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104197

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_46.0.bb => rdma-core_47.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_46.0.bb => rdma-core_47.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_47.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_47.0.bb
index a6927f566d..ac417435ce 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_47.0.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch"
-SRCREV = "f2789cbd394c5839e8942d585a494ab72fd97e39"
+SRCREV = "ccb120cc7b7faceca90cfa55189a1b35b0adc78d"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


