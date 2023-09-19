Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78488CD5485
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:35:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2261.1695108926660119937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120910423"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120910423"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:35:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05955DE6B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:35:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 38884D4F62
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:35:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AE9B26BF63;
	Tue, 19 Sep 2023 16:35:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libglvnd: upgrade 1.6.0 -> 1.7.0
Date: Tue, 19 Sep 2023 15:33:57 +0800
Message-Id: <1695108837-7219-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.006
X-TMASE-Result: 10-0.732000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSzmwpmAFt7kWYkAyCbA7KV50C6WJNXTpiJdh
	ToUNB/e6xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzvdWdxm0TWFYCLC
	rt6OZDkbUJHEAyvyTsvxe17Xk9IklQwziQB7JaJBvgQt0JUq+K1wngViGnyb73vAuiGu+FS8z6H
	Hej79uJiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104969

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Added support for HGL on Haiku. Currently, Haiku is only supported with the Meson build.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libglvnd/{libglvnd_1.6.0.bb => libglvnd_1.7.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libglvnd/{libglvnd_1.6.0.bb => libglvnd_1.7.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.6.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libglvnd/libglvnd_1.6.0.bb
rename to meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index b76373cf2a..4094aa4fc6 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.6.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efe
 SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
 
 # v1.5.0 tag
-SRCREV = "b05bbcdaeb9b700cf7877e6d66f8fc3ac952295b"
+SRCREV = "faa23f21fc677af5792825dc30cb1ccef4bf33a6"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-- 
2.34.1


