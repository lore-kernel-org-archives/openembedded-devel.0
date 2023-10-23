Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38EEC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:29:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.116253.1698049753279917199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136683284"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136683284"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:29:11 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 82422D9DA6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:29:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C8A5FCFB9F
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:29:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B8C8E88225;
	Mon, 23 Oct 2023 17:29:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 3.0.0 -> 3.0.1
Date: Mon, 23 Oct 2023 16:28:27 +0800
Message-Id: <1698049707-24963-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-3.077100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbys/d0QOA4TCL0Rv
	QSGMpDez4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6oY8
	o6kGRewjQM5Xl+mQZw6xUVrXHdvo9ue4+5U+ha6AJxnqRbVEmDEvHWaix8OQnV9dtb9rGqjy/FH
	po0Ox4HYMLXC5vjKByCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105650

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix crashes linting code using PEP 695 (Python 3.12) generic type syntax.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.0.0.bb => python3-astroid_3.0.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.0.0.bb => python3-astroid_3.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
index cdf6fc74ed..db3ef43920 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1defdbca052635dd29657ea674edfc45e4b5be9cd53630c5b084fcfed94344a8"
+SRC_URI[sha256sum] = "86b0bb7d7da0be1a7c4aedb7974e391b32d4ed89e33de6ed6902b4b15c97577e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


