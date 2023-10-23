Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BB5C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:47:25 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.136597.1698104843040756738
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="124954345"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="124954345"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:47:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7076CD6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:47:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AABE2D9686
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:47:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D43EB6BA6C;
	Tue, 24 Oct 2023 08:47:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 47.0 -> 48.0
Date: Tue, 24 Oct 2023 07:46:50 +0800
Message-Id: <1698104810-32203-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-0.929200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8slUsRs8270qXOjf3A4DTYuFLGPRv0WdxQkHDfOylHeWPnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFETEt4m25yHgwTHt8+8eGr77W+
	zobPL03MsncUcwz15unqHJnYxPfKCGZgJYbWoPRE1xzfknfDUVeJs0B7r+6t8osCf70oBVvOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_47.0.bb => rdma-core_48.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_47.0.bb => rdma-core_48.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_47.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_47.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
index ac417435ce..b9e07604d2 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_47.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch"
-SRCREV = "ccb120cc7b7faceca90cfa55189a1b35b0adc78d"
+SRCREV = "3e039515b959fea70356b010ed093e43cf360e99"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


