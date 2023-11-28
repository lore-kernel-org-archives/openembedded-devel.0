Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCF7C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:44:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.28487.1701161047873828722
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120587543"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120587543"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:44:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B881D9D94
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:44:03 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E069BF495
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:44:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E75A8418A;
	Tue, 28 Nov 2023 17:44:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.35.0 -> 1.37.1
Date: Tue, 28 Nov 2023 16:42:51 +0800
Message-Id: <1701160971-28544-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--6.502800-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuAI7Mvq/sL52pP
	jHo14Z8HiIAAZbpsm0lTjL3vFHa57Mnxt9PgfAMXqhcdnP91eXFIvK4LrXs1ae8+PNqCaHTUKYU
	5gkls+qnFRWD4/kgdG3e7gdOfBewGfrwh0VleVxwgFhzkd+/gE8Jd4cnAlxP2jhBDYLFALmKYFC
	8uMwGxQQtLm1eZAs2HmiK+8VVF0OTDLVAj5iPQBfd23bssfyGcVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJoi9b7bd19qdFngIgpj8eDcBpkajQR5gb3t/C2riNn8beKrau
	Xd3MZDWxL8xVanOKw+1tFI91mAHzS1ieQi1nMWz1qmVQ3dMSjp+t2Yz/h8Lw
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107089

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix NameError on parse_version with eventlet
-build(deps): bump checkouts/data-schemas from 68def1e to e9f7d58
-Move installed modules code to utils
-Note: We moved the internal function _get_installed_modules from
 sentry_sdk.integrations.modules to sentry_sdk.utils. So if you use this
 function you have to update your imports
-Add code locations for metrics
-Add query source to DB spans
-Send events to Spotlight sidecar
-Run integration tests with newest pytest
-Bring tests up to date
-Fix: Prevent global var from being discarded at shutdown
-Fix: Scope transaction source not being updated in scope.span setter
-Django: Support Django 5.0
-Django: Handling ASGI body in the right way.
-Flask: Test with Flask 3.0
-Celery: Do not create a span when task is triggered by Celery Beat
-Redis: Ensure RedisIntegration is disabled, unless redis is installed
-Quart: Fix Quart integration for Quart 0.19.4
-gRPC: Make async gRPC less noisy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.35.0.bb => python3-sentry-sdk_1.37.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.35.0.bb => python3-sentry-sdk_1.37.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.35.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.37.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.35.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.37.1.bb
index b2bc875f5..868a7e2f3 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.37.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "04e392db9a0d59bd49a51b9e3a92410ac5867556820465057c2ef89a38e953e9"
+SRC_URI[sha256sum] = "7cd324dd2877fdc861f75cba4242bce23a58272a6fea581fcb218bb718bd9cc5"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


