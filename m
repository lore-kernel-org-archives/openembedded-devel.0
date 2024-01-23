Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FC1C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:15:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.755.1705972506844923162
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="134574830"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="134574830"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:15:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 24026D9DAB
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:15:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FDB9CFBB5
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:15:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DACE82007B706
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:15:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7718E1A006A;
	Tue, 23 Jan 2024 09:15:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 2.1.5 -> 2.1.6
Date: Tue, 23 Jan 2024 09:14:47 +0800
Message-Id: <1705972487-24957-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-2.890800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL9Vz
	2RzqmR3B4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0548SiwizsgluQ1vZ
	7s3YIVDI3lq3YEgY6JihmR11aDrR6EJ5+KkdAau4dZEkR8Y/meU50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJ4SPnU7aqreiCf3pLK/2vZLVq6OIICK1Vck6ql4Nb1tCjuv
	LnPHqn6PWp+q7ihGpT221Vd9tUV36b/KkxnBzQZ4hhSK1crnp9Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108391

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix issue #217 Update information' crash dnfdragora

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnfdragora/{dnfdragora_2.1.5.bb => dnfdragora_2.1.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/dnfdragora/{dnfdragora_2.1.5.bb => dnfdragora_2.1.6.bb} (89%)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.5.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
similarity index 89%
rename from meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.5.bb
rename to meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
index 1d6ffa331..50504caf9 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.5.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
@@ -3,13 +3,13 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504 \
                    "
 
-SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=stable-2.x;protocol=https \
            file://0001-disable-build-manpages.patch \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-To-fix-error-when-do_package.patch \
            "
 
-SRCREV = "d808904fc6082578c02d7c8bf543380ed447e925"
+SRCREV = "abbe08b7a487325182758d5285b54437a914207b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


