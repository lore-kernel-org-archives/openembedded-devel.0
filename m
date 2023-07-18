Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C76AC25B5B
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.689.1689654379725723008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124880136"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124880136"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D307DCA1EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F5E6D9479
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89F6E20077821;
	Tue, 18 Jul 2023 13:26:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mock: upgrade 5.0.2 -> 5.1.0
Date: Tue, 18 Jul 2023 12:25:34 +0800
Message-Id: <1689654348-30702-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--3.927700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrOA3W7N7dBgmfZAKheoeQwcrM
	f2YsbSCKvnCllUJsUcsnlI/F17oW8kn06/N0voNVvf5DDPstHFEBqNb4Qv6Vo92Mb1nXqHbBvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgFXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJ2pSnkBxJLcc6/72/8qw6FJAzIVCOxSlARjS+ZYo045Cy00
	v0l6pYWTP0xMQGTg1Umt7pFCG8r52sfISoZ1YNzUP8QtfqTCtpLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103923

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-bpo-44185: :func:'unittest.mock.mock_open' will call the :func:'close' method
 of the file handle mock when it is exiting from the context manager.
-gh-94924: :func:'unittest.mock.create_autospec' now properly returns coroutine
 functions compatible with :func:'inspect.iscoroutinefunction'
-bpo-17013: Add ThreadingMock to :mod:'unittest.mock' that can be used to create
 Mock objects that can wait until they are called.
-bpo-41768: :mod:'unittest.mock' speccing no longer calls class properties.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mock_5.0.2.bb => python3-mock_5.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mock_5.0.2.bb => python3-mock_5.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
index 6b511d82f7..d9ecb9d4c8 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += " \
     python3-unittest \
 "
 
-SRC_URI[sha256sum] = "06f18d7d65b44428202b145a9a36e99c2ee00d1eb992df0caf881d4664377891"
+SRC_URI[sha256sum] = "5e96aad5ccda4718e0a229ed94b2024df75cc2d55575ba5762d31f5767b8767d"
-- 
2.34.1


