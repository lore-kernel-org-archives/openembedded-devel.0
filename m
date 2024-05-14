Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924EDC27C5E
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10785.1715677830995301832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tFyPOoSM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677832; x=1747213832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=b3GXECckwFmNWY5J9VDJWfvJQJ6Vms4949hkf++uHls=;
  b=tFyPOoSMAGaZGxUvM0xsA/RdyuytuATRN6Xy1uyNNSHmp+VyopQ0OUFC
   huiflWPcluuuYlqu6JmlWX/e99SddT/gog2BQ9/k8zNzAy+APB11mlRDa
   /jBdRGLlEXlLUT3gls1n0Xs3rbJegL5KQv9ES7Kp0AhFPrOYCupe+KoO4
   kqRhbOF94wVUPx1DBDAcJ+iqdlr2DVM3inoqz2Thr4k0BiuV4rvj7l2w0
   7y8GQb5gygNrzxTf2475jhvdmH3NdRtvhAy7tKsUZAsmF4dHYiM/Wj/Ax
   Ce/IM36jxg6mkeUMiC1AfD5S4q20K2368Tea5k+z7KNR6UgmlgATjobqu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="160257814"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="160257814"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 922A2D3EA3
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D5996D3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 61D336BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DBE61A000B;
	Tue, 14 May 2024 17:10:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/44] libnvme: upgrade 1.8 -> 1.9
Date: Tue, 14 May 2024 17:09:39 +0800
Message-Id: <1715677817-2223-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--1.001700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDmlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah/tAdDE/EtBJIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzBaMANBpoWOPfXL
	14U5WKybG4xQS1Ejp5AD0nCQnjWSi5ZFk+qMpxGmRyePSU8gCxECVRLnxLTWs5cfBwHCFW58l1X
	jQUq7ljiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110353

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/linux-nvme/libnvme/releases/tag/v1.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/libnvme/{libnvme_1.8.bb => libnvme_1.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.8.bb => libnvme_1.9.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.8.bb b/meta-oe/recipes-support/libnvme/libnvme_1.9.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.8.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.9.bb
index 3894facec..1e03b4e7a 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.8.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "bff7dda7e2a0f883d0b89e23fed725c916de3e61"
+SRCREV = "80c5cf2aa45f4afc7571dc48850fae3fd62828af"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.34.1


