Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE125C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:52:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.116168.1698051121821020474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125519915"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125519915"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:51:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E98FD6189
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:51:57 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CCC94D5EB0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:51:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3B58879A4;
	Mon, 23 Oct 2023 17:51:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-msgpack: upgrade 1.0.6 -> 1.0.7
Date: Mon, 23 Oct 2023 16:51:42 +0800
Message-Id: <1698051102-25983-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--1.053600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysdfKGysxBYcr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HztJgOULF9rDXk
	WtYCR289bJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7qQ5
	LTIVKlV5IP/qgNTqqaMXSIwd/n1AsC7YiuZqgsFY8t752+/cpTOsaYH0T27L1QCqPWbUetscu+/
	K+//Xl8hixOBsvUeJiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105675

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Fix build error of extension module on Windows.
setup.py doesn't skip build error of extension module.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-msgpack_1.0.6.bb => python3-msgpack_1.0.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.6.bb => python3-msgpack_1.0.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.6.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
index 3cddcb9ae3..79943b55e4 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "25d3746da40f3c8c59c3b1d001e49fd2aa17904438f980d9a391370366df001e"
+SRC_URI[sha256sum] = "572efc93db7a4d27e404501975ca6d2d9775705c2d922390d878fcf768d92c87"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-io \
-- 
2.34.1


