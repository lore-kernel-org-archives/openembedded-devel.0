Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6D1E7719C
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.16411.1736240516631520974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ieAmsf+5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240517; x=1767776517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wAdXJPiQEdfrhAo2ZQexVS/F+Yrq1dlcBZHmZfUNeMU=;
  b=ieAmsf+5F6qhIVHsPDEXNx+e15O4gDkezKvKIRGLgw67H97t/ILVceEy
   WZGrErIpEREKSPY+1EHcCZZvfRJPLXFH9Ul8JCwbxtT+518IJMcHyigTy
   GUoEflNVnFf2hEHemOfJ9Lsl8n9VZCEnUQKdJViecf1Dvd4JmgJ58zGCq
   wwAiNEi0dMlHSGmq5SsN10XGjFZVQ/yEt7A4X48fSvCYB4rOTu+Lw5s3t
   EGYprAtmNRr0V4/6jPE1U+uoHeUjCDPjwC1vqOM9MNkZGLOhAm1Zk3ao9
   QdMJRvJUNQK2GFvNoQJl2TSrloaNO9l9FVDz77RchrI28YjsgCwpaHw+D
   w==;
X-CSE-ConnectionGUID: EuVgHu3nQ2qTrd0xwnLoIQ==
X-CSE-MsgGUID: yCQbsMS3RzeYhQ4Z7bx9uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="174177527"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="174177527"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9EC2D5013
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AE80DD5094
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F15E20086106
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE4521A0073;
	Tue,  7 Jan 2025 17:01:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 04/18] fping: upgrade 5.2 -> 5.3
Date: Tue,  7 Jan 2025 17:01:30 +0800
Message-Id: <1736240504-5315-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-2.497000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJH0rRDVM+nVNz4cH5hW96YOwpfLMeBwRtr9+Kgn2XgeGME81e9NBDCo8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUs4meBYkPP9D/650ksFIRWNXa08
	jAlxTT0gcm4vpgXwP7FQB5H/383r4Eke/HQk4urk787qe5hMukGtx3mNFqQn165N3obcGUtogep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114678

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fping/{fping_5.2.bb => fping_5.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fping/{fping_5.2.bb => fping_5.3.bb} (92%)

diff --git a/meta-networking/recipes-support/fping/fping_5.2.bb b/meta-networking/recipes-support/fping/fping_5.3.bb
similarity index 92%
rename from meta-networking/recipes-support/fping/fping_5.2.bb
rename to meta-networking/recipes-support/fping/fping_5.3.bb
index f75b6441b2..d5f77d7c5a 100644
--- a/meta-networking/recipes-support/fping/fping_5.2.bb
+++ b/meta-networking/recipes-support/fping/fping_5.3.bb
@@ -15,7 +15,7 @@ NO_GENERIC_LICENSE[fping] = "COPYING"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a7692d10d73fb0bb76e1f7459aa7f19bbcdbfc5adbedef02f468974b18b0e42f"
+SRC_URI[sha256sum] = "d57bd0141aea082e3adfc198bfc3db5dfd12a7014c7c2655e97f61cd54901d0e"
 
 S = "${WORKDIR}/fping-${PV}"
 
-- 
2.43.0


