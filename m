Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7535DC7EE2A
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2149.1685951607692041341
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="119462870"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="119462870"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F7E1C3F94
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:23 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 784E9D208E
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id A80922FC85E5;
	Mon,  5 Jun 2023 16:53:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xrdb: upgrade 1.2.1 -> 1.2.2
Date: Mon,  5 Jun 2023 15:52:57 +0800
Message-Id: <1685951589-29920-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-3.011000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzXXbamj/TU57hd
	ARHnUbVtMB+YD3KTT8Ymyuh5zZxuRrpdaAsBw4K7bTdhrAcm88L/ceurXvXgoN9RlPzeVuQQsPg
	sj1zRh6JEyRr1yZ+Tef+1065WI2+4L/tBTZzO5Q25x7uAXGEprfOd2ImQcUyEPbCkSqodb8SUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLNi4yvXKt3uaWwFa
	Cb0RqWT6aXgCfaJbJDCzEOovYdCuPe6gbRMpELPK11BilSnwjd0PsXKDsMyGTJ5vk8Do5aUb8HM
	6RE6PtmIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103113

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
gitlab CI: add a basic build test
Build xz tarballs instead of bzip2
gitlab CI: stop requiring Signed-off-by in commits
Variable scope reduction as recommended by cppcheck
Use C99 struct initialization
Rename variable 'dup' to avoid shadowing dup() function
Fallback asprintf: don't truncate output that has a \0 in string
configure: raise minimum autoconf requirement to 2.70

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xrdb_1.2.1.bb => xrdb_1.2.2.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrdb_1.2.1.bb => xrdb_1.2.2.bb} (70%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.2.bb
similarity index 70%
rename from meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
rename to meta-oe/recipes-graphics/xorg-app/xrdb_1.2.2.bb
index 20fdea1a54..53214c8fe8 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 
 DEPENDS += "libxmu"
 
-SRC_URI[sha256sum] = "4f5d031c214ffb88a42ae7528492abde1178f5146351ceb3c05f3b8d5abee8b4"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "31f5fcab231b38f255b00b066cf7ea3b496df712c9eb2d0d50c670b63e5033f4"
 
 EXTRA_OECONF += "--with-cpp=${bindir}/cpp"
-- 
2.34.1


