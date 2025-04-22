Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16723C3ABAC
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35397.1745311772881697853
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n1u3ZxR+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311772; x=1776847772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U+5iYIhHJepxAHAGK3/LNVy08ZCYlWCUoopbiP+2qoE=;
  b=n1u3ZxR+j7S0J8JJKcHrMjPEuDnCrLjWHaKL04+8dJvGGl1emhAKWHZ/
   aPSU5DQwaTcJRKmQplRLyid3nGG8TUHAD2ti2UbD54lbRvHitXN5+SrW/
   zu3moFd9+xbfbNDYGQ8+XGbzcQSEKN1xWmcOFFMdYsvjaP4q8poEJjBA+
   G7J/hNdyfChhHyuW7ZFuAv1sd9mYzROcap3x0H5LW33iiMnnazPGLjzTN
   nZpS9CwHi6tDpBik93rmCSS44XpY65NgkZ3Vcpmuu98ejUUn7oeSNgyC6
   9ONnGV91feCuWf28pUBh+LrgbEuUZMYCdghDf4vPYCdpdrj0ORF9CINo5
   g==;
X-CSE-ConnectionGUID: uLm5l0OPSki/JOeaU2Qy4A==
X-CSE-MsgGUID: KrrUIFYNS+2+qhM6uBJdLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197650123"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197650123"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71D13DBB87
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 265EBD72A3
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B38A81A0078;
	Tue, 22 Apr 2025 16:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/30] nftables: upgrade 1.1.1 -> 1.1.2
Date: Tue, 22 Apr 2025 16:49:00 +0800
Message-Id: <1745311761-1912-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117025

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nftables/{nftables_1.1.1.bb => nftables_1.1.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.1.1.bb => nftables_1.1.2.bb} (98%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.2.bb
similarity index 98%
rename from meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.2.bb
index f0f51f5397..3d66178581 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.2.bb
@@ -14,7 +14,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "6358830f3a64f31e39b0ad421d7dadcd240b72343ded48d8ef13b8faf204865a"
+SRC_URI[sha256sum] = "822f1f7c4059e8420387c302bd603cc0eb8cbfe403fa2e3f78c8ddb7f0d53bbc"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.43.0


