Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC705C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:36:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.115582.1699508155555911046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="117880653"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="117880653"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:35:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BDCFACF1C0
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:35:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1512FD20B6
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:35:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 319796B808;
	Thu,  9 Nov 2023 14:35:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-inflate64: upgrade 0.3.1 -> 1.0.0
Date: Thu,  9 Nov 2023 13:34:56 +0800
Message-Id: <1699508096-16932-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27986.002
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zb056mCmF00ZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SDAmOeMifDfutH7kPVOqjqHzG3Maf3kWJbkuYhndUMVERRt
	9gAa0K7oyD1EkacEVn/oabklnC8QFGtMx/Sa8wYW4OFV92fEKsS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106503

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-inflate64_0.3.1.bb => python3-inflate64_1.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inflate64_0.3.1.bb => python3-inflate64_1.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-inflate64_0.3.1.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-inflate64_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
index 835856025..d3b557406 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "b52dd8fefd2ba179e5dfa18d6eca7e2fc822584616271c039d5ef1f9ca90c71c"
+SRC_URI[sha256sum] = "3278827b803cf006a1df251f3e13374c7d26db779e5a33329cc11789b804bc2d"
 
 PYPI_PACKAGE = "inflate64"
 
-- 
2.34.1


