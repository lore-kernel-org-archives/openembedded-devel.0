Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD60C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:33:53 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.115389.1699508028068666219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="138531475"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="138531475"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:33:46 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40A30CA240
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:33:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 73D3DD5608
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:33:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A433920050183;
	Thu,  9 Nov 2023 14:33:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-geojson: upgrade 3.0.1 -> 3.1.0
Date: Thu,  9 Nov 2023 12:39:06 +0800
Message-Id: <1699504746-16552-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27986.002
X-TMASE-Result: 10-0.949700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwC10TsipyQq76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIMay5jJvrxqM1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4vA3
	Hsd3eoaxWo3nPi0XWnK3KQ0bbw97PYEvYjKonhE4iCL0U36p5VQfVMp3N7L4KvhkfmZE9yME4TD
	EFKJBOUceFRWe51GB6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106501

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Add support for Python 3.12
CI improvements
Unit test improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-geojson_3.0.1.bb => python3-geojson_3.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-geojson_3.0.1.bb => python3-geojson_3.1.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.0.1.bb b/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-geojson_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
index 671fe4f23..79ad228d1 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/geojson/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f77f2ed49768c8d4c79ba874c0f94d8a"
 
-SRC_URI[sha256sum] = "ff3d75acab60b1e66504a11f7ea12c104bad32ff3c410a807788663b966dee4a"
+SRC_URI[sha256sum] = "58a7fa40727ea058efc28b0e9ff0099eadf6d0965e04690830208d3ef571adac"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


