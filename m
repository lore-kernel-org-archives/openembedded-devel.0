Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9143C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.14076.1713777376813262562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GHHJ8GVE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777377; x=1745313377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+pFiR7BohHNKLpbYjG0AELzGMzns12aOqZtMTi1M4kE=;
  b=GHHJ8GVEeBENH1EB6oxx1ygzf88InmlgmJ/VfKyGjfXYvxe+GaFvz9te
   5tOGhVGvoj1qk2xGBPgXHcl6VqRU0S5eRLPVV+7L9HslR0VNrLoNMDJOn
   ieR6DDJ6xwg+h8k+z+HgVYhPcwyis0DR7CkWk9qLabUXUeHm72T3zEmxR
   yGB26HGOtgCJWGydQ6qSisAWUCTqrn0nbSWmVutnTypStMybPBYh9vXyF
   n87Pdl3hJf49l7mq0FIk5bjDxfibcyFJe9vMKfHMPI3QJyHg4C7Ix0C9a
   VLM0EQ16uXZIcRUX8/fAdTc+G7cnR99Zt8IuZ/RAiz549WQ2wnf+zLxTG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="158260578"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="158260578"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:14 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 040AFD500E
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 47C4CCF7E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D3E7B20093277
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FDD81A000B;
	Mon, 22 Apr 2024 17:16:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/15] python3-grpcio-tools: upgrade 1.62.1 -> 1.62.2
Date: Mon, 22 Apr 2024 17:15:37 +0800
Message-Id: <1713777345-29264-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-1.955200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyseVAKp7ODjmWB9
	LYuXLqg2QtOthS+AmMDy9zcRSkKate1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ3JB
	1YIf9iAp8A77OcNrQZhjHQp/zpoAJ5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEYPI3a9KmWbQ5wzftrWnt2CWJr3QqNFLD3Px8pJqfBUXomLb4sYw6Zx4bZreCjeiJ/hjj
	dgTHpqXy4ypO/+mUrb9G0nr4yFSIPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110098

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 [Fix Python Deadlock] Guard grpc_google_default_credentials_create with nogil

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.62.1.bb => python3-grpcio-tools_1.62.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.62.1.bb => python3-grpcio-tools_1.62.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
index ffa2f843c..e05b8734d 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
@@ -12,7 +12,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "a4991e5ee8a97ab791296d3bf7e8700b1445635cc1828cc98df945ca1802d7f2"
+SRC_URI[sha256sum] = "5fd5e1582b678e6b941ee5f5809340be5e0724691df5299aae8226640f94e18f"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.34.1


