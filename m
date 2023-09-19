Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EECCD549D
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:57:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2786.1695110269911282106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132647931"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132647931"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:57:48 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C36E2D29E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:57:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0677AD9481
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:57:45 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 875816C9DB;
	Tue, 19 Sep 2023 16:57:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.4 -> 20.24.5
Date: Tue, 19 Sep 2023 15:57:17 +0800
Message-Id: <1695110237-8299-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.006
X-TMASE-Result: 10--0.516300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvaHZDWBWzqzriR
	FJnWDxklvEOj8C68r1lQfw/ZZiLyte1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt9q54gErf+yLJGRPFS+3dvtz4ZMA/BluOtJI3XvVMavjnUyrPVU0QF4qJS
	e6ykw6Enf27+5n0qWdT8qgF9sGpyabYrwMaOJjLHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104996

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-release 20.24.4
-Fix brew cannot copy
-Test with 3.12 rc
-Upgrade setuptools
-GitHub Actions: Add PyPy 3.10 to testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.24.4.bb => python3-virtualenv_20.24.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.24.4.bb => python3-virtualenv_20.24.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.4.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.24.4.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.24.5.bb
index 889c73b2f1..d05c7f4927 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "772b05bfda7ed3b8ecd16021ca9716273ad9f4467c801f27e83ac73430246dca"
+SRC_URI[sha256sum] = "e8361967f6da6fbdf1426483bfe9fca8287c242ac0bc30429905721cefbff752"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


