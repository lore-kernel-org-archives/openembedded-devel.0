Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55071C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:13:24 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6166.1692864802790809675
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="108636728"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="108636728"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:13:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 60939C3F81
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:13:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F3DECF7DF
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:13:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BB106BE79;
	Thu, 24 Aug 2023 17:13:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.5.1 -> 4.6.0
Date: Thu, 24 Aug 2023 16:12:41 +0800
Message-Id: <1692864761-2541-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.005
X-TMASE-Result: 10--1.832800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrJF8tFEtOdqst5eB0VbV73EeU
	78fpCoewfLnWqh+I27QNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFCIprJHD2+agt1/X5e5kY/Hq5/
	qzkikRHE7Fw6aAEa29nXG1fHQ+b6lO5wbw6xmYLo9pP2MiNCEF0gconZVa5vkAr7MdfbVHyux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104570

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Improvements in the connection rejected flow
Better handling of Gunicorn threaded worker
shutdown() method for the Engine.IO server

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.5.1.bb => python3-engineio_4.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.5.1.bb => python3-engineio_4.6.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.6.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.6.0.bb
index d97248891c..84db9b53b7 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.6.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "b167a1b208fcdce5dbe96a61a6ca22391cfa6715d796c22de93e3adf9c07ae0c"
+SRC_URI[sha256sum] = "dca041f0653ef092da4ce8abd4550fdc54076680b9c72d931c146492c620678b"
-- 
2.34.1


