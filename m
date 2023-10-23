Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7232C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:21:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.115818.1698049314448520238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137172268"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137172268"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:21:52 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0F0ED3EBA
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:21:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CABACFB9A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:21:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 62EEE34786;
	Mon, 23 Oct 2023 17:21:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libyang: upgrade 2.1.111 -> 2.1.128
Date: Mon, 23 Oct 2023 16:21:32 +0800
Message-Id: <1698049292-24555-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-0.030000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr0nXvwjW2mSXVjNsehGf0vXX+
	5pS6rxRuB35JUm0KMAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6Jof4l8ZK0TNJL7fGpDjikVY6N/cDgNNi4U50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJF1Jr62f/5dSvPakR8R3NtENgrqUrGVhGVG9MT4PfO7tL2d
	+eyaOukwaz7s4h4VV08VVRVSeUIofZNXsWRle/XwECSxEhTY7BLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105640

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
revert of identityref canonical value change
the identity always printed with the module name as the prefix
data tree and hash table optimizations
opaque node handling fixes and improvements
lots of other bug fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_2.1.111.bb => libyang_2.1.128.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.111.bb => libyang_2.1.128.bb} (96%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.111.bb b/meta-oe/recipes-extended/libyang/libyang_2.1.128.bb
similarity index 96%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.111.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.1.128.bb
index e59235690a..55dbb82029 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.111.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.128.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "8b0b910a2dcb7360cb5b0aaefbd1338271d50946"
+SRCREV = "7e5ea21030fe6632b6faad30c0de8d9669503773"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
-- 
2.34.1


