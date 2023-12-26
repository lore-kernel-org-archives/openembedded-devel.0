Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C1AC46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 06:56:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.76154.1703573751475083300
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 22:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="132263629"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="132263629"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 15:55:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C81C9DC645
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:55:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 019FED5014
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:55:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C5AD202F0412
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:55:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2139A1A0072;
	Tue, 26 Dec 2023 14:55:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dbus-cxx: upgrade 2.4.0 -> 2.5.0
Date: Tue, 26 Dec 2023 14:55:41 +0800
Message-Id: <1703573741-12570-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62Sl93/yrFbOCYwtf6p1172z+BzNL64pLoMWVulnnX60uuLGy
	O2DrWmXipN4GrE385YqPLgeo0RdllTy1F1/6esUNxF7G+bIfZvS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 06:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107785

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dbus-cxx/{dbus-cxx_2.4.0.bb => dbus-cxx_2.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.4.0.bb => dbus-cxx_2.5.0.bb} (91%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.4.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.0.bb
similarity index 91%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.4.0.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.0.bb
index 6294827b1..fa81472af 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.4.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.0.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
-SRCREV = "ebac3df5beeb4337f65968ae5b265927abb792af"
+SRCREV = "2c3b3a767a5898ea8e51159e8122ddbb3aaeeb94"
 
 DEPENDS = "\
 	dbus \
-- 
2.34.1


