Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFC1EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2314.1687157422040252285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="120836499"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="120836499"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1B92C68E2
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:26 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 41513D5EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 658092FC8442;
	Mon, 19 Jun 2023 15:50:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 6.0.2 -> 6.1
Date: Mon, 19 Jun 2023 14:48:23 +0800
Message-Id: <1687157308-17342-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-1.667600-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrZG3SCLP7QtKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrYwPMLo/V+d/4obqk1WhdfZr2/DtVCx885Fyg4dtUpd3BWLoXgWa/xaywP
	xLZD1XA2C0M3K0BuSxCYFiFQrc6iroTwM73hkwTx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-6.1.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_6.0.2.bb => python3-robotframework_6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_6.0.2.bb => python3-robotframework_6.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_6.0.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_6.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_6.0.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_6.1.bb
index 19c765275..154b011aa 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_6.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_6.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "6a9c06deb220099990f190c6e4e772675f625e4d5d84640fca6f0ad46ff538d0"
+SRC_URI[sha256sum] = "a94e0b3c4f8ae08c0a4dc7bff6fa8a51730565103f8c682a2d8391da9a4697f5"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.34.1


