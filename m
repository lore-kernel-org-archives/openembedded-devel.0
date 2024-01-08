Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ECCC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:43:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6744.1704721419758995123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="124769365"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="124769365"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:43:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A7E3D6475
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:43:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E311ED4BC1
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:43:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56607202D4AB8
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:43:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0EC5D1A0072;
	Mon,  8 Jan 2024 21:43:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 2.0.24 -> 2.0.25
Date: Mon,  8 Jan 2024 21:43:16 +0800
Message-Id: <1704721396-30581-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--2.033800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSB1x0KuswXklOn7
	ya/+V5vjMzTo2qNcI5YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3i4Jg
	4IB24UOj/KVtfZiSDpoNFhuChNKBZeBzEkCCpnRndCok3ibXlQX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXLATnU9/xJLTlfhK2mgrzra7nNY2b9AmTQ6f8+8MB0pA1dcJ
	wYysE/nAfZitUxN6bx7CvfE9T9p93/KwfsttEWaLCvgcE8Kzij+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108151

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/sqlalchemy/sqlalchemy/releases/tag/rel_2_0_25

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-sqlalchemy_2.0.24.bb => python3-sqlalchemy_2.0.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.24.bb => python3-sqlalchemy_2.0.25.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.24.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.24.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
index 91ab762eb..35011553c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.24.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "6db97656fd3fe3f7e5b077f12fa6adb5feb6e0b567a3e99f47ecf5f7ea0a09e3"
+SRC_URI[sha256sum] = "a2c69a7664fb2d54b8682dd774c3b54f67f84fa123cf84dda2a5f40dcaa04e08"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


