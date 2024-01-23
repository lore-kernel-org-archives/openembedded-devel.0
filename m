Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CBDC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:41:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.1379.1705974100108048789
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146417922"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146417922"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:41:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 386F8A3124
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:41:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E807D21AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:41:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E8F620059322
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:41:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9863A1A006A;
	Tue, 23 Jan 2024 09:41:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 2.21.0 -> 2.21.1
Date: Tue, 23 Jan 2024 09:41:15 +0800
Message-Id: <1705974075-25644-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-3.973700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkpVVTEg9RDJNMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzcZ8/T6lrbv8dJC
	njmZ9nQZR0OiaxsMNo4Lq3aJl8AFS5CyYL2sIcewa5Z7QLkLw7Hre3NGlPDfEroNuCWDkaMqcpV
	uvoUOWmiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108406

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Avoid expensive runtime inspection of known callables

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.21.0.bb => python3-dbus-fast_2.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.21.0.bb => python3-dbus-fast_2.21.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.21.1.bb
index 5698ae99f..9e2566175 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "f582f6f16791ced6067dab325fae444edf7ce0704315b90c2a473090636a6fe0"
+SRC_URI[sha256sum] = "87b852d2005f1d59399ca51c5f3538f28a4742d739d7abe82b7ae8d01d8a5d02"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


