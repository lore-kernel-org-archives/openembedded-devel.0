Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F323C05052
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2726.1713318103627840586
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S6bCpJ0q;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318107; x=1744854107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EndxO8yTDQxLghGBqbljCEpR0G5WbHic0pJlCUzwxL0=;
  b=S6bCpJ0q5PzGuYrGsV+3yNd27mrLJR1XhnERhZHOmtbwa7gb/xLreeKm
   STBy5byfWCMCtg/+5zH1h7yzeVwVhAd3xV0z5SCJtyPF/invjKn/IO741
   ZBhC0FRj+ewwzWvVpeKxiS9We5k0wRXy84gySPKkJFPxTKIuArkQUVlc4
   MhuTVOcdG6RaRneIxyRFHz+IUVmapbYtSRSneruhdbBpkj+vZDb3cP1OA
   6a6VvR2u7PIa5R2djpMJAnw58lQygCUN9ioUEUSQJrZDHRWpfIYWX/0wW
   jY/pVsEoSkHmZwkfe5Y6D8aMfUO+A0Hq6c3r4F9nvZOBXQV6OXHmV8L5i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135076066"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135076066"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C56C2D4F62
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E44C1660B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B8E82007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 085FD1A0002;
	Wed, 17 Apr 2024 09:41:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 42/49] rdma-core: upgrade 50.0 -> 51.0
Date: Wed, 17 Apr 2024 09:40:54 +0800
Message-Id: <1713318061-17128-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-3.930600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7S4n9bqPhfH2+nQ
	k6dUeFKNUtrCeQ5WKVZZLssvIGkU4y9Yu0mNbmByEhGH3CRdKUXAmOfzKotTojoUdFbHYUawLYg
	IvATsfpchf5SaZLASRw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXtLALfOrPJxTfl0
	PvqvMF98EZ1SLPkKuVxY2IFpLfAO+nbZwEx097TZ1U1lojafr/VeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWZbmAaG1kAaL9k4RA4/or+KRyGVbOcQANTshloEvZD4xzskN0W7JMcrSCB
	HddwkvNOAvncP+QPqevMJjLl13hZdViRFJeizYRiW2eA9nSDIFPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Merge pull request #1444 from yishaih/mlx5_dr
-Merge pull request #1439 from Kamalheib/qedr_pr
-mlx5: DR, Using sq ts format when RoCE is disabled
-Merge pull request #1440 from Honggang-LI/doc
-librdmacm: adjust ECE function name in man page
-providers/qedr: Remove unused debug files
-roviders/qelr: Replace DP_ERR with verbs_err
-providers/qelr: Replace DP_VERBOSE with verbs_debug
-providers/qelr: Remove unused macros
-Merge pull request #1438 from amzn/fix-rdma-tracepoint

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_50.0.bb => rdma-core_51.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_50.0.bb => rdma-core_51.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
index ab4de22a5..7c26a8c43 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=http
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
            file://0001-include-libgen.h-for-basename.patch \
 "
-SRCREV = "bc6b4bc134532e952fe7f8efc251e1f89b912098"
+SRCREV = "6cd09097ad2eebde9a7fa3d3bb09a2cea6e3c2d6"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


