Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C670C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:20:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6254.1692865228934771346
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129324828"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129324828"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:20:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B4C1ADB4C2
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:20:24 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1C20D67A8
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:20:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id A37D02FC85D0;
	Thu, 24 Aug 2023 17:20:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tox: upgrade 4.8.0 -> 4.10.0
Date: Thu, 24 Aug 2023 16:20:00 +0800
Message-Id: <1692865200-2998-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10--3.158000-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrcV3n4J/0zUOG6yXRaea1Onls
	GJXt79WMoA2X1Co0To3PYHNZ/BmJa8tXHWdj2t4o8IK7yRWPRNFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiDAixBlu3NnC5x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuNr34lUqic7t0p0ODI8GjvXKrauXd3MZDXqQODZQhylWFdqA
	qJ9NyZeyocAh0S+0CNYKt6wR8oDOUIWE4KGscsFytj/Sv0dqpu123e6Ki/z8UBkZKJgPhywgZk7
	aTIEnqmCV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104581

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Change accepted environment name rule: must be made up of factors defined in
  configuration or match regex (pypy|py|cython|)((\d(\.\d+(\.\d+)?)?)|\d+)?.
- --override foo+=bar appending syntax will now work correctly when foo wasn't
  defined in tox.ini.
- Disallow command line environments which are not explicitly specified in the config file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.8.0.bb => python3-tox_4.10.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.8.0.bb => python3-tox_4.10.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.8.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.10.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.10.0.bb
index ab69d2119b..fb6b3d712e 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.10.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "2adacf435b12ccf10b9dfa9975d8ec0afd7cbae44d300463140d2117b968037b"
+SRC_URI[sha256sum] = "e041b2165375be690aca0ec4d96360c6906451380520e4665bf274f66112be35"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


