Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A434DC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:40:46 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2966.1700124043840938644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119279960"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119279960"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:40:42 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 770B3D5028
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:40:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1397D9739
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:40:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EDEF040196;
	Thu, 16 Nov 2023 17:40:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.126.0 -> 0.127.0
Date: Thu, 16 Nov 2023 16:39:52 +0800
Message-Id: <1700123992-22691-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-2.935700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa3BF2OdN6oAASl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzXxJHP1IU/RhxuZ
	qq/c3nFmfGBDFwoHkukA7R7cwAW+17ZxRDkM1HTAgr3uq5JXCdo3dQvXKp3vyBXfiYL5fekuUdU
	TCNzVsdiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106804

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Small speed up to writing outgoing packets
-Speed up incoming packet reader
-Small speed up to processing incoming dns records

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.126.0.bb => python3-zeroconf_0.127.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.126.0.bb => python3-zeroconf_0.127.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.126.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.127.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.126.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.127.0.bb
index 7d5077e30..45df13eec 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.126.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.127.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"

-SRC_URI[sha256sum] = "875afbebc25bab002610091ecfdccaeebc185ce69f07a3525e4b86680693ea71"
+SRC_URI[sha256sum] = "1ec001989666be7f76630d6bb8b07fb3928d655fa79a1484674a776778c9a1b3"
 
 inherit pypi setuptools3
 
-- 
2.34.1


