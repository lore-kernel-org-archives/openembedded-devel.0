Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74EAC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:30:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.1165.1705973449903491750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="126248620"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="126248620"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:30:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 28606D63C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:30:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 65920CFBA4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:30:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5D022008389D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:30:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7BC371A006A;
	Tue, 23 Jan 2024 09:30:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] plocate: upgrade 1.1.20 -> 1.1.22
Date: Tue, 23 Jan 2024 09:30:21 +0800
Message-Id: <1705973421-25376-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--3.600500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrcV3n4J/0zUMUWpzATs/hIpbX
	moug+1t+SAhujIM3hn0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7hEz
	I3+mkzieIBobZi+wI4i5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3x/F
	0UMEoTu69pynG4ZdMbDz8i69MWbcfS+Bg29hFcI27RkkMU5BOCURlQ2o1SX5Fo46Cssi+8U3RvP
	X7lGaTjzXjyTrh+NXuBQ5uaIOS/ZPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108400

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Revert the updatedb change in 1.1.21 that did not open
  pruned paths; it broke pruning of paths that were not at the root
- Improve interactions between pruning and bind mount detection
  logic.
- Pruned paths are now not opened, which can be useful in certain
  cases. Note that this does not (yet) apply to filesystems that
  are pruned due to type and not due to paths; they are still opened
  and then immediately closed again.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../plocate/{plocate_1.1.20.bb => plocate_1.1.22.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/plocate/{plocate_1.1.20.bb => plocate_1.1.22.bb} (84%)

diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.20.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.22.bb
similarity index 84%
rename from meta-oe/recipes-extended/plocate/plocate_1.1.20.bb
rename to meta-oe/recipes-extended/plocate/plocate_1.1.22.bb
index 5f45d7fbd..07de35726 100644
--- a/meta-oe/recipes-extended/plocate/plocate_1.1.20.bb
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.22.bb
@@ -11,4 +11,4 @@ DEPENDS = "zstd liburing"
 
 SRC_URI = "https://plocate.sesse.net/download/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "9b3d2842a08e69633c0ffa480c139603514ce59f1d021c263e9301324976959f"
+SRC_URI[sha256sum] = "3b7e4741b4aa2ec044e53eff06474a32a3fb1e928b9382351fe79d4c27fb0049"
-- 
2.34.1


