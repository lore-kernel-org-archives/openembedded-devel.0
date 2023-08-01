Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9346FC07E8A
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.7612.1690875740337766105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126071609"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126071609"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:18 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21A6DC3F84
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 44F30CF7D1
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B930710211;
	Tue,  1 Aug 2023 16:42:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-click: upgrade 8.1.5 -> 8.1.6
Date: Tue,  1 Aug 2023 15:41:37 +0800
Message-Id: <1690875717-21608-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-1.334700-10.000000
X-TMASE-MatchedRID: pRBf1MvsfTW7qz8f6326on1zro62qhdCpxAd6mi1Ga14YeSlHZYFopIh
	2sHJ3rY0n930i8LkkelSHwKg482PEO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJaf/8Uw5sGwgYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXJe5wsQaHLqM4GrMjTT3cMUbs20VhZ1gApLQVFHMm5W7AzSD
	h32EXd7UqmdF9YJtLTLUnjCU+bKpMuaObV9sPas0m9Ur3h5EhX+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104179

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix an issue with type hints for @click.group()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-click_8.1.5.bb => python3-click_8.1.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-click_8.1.5.bb => python3-click_8.1.6.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.5.bb b/meta-python/recipes-devtools/python/python3-click_8.1.6.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-click_8.1.5.bb
rename to meta-python/recipes-devtools/python/python3-click_8.1.6.bb
index d7d50118e2..4858c9e359 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.6.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "4be4b1af8d665c6d942909916d31a213a106800c47d0eeba73d34da3cbc11367"
+SRC_URI[sha256sum] = "48ee849951919527a045bfe3bf7baa8a959c423134e1a5b98c05c20ba75a1cbd"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


