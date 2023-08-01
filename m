Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C51C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7609.1690875735070554660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613524"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613524"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:15 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 91C3CDB3C8
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D9A0CCF7CA
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 617AB10211;
	Tue,  1 Aug 2023 16:42:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dill: upgrade 0.3.6 -> 0.3.7
Date: Tue,  1 Aug 2023 15:41:32 +0800
Message-Id: <1690875717-21608-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-1.309200-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yYHfzWJnn0eolEDhvi2wR879wRnyxuPjhOaG
	g/Bit59t6tJOVmmMtwemEG66w8rWvc0ZW7sNo8j1bnNT+QUGvxy7J9Pq87AdKTxr78aOiICqvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPioIsi7Sa0gxrLmMm+vGozW9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs/9z6
	fhrVeNmeMGkV42GvyRxneLLnEXH9ugUfoPkwtmOi+n30HpLVHQl4wEYtNb51kxQarukxwduHQJT
	iFZYtuL+Y7m0h3/TLYgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104173

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 align LICENSE wording with BSD-3-Clause
 Copyright updated to 2023.

Changelog:
==========
 Fix _is_builtin_module
 minor changes from PR #554
 align LICENSE wording with BSD-3-Clause
 Python 3 Metaclasses [Support ABC and Enums - Part 1]
 Abstract Base Classes [Support ABC and Enums - Part 2]
 fix typo
 Bump requests from 2.27.1 to 2.31.0 in /docs
 Fixed crashed in _dill._is_builtin_module when a module's file is None
 Bump pygments from 2.11.2 to 2.15.0 in /docs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-dill_0.3.6.bb => python3-dill_0.3.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dill_0.3.6.bb => python3-dill_0.3.7.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.6.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-dill_0.3.6.bb
rename to meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
index bec4643064..b6b788110d 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Serialize all of python"
 HOMEPAGE = "https://pypi.org/project/dill/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=61f24e44fc855bde43ed5a1524a37bc4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19de1f406e29e68f579e7e82e0758ce3"
 
-SRC_URI[sha256sum] = "e5db55f3687856d8fbdab002ed78544e1c4559a130302693d839dfe8f93f2373"
+SRC_URI[sha256sum] = "cc1c8b182eb3013e24bd475ff2e9295af86c1a38eb1aff128dac8962a9ce3c03"
 
 inherit pypi setuptools3
 
-- 
2.34.1


