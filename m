Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A97DC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:33:16 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2832.1700123592593751982
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119279129"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119279129"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:33:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 268C4D5026
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:33:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56C06F968
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:33:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D826200649E9;
	Thu, 16 Nov 2023 17:33:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.34.0 -> 1.35.0
Date: Thu, 16 Nov 2023 16:32:04 +0800
Message-Id: <1700123524-22496-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--3.538800-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrK2GKtdiFmTnJt7aD46KTu7h+
	pYnZ0bxFGtPsII7bpSG6M1wBej8T3cWQ1BiO6SCP1l+BjLM8lsr2/fdRbxY1gKw2biBXqw2EAq/
	SSAVn/GIaRkW7L3QEvmvlTtMKBgRwkWZngRPp3NptN2GsBybzwhhH6ApagZfOlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDd0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtiN2nYwbbDKzt93a9VsIhYj84LeW+KFL1U8JkKvIUTY/R30BZ07qEPk8P8u0qeU3EC8xO
	X+YZaE3eu5+QcHWLBLdnXWqmKAhCTXHrxlzIXT7yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106800

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Updated gRPC integration: Asyncio interceptors and easier setup
-Python 3.12: Replace deprecated datetime functions
-Metrics: Unify datetime format
-Celery: Set correct data in check_ins
-Celery: Read timezone for Crons monitors from celery_schedule if existing
-Django: Removing redundant code in Django tests
-Django: Make reading the request body work in Django ASGI apps.
-FastAPI: Use wraps on fastapi request call wrapper
-Fix: Probe for psycopg2 and psycopg3 parameters function.
-Fix: Remove unnecessary TYPE_CHECKING alias

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.34.0.bb => python3-sentry-sdk_1.35.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.34.0.bb => python3-sentry-sdk_1.35.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.34.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.35.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.34.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.35.0.bb
index 453b54c53..b2bc875f5 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.35.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "e5d0d2b25931d88fa10986da59d941ac6037f742ab6ff2fce4143a27981d60c3"
+SRC_URI[sha256sum] = "04e392db9a0d59bd49a51b9e3a92410ac5867556820465057c2ef89a38e953e9"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


