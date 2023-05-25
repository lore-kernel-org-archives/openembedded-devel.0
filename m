Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7160FC7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:27 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.6215.1684997896257249828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117405309"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117405309"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:13 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 20947DDC62
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15215E4AFD
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D7892008FEDB;
	Thu, 25 May 2023 15:58:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.22.2 -> 1.24.0
Date: Thu, 25 May 2023 14:57:56 +0800
Message-Id: <1684997886-2137-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--4.074200-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrKQNhMboqZlp2HZGDrssVUnv3
	EJJrdBuxSaQNyBjVdUn7l/C1nMhv7o4OfNKPDm459k5nZzZVBSD865QlVwxmG4Ajsy+r+wvnoPS
	jAvnyLoq62sn1Xy7JgTGPoH6kik5G/0ish2wv8noCOoDG5aR1MazghBiD4bcIQcU8dj0/qVHMcC
	EoMjU3SOV3GL0CuTlMFB/D5lqNoYWwQEC6hpSorz9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlu79CzFSl2w0V5OPD8XJFfpB8TzIzimOwPur1QVFMnSQrEQdG7H66TyHEqm8QYBtMO9dMD
	4Y7k0paO+cr1MQ5pRlhHgKd6F1pWzF3MruIkDWI+PYmG54jcihle2UJVatBeSfnfHtuqDPoZLgE
	BuCxDyJmWb1yMLL9Fgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102840

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
New: Celery Beat exclude tasks option
New: Add support for ExceptionGroups
Prefer importlib.metadata over pkg_resources if available
Work with a copy of request, vars in the event
Pinned version of dependency that broke the build
Disable Django Cache spans by default.
New: Add loguru integration
Do not truncate request body if request_bodies is "always"
Fixed Celery headers for Beat auto-instrumentation
Add db.operation to Redis and MongoDB spans
Make sure we're importing redis the library
Add include_source_context option
Import Markup from markupsafe
Fix __qualname__ missing attribute in asyncio integration
Remove relay extension from AWS Layer
Add a note about pip freeze to the bug template

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.22.2.bb => python3-sentry-sdk_1.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.22.2.bb => python3-sentry-sdk_1.24.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.2.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.24.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.2.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.24.0.bb
index 359090cae..9e4b87da9 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.24.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "5932c092c6e6035584eb74d77064e4bce3b7935dfc4a331349719a40db265840"
+SRC_URI[sha256sum] = "0bbcecda9f51936904c1030e7fef0fe693e633888f02a14d1cb68646a50e83b3"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


