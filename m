Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70CCC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:57:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.1742.1705975020357091883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="135331978"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="135331978"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:56:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2448ED9D93
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:56:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 568FDBF4A3
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:56:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D79646B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:56:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77E6C1A006A;
	Tue, 23 Jan 2024 09:56:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.39.1 -> 1.39.2
Date: Tue, 23 Jan 2024 09:56:41 +0800
Message-Id: <1705975001-26318-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--3.716900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu41slblCqbQv4P
	dEuhNbfdGfvvA62+ODpDc4lSgrowpSJcv5X7ObmJA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYragH2fa4K/a5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAN1gGfSFMLUOPWLSStl5n3SqazxIZazy6JKxF6nADVwUMZ1NX0AYaK+x6m9HApDF4aQYq
	qljipqAqbDmwtN0sJtjGHvUBLC3AvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108422

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix timestamp in transaction created by OTel
-Fix relative path in DB query source
-Run more CI checks on 2.0 branch
-Fix tracing TypeError for static and class methods
-Fix missing ctx in Arq integration
-Change data_category from check_in to monitor

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.39.1.bb => python3-sentry-sdk_1.39.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.39.1.bb => python3-sentry-sdk_1.39.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.2.bb
index 9f421328b..9c3cf5860 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.2.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "320a55cdf9da9097a0bead239c35b7e61f53660ef9878861824fd6d9b2eaf3b5"
+SRC_URI[sha256sum] = "24c83b0b41c887d33328a9166f5950dc37ad58f01c9f2fbff6b87a6f1094170c"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


