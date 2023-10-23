Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC27CCDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:37:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.116354.1698050243825076985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136684275"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136684275"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:37:22 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 81602D9DA6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:37:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C810BD9682
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:37:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C0382005932A;
	Mon, 23 Oct 2023 17:37:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-croniter: upgrade 1.4.1 -> 2.0.1
Date: Mon, 23 Oct 2023 16:36:43 +0800
Message-Id: <1698050203-25263-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--0.155600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvPRFFhcWhYAjJ
	lierVE/nlj6xN6uhFIsNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5f3C
	xyyKhNDCs4mVDCZhxPhRmMC6u+2hjJUClu3DMwALGlEjAWgJ6MY/tL7rTlzGmD3300kpif0fNvU
	iOhLd0YIKOsW18R7QmCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105657

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fix release issue
Add Python 3.12 support
Make major release instructions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_1.4.1.bb => python3-croniter_2.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.4.1.bb => python3-croniter_2.0.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.4.1.bb b/meta-python/recipes-devtools/python/python3-croniter_2.0.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-croniter_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-croniter_2.0.1.bb
index e9f84eb9e5..7f418b063f 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_2.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "1a6df60eacec3b7a0aa52a8f2ef251ae3dd2a7c7c8b9874e73e791636d55a361"
+SRC_URI[sha256sum] = "d199b2ec3ea5e82988d1f72022433c5f9302b3b3ea9e6bfd6a1518f6ea5e700a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


