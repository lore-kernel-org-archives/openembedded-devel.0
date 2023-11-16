Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A0AC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:17:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2696.1700122618472570850
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119252908"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119252908"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:16:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 324E3D66DD
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:16:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7174FCF7E5
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:16:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9C482007910F;
	Thu, 16 Nov 2023 17:16:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.12.0 -> 2.14.0
Date: Thu, 16 Nov 2023 16:15:55 +0800
Message-Id: <1700122555-22095-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--2.348400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrNi8L88UV9IDozDhGeQC9ErYX
	dmPuTQvH7PMLf+a/dtzVeptTRKjYpRLmJd2F/yFuIVybEvvop47Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZICK1bZeqLFdWV3qhYKUSt8kxWPgAkcfWik4lOUb+LqAek9z
	araqG4rMqvteFXmG6u4EfM4V2/xd/8Ue/k/Xq5ywSDe8QA7XzhLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106790

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Support with_call for wrapped rpcs
-Update async client to use async retry
-Add caching to routing header calculation
-Add warning to retry target to avoid incorrect usage
-Drop usage of distutils
-Ensure exception is available when BackgroundConsumer open stream fails

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.12.0.bb => python3-google-api-core_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.12.0.bb => python3-google-api-core_2.14.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.14.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.14.0.bb
index 28c6a7989..b620e553e 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.14.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c22e01b1e3c4dcd90998494879612c38d0a3411d1f7b679eb89e2abe3ce1f553"
+SRC_URI[sha256sum] = "5368a4502b793d9bbf812a5912e13e4e69f9bd87f6efb508460c43f5bbd1ce41"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


