Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAC9C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 03:32:46 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.13190.1736911962662905809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 19:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=efPOASU+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736911963; x=1768447963;
  h=from:to:cc:subject:date:message-id;
  bh=VqFLPgb0BRNA824RvfGgoCcfTVJto+l0pjcbU/7+LCM=;
  b=efPOASU+ck750xn0tCJZ3OXTMhXq6OC5RZScnUY1z9XUu0wBJMIL8Uu0
   LkV0aU+v4nAtEov3rgzhpCSDKnsf4nuGzDId0Yx9s4O7KtBUk20+ECXdi
   PjE2NRtsdCCY694deQAf4EgEyEiqpokChYZI9fw9r1vWS4Tlsu+k/Uy8T
   LeYowhlQ2N5fMX7op847/r7/TOQ5hMHz6wToZhp8DtLBoCveFC/GdeWwu
   LOikrpL/0hXYcuMbcOOp7Rvi9ghiZhSja+/bBkO7vwDrm+LlY3cs5rgVH
   JDIwLaBX5lV7vKxtPzqxQUgvJA3Voty6GIfFLGHrjNsOv+s8aVAB16vPy
   Q==;
X-CSE-ConnectionGUID: oMtLijezQbeY+f2DicbqbQ==
X-CSE-MsgGUID: VouF9ZbTT2KwzXPlCi6TMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="166041088"
X-IronPort-AV: E=Sophos;i="6.12,316,1728918000"; 
   d="scan'208";a="166041088"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 12:32:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D6BDD96743
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 12:32:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A0DC4D5037
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 12:32:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 345B320071A3A
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 12:32:37 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B1DD71A000B;
	Wed, 15 Jan 2025 11:32:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Date: Wed, 15 Jan 2025 11:32:32 +0800
Message-Id: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28924.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28924.004
X-TMASE-Result: 10-0.667600-10.000000
X-TMASE-MatchedRID: yMJabxzLzWXRhEyb9f1sjj9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8F
	Hrw7frlubTF4phlrGWQGFBbDeVn4ha7Kv+wYXRsgngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSq
	bxBgG0w5u73QCD7NgWFkjhezJIKIyDtCRyUfKMH+5M957wKZyY4sTAg36QjmMc+zDSRwZUBwao8
	DeilLBFIJC2eJIH9LWDL/+tIXnB1qCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 03:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114880

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smarty/{smarty_4.5.5.bb => smarty_5.4.2.bb} | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.5.5.bb => smarty_5.4.2.bb} (63%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.5.5.bb b/meta-oe/recipes-support/smarty/smarty_5.4.2.bb
similarity index 63%
rename from meta-oe/recipes-support/smarty/smarty_4.5.5.bb
rename to meta-oe/recipes-support/smarty/smarty_5.4.2.bb
index e8a63a74a7..906b9e4ee2 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.5.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.2.bb
@@ -7,21 +7,22 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 DEPENDS += "php"
 
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4"
-
-SRCREV = "c4851c12e34ff80073ddeb7d98b059d57dea9de2"
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
+SRCREV = "642a97adcc2bf6c1b2458d6afeeb36ae001c1c2f"
+
+do_compile() {
+	:
+}
+
 do_install() {
         install -d ${D}${datadir}/php/smarty3/libs/
         install -m 0644 ${S}/libs/*.php ${D}${datadir}/php/smarty3/libs/
 
-        install -d ${D}${datadir}/php/smarty3/libs/plugins
-        install -m 0644 ${S}/libs/plugins/*.php ${D}${datadir}/php/smarty3/libs/plugins/
-
-        install -d ${D}${datadir}/php/smarty3/libs/sysplugins
-        install -m 0644 ${S}/libs/sysplugins/*.php ${D}${datadir}/php/smarty3/libs/sysplugins/
+        install -d ${D}${datadir}/php/smarty3/src/
+        cp -rf ${S}/src/* ${D}${datadir}/php/smarty3/src/
 }
 FILES:${PN} = "${datadir}/php/smarty3/"
 
-- 
2.43.0


