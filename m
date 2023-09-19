Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC53CD5495
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:47:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2516.1695109661803846439
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120424030"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120424030"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:47:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AC056CD7E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:47:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ACC81D5E31
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:47:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 30BBF20079116;
	Tue, 19 Sep 2023 16:47:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-migrate: upgrade 4.0.4 -> 4.0.5
Date: Tue, 19 Sep 2023 15:47:01 +0800
Message-Id: <1695109621-7760-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10-5.545700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrWq/snXbxpCDI9EDAP/dptq1S
	A8yCaZPAk8CPkEfLblR3aWU5jdY62O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqh
	SzMv5WaZ7MSP7SLpuGIiEKUa2WZLOeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibec3QM3secWbCIhSsocEZo18nZlSmye/eR1+DMBUjp6YvhQh79gRf7BbTp
	fen3lqy/SUwIobf5aMP7tkAMAklK1r2qvVlwbfnBTvke5AdCTo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104983

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Compatiblity fixes for Flask-SQLAlchemy >= 3.1
-Allow process_revision_directives option to be configurable
-Stop testing Python 3.7, as Flask-SQLAlchemy 3.1 stopped supporting it 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-flask-migrate_4.0.4.bb => python3-flask-migrate_4.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_4.0.4.bb => python3-flask-migrate_4.0.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.4.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_4.0.4.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
index d9df2a4270..13f4e0f5a7 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "73293d40b10ac17736e715b377e7b7bde474cb8105165d77474df4c3619b10b3"
+SRC_URI[sha256sum] = "d3f437a8b5f3849d1bb1b60e1b818efc564c66e3fefe90b62e5db08db295e1b1"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.34.1


