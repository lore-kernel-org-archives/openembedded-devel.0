Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CBCC3ABB3
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7601.1745900150871326977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NrJr7sx4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900153; x=1777436153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dosJqVBV2oPyEORiuf6nX97jMD6wrYmykXcB2sRw0ME=;
  b=NrJr7sx4oE0bMff9aK44V8YsxUO31l4nvHTa0PzxYVjr/Ykqkb9iRy03
   q8S86Fx/L3emSCuiGfmYpFJbteK2oubX3TmNgnDx9fTUa6Thbwk5smn0w
   vO7DobDOE7bWxaLXSTz5Rq7AmAeE/FYg0nsWVtqHBLuWu9cWPosldmxpf
   mKaH2vmD5ThUi0LkIOFZTyvaT9YLVkWAjoo0Dk09e/HoUTy34aza+IoPu
   z5cjrnCA7LLNyqHeEtHxLXT9vndmntWEpLvtKclQIO0mtyHO8aTAzxPek
   Y4KUbZ2ybeGgODKY/rmJfxUIz+CKS86mG83SYuaJiqc+DnZhpxsVQxC6/
   Q==;
X-CSE-ConnectionGUID: iV5W5yG5SP+LACwhKo2aPA==
X-CSE-MsgGUID: aDc0tuDYR5CJicZPPILVzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="198356482"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="198356482"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00B08D480A
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B3949BF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 730791A009A;
	Tue, 29 Apr 2025 12:15:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/23] python3-grpcio: upgrade 1.71.0 -> 1.72.0
Date: Tue, 29 Apr 2025 12:15:31 +0800
Message-Id: <1745900138-26424-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117217

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.71.0.bb => python3-grpcio_1.72.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.71.0.bb => python3-grpcio_1.72.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.72.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.72.0.bb
index 793fcf0ced..19983c9e33 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.72.0.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "2b85f7820475ad3edec209d3d89a7909ada16caab05d3f2e08a7e8ae3200a55c"
+SRC_URI[sha256sum] = "05aee9be958a580e169e1aa8987387bcd8be6ed7fc5c2a3a048b6a2b911473cd"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


