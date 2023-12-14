Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C870FC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:06:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.17926.1702544763246615269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143570256"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143570256"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:06:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26FE7D5026
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:05:58 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E5BED3F3A
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:05:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DDD4883E1;
	Thu, 14 Dec 2023 18:05:56 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.37.1 -> 1.39.0
Date: Thu, 14 Dec 2023 17:05:36 +0800
Message-Id: <1702544736-28467-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--13.411800-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxs1Ir4NZzFmsxw
	ISgyNTdILUT3zzA7XPPuhqHGdBM90RcAx4W352h+OIQ9GP2P2u8xVUWGXs3C85UKAwcqU3Tdl4n
	a/XrRWdaBNeBGeHIi2058Fhz8VuqnfmpY4OvTCPJ85pjA/x1xfmmQExgOfwV4XL3alrQqMpI9UY
	NUDN4YfKCRBldoVqR51NHbzQby3vvtWteqKqfAdfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkATn2
	mTiRxzlsX24ahsS5PuAMuqetGVetnyef22ep6XYOwBXM346/+wMhyNN36DjPOpW/m2ts40zXybw
	d/qK5NjEBEU8BIQQtjZkL5zrNkSv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107448

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add support for cluster clients from Redis SDK 
-Improve location reporting for timer metrics 
-Fix Celery TypeError with no-argument apply_async 
-Fix Lambda integration with EventBridge source 
-Add max tries to Spotlight 
-Handle os.path.devnull access issues 
-Change code.filepath frame picking logic 
-Trigger AWS Lambda tests on label 
-Run permissions step on pull_request_target but not push 
-Hash AWS Lambda test functions based on current revision 
-Update Django version in tests 
-Make metrics tests non-flaky 
-Various fixes & improvements
-Only add trace context to checkins and do not run event_processors for checkins 
-Metric span summaries 
-Add source context to code locations 
-Use in-app filepath instead of absolute path 
-Switch to jinja2 for generating CI yamls 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.37.1.bb => python3-sentry-sdk_1.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.37.1.bb => python3-sentry-sdk_1.39.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.37.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.37.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.0.bb
index 868a7e2f3..81828737f 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "7cd324dd2877fdc861f75cba4242bce23a58272a6fea581fcb218bb718bd9cc5"
+SRC_URI[sha256sum] = "67f62238af273eebd6432f85116dc6cd5422d4bc02df886514e8139e755f48e4"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


