Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFDBC48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 08:19:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8717.1708503587418875598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 00:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SAxI44Eo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708503587; x=1740039587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hZFObx2ykQOY9yCl4S0RNM8Oh/GKxrTLaS7ap37HJLs=;
  b=SAxI44EoBnQbVrNGtPLZDdneUiw4rR4dGyJA6BK32g/DociqLWeb6n28
   rIWAA5xLLTxx7V/nsqM7v4r615XhIiwKjCG+oYNX5YD5NygvY/bNSc0e/
   KQW01LlYTJgQGF0+Da0BTW8unIy5blXt8ggONy1kKJmVwP6i0lM7QmYOz
   6SCXd3MFtcirZxEMtOi7xI2/z0nzXG2+nQyDQF9yEhT2NKau8qEYzlWNc
   6L2ezdFpfsIQBXU3yAaD7CrGVbSetuuemiLx/+knPUK2ZbhL6sBOLEaQ3
   7NWoy3OxoipWIdtwH20TropWjSO6ebKfG4dYIMHvfAQ7Cr/HEjeNIlLhx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="150301401"
X-IronPort-AV: E=Sophos;i="6.06,175,1705330800"; 
   d="scan'208";a="150301401"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 17:19:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C1CB155872
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D1F6DD530A
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7312920095793
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2DBF01A006B;
	Wed, 21 Feb 2024 16:19:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 4/4] python3-sentry-sdk: upgrade 1.40.0 -> 1.40.4
Date: Wed, 21 Feb 2024 16:19:19 +0800
Message-Id: <1708503559-1895-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708503559-1895-1-git-send-email-wangmy@fujitsu.com>
References: <1708503559-1895-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28204.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28204.005
X-TMASE-Result: 10--1.905700-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrsBSA1tuZVSZqTj+cW75OIDq5
	pN7LydEY+FyTwBk2ojw76EG8K9nMWCSTQ+POZGNWGFMYlDUzwr1ITEcvqjcF4P5FpHriNwIFlrH
	7mJSSe4VBOq1LSIbi+w3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGX+rNJicjlVL2em2
	vw+cenKeLzNWBegCW29sZ0UX0EaOILbigRnpKlKZx+7GyJjhAU6SpZvfhtTrX+AKj3VuUy6LvUT
	q37A01khUm794tP1kr/oKvmqeVb9r7LmHkxKZmnhkTgFeZgLh2iUmnv825bNidmYSLRg/wR7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108962

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Only start metrics flusher thread on demand
-Bump checkouts/data-schemas from aa7058c to 6121fd3
-Turn off metrics for uWSGI
-Minor improvements
-test: Fix pytest error (#2712)
-build(deps): bump types-protobuf from 4.24.0.4 to 4.24.0.20240129
-Fix uWSGI workers hanging
-Make metrics work with gevent
-Guard against engine.url being None
-Fix performance regression in sentry_sdk.utils._generate_installed_modules
-Guard against Sentry initialization mid SQLAlchemy cursor
-Fix yaml generation script
-Fix AWS Lambda workflow
-Bump codecov/codecov-action from 3 to 4
-Bump actions/cache from 3 to 4
-Bump actions/checkout from 3.1.0 to 4.1.1
-Bump github/codeql-action from 2 to 3
-Bump actions/setup-python from 4 to 5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.40.0.bb => python3-sentry-sdk_1.40.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.40.0.bb => python3-sentry-sdk_1.40.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
index 19095b30d..f3f2a5d20 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "34ad8cfc9b877aaa2a8eb86bfe5296a467fffe0619b931a05b181c45f6da59bf"
+SRC_URI[sha256sum] = "657abae98b0050a0316f0873d7149f951574ae6212f71d2e3a1c4c88f62d6456"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


