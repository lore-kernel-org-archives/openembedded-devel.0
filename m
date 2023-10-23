Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7AFC00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:40:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6664.1698104440644063812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="116651478"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="116651478"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:40:38 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3347ACA1E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:40:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 684ADD9474
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:40:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B20E0E5E27;
	Tue, 24 Oct 2023 08:40:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.10.0 -> 6.11.1
Date: Tue, 24 Oct 2023 07:39:20 +0800
Message-Id: <1698104360-31939-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--6.491600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrxZpjHSMI6w6y5rejC7zZUG9Q
	U5AyX6nlWJBPIRIrBsgtD1kIcLD9bK5eIDD1ppIU1PhYGbtK4A7sbTWwP5iBzJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3cgUVP3Cp+vRCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG7bkV4e2xSge64MqWm3dIaWmEZx
	SVA4SdhN1YTjSBDeaK+8ArUXHlrYb7rweoAIK8o
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105701

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Updates and refactoring for the WebsocketProviderV2 class and its internal
 supporting classes and logic.
-Add upper pin to hexbytes dependency to due incoming breaking change

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.10.0.bb => python3-web3_6.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.10.0.bb => python3-web3_6.11.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.10.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.11.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.10.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.11.1.bb
index cba7ffe0db..aabea69a3d 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.11.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "ea89f8a6ee74b74c3ff21954eafe00ec914365adb904c6c374f559bc46d4a61c"
+SRC_URI[sha256sum] = "d301d7120922d5b9e5c9535ef9780012ea25ea4011c2b177490ba7d3ef886b92"
 
 inherit pypi setuptools3
 
-- 
2.34.1


