Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42817C0650F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2754.1713318085926072046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iJeK8Ire;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318086; x=1744854086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=loS3kdXy69PH94172e7euoUBJYQVpRzyRkqZrauFjTQ=;
  b=iJeK8Ire3Y1nCaUz2iKnv9vAgi8Kwutfs5NGBxKjR65OLG2tf/L5t8qG
   /4s0LdB7+YCTEvN2kVwHpkie5P+c21zzpT8DmE8USWPBjapNUnQi0Wr2Z
   778s0UYT2IPQxqNMPtZR9j4X/DmsAISpt0vZz3yziODs6NGd0XD+GfMLT
   IDQFcx8qvE9f11VqjbaQ/9vHyfy9oLIYyn6EBEVZoC/dVMc9EHPCUALF/
   GpQgji/g2ae6s8H1lpcVTyHQ5CzSHJbkipB3njMvvnA/BlK+hSpqenr8v
   F2PQ13WAZiv0TBUOSXN/FZepeGe1c5RKHTMDIIZD58R6bxA3LCfskHe4V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143393369"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143393369"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D242D4802
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3ADED11ECB
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7A71200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 547871A0002;
	Wed, 17 Apr 2024 09:41:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/49] libbpf: upgrade 1.3.0 -> 1.4.0
Date: Wed, 17 Apr 2024 09:40:22 +0800
Message-Id: <1713318061-17128-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--4.514900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDmlF
	7OhYLlctm9L28Suig/hau0R1GRb+n20Xr+fj3ww/TuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLhphqipnEX3PoZZi/IkGccCbm0451GVI2eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNedRhJxHhpcyPNRfYjxOCrd3EPeFZnbVqhDNFZAUaOdZtGrsjSJreyDEbhbMEuCTcZg8w
	kLgtSNPdaOHFP7U3D+CwrMqNyw9ZgQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109996

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/libbpf/libbpf/releases/tag/v1.4.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-kernel/libbpf/{libbpf_1.3.0.bb => libbpf_1.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.3.0.bb => libbpf_1.4.0.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.3.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.3.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb
index 9b8ca07fe..f2ec48f39 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.3.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "20c0a9e3d7e7d4aeb283eae982543c9cacc29477"
+SRCREV = "20ea95b4505c477af3b6ff6ce9d19cee868ddc5d"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.34.1


