Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18287C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:28:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.45850.1702600092861301701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="131814063"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="131814063"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:28:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF3D2E05AD
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:28:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AEC017CD8
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:28:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CF9486578;
	Fri, 15 Dec 2023 09:28:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.7 -> 20.25.0
Date: Fri, 15 Dec 2023 08:26:21 +0800
Message-Id: <1702599981-1808-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--0.392600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrXs5nqGvDCfNqTj+cW75OICmF
	OYJJbPqplxPsRwiY5LyX9moRF8wW9+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt/S/wbZ1wW3OKX+68t00T66jwwxZwu+P0umDnnW7eqW9KxUzi4K3WOAcGY
	O4DF3bAJ2fyAHxzNYBnv9AMRu5Wu/cx7DhxMWBpHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107475

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-release 20.24.6
-Allow platformdirs v4
-Bump wheels package
-Bump setuptools and wheels
-Run CI tests on Python 3.13, fix tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.24.7.bb => python3-virtualenv_20.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.24.7.bb => python3-virtualenv_20.25.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.7.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.24.7.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
index a4e5607e7..0a9ba5945 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.7.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "69050ffb42419c91f6c1284a7b24e0475d793447e35929b488bf6a0aade39353"
+SRC_URI[sha256sum] = "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b86959257378aef020e1f1b"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


