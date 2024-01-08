Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18814C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:21:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.6379.1704720080421094057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="147085401"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="147085401"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:21:17 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AF96D63DB
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:21:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B05B2F470
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:21:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 44E5E202CFE9F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:21:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F29E11A0072;
	Mon,  8 Jan 2024 21:21:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] jwt-cpp: upgrade 0.6.0 -> 0.7.0
Date: Mon,  8 Jan 2024 21:21:06 +0800
Message-Id: <1704720066-29918-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXL7w+iMP6+9yZEuxFE1DWQZWZPxocrSHiXKJ8
	77SCuTfT4o/Uwt/19uFz8MygB6opTaKPCIS8Hle4/MuKAObktuen489gc6Suz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108134

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jwt-cpp/{jwt-cpp_0.6.0.bb => jwt-cpp_0.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jwt-cpp/{jwt-cpp_0.6.0.bb => jwt-cpp_0.7.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
rename to meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
index 2e06b701c..87f7f1a6d 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
 SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
             "
 
-SRCREV = "4a537e969891dde542ad8b1a4a214955a83be29f"
+SRCREV = "08bcf77a687fb06e34138e9e9fa12a4ecbe12332"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


