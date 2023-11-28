Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C0CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:21:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.28225.1701159699689042876
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120014434"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120014434"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:21:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E355D64B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:21:35 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EE12D9476
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:21:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9494488005;
	Tue, 28 Nov 2023 17:21:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbpf: upgrade 1.2.2 -> 1.3.0
Date: Tue, 28 Nov 2023 16:20:42 +0800
Message-Id: <1701159642-27881-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--3.379800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VRvtxLq45qm9TuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLhphqipnEX3PoZZi/IkGccCbm0451GVI3dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtCqQOrxchYcyW4ss9+Bd2B3OUi3+PCPT5OyM+ZeDarQogdw5E9NGZYNb1a
	qIMIQHhrJKqWEBkhsSYFH/Mzoy5FCCwP4EqdoCNHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107074

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
https://github.com/libbpf/libbpf/releases/tag/v1.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbpf/{libbpf_1.2.2.bb => libbpf_1.3.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.2.2.bb => libbpf_1.3.0.bb} (91%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.2.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.3.0.bb
similarity index 91%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.2.2.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.3.0.bb
index 8dbf7933b..9b8ca07fe 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.2.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.3.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-v1.2.2-bugfix"
-SRCREV = "1728e3e4bef0e138ea95ffe62163eb9a6ac6fa32"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
+SRCREV = "20c0a9e3d7e7d4aeb283eae982543c9cacc29477"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.34.1


