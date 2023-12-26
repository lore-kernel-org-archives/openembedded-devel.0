Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FBDC46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 08:40:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.77299.1703580006200228491
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 00:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="144634556"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="144634556"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 17:40:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6418FD4F51
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:40:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A6403D5EA0
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:40:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 28B93200932D9
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:40:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D6CFA1A0072;
	Tue, 26 Dec 2023 16:39:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opencl-icd-loader: upgrade 2023.04.17 -> 2023.12.14
Date: Tue, 26 Dec 2023 15:52:11 +0800
Message-Id: <1703577131-13597-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.006
X-TMASE-Result: 10-2.884800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJou+DE4VrL3yYaDCzqDR7DPb+nFx78OJTaoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJQUS1UnD8R+8vuMuhYOOeIq4ykud4tS1HgWz
	P3zh3CSYBIHhqDFDAfFAieONbpMTcGp/qe+CPc5YjN8qtJHeGWS+PVVuXgXyL+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107806

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Synchronize with OpenCL v3.0.15 specification release.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...icd-loader_2023.04.17.bb => opencl-icd-loader_2023.12.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-icd-loader_2023.04.17.bb => opencl-icd-loader_2023.12.14.bb} (96%)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.04.17.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
similarity index 96%
rename from meta-oe/recipes-core/opencl/opencl-icd-loader_2023.04.17.bb
rename to meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
index 925053bd6..6bf01a248 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.04.17.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
@@ -13,7 +13,7 @@ RPROVIDES:${PN} = "virtual/opencl-icd"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "b1bce7c3c580a8345205cf65fc1a5f55ba9cdb01"
+SRCREV = "229410f86a8c8c9e0f86f195409e5481a2bae067"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
 EXTRA_OECMAKE:append = " \
-- 
2.34.1


