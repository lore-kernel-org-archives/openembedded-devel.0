Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4017C3ABA5
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.7617.1745900152358167620
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hWB9y6N9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900152; x=1777436152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PzfJsggo3Eo6aNi2qiGIOPd0g7WsrpcX+L/aZBKV7us=;
  b=hWB9y6N9n6SAOKgrMYz0v9+vqhnxMp7L2mT00THF3PJjxmFfPJl3NDob
   jG2+PeQHqT6mYMR2TRIDPjtEzeh+eyAtxoIiHCC96KuqyNQUJlBM2CIdX
   xc9A4n3vdONOo+oP5C4vcTutteX7Zp+qU/86k7w/ibc5idGiJpLhh4KaJ
   49HMknXYB43z0uHRNfZQ30uR8C2Wgb1m60F+h0h3Lq/b8f8rO2kV+bz68
   pAGXLDv4S8vPTnyEvMzXlmtrSO7sp00VTvcNjnJ3OB04/PTs77LYc1zoz
   2bsjdpwr2GXigdfmTjV2mjPwkIC3BhjQThsarZGajAUz2P7KupjAoiLW1
   w==;
X-CSE-ConnectionGUID: ILp93DrDQTG+PhXmmOLolg==
X-CSE-MsgGUID: 9s5HKhWfTPWxTH8zLlQV1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="198356478"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="198356478"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:50 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 286BBDBD42
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D9263D88A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 97F451A0071;
	Tue, 29 Apr 2025 12:15:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/23] nftables: upgrade 1.1.2 -> 1.1.3
Date: Tue, 29 Apr 2025 12:15:23 +0800
Message-Id: <1745900138-26424-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117212

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nftables/{nftables_1.1.2.bb => nftables_1.1.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.1.2.bb => nftables_1.1.3.bb} (98%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.3.bb
similarity index 98%
rename from meta-networking/recipes-filter/nftables/nftables_1.1.2.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.3.bb
index 3d66178581..09da57a372 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.3.bb
@@ -14,7 +14,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "822f1f7c4059e8420387c302bd603cc0eb8cbfe403fa2e3f78c8ddb7f0d53bbc"
+SRC_URI[sha256sum] = "9c8a64b59c90b0825e540a9b8fcb9d2d942c636f81ba50199f068fde44f34ed8"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.43.0


