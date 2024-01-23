Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13FEC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:39:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.1326.1705973944896379931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="147208346"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="147208346"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:39:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 348F1D4F60
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:39:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75723D9680
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:38:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E68523EA77
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:38:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9DE1C1A006A;
	Tue, 23 Jan 2024 09:38:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 39.4.2 -> 39.4.3
Date: Tue, 23 Jan 2024 09:37:35 +0800
Message-Id: <1705973855-25567-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-1.637700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz3MHPl9UlNhql8
	Bh3+/TeG4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4EDM
	kO3NYugo/tFZImySLRikzn/m1sFMRS6xgLr3s/rHn456LajupGL/XHFrN/ix01f+/pgdwUsJMMu
	EFcp1rVbgyA5rcSZjSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108404

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add type annotations to c_source.py
-Enum newlines

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.2.bb => python3-cantools_39.4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.2.bb => python3-cantools_39.4.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.2.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.2.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.3.bb
index ad2025e64..3cf956083 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "8069a8f473bb1679990bea0903f3a22d58df5495aebbf09f58d49f627511b619"
+SRC_URI[sha256sum] = "7aaa3d246bc5328bb29c681fc8162d2800be05ee095b3edb9470fa1478f9e506"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


