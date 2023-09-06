Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA23CCFA16
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:00:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2426.1693965649039821331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="131009728"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="131009728"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:00:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F2231E8521
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:00:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4206AD5EA7
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:00:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A0862FC7D48;
	Wed,  6 Sep 2023 11:00:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.14.0 -> 8.15.0
Date: Wed,  6 Sep 2023 10:00:33 +0800
Message-Id: <1693965633-14559-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrcMevonLZFXHEXghyuabqIDMhemprblfYUKQSjBNZaub6FCghHQvPFHsBD
	+ztSmevuI1CbBd+OXXKucpWPsNWMbKRz3pKqDJUR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104751

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.14.0.bb => python3-ipython_8.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.14.0.bb => python3-ipython_8.15.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.15.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.15.0.bb
index dece1d7e37..f06e501d76 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.15.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "1d197b907b6ba441b692c48cf2a3a2de280dc0ac91a3405b39349a50272ca0a1"
+SRC_URI[sha256sum] = "2baeb5be6949eeebf532150f81746f8333e2ccce02de1c7eedde3f23ed5e9f1e"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


