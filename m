Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71913C3DA40
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.681.1689654362314687023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="113108742"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="113108742"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:12 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DB99CA1EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 92EC5D947A
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F1AB20077821;
	Tue, 18 Jul 2023 13:26:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.15.5 -> 2.15.6
Date: Tue, 18 Jul 2023 12:25:24 +0800
Message-Id: <1689654348-30702-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon585nKQczq7uce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIDXr9MXEKFBgl5Ss4ESAjXt0aTklyu+K1O1n
	ViW1yexnCthfMVSyd9iQDeEAKmVIDizHQjzjWCJyd3JEd6fpjmcU9i+tpO24n+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103912

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Harden get_module_part() against ".".
 Avoid expensive list/tuple multiplication operations that would result in MemoryError.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
index 7c859107cb..7325eb13f3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1039262575027b441137ab4a62a793a9b43defb42c32d5670f38686207cd780f"
+SRC_URI[sha256sum] = "903f024859b7c7687d7a7f3a3f73b17301f8e42dfd9cc9df9d4418172d3e2dbd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


