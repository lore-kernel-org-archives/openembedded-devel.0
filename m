Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB060C0218D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.30504.1735032439941691626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LHwKtGdQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032442; x=1766568442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uedSdBurOeKjnhVRT/ndUv1/u2441vsQ1gd1dvdRMR0=;
  b=LHwKtGdQOkGyuDxPTvJoJQixVB5Qk7DvUV8ZXbRDDW/L31OnVyAaDCZw
   GAFvPH5rn3LxoESlApOIWG5gYQgWcQMILB/42nDQubZBY2ykv1ZoqYOqh
   tc0SE7ZKWwJ+MQ22J34qP5cLzx8Q3PKpmvEDu8t3b8mnB6+s+wBMw8GKS
   UeOsRhCRsDyO6MP9rDfszs24IFLU+KVHEKq7B+/7YpF/7ETZudr+xoWOl
   EbaTzPP0k5Iz07xehuGsJ2lOS9sn4kzxJuoPMFCgVp9ZE+Ezy8u+zjPw2
   VNwlCN0F59qUnmUUDUeel3c0cGLPwyvuYO8mxX8aCV2NOYUZBuK1oiaxz
   g==;
X-CSE-ConnectionGUID: mcw21Xs9QQCXzn1vk+28+w==
X-CSE-MsgGUID: HXTAJPjRR3+Y5Pnz4o/uSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184809908"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184809908"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E60CE8528
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B337D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E00856B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A61021A006C;
	Tue, 24 Dec 2024 17:27:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/67] python3-drgn: upgrade 0.0.29 -> 0.0.30
Date: Tue, 24 Dec 2024 17:26:13 +0800
Message-Id: <1735032421-13513-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--2.272700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VRvtxLq45qm9TuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLn22EcSrQBnRIlVYCqhV5OHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6fEa
	tJmMVY4uqnVYIsEgQIyh4l/9ncyW4JXwQXDZ08ENjcFaiZxl4Z44Z500AbELb+mIzqBZEB/UxyP
	AFDwlZ9sxRq6jUSTeKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114491

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/osandov/drgn/releases/tag/v0.0.30

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drgn/{python3-drgn_0.0.29.bb => python3-drgn_0.0.30.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.0.29.bb => python3-drgn_0.0.30.bb} (97%)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.29.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
similarity index 97%
rename from meta-oe/recipes-kernel/drgn/python3-drgn_0.0.29.bb
rename to meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
index 91f0262775..0c2749dbd4 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.29.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
@@ -6,7 +6,7 @@ LICENSE = " LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main"
-SRCREV = "86b29d041c965030c24e9ab0a6907ff22c2a75fa"
+SRCREV = "92023c5b5d5a1c7e1556e945b098148f0b46e608"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


