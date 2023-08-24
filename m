Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF0EC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:22:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6269.1692865345096058698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="128798635"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="128798635"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:22:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF241DDC68
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:22:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E576CBD698
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:22:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CA62B6BECE;
	Thu, 24 Aug 2023 17:22:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.76.0 -> 0.82.1
Date: Thu, 24 Aug 2023 16:21:35 +0800
Message-Id: <1692865295-3112-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.006
X-TMASE-Result: 10-0.546700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrZFW4zmF+QELk6Qbi+9i6Dx/4
	6V7eJv9O4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedli+
	BaqMwTNrVuPnsbKmJliiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDhCMfI6s63X/Vq7N+RK0bTUplOIGD8Q44GJ7zlH8hUZ2GJ2evYGnNN5ug7NT9J4k56r3j
	SwtrsS4phF4xS44gSOGvovEttwXjIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104584

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Build failures with older cython 0.29 series
 Optimize processing of records in RecordUpdateListener subclasses
 Speed up the service registry with a cython pxd
 Optimizing sending answers to questions
 Optimize unpacking properties in ServiceInfo
 Refactor notify implementation to reduce overhead of adding and removing listeners
 Add cython pxd file for _listener.py to improve incoming message processing performance
 Cythonize _listener.py to improve incoming message processing performance

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.76.0.bb => python3-zeroconf_0.82.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.76.0.bb => python3-zeroconf_0.82.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.76.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.82.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.76.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.82.1.bb
index 86f12ab384..9d3d25d136 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.82.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "80478e7e61eb2aac8043ead671d9b248333d6a6929153023a50774dd1e5dbd2c"
+SRC_URI[sha256sum] = "bc876f8128da9baf939f7f5b7b29c8b4571b04a2036b2fa2b0c82db254a78e3e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


