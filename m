Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5A6C46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:23:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.76746.1703575408748529584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="132266681"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="132266681"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:23:25 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7396D5026
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:23:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1646AD3F34
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:23:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ADB922DB01
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:23:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 30F091A0072;
	Tue, 26 Dec 2023 15:23:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.9.0 -> 2.9.1
Date: Tue, 26 Dec 2023 15:21:41 +0800
Message-Id: <1703575301-13160-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.006
X-TMASE-Result: 10-1.275300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mre9J6VkwneFYcCkgotCl7hM8L
	GTNFqWKa4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedli+
	BaqMwTNrVuPnsbKmJliiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52j6ecRxYWibZdRbeXnucy/rfU4uQCCOg83ZzpBxaVUDOPUNfd5b6TwfY9R+JXfw8FBE2Rh
	/5tE1fnUrRD0JkGmBdbm4ORPbITaPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107797

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-* avoid buffer being unnecessarily initialized with 0s in several
   functions of the 'bitarray.util' module
-* fix '.count()' type hint in pyi-file
-* improve testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.9.0.bb => python3-bitarray_2.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.9.0.bb => python3-bitarray_2.9.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.9.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.9.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.9.1.bb
index e899c800b..0d7107a0f 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "41f6b46f01bc59abfc38653d203565113b6e7dd04d0ec688774ed28e6d9755db"
+SRC_URI[sha256sum] = "912efbeed6d8b155c8e8c37464f79d75b1de58936c0f29ffb599ce95af5563f2"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


