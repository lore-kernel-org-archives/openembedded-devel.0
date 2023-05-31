Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B7BC7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:41:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8608.1685518846368641550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="106644076"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="106644076"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69E04CA1F3
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90EF1D4BEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B87B68957;
	Wed, 31 May 2023 16:40:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.23.1 -> 4.23.2
Date: Wed, 31 May 2023 15:40:17 +0800
Message-Id: <1685518820-20028-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-3.504300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy6avPqv3X7/XOwpfLMeBwRtr9+Kgn2XgeFoJuH6vaNCz1SH
	ks9v6SQyxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtpmd/ehreR4V0eq
	Due0tCwmmfRy/tU4ePGZvMBWQeTUT6q9gyuBlOjUR2kLl4tPVtJEDI9wQbO6YXmko1zUmrC1r0v
	AJRo2YPuH9ppkaD/FzyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102922

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.23.1.bb => python3-protobuf_4.23.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.23.1.bb => python3-protobuf_4.23.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.23.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.23.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.23.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.23.2.bb
index e0c9ef967..6aa4f636e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.23.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "95789b569418a3e32a53f43d7763be3d490a831e9c08042539462b6d972c2d7e"
+SRC_URI[sha256sum] = "20874e7ca4436f683b64ebdbee2129a5a2c301579a67d1a7dda2cdf62fb7f5f7"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


