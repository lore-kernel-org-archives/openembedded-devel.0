Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26744C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:33:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.136312.1698104021477967103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="116650076"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="116650076"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:33:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76D54D3EC0
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:33:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5FDAD3F02
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:33:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CFFC22005A580;
	Tue, 24 Oct 2023 08:33:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.9.0 -> 5.10.0
Date: Tue, 24 Oct 2023 07:33:18 +0800
Message-Id: <1698103998-31662-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--1.978600-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrKQNhMboqZlozY4Z+W6z6mmQb
	gS2jMHPf4oco8WFJ7F36sV6aK5FCiR/HXj0hXLdJEhGH3CRdKUXE0rv2iB8gqYAjsy+r+wvnRfB
	9456KWmol90hRk0GXNxhWMyiMciBVFrv2YCxwYxYD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpitqAfZ9rgr9rlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs6pDv
	E22DBXSrwcNB90exLqntpAds5s4OZiNYPmkOgD7gRW98jvq5JK/KKozJrxUKmgah1aftrQO9rlB
	AH0ycGrkD0H2Zvl474geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105694

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-New SimpleClient and AsyncSimpleClient classes
-Reporting to Socket.IO Admin UI
-Support entering and leaving rooms through pubsub client managers
-Async versions of enter_room and leave_room should be coroutines
-Add a shutdown() function for the server
-Message queue optimizations
-Remove unneeded arguments from super()
-Internal code restructure (no functional changes)
-Add FastAPI and Litestar server examples
-Update Socket.IO JavaScript client to version 4.7.2 in all examples
-Update ping_timeout documented default to accord with current Engine.IO behavior
-Refactor common testing helpers into a separate module
-Migrate Python package metadata to pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.9.0.bb => python3-socketio_5.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.9.0.bb => python3-socketio_5.10.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.9.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.10.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.9.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.10.0.bb
index 9064ee4b8d..68168bb635 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.10.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "dc42735f65534187f381fde291ebf620216a4960001370f32de940229b2e7f8f"
+SRC_URI[sha256sum] = "01c616946fa9f67ed5cc3d1568e1c4940acfc64aeeb9ff621a53e80cabeb748a"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.34.1


