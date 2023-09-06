Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99138CCFA1B
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:02:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2493.1693965735104761969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130903521"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130903521"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:01:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BA66CD6C4
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:01:50 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F2951228E
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:01:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD7F0814DE;
	Wed,  6 Sep 2023 11:01:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.24.1 -> 4.24.2
Date: Wed,  6 Sep 2023 10:01:40 +0800
Message-Id: <1693965700-14701-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-5.014900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrWq/snXbxpCCU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3BF2OdN6oAAXztJgOULF9rU3Z
	K/gGt+6KuVwt4V/zusjF/NHLpWiF5BJIzKK6oGR7dCok3ibXlQX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjsjvNV98mpPMa2VuiMoZn+aB7Q1WIr0SWkYkAGv2PTkQcIaorvKX6y/XtZ
	XDSzqPeY2dHaemusDsEP78BnKtixupSkQNLqS8hRgmfaxNfCXQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104754

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixes for 32-bit MSVC. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.24.1.bb => python3-protobuf_4.24.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.1.bb => python3-protobuf_4.24.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
index 6322ec1f30..3014884a33 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 SRC_URI += "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch"
-SRC_URI[sha256sum] = "44837a5ed9c9418ad5d502f89f28ba102e9cd172b6668bc813f21716f9273348"
+SRC_URI[sha256sum] = "7fda70797ddec31ddfa3576cbdcc3ddbb6b3078b737a1a87ab9136af0570cd6e"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


