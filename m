Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C9DCCFA1D
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:03:35 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2537.1693965811892927824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="110267935"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="110267935"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:03:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB0F4CD6CC
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:03:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 11BA8D5EA7
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:03:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88B6B6B346;
	Wed,  6 Sep 2023 11:03:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.8.0 -> 5.9.0
Date: Wed,  6 Sep 2023 10:03:19 +0800
Message-Id: <1693965799-14846-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--1.201800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrjkDrBOJwwnR4YeSlHZYFomtY
	VBWG/FwW5YDYgo/wV4egGOZ3m2LY5+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcgw3zCvxi5CwcyadGHFfysSdAD
	HAouguKbqVPCBc337g9BlTM8PSxXsCSPTI2MO0pdMcbNzPtWrZOs1W7Y1aKCM8ZV7y0pc9if6/2
	/nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104758

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Optimized performance and memory usage for broadcasts
Improved documentation on horizontal scaling
Corrected user session documentation example
Improved grammar in documentation
Fix docstring typo: client/server mixup
Fix typos in the documentation
Upgrade dependencies in Django server example
Update reference JavaScript examples
Upgrade to pypy-3.9 in unit tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.8.0.bb => python3-socketio_5.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.8.0.bb => python3-socketio_5.9.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.8.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.9.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.8.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.9.0.bb
index 5de7490815..9064ee4b8d 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.9.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "e714f4dddfaaa0cb0e37a1e2deef2bb60590a5b9fea9c343dd8ca5e688416fd9"
+SRC_URI[sha256sum] = "dc42735f65534187f381fde291ebf620216a4960001370f32de940229b2e7f8f"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.34.1


