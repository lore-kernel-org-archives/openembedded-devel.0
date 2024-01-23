Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70C4C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:56:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.1706.1705974984824927177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146931330"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146931330"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:56:22 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A5F27D6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:56:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA7CED3F21
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:56:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 711D86B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:56:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 038F51A006A;
	Tue, 23 Jan 2024 09:56:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 6.1.1 -> 7.0
Date: Tue, 23 Jan 2024 09:56:00 +0800
Message-Id: <1705974960-26280-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-0.532500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrVucbhjEdoOg5w294g4dbVhQD4/2I6F8gffXYO3spjupw3ZQq7H7kBGywP
	xLZD1XA2C0M3K0BuSxCYFiFQrc6iroTwM73hkwTx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108421

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-7.0.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_6.1.1.bb => python3-robotframework_7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_6.1.1.bb => python3-robotframework_7.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_6.1.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_6.1.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
index 7fd2f2e88..ca301e46a 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_6.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "3fa18f2596a4df2418c4b59abf43248327c15ed38ad8665f6a9a9c75c95d7789"
+SRC_URI[sha256sum] = "04623f758346c917db182e17591ffa474090560c02ed5a64343902e72b7b4bd5"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.34.1


