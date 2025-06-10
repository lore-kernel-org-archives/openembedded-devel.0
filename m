Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C35C71147
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.78430.1749526423382039445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ITCU1+bo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526425; x=1781062425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UUhA2Ep/TwJB7UQMCPkg9qPWj5dEB40DuoajQJNeENQ=;
  b=ITCU1+bo92CBpi0xitneatCz1EfF7v4G/hkuU7oFvQwtIQHJUDyeZulf
   C/hzXTGiC2cFLxpHME1X9Wnor+cHttByuDnUsLjkRzJvk9fSeQ6pLloKe
   BSLRhGwZE8xXahCj1+YxdSaKBD8DXs9ZkI1Gxp7PETZ/uowHKLF4mYBxE
   y5VG1wT995EuboaBUJEWMXXWZCooqJuRStj/OgQxPZKgtt1peMVobRW7C
   5rTMTSLy/gYLe0YuGZRCZHilByVjGek5Uh0sYsdV0fsi+jJWiVPrpwTZq
   VvY0sFc3siK+8PYALtDLfWVf6GQ1X0N/aZyFpWEvrkTgYhwd2lCnV0h/t
   w==;
X-CSE-ConnectionGUID: JjV1gNdjRZm1HX+9tF5PEQ==
X-CSE-MsgGUID: yABfl1BwRVO05xOcbGYLKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="205286176"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="205286176"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04051DE53F
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A4517D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:41 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2666E1A009B;
	Tue, 10 Jun 2025 11:33:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/64] libvpx: upgrade 1.15.1 -> 1.15.2
Date: Tue, 10 Jun 2025 11:32:46 +0800
Message-ID: <20250610033330.924-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117808

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webm/{libvpx_1.15.1.bb => libvpx_1.15.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.15.1.bb => libvpx_1.15.2.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.15.1.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.15.1.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
index 54433a2b98..f709541c20 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.15.1.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "39e8b9dcd4696d9ac3ebd4722e012488382f1adb"
+SRCREV = "d168454ecd099805c675d4a98c66f4891373302a"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main;tag=v${PV} \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.43.0


