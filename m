Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5898CCFA1F
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:04:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2563.1693965862155022632
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="132257911"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="132257911"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:04:12 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AF468C68E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:04:10 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1D3ED9681
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:04:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F39B814DE;
	Wed,  6 Sep 2023 11:04:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tox: upgrade 4.10.0 -> 4.11.1
Date: Wed,  6 Sep 2023 10:04:01 +0800
Message-Id: <1693965841-14920-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10--2.103400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfNs1Ir4NZzFmh+D
	i3+4QSRc2F1OKN2XaRY7blYJVFl87+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJaf/8Uw5sGwgYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXL4XQaXzdGfBKzXyUGfEkByWb5x1g5F/lY7WNJIOFd531m9t
	qbUdxe1XguOzujf8FkR2lEs0Ozrs7+6CB0KbKOhboH/QoSnt2f+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104760

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Allow passing in multiple overrides using the ; character and fix , being used as splitting values
Add support for setting build backend config_settings in the configuration file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.10.0.bb => python3-tox_4.11.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.10.0.bb => python3-tox_4.11.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.10.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.11.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.10.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.11.1.bb
index fb6b3d712e..bbb77e713d 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.11.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "e041b2165375be690aca0ec4d96360c6906451380520e4665bf274f66112be35"
+SRC_URI[sha256sum] = "8a8cc94b7269f8e43dfc636eff2da4b33a199a4e575b5b086cc51aae24ac4262"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


