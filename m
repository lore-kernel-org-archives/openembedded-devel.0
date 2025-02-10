Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C2EC021A4
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.46462.1739178118915531523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sGGKgiC+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178125; x=1770714125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2zCjq3vIca18OOlugzbK3fhH+KsK/Tj74CXA/q4j58s=;
  b=sGGKgiC+sfKldwq46ime4FnXiGHI3Tv+Oek+ct7Ya4bXfkVsfFFWuue7
   1VYjasR5yZXU9FnYOhrzsoRsNeuPbI1/xIxXv0bF11u0pCCxq9Wx47Ero
   KraW/SOKsKhKk6dzHBSUxbGPYWo/g3HGqgVjKTLcUlosadQDKMjvxRo4v
   q/6c3SvNQQ+QeQ7bxhWvjNpDjxbQa18ZfqalFihPiMv7VfttONzIPMDEN
   5hFOKpkDD5WqGH/Bg0HHJQDvdGHyNWTmht0SGLDwi3+yv4DLmGZqMk8u8
   nSI/gKp8NiEZfW7h4CG8AO2Ea6M78QStJA7v+tBnSG2MZntAJXYJUTLln
   w==;
X-CSE-ConnectionGUID: Z3oCvNLATUyoa5TqiCIDqQ==
X-CSE-MsgGUID: z/14AfS6Rc2t1cms8kSSuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189493100"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189493100"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EF32E8523
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0553ACFA5B
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9BA7F1A006C;
	Mon, 10 Feb 2025 17:02:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/66] python3-grpcio: upgrade 1.69.0 -> 1.70.0
Date: Mon, 10 Feb 2025 17:01:10 +0800
Message-Id: <1739178095-26432-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115369

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.69.0.bb => python3-grpcio_1.70.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.69.0.bb => python3-grpcio_1.70.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
index b076298fef..bebfa51be1 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "abseil-cpp c-ares openssl python3-protobuf re2 zlib"
 
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch"
-SRC_URI[sha256sum] = "936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5"
+SRC_URI[sha256sum] = "8d1584a68d5922330025881e63a6c1b54cc8117291d382e4fa69339b6d914c56"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


