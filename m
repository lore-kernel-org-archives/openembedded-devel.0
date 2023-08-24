Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562EAC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:14:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6191.1692864880989647640
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117555063"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117555063"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:14:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A1F2ADB4C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:14:34 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E578BD3F2A
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:14:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D17F2FC7276;
	Thu, 24 Aug 2023 17:14:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 1.5.0 -> 1.5.1
Date: Thu, 24 Aug 2023 16:14:10 +0800
Message-Id: <1692864850-2655-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrVrG0IPNMLn8PbgCJE85RdI+SbHv8MF2wFbEEBRlnYzYkQ7Rp5mywaAusS
	l22oy+A3kUnj4lg1486b81r1exiP7Vm5fj66gUMR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104573

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mypy_1.5.0.bb => python3-mypy_1.5.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.5.0.bb => python3-mypy_1.5.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.5.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.5.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.5.1.bb
index 46730aa231..50ad9efea1 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba8ec528da02073b7e1f4124c0f836f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f3460f34b3839b9bc84ee3ed65076eb827cd99ed13ed08d723f9083cada4a212"
+SRC_URI[sha256sum] = "b031b9601f1060bf1281feab89697324726ba0c0bae9d7cd7ab4b690940f0b92"
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


