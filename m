Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52C0C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:39:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.151972.1692149974196795792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107043897"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107043897"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:39:31 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C13A810881
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:39:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 04CBECFBCA
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:39:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84D9F20050193;
	Wed, 16 Aug 2023 10:39:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-uefi-firmware: upgrade 1.10 -> 1.11
Date: Wed, 16 Aug 2023 09:39:07 +0800
Message-Id: <1692149947-5179-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-1.285200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yRIRh9wkXSlFXLILvyEBT87fUZT83lbkEPeI
	V08TMnTu+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Ci79SuUaiD8v9QkS1QeJhXDPl
	pE35iilK4FLVqd1E+GXqYviVWLIXKeBzEkCCpnRloMLOoNHsM9kLixrsCJ1jTwSC6qIZ5nkmjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcm3N6XdbkMsbk69GqYwWmD00gQjJXQo4aXxCW
	gy/cpfg3Sbr979khJu405z9eHgavnHBTR+RocNmDM3nxYHREn63j9S6hE2xcv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104380

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Remove Python version specific classifiers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-uefi-firmware_1.10.bb => python3-uefi-firmware_1.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uefi-firmware_1.10.bb => python3-uefi-firmware_1.11.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.11.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
rename to meta-python/recipes-devtools/python/python3-uefi-firmware_1.11.bb
index 539366c0d6..67e668ac69 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.11.bb
@@ -5,11 +5,11 @@ extracting, and recreating UEFI firmware volumes. This includes parsing \
 modules for BIOS, OptionROM, Intel ME and other formats too."
 HOMEPAGE = "https://github.com/theopolis/uefi-firmware-parser"
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://setup.py;md5=90fa5bae1547550f1c1993f651eda955"
+LIC_FILES_CHKSUM = "file://setup.py;md5=5a59066a8676f17262ef7e691f8ef253"
 
 SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master"
 
-SRCREV = "dfb15b068960b771e2e1536d34790dac9b5bfe32"
+SRCREV = "f289219b99eb525cbc58e4dc2b07df3811f92ef7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


