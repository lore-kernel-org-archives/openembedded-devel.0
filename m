Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17B6C07E8D
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7633.1690875734649116257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105920460"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105920460"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D6DB2CD7E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AEA6D8B7E
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 95B3D10211;
	Tue,  1 Aug 2023 16:42:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 6.1 -> 6.1.1
Date: Tue,  1 Aug 2023 15:41:51 +0800
Message-Id: <1690875717-21608-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.532500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrZO4CGSsZ7L+IrTYg0ReHLugHBe3qpAiRmCbWfByA59HkL/QR+5ilqWywP
	xLZD1XA2C0M3K0BuSxCYFiFQrc6iroTwM73hkwTx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104191

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-6.1.1.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_6.1.bb => python3-robotframework_6.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_6.1.bb => python3-robotframework_6.1.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_6.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_6.1.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_6.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_6.1.1.bb
index 154b011aab..7fd2f2e888 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_6.1.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "a94e0b3c4f8ae08c0a4dc7bff6fa8a51730565103f8c682a2d8391da9a4697f5"
+SRC_URI[sha256sum] = "3fa18f2596a4df2418c4b59abf43248327c15ed38ad8665f6a9a9c75c95d7789"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.34.1


