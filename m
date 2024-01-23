Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E36C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:54:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.1677.1705974890148889475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="126251999"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="126251999"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:54:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 30571D9D8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:54:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59F21D5B4D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:54:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E88C36B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:54:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 960E11A006A;
	Tue, 23 Jan 2024 09:54:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyatspi: upgrade 2.46.0 -> 2.46.1
Date: Tue, 23 Jan 2024 09:54:25 +0800
Message-Id: <1705974865-26207-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-3.787600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIgofMgahPrSQG
	h5qJzqDbh4OimVmsmV+BdYP3BvkQauG1W8jesiDJzmwpmAFt7kVUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG53ZbPRfc5otoHmOTZNdeMXX7Q
	qxdrFbPuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUjlFhvTAgBXqC5q4LbC2nPCOKj
	2jxPD/wsv6bibJBHvgcZ2SMq0/I+lpi+EcAC3hYSor4sB6mW2pmL5txfP5/KcmQaSZEivut7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108419

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix some implicit function declarations and other compiler warnings
  in the tests.
* Remove some unused code.
* Update the README to describe the module's current status.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyatspi_2.46.0.bb => python3-pyatspi_2.46.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyatspi_2.46.0.bb => python3-pyatspi_2.46.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
rename to meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
index cd0e12ec8..2b6a6c2c0 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
 
 SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master"
-SRCREV = "c9cb2a2289a6eb1fb95b66c25d5351bfea54c47e"
+SRCREV = "8c69016b38d0e4caaf4c986938ea3410fb7351b6"
 
 S = "${WORKDIR}/git" 
 
-- 
2.34.1


