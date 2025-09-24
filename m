Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AEFCAC5B6
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8318.1758704442458090056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KevbOebD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704446; x=1790240446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=szwZF8k/lWiBlZNG2BjEOKJmTHw7TNsr7FlpiaGKhDo=;
  b=KevbOebD57lTGET5GVxSjU011YWmx9Z/ZYhWMU/SlPbSLgmfAvkpq0JN
   pCQbX1/hXK/VzEcJVEKMz4BFYxT7tC5lQxYNR5u/IfKiNzc7mDb88MqzL
   hFvUFHChMZ26EIUXq3ulkS4XSCyr/A+vOrh0iWfXOIVTlK869ASR+m0NW
   WrgvvAKVcBJ0tXdV/zHat9hBjft0bU/r7aU3fwrzemKZdTbjavJS7/WfN
   StpLDiFwHh0AsDYrRcWid841QV2W7BO5fpFMLQL3pXdJl4Nll6EFMYtXt
   A3CeF1ik+9QUjZrG8zEukntX0V23mRXEYoU+LeoeLR/aiWAZEbyMLmgo2
   g==;
X-CSE-ConnectionGUID: Y4OpuyZoRjadqvBubxkFiw==
X-CSE-MsgGUID: IO7dSr5cQ7+FepE0nhGmFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="217279689"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="217279689"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:45 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 55BF11C0008D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0E67C180198D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 7CB2D2000756;
	Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 740381A0071;
	Wed, 24 Sep 2025 17:00:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/29] python3-grpcio: upgrade 1.74.0 -> 1.75.0
Date: Wed, 24 Sep 2025 17:00:23 +0800
Message-ID: <20250924090029.1786-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119785

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.74.0.bb => python3-grpcio_1.75.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.74.0.bb => python3-grpcio_1.75.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.74.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.75.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.74.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.75.0.bb
index e4cf4405f4..52a0158107 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.74.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.75.0.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "80d1f4fbb35b0742d3e3d3bb654b7381cd5f015f8497279a1e9c21ba623e01b1"
+SRC_URI[sha256sum] = "b989e8b09489478c2d19fecc744a298930f40d8b27c3638afbfe84d22f36ce4e"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


