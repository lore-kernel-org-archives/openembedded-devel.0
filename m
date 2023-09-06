Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A01CCFA0A
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:55:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2326.1693965333682377475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="118949048"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="118949048"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:55:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3102FE6882
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:55:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BF0ABF4A3
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:55:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 82CD22FC7D48;
	Wed,  6 Sep 2023 10:55:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libzip: upgrade 1.10.0 -> 1.10.1
Date: Wed,  6 Sep 2023 09:55:19 +0800
Message-Id: <1693965319-14101-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10--4.682500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxjdFKCcTb+8ZKy
	Pf1j7t43dlXuJSGrPLwprZEvyN1LEjMuI1Y2xbgzqoeab9Xgz89UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw4DfgpjSDkFN1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKPgqFdEjAWcu5ZrtAOITGJziILcdlAHjXDOi4K1iCgAGHFY
	gRe9/z4avjJDsUS6OkCIuB4HboeAeVvXDIeqWD5i2f98kyoZohLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104739

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add 'ZIP_LENGTH_TO_END' and 'ZIP_LENGTH_UNCHECKED'. Unless 'ZIP_LENGTH_UNCHECKED'
  is used as 'length', it is an error for a file to shrink between the time when
  the source is created and when its data is read.
* Fix test on Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.10.0.bb => libzip_1.10.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.10.0.bb => libzip_1.10.1.bb} (91%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.10.0.bb b/meta-oe/recipes-extended/libzip/libzip_1.10.1.bb
similarity index 91%
rename from meta-oe/recipes-extended/libzip/libzip_1.10.0.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.10.1.bb
index b500f26e25..a314efc126 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.10.0.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.10.1.bb
@@ -21,6 +21,6 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "cd2a7ac9f1fb5bfa6218272d9929955dc7237515bba6e14b5ad0e1d1e2212b43"
+SRC_URI[sha256sum] = "dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318"
 
 BBCLASSEXTEND += "native"
-- 
2.34.1


