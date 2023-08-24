Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551E1C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:14:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6314.1692864852375065640
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129332985"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129332985"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:14:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id ED13CCD7E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:14:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0D4CD6024
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:14:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6399320074727;
	Thu, 24 Aug 2023 17:14:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-humanize: upgrade 4.7.0 -> 4.8.0
Date: Thu, 24 Aug 2023 16:13:48 +0800
Message-Id: <1692864828-2618-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.006
X-TMASE-Result: 10-1.949900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxV/6sIZMTnkuhZ
	11OnrxJUDVHHAE0cndSpqSHgFxgh5ADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRndCok3ibXlQX0tCKdnhB58ZYJ9vPJ1vSBp7q
	EhmmPgy46HM5rqDwqtdDjFYmaXPYZ730sCXA32lM7MFmgvD9hk70npqqht4OlSZDu4fW9Xx7P2+
	bsSP23trN/0snPwXsKgl9cI2UsJTOEPYs1cI5Vr9UElV5SMCCrLt16YWtxzeF9NpZbddHv73iGQ
	YUPZme7O51vq1xhTsg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104572

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add Hungarian localization
-Revise Turkish localization
-Translate "thousand" to "千" for zh_CN
-Update docs link to https://humanize.readthedocs.io
-Move logic to convert aware datetime to naive into function
-Docs: fix formatting of return value

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.7.0.bb => python3-humanize_4.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.7.0.bb => python3-humanize_4.8.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.8.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.8.0.bb
index 81654af875..aa56a90119 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.8.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "7ca0e43e870981fa684acb5b062deb307218193bca1a01f2b2676479df849b3a"
+SRC_URI[sha256sum] = "9783373bf1eec713a770ecaa7c2d7a7902c98398009dfa3d8a2df91eec9311e8"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


