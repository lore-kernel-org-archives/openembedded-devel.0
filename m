Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4A9C54E50
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:04 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.9336.1708419303168362243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j5lVYxx4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419303; x=1739955303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vcBbA2LjnOcQGIWEgt5tPdItQ3TRl/Jyl/7RprxFKF8=;
  b=j5lVYxx4KCpQpLNph/JmiuFulMqRXTHDPbEnlGpMJzTWTyhnG6SpB92O
   j1yBTsuEv8qM+4qHhqpV7NuhUACehIBxkQuk02xwN5L2wh7hHNL2Wj9pJ
   JYsAD1VQpEZJcl0TaIAhwmLpnIv0vywsUiVqnsSB6YMITZnZyaHL5j7XE
   ozD6ue3Lnk/OTIAb+bXQd0HyPFHbdKhM2RZRbdjOOA0ZFxrCkStOWYjUZ
   J9EehszJ/nvwu9GQKK6l+8uBFnJBhowgWrLu/UIawc5QLxN89t9fQR6HY
   m9Qb33XxdwnCJizGC1L/A2Z/HyV1CCpTsBNYP4YDHz80Vf0CzEkdW2ByL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="151648135"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="151648135"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA615D3EA9
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02877CF7D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AE726B8C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3542A1A006B;
	Tue, 20 Feb 2024 16:54:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/26] python3-socketio: upgrade 5.11.0 -> 5.11.1
Date: Tue, 20 Feb 2024 16:54:34 +0800
Message-Id: <1708419281-26047-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--3.130800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrJF8tFEtOdqswAYdq1VTXo8P+
	gsBeuI3ipPkgFEQ0YZkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFM33q373zqQPYv4GPs5rubnDIn
	oS4mbmIVKd0JcpJJiegG637bTAWmCK1BG92YWFC9tcC3j/kRwewmps2eFD/tLznH0ZYmG9Tex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108939

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Connection retry option in the client
-use Socket.IO sid in transport
-Add support for Python 3.12 and drop 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.11.0.bb => python3-socketio_5.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.11.0.bb => python3-socketio_5.11.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
index 72471e956..b89430ef9 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "b03186e04b942088781f6286c13604a853e5e35ed59158c51ff7af22fa032e6f"
+SRC_URI[sha256sum] = "bbcbd758ed8c183775cb2853ba001361e2fa018babf5cbe11a5b77e91c2ec2a2"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.34.1


