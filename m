Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BD2C7EE31
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.6218.1684997898089563743
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105605039"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105605039"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CB90D29F4
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CDA62D9A80
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 518042008FEDB;
	Thu, 25 May 2023 15:58:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 45.0 -> 46.0
Date: Thu, 25 May 2023 14:58:03 +0800
Message-Id: <1684997886-2137-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-2.352100-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7Q6zLxCwRKltdcO
	gA4OgUBvCkexJr+06ntZ9gYJQJkxd4aw96TXEsdW4cHetH2VtnJN8rmPQRlvK5DHQ2MaZXz4frL
	Hs4UTbxB755lTx6LDRjvoQbwr2cxYGR0JdHbxArED2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpixwb6oUXQPLLm6Kwuq5YazJ1U1lojafr/QuLGuwInWNPBILqohnmeSaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrQonmjK3Al5Cetb/AOtW0yr+gFBLGGb53SKEcYNOk3qxDBnk
	sZDtI/2WqsGWOZzDUurEf1NVnVi4KiCaJfOFJ8X68yQZAXTlcB0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102841

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Merge pull request #1327 from haoyue-Xu/bugfixes
 libhns: Disable local invalidate operation
 Merge pull request #1330 from amzn/change-maintainer
 MAINTAINERS: Update EFA provider maintainer
 Merge pull request #1329 from selvintxavier/bnxt_update
 bnxt_re/lib: Remove deferred arming logic
 bnxt_re/lib: Fix the UD completion reported
 Merge pull request #1328 from amzn/tests-fix
 tests: Skip rc_flush tests if not supported in kernel
 tests: Fix get_net_name for cases there is no net device

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_45.0.bb => rdma-core_46.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_45.0.bb => rdma-core_46.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_45.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_45.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
index ed1f7c94a..c4c438798 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_45.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
-SRCREV = "53ee89b4abb1463e7ae713103f552b2bef1307ce"
+SRCREV = "f2789cbd394c5839e8942d585a494ab72fd97e39"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


