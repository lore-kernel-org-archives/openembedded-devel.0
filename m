Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD5FCD5498
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:50:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2554.1695109833415328868
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120424345"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120424345"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:50:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9C44DE6B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:50:28 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 12B7DD4F55
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:50:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26B9086F10;
	Tue, 19 Sep 2023 16:50:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 10.0.0 -> 10.0.1
Date: Tue, 19 Sep 2023 15:49:51 +0800
Message-Id: <1695109791-7928-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10-1.375300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3HztJgOULF9rREf
	fVh/puQ4Qf5beUHrsHFFBtMfutWmRtPmTjXcK+VNvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLae9RgUMr8m5urv3UcsUdxLOWlJlFwZ9aADbbqCuley4dJ5
	sYbwvsQYM29qVpnib5Ujtd9knVsQcdBUfGjWJsg+C3H/mNeblBLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104987

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Updated libwebp to 1.3.2 #7395
Updated zlib to 1.3 #7344

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pillow_10.0.0.bb => python3-pillow_10.0.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_10.0.0.bb => python3-pillow_10.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pillow_10.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_10.0.1.bb
index 8683ef2287..055b41bfa5 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b22dc6b663b9175820e5e03337c7596b"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=10.0.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
            file://run-ptest \
@@ -62,4 +62,4 @@ do_install_ptest() {
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "6e28ed1f36d0eb74053af54e1eddc9c29db698cd"
+SRCREV = "e34d346f10c0b1c814661e662a3e0c1ef084cf1c"
-- 
2.34.1


