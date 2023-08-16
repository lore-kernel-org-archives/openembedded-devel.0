Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1C3C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:47:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.152114.1692150447107977505
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107669790"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107669790"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:47:24 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5BC1D29E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:47:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EB47FD8BB4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:47:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F1F921BD42;
	Wed, 16 Aug 2023 10:47:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2023.6.3 -> 2023.8.8
Date: Wed, 16 Aug 2023 09:46:45 +0800
Message-Id: <1692150405-5820-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKr2c3DCsg9T1EqjnNCYOahpmj2pHQ+FdjO09
	ADuJMMtXa5fBEyjaeFSldRaequYPEZDZB6eSqTubUBoWLfRBkufVzICdt/6Nv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104397

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 emoved usage of _PyBytes_Join and did a little tidying of the code that makes the result string.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2023.6.3.bb => python3-regex_2023.8.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2023.6.3.bb => python3-regex_2023.8.8.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2023.6.3.bb b/meta-python/recipes-devtools/python/python3-regex_2023.8.8.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2023.6.3.bb
rename to meta-python/recipes-devtools/python/python3-regex_2023.8.8.bb
index f653f32fe2..1676bab26a 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2023.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2023.8.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "72d1a25bf36d2050ceb35b517afe13864865268dfb45910e2e17a84be6cbfeb0"
+SRC_URI[sha256sum] = "fcbdc5f2b0f1cd0f6a56cdb46fe41d2cce1e644e3b68832f3eeebc5fb0f7712e"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


