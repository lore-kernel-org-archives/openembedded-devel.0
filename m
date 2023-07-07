Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DEBC001B0
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.4895.1688699654076689617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103103853"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103103853"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:12 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 877AFDA68A
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:10 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD6C6BF3D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id CFD0A881D9;
	Fri,  7 Jul 2023 12:14:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-configargparse : upgrade 1.5.3 -> 1.5.5
Date: Fri,  7 Jul 2023 11:13:38 +0800
Message-Id: <1688699627-2519-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-2.522700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr5sPqcQkI8puU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFIKtAkJEUvyK9A6YMGzA8mZvgj
	TLCgLe9J6EWvuxS6Bo2Du9djvLYr9n8n/PNU1cM5ZWRxe+W/ETkOOBOlTfMTe8yIrSz96y9ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103700

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
fixed 'publish' step

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-configargparse_1.5.3.bb => python3-configargparse_1.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.5.3.bb => python3-configargparse_1.5.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.5.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.5.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.5.5.bb
index 7d21375548..7d3a5fba5f 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.5.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "1b0b3cbf664ab59dada57123c81eff3d9737e0d11d8cf79e3d6eb10823f1739f"
+SRC_URI[sha256sum] = "363d80a6d35614bd446e2f2b1b216f3b33741d03ac6d0a92803306f40e555b58"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.34.1


