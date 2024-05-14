Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C8FC27C6E
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10756.1715677840920283919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nxUDlDKx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677841; x=1747213841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=witPXJZEgR8zJn+SuSbdWRS3tRsSkTbVEDP9kjzzRAc=;
  b=nxUDlDKxmxQ8wHZGnjXyBxhMqQmw1Gyl/dDuy6GDMLS9Uuwhr15Fjd8B
   DCtUeu0UPqn+jyM7TIKgEB2s/yWIO1zkLcHwkqgbfUIeCACN8e9OZCKRT
   szCf8GRJPg9/OPxajtWwwlGHUglSLEwmQ11s4LBscu784SJlmxSFF43i2
   wu8GLGQ25xz+efLKy3ZKXV/TaU/LKtcsHGPe24/N9ytTj6efMIF1wstSs
   DJhXhSizMg1bAES5GB38DGM7jUgBN7Wqu2Ah4HwhIurJ9Au1VH0Fc7y9C
   u/u4oQqA2kWh4HdDu5aEHooLaLKYLeBDwojEe5SHIAe9wk4I8buRvQRQh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="160257834"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="160257834"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:39 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 54BDCC68E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9023AD3F26
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 275916BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C96C51A000C;
	Tue, 14 May 2024 17:10:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 29/44] python3-moteus: upgrade 0.3.67 -> 0.3.68
Date: Tue, 14 May 2024 17:10:02 +0800
Message-Id: <1715677817-2223-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--7.402700-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yRIRh9wkXSlFnJdsOLB4zv79wRnyxuPjhE0j
	9gbYPsiSvAdlz3zxr6YSuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKacrT6V6InEuVxmyTBaqiJvcyIKHzIGoT63IFG
	fpXhVj7n1Oc2v94ohPH6FmqkQO4spzfeCSt9MtiPi9hrAKwILaF430d3dMHkY7FaDt0Ph3eAanR
	UYx3SG4sX24ahsS5PuAMuqetGVetnyef22ep6XYOwBXM346/+zJ+ofGSD9co25vmd1B7iENpwDm
	UjbizHaMpCv+l5wMqG1dAXXiUt1E
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110375

From: Wang Mingyu <wangmy@fujitsu.com>

0001-lib-python-remove-self-import-from-setup.py.patch
removed since it's included in 0.3.68

Changelog:
===========
Support moteus-c1
Properly detect board hardware when DC input turn-on slew is very slow

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon-remove-self-import-from-setup.py.patch | 32 -------------------
 ...eus_0.3.67.bb => python3-moteus_0.3.68.bb} |  4 +--
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-moteus/0001-lib-python-remove-self-import-from-setup.py.patch
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.67.bb => python3-moteus_0.3.68.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus/0001-lib-python-remove-self-import-from-setup.py.patch b/meta-python/recipes-devtools/python/python3-moteus/0001-lib-python-remove-self-import-from-setup.py.patch
deleted file mode 100644
index 10acd7b8c..000000000
--- a/meta-python/recipes-devtools/python/python3-moteus/0001-lib-python-remove-self-import-from-setup.py.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7490ac4629c7fe0dc329647e6e000d4bc13c610d Mon Sep 17 00:00:00 2001
-From: Richard Leitner <dev@g0hl1n.net>
-Date: Wed, 24 Jan 2024 00:49:45 +0100
-Subject: [PATCH] lib: python: remove self-import from setup.py
-
-Importing moteus itself within the setup.py creates some kind of a
-chicken-and-egg problem. Furthermore it isn't used anywhere within
-setup.py. Therefore remove the corresponding import.
-
-Signed-off-by: Richard Leitner <dev@g0hl1n.net>
-
-Upstream-Status: Backport [https://github.com/mjbots/moteus/commit/7490ac4629c7fe0dc329647e6e000d4bc13c610d]
----
- setup.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 2731685..6c6064d 100644
---- a/setup.py
-+++ b/setup.py
-@@ -17,8 +17,6 @@
- import setuptools
- import pathlib
- 
--import moteus
--
- here = pathlib.Path(__file__).parent.resolve()
- 
- # Get the long description from the README file
--- 
-2.40.1
-
diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.67.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.68.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.67.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.68.bb
index 3c93ee44f..d99d30e63 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.67.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.68.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI += "file://0001-lib-python-remove-self-import-from-setup.py.patch"
-
-SRC_URI[sha256sum] = "a2122f20f59b8962057cf8d3fb583e0aa19006eaf2cde49e30027a4d1b8bf925"
+SRC_URI[sha256sum] = "a5c4259ecc20cbb5dea9352f8364300db45eab971fa7bddd1625da9b16d63248"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.34.1


