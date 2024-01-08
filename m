Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7EEC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:54:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7109.1704722069827425270
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="124233002"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="124233002"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:54:27 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D347D3EA9
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:54:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B2D55156FB
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:54:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50893202D20EA
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:54:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DC2381A0072;
	Mon,  8 Jan 2024 21:54:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.182 -> 2.4.183
Date: Mon,  8 Jan 2024 21:53:19 +0800
Message-Id: <1704721999-30955-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--3.209500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrPxX+QhEWeLN4s/vUphzuilDc
	zN/SMpBYXr7NXg/pSgT3V6MxFV6beqXUs7kD79U2qhcdnP91eXFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw65x7uAXGEprb44ZVtjBiyJm3CWjrgmoUGUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPXH1ALqutwCyxr0
	vMSHrYxtESbOhziyt0ASikTbl+qn/HxeX3cqFfMk1LPDnW1J8luhWBLm+Niw/RWAisSf9QmmyHc
	0WFc/E+IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108160

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Documentation to install PyMISP on offline machine.
- Bump objects.
- Bump version.
- Remove jsonschema from dependencies.
- Encrypt malicious js.
- Fix api ssl verify typing.
- Add HTTPS Adapter.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.182.bb => python3-pymisp_2.4.183.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.182.bb => python3-pymisp_2.4.183.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.182.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.183.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.182.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.183.bb
index 12bf6245e..dec818699 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.182.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.183.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "888e848494e04148c8ff5887f04154a2b40f3065c53d93f9cec65f7ca7171362"
+SRC_URI[sha256sum] = "00abe5592f07bb1cd41ca803f9b0b8b2b70474004a779be53cd215280fd625b3"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


