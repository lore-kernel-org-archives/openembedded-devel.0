Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD06D44009
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.36713.1731922211155078530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=shTXsBdu;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922211; x=1763458211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Hqui5dLfNutg+oVgHfXgpjl/EoNjeTdx64oBZjwvCk8=;
  b=shTXsBdu2EgSAdnqwxonpWtCgopAjlzqPSjn3WNtY94tHmkPjToevLeQ
   slk/1hqugCJ6jPk4uqIrhRg2ObvyzDfZq7NXDFpz9f/fuPUU6qJeEFTWO
   hFUm8Y7chtY9taFePgORkMkfWh01JKB9i1kBNb/UbyMe3CCORhJFdFlqz
   PK6yRwGb+kOoo0sdHL2FdKDvVDVNRObFUjcFgLL4DBgYJlBsfM6joSL5y
   araAfCYXycj1puqk+ys25Y4R0D6azgVLswfeGidJtK5tBk6S6Q9n2HkCq
   xRpip/K3au2Eh08tX1c7ERSolTADQ4ueB9MycQDSZucZIlJWCwNz9NkWJ
   Q==;
X-CSE-ConnectionGUID: OKnKz4h6Qtm2+Vu3Rlx4kw==
X-CSE-MsgGUID: vj+QJrqFRd+IRQpllmFy7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168782706"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168782706"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C4105D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E469D5470
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8EA020071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 892661A000B;
	Mon, 18 Nov 2024 17:30:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/32] magic-enum: upgrade 0.9.6 -> 0.9.7
Date: Mon, 18 Nov 2024 17:29:30 +0800
Message-Id: <1731922195-5266-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--2.867800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuH4I6QZJ07kROj
	UpfeO1nM4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2VtRKarSV80bo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLxijrlRXzyGp1xu4azCtPg5W2hTphZEcnQ6H
	Bk5As1swZGgUhTJFeW97vIAY8qltRNFBcg1SxjdA/Uvvleb6he2Td9DSahUFD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113873

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix installing via CMake
- Fix install headers and pkg-config file via Meson
- Fix bitset constructor
- Fix parameterize formatter::format
- Fix enum_fuse shift value calculation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../magic-enum/{magic-enum_0.9.6.bb => magic-enum_0.9.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/magic-enum/{magic-enum_0.9.6.bb => magic-enum_0.9.7.bb} (95%)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
similarity index 95%
rename from meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb
rename to meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
index 01a134a5b..4557ed0a8 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "dd6a39d0ba1852cf06907e0f0573a2a10d23c2ad"
+SRCREV = "e046b69a3736d314fad813e159b1c192eaef92cd"
 S = "${WORKDIR}/git"
 
 inherit cmake ptest
-- 
2.34.1


