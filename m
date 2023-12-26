Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAA5C46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:06:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.76577.1703574382063900943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="133012886"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="133012886"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:06:19 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 22328D64A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:06:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 56CC1D88CE
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:06:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFF721EB6A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:06:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A5FDD1A0072;
	Tue, 26 Dec 2023 15:06:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opencl-headers: upgrade 2023.04.17 -> 2023.12.14
Date: Tue, 26 Dec 2023 15:06:05 +0800
Message-Id: <1703574365-12941-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10-1.731400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3IFFT9wqfr0CtGYG0znilPnGwx36cSE1IY6
	e+Xi1ah9bJcQH3furV3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6ikH
	ru3t9E8h9Q2Y6OGct0kaLRhRBNYcSQdWtq+pUZagyfU9tW0aYHMppTihB8mGV/GTJfGqCeYQmnq
	3lr1MlYC611wGLfqe2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107793

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...pencl-headers_2023.04.17.bb => opencl-headers_2023.12.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2023.04.17.bb => opencl-headers_2023.12.14.bb} (91%)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2023.04.17.bb b/meta-oe/recipes-core/opencl/opencl-headers_2023.12.14.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-headers_2023.04.17.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2023.12.14.bb
index 6ffaf68ea..8b1c79566 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2023.04.17.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2023.12.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-SRCREV = "4fdcfb0ae675f2f63a9add9552e0af62c2b4ed30"
+SRCREV = "2368105c0531069fe927989505de7d125ec58c55"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
-- 
2.34.1


