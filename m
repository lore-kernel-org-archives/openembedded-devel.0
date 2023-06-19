Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A6DC00528
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2279.1687157424271482548
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="100773771"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="100773771"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8160FCA1F1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:19 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B4F19D88B3
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id CFF212FC847B;
	Mon, 19 Jun 2023 15:50:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.5.3 -> 3.6.0
Date: Mon, 19 Jun 2023 14:48:11 +0800
Message-Id: <1687157308-17342-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--1.141800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrjkDrBOJwwnRd9sN/3ASTwL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74C0oMqkY991yQ9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBFX7dhCQ2PxGZKezTVYtn4s1H
	vhA58UjeFOcyevjxgNmPBGpA3etYgA/GdQ2CaeDFjzBemW4AUFcfWn0UuR6cDUVw7nbQzTbux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103363

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
platformdirs: introduce user_downloads_dir()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_3.5.3.bb => python3-platformdirs_3.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.5.3.bb => python3-platformdirs_3.6.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.3.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.5.3.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
index c91d9111f..20b3299ac 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV ?= "50e638eec6cadee0dfe47197464241be8a70718d"
+SRCREV ?= "85b0b67eb33a835b797c1d52dab4a06c5554b7ee"
 SRC_URI[sha256sum] = "7954a68d0ba23558d753f73437c55f89027cf8f5108c19844d4b82e5af396335"
 
 inherit python_setuptools_build_meta ptest
-- 
2.34.1


