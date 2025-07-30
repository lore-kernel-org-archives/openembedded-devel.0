Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AD8C87FD8
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.49375.1753918172614626073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uFsGepVp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918173; x=1785454173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BbSyZ/wMfAcUWt0YDxVRvTqwDFMiQDh9PHzlZJetz0A=;
  b=uFsGepVp2L03lT8CIz6xnEtnjerJ3wCjzYikVMirIMyTKM/OJS85SjQJ
   I58+1YYynEwbon7ZPMRc98ceYM5HS5XbAn6ju2e9s/8eS72p15GT9Lfjl
   XedC1CRJCgouzMjSwekyVcLJpibRP71veREqtEZ/6vkWg6UTsqk5Pk3Wp
   19RDPfh300W3Gsdee1dIqrLOOkbOKeBE2EjfGpSv5FJll2qSNxQsO9y3Y
   jQrkQV1S7f+ejyimfSV26HH1nQRAqELp6r499cIV/OTEDDYAotsYWwrRJ
   k9QqdGkaUWOPG5lW9JAQTtZ0VeiZh2PrZSjREWMmvGboW1XVWGkw1+RsP
   w==;
X-CSE-ConnectionGUID: lRYZHQcDRjCv6ySrU3SbHA==
X-CSE-MsgGUID: 9nMnEZ8IQyqNqGT9YeiCvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="195354472"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="195354472"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:30 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id BCD3FC0022D
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2D04214003FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB6DB1A0073;
	Thu, 31 Jul 2025 07:29:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/40] python3-grpcio: upgrade 1.73.1 -> 1.74.0
Date: Thu, 31 Jul 2025 07:29:11 +0800
Message-ID: <20250730232923.522-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118802

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.73.1.bb => python3-grpcio_1.74.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.73.1.bb => python3-grpcio_1.74.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.73.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.74.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.73.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.74.0.bb
index 0edfab3101..e4cf4405f4 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.73.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.74.0.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "7fce2cd1c0c1116cf3850564ebfc3264fba75d3c74a7414373f1238ea365ef87"
+SRC_URI[sha256sum] = "80d1f4fbb35b0742d3e3d3bb654b7381cd5f015f8497279a1e9c21ba623e01b1"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


