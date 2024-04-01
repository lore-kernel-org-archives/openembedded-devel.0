Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DFCCD12A2
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.39485.1711983105434290641
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=morEGv0U;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983106; x=1743519106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lGxPaRYxuSiOpt5S/1PO2NPsnziL9GwJTBnLWyNyas4=;
  b=morEGv0UdePS/EtN0ZFv8IWer85RFdp7bs7dC9BdyojAKq+mU0bsnL2A
   KzG9tFJCAju3KoL7H5JaM1mxCnuivTpbw5gYWZO1DOPCjaF+2FfsSxwtM
   mdqpZZT2pw+fCqJe5wByPiZODSqhjrE0hvwCPsBEWVgqG15nAHmDx1DQJ
   pQQe5BDDqJ2A+fO0xNl3dXBGbBB66AB9gpzkmbSLhdP15V3BQ+yXmPpg/
   WodT73UfwZmDubtwuhyn+69RAHNf+MzvlJtCakk8Kc8S3cSYxsnggF9bl
   qTrzhsRY8xKzRAsJkI0yaQbnbnE9mhGjTR9yTXhqzlDrORDCuHpOQTB7a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="142245645"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="142245645"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:44 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C261FD3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FD661B860
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A1AFB21F7B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 580B81A000A;
	Mon,  1 Apr 2024 22:51:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/47] python3-sentry-sdk: upgrade 1.42.0 -> 1.44.0
Date: Mon,  1 Apr 2024 22:51:08 +0800
Message-Id: <1711983079-16849-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.020800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy3L2aPW6sT0juR
	oA1LVbPUkHN7/vFfwP7XR5LQr9vuEOxqcgb67CyaE7sLdRVaGmdUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiL1vtt3X2p0WeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDu8X01TOYl1zGaoK3fgbvYmZvbzbSpR1N9LRI9+MTw87alXYK5WNKMIpGW6r0Ul9HMqBL
	r7Dxe4j3DWJ7xOk0NmsyIXBRZoR1YK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109752

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-ref: Define types at runtime
-Explicit reexport of types
-feat(profiling): Add thread data to spans
-Add optional keep_alive
-Add support for Celery Redbeat cron tasks
-The SDK now supports the Redbeat scheduler in addition to the default Celery
 Beat scheduler for auto instrumenting crons.
-aws_event can be an empty list
-Re-export Event in types.py
-Small API docs improvement
-Fixed OpenAI tests
-Bump checkouts/data-schemas from ed078ed to 8232f17

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.42.0.bb => python3-sentry-sdk_1.44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.42.0.bb => python3-sentry-sdk_1.44.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.42.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.44.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.42.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.44.0.bb
index 141343a27..1b371ef01 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.44.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "4a8364b8f7edbf47f95f7163e48334c96100d9c098f0ae6606e2e18183c223e6"
+SRC_URI[sha256sum] = "f7125a9235795811962d52ff796dc032cd1d0dd98b59beaced8380371cd9c13c"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


