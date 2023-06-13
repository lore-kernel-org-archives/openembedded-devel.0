Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9E2C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.3866.1686620480257431534
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="99794076"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="99794076"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:41:00 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 76716D29E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA555D9485
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AF6620074724;
	Tue, 13 Jun 2023 10:40:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.63.0 -> 0.64.1
Date: Tue, 13 Jun 2023 09:40:20 +0800
Message-Id: <1686620422-29962-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-3.083100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/ySrLqyE6Ur/jVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa3BF2OdN6oAASl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzEa6PwyY+YyHaFd
	GWdJ4frM55KZh/A/5/Ri2gIaRQ4Od35UjMmFx7mQ9YXqpzShUHExX5CWsPBzLeUU2b/jOl7Rw4Z
	qqoBDnhiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103252

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
 Small internal typing cleanups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.63.0.bb => python3-zeroconf_0.64.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.63.0.bb => python3-zeroconf_0.64.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.63.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.64.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.63.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.64.1.bb
index 6f3dbd522..1fd79a642 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.63.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.64.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "2643b1c9c6ffdfaa1313cf3d12ea0099482fcb3da77929a08be87fc8354d0b3d"
+SRC_URI[sha256sum] = "e90b2d5d247474b6ccf49bc7e02de516cc459efca6e3ac052b48eeb4a11985af"
 
 inherit pypi setuptools3
 
-- 
2.34.1


