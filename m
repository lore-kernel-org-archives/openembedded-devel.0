Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9C4C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9269.1708419300752778585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uIqaXqjK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419301; x=1739955301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0CZEMHkKLMOnW6nAC+AkHxTAqVBdUGEO7uASEuxtu6o=;
  b=uIqaXqjKtIAJ3TVLCjJSK1GggBC3qVyRnpH2XuctNmA1aDK0kmHPb5K/
   1Rj4cQ84SVBDpmln6Utac0jW5atnvkjuDY3PMtgK0AWfr6HdXWH0359/2
   iQlHxTZnODA2dewZ0C670l79LVtth0uvvgEtnAVv9Xugx3WWJwrsxgfXq
   X0IkQelw4y+BqadwTU3lyroekr4i1EYwCp2eacEC4timR7+LOuSLzbfvz
   l4SmedxdsHOTJk+IVRouC2hHuIYXc9SGoVhIqGy5/MrrK1Eng3nxhE0CP
   NSdMyRKGVfnNh0OrLzlIRvZWy73XAgXmVcRDQEJbuzpLLMSvMikpnSqgq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149872572"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149872572"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:00 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B358D4800
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BCF0D622B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26FAF200A7687
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C8CFF1A00A0;
	Tue, 20 Feb 2024 16:54:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/26] python3-sentry-sdk: upgrade 1.40.0 -> 1.40.4
Date: Tue, 20 Feb 2024 16:54:33 +0800
Message-Id: <1708419281-26047-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--1.744800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrsBSA1tuZVSZqTj+cW75OIDq5
	pN7LydEY+FyTwBk2ojw76EG8K9nMWCSTQ+POZGNWGFMYlDUzwr1ITEcvqjcF4P5FpHriNwIFlrH
	7mJSSe4VBOq1LSIbi+w3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGX+rNJicjlVL2em2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkq8wVBNrCywcbXIpEqEia6ALkAWIdsq5kCpxg
	8MtNxER/pw1pfeTdMrv5FFsCCPu5vWovyD+kmQvD0TXiyuzu2UmH3KuUdmXoUu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108936

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
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.40.0.bb => python3-sentry-sdk_1.40.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
index ec59c712b..cc27b6fd6 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "34ad8cfc9b877aaa2a8eb86bfe5296a467fffe0619b931a05b181c45f6da59bf"
+SRC_URI[sha256sum] = "657abae98b0050a0316f0873d7149f951574ae6212f71d2e3a1c4c88f62d6456"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


