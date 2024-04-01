Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D78CD12A0
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.39361.1711983107514078672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mI7gf6DI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983108; x=1743519108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WkwJXSCizwCKaDK6+llxT4pUzmAnnI5+db0cvgu8TgA=;
  b=mI7gf6DI1m1bhaE+/BsJOlbKtuKwzadFBFIRCUhIYAzSQdMu84U+UQ6O
   +j5V87aKpXPs4/BqhaVZXeChBcpb79J44WCarROvV1euh7pa81V/bUg/k
   lQf6D9f1ZZ8/HhfnpTBD5V4iZ6zxo/0sOM6ie8ain1r97EVGTWvrHqm0W
   Q3hBSboZWfScNN69m0JzcPDq/UjNdcHCl2k3gzuAF6Chszl2KBSQPzA2x
   yWXJj35fnGtcGt0j9BPxilf8n3cZNtAP1RnmiBCnEfZVZEoUe8VNIILtZ
   uXe5/AlELHH/LJKNJdPEvLN1mVsrfDSI3LoPkNHXz3nKFgM8qKmNz5byq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="156148781"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="156148781"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4272AD4800
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76F8ED4C1A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1669320093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C11B31A000A;
	Mon,  1 Apr 2024 22:51:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/47] python3-socketio: upgrade 5.11.1 -> 5.11.2
Date: Mon,  1 Apr 2024 22:51:09 +0800
Message-Id: <1711983079-16849-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-2.203200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrnY+2FiS7N521rf6Iwst03zhy
	bhbsVgIwT0dK3a38v4ANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFInlMCDOKDEka1yp7DJ3lJZ+cA
	oEpbfqJGB7cB1T8LzkY8Y4JO1VDRjJXLWS8lhFBQqMdWOTrF8ojgjAzwBm3AoKzJCHOUdBJex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109753

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Improved routing to catch-all namespace handlers
-Option to disable routing in ASGIApp

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.11.1.bb => python3-socketio_5.11.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.11.1.bb => python3-socketio_5.11.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb b/meta-python/recipes-devtools/python/python3-socketio_5.11.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.11.2.bb
index 91feec98f..4251a81d6 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.11.2.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "bbcbd758ed8c183775cb2853ba001361e2fa018babf5cbe11a5b77e91c2ec2a2"
+SRC_URI[sha256sum] = "ae6a1de5c5209ca859dc574dccc8931c4be17ee003e74ce3b8d1306162bb4a37"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-- 
2.34.1


