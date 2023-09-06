Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CA3CCFA0F
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:57:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2375.1693965468743012896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="132253643"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="132253643"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:57:47 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A224E6853
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:57:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D895D9489
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:57:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C69A6B346;
	Wed,  6 Sep 2023 10:57:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argh: upgrade 0.28.1 -> 0.29.3
Date: Wed,  6 Sep 2023 09:57:35 +0800
Message-Id: <1693965455-14304-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--0.159800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzWfdTIhX4P8yYi
	aX7LCuq+tMXroPmlYSCITE3HVSm/hVHC2bC5Dl3OKABBZZ3PPkVzNCdGumZsSZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprfOd2ImQcUyEB8t49EdJHieUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrYbaLjLw/bFed0H8LFZNFG76sBnwpOylLNgzEBp70kK147Z0
	SyF+4f5SSZpV5FVZVynnaOQ8zc5ibmO5eoTq3wDEaC7DhYb0sYisbBIYNyRcXwCL6A043y0vOdQ
	PCAsRtWIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104744

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Wrapped exceptions now cause dispatching.dispatch() to raise SystemExit(1)
 instead of returning without error.
-Renamed arguments in add_commands() (#165 / #178):
-Can control exit status (see Backwards Incompatible Changes above) when raising
 CommandError using the code keyword arg.
-Positional arguments should not lead to removal of short form of keyword argument
-Avoid depending on iocapture by using pytest's built-in feature
-chore: publishing to prod PyPI
-test: add coverage for action="count" (#127)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-argh_0.28.1.bb => python3-argh_0.29.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argh_0.28.1.bb => python3-argh_0.29.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.28.1.bb b/meta-python/recipes-devtools/python/python3-argh_0.29.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-argh_0.28.1.bb
rename to meta-python/recipes-devtools/python/python3-argh_0.29.3.bb
index 2b1cb3ed81..93e0a84eea 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.29.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://README.rst;beginline=261;endline=275;md5=a8bf3475df7e0d575a53d04c83d5e090"
 
-SRC_URI[sha256sum] = "b2093086f0e809a3ecc24b64a2145309ee8f56d034936cd59e57c558a357329d"
+SRC_URI[sha256sum] = "58e438ce9169aaa2e6de147e3ceb34ceacfe26556a2306f50e2d46f52779acb1"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


