Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E70C02186
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.16413.1736240518746565725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LoOojBxz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240520; x=1767776520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5M1MUm3bPN1YoeRjyJv1Nt4x/190iLIjTvwm3Cl2zfQ=;
  b=LoOojBxz9B3T99RkLmXD/LG+jQ8flChU+lKCSrShGLWUWfPDGlumc52w
   ZTAN3lkLS8o6bqWY5/hyhN0TPL81xEE205yNm8aEIYnkb23Q3mYkbR3e9
   t88LDNqzldtLMkSmxl/3OUH/bK7rxM8zNHb2L4uH4e6L/7gq7jO6tYKb9
   xxv1W2gz0ltlN4DoZzrgtehzivFkpdfSN/S+NPS5VgKH6S6IU23rLVSqS
   +Hst0qo/4XeAhLpJVxJ0IUEZIMtiD4CcR77vyr6YyDEIOZDLOS95MjvVv
   Q5rskrIY6knrU9oHbeZt1/PDiTsoWaGKydsIWaAe89eD+68QMGaUj2ugM
   A==;
X-CSE-ConnectionGUID: 3HKNDdrdQKSiqWjjIpHtfg==
X-CSE-MsgGUID: EtuCb2bWTMqoG1iTADgc+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="185768912"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="185768912"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D068C2264
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7093CD8B6E
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 067FE200930C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5F971A0071;
	Tue,  7 Jan 2025 17:01:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/18] libbpf: upgrade 1.4.7 -> 1.5.0
Date: Tue,  7 Jan 2025 17:01:33 +0800
Message-Id: <1736240504-5315-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--4.514900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VRvtxLq45qm9TuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLhphqipnEX3PoZZi/IkGccL8Ur8C/ZRQaeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNT9FMMFmEfceuZWXPoxSC2B9dFXrT8aoa240cq//sBh72ZgCvAe1TuxrHQu7fn6kW5btN
	ksGxwIQtxWzw6XgIC2BPxgMyCs1mPzs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114682

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/libbpf/libbpf/releases/tag/v1.5.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbpf/{libbpf_1.4.7.bb => libbpf_1.5.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.7.bb => libbpf_1.5.0.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
index 8df1c639ed..5f92939274 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.7"
-SRCREV = "ca72d0731f8c693bd98caba70d951fc0bfe20788"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
+SRCREV = "09b9e83102eb8ab9e540d36b4559c55f3bcdb95d"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.43.0


