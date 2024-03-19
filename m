Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B74C54E77
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8224.1710827203701663180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NB1f+kvn;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827204; x=1742363204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5/GGJR+aYj8gJVaJNqmfrJsF6Kyd9tbw7uLBpeURbw4=;
  b=NB1f+kvnByh4f4qW7hwXr1HPxwOYDNr4k8nNCtmBptVVgyPCqe4+WWUN
   YG8bj2efMHml1EpNre/xgeWP4GtmkenS+vgFPgGk4Aog00kfIasYnwL6K
   5Sx2Td6imAx39rChpZ/P+I+V/iJH2P4Mi4oAAdi1vHcfZ/bcKwG2XPuhS
   h/RO3J0OY5ipaCDXLWc4KVsbWk7K/cESCStsb/wBJIAHsiIIv8YR6jE4t
   4eUDz+6YNJhI2LlcxveQ54MU5j9hninVk9gkq4+fjufZv9BIBJgTisNI0
   ffvDX+AQHRDXDnktsRF12AXlKlih7FKKBNWhvUvZkcSgMEEHHGn/qzYDx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131999402"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131999402"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEA64C21B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF49BD616C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E7822009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 253701A006B;
	Tue, 19 Mar 2024 13:46:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/50] python3-grpcio-tools: upgrade 1.62.0 -> 1.62.1
Date: Tue, 19 Mar 2024 13:45:20 +0800
Message-Id: <1710827139-30056-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-2.718600-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv2ygQpO8og5VK3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrXKlXnQFycJwX5jf8r/rzeN08bOfAYUUkiB9FNy3OmSRoHJapsjL/VNugB
	q/YDLDmCTL6ul4l4yVSThyLdIqErfezkqZyPuMNx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109447

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.62.0.bb => python3-grpcio-tools_1.62.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.62.0.bb => python3-grpcio-tools_1.62.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.1.bb
index a8c0ad91f..ffa2f843c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.1.bb
@@ -12,7 +12,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "7fca6ecfbbf0549058bb29dcc6e435d885b878d07701e77ac58e1e1f591736dc"
+SRC_URI[sha256sum] = "a4991e5ee8a97ab791296d3bf7e8700b1445635cc1828cc98df945ca1802d7f2"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.34.1


