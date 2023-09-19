Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0B9CD5495
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:48:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2548.1695109703387841443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132122812"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132122812"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:48:22 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 144BCC68E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:48:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AD83D9689
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:48:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C271B2005019A;
	Tue, 19 Sep 2023 16:48:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.3.5 -> 5.3.6
Date: Tue, 19 Sep 2023 15:47:50 +0800
Message-Id: <1695109670-7817-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--0.050800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmNM+b8yxBqvA+fY
	wU5LZxSc4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWY5v+NllnxQoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIkhwIIZ56PpBSqHpeOCuwvJPFHhJc+7m1GCU
	lGa6bQYnkwhPr1qCfBJUCi5777pZ4GSmHawauJwApGRM48kuK3swVCqWmUw//+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104984

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixes in the test client to support recent changes in Socket.IO dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-flask-socketio_5.3.5.bb => python3-flask-socketio_5.3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.3.5.bb => python3-flask-socketio_5.3.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.5.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.3.5.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
index 34919d2222..e151fda9d5 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "5f01158d10db71aa78c969b631ce3b9148b47ab0de1995158f9577f85b004d25"
+SRC_URI[sha256sum] = "bb8f9f9123ef47632f5ce57a33514b0c0023ec3696b2384457f0fcaa5b70501c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.34.1


