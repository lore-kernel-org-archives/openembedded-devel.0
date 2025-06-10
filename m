Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE12C7115F
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.77956.1749526432094742799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V4+SQcR6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526432; x=1781062432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UDgOBkUAqTiiR6Hu8nG8HjVi4IZoIwwhT9OQjQIc244=;
  b=V4+SQcR6HoEFC6EeeGCNGoBZLxQKsF4u4bTX7m/X57I3lLL4T5aT+gVY
   jKYz7SHlyopyPGrUkjYOKg1LL8u5l4wcBDrar/Z/kJ1SABSr9mVeLo1xY
   g7nwmYxJZsl0HBBBmdrVEP1JCSe98fhHDLcUtO9/J8whrnBdFKSEKNjCM
   6UcY7lO5Cz2fjABE4a18qOdX9a0RUnWAaZsb69l/qe3s7VHOMSLKfV1XP
   peDzQgIBAZhAFLjNwunAzsBxdoJF9Rd6m347EWY4zUHIfHTYiE+INAa00
   0vnbCL3pZYPRx+z13eDfz9XjZLvrN5IWJiCXd5U0bhvCHyq1SL7TCDqHb
   Q==;
X-CSE-ConnectionGUID: LtTvd40bQrWXJoejhv7OtQ==
X-CSE-MsgGUID: C3nfVNFyQIOTlAihZd8XDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662477"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662477"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:50 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 975A6D6FBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FBE9D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B70E11A009A;
	Tue, 10 Jun 2025 11:33:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/64] python3-grpcio: upgrade 1.72.0 -> 1.72.1
Date: Tue, 10 Jun 2025 11:33:04 +0800
Message-ID: <20250610033330.924-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117830

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.72.0.bb => python3-grpcio_1.72.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.72.0.bb => python3-grpcio_1.72.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.72.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.72.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.72.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.72.1.bb
index 19983c9e33..79059a33cf 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.72.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.72.1.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "05aee9be958a580e169e1aa8987387bcd8be6ed7fc5c2a3a048b6a2b911473cd"
+SRC_URI[sha256sum] = "87f62c94a40947cec1a0f91f95f5ba0aa8f799f23a1d42ae5be667b6b27b959c"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


