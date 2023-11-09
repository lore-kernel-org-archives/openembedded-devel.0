Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C909C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:38:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.115604.1699508278771114654
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="127393055"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="127393055"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:37:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE00AD64AD
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:37:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14A5FD55EB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:37:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37E6C20050183;
	Thu,  9 Nov 2023 14:37:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lru-dict: upgrade 1.2.0 -> 1.3.0
Date: Thu,  9 Nov 2023 13:36:34 +0800
Message-Id: <1699508194-17007-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27986.002
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKFXNZ4WKN4mfGhHsAzFiWkWiZmypaYzvqln0
	0jw4UFGcOHEJ8qOYCSMr03mmGKz2eXoBMQhHxZJ4Y2Z3SOkJHToiqa04ZHuwr+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106505

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-lru-dict_1.2.0.bb => python3-lru-dict_1.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lru-dict_1.2.0.bb => python3-lru-dict_1.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index 7a3a17274..e9535fa6f 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 
-SRC_URI[sha256sum] = "13c56782f19d68ddf4d8db0170041192859616514c706b126d0df2ec72a11bd7"
+SRC_URI[sha256sum] = "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea11079e3fd07b6b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


