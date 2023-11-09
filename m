Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB2C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:40:12 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.115631.1699508405646424876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="118471185"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="118471185"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:40:04 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 048C8CF1C0
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:40:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 462E9D20B6
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:40:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FEDC2005019F;
	Thu,  9 Nov 2023 14:39:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.119.0 -> 0.120.0
Date: Thu,  9 Nov 2023 13:38:56 +0800
Message-Id: <1699508336-17100-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27986.002
X-TMASE-Result: 10-1.413700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrnSXAAnfQldKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8Jlr1xKkE5uYMNZlevXKUzBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4JNw
	CjWm455EsoSwz69UWiZF2WGpv4T3igSqLqvn3BW29mv6VcDF4OjuV9wuUEbEbrzM6G4eJsDYqas
	WQQ83L2X/rvj9c0JACCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106507

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Speed up incoming packet processing with a memory view
Speed up decoding labels from incoming data
Speed up ServiceBrowsers with a pxd for the signal interface

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.119.0.bb => python3-zeroconf_0.120.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.119.0.bb => python3-zeroconf_0.120.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.119.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.120.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.119.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.120.0.bb
index a62c1b8d9..7d5077e30 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.119.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.120.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "dbe3548ac0a68ab88241f6ac03bc6b7c19c23160bd78ed4c94ae4d92196be230"
+SRC_URI[sha256sum] = "52b25a4ed92de21d10d768c92ab5a9765a88a2ed43dea1260d67bf22734dc951"
 
 inherit pypi setuptools3
 
-- 
2.34.1


