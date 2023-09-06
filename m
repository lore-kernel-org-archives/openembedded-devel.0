Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943B4CA0FFC
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:04:45 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2524.1693965883232130384
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="110268341"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="110268341"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:04:41 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38301DDC65
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:04:39 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B8C5D9493
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:04:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id A02482FC03EE;
	Wed,  6 Sep 2023 11:04:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-typeguard: upgrade 4.1.2 -> 4.1.3
Date: Wed,  6 Sep 2023 10:04:23 +0800
Message-Id: <1693965863-14956-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-3.719700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhGQgIVrmBL5NDS
	nIWWPMFHo7QSSB5Xe10Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSy9o2p3dj0RfAYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqteNxwQglC3Yxo5O3rX5NTV8wlseoHLe7ZhhVxGE2DZrsw0kt3adUGFhjxN
	kx2eu3KQXJ772SePt7an/kWGwAtfTnUQoO8CRkBHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104761

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Dropped Python 3.7 support
-Fixed @typechecked optimization causing compilation of instrumented code to
 fail when any block was left empty by the AST transformer
 (eg if or try / except blocks) (#352)
-Fixed placement of injected typeguard imports with respect to __future__
 imports and module docstrings (#385)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.1.2.bb => python3-typeguard_4.1.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.1.2.bb => python3-typeguard_4.1.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.1.2.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.1.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.1.3.bb
index 828e2727e3..73935d090c 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "3be187945f9ef5a9f6d7a926dfe54babb7dfd807085ce05f9a5e8735f2487990"
+SRC_URI[sha256sum] = "7d4264cd631ac1157c5bb5ec992281b4f1e2ba7a35db91bc15f442235e244803"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


