Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27105C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:35:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6571.1698104150036020153
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137284627"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137284627"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:35:49 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 85A38D5029
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:35:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB54AD9684
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:35:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E092C70BE1;
	Tue, 24 Oct 2023 08:35:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-texttable: upgrade 1.6.7 -> 1.7.0
Date: Tue, 24 Oct 2023 07:35:30 +0800
Message-Id: <1698104130-31772-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-0.442400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy8+eIWB1EvDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBIkEpjrRL3G2GJk6ApcFD5n1Y
	H16FAUesTzRKhJF3wPtbmLhh2ZKt5teouMFB/CWIzeplnwZblTVldlPn3j8GK6hJRQgWKsUOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105697

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add boolean formatting option

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-texttable_1.6.7.bb => python3-texttable_1.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-texttable_1.6.7.bb => python3-texttable_1.7.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.6.7.bb b/meta-python/recipes-devtools/python/python3-texttable_1.7.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-texttable_1.6.7.bb
rename to meta-python/recipes-devtools/python/python3-texttable_1.7.0.bb
index e8024987c9..56448f738e 100644
--- a/meta-python/recipes-devtools/python/python3-texttable_1.6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.7.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "290348fb67f7746931bcdfd55ac7584ecd4e5b0846ab164333f0794b121760f2"
+SRC_URI[sha256sum] = "2d2068fb55115807d3ac77a4ca68fa48803e84ebb0ee2340f858107a36522638"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


