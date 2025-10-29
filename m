Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A7DCCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.27254.1761696975921702937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mhOdvmIF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696977; x=1793232977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SoNVid+7n1BioCXkp4cd2G3gbNQ+RW/pyIiGMNVUzkM=;
  b=mhOdvmIF24D4aFRGRX3A67l24H6t+FZMQV2xOgO8Mc0Kz3liTlpvq6WS
   SxRhHVCBE+oQXYV0jQEImP8lc/J/EKSk9jy1LrC9WkyPEWzvRMPh1WGbq
   StkZ6AHaEohzkbpFGm86+n2XN41WpxYp12OVdYhXBkAvhGNqajzhn3MxG
   E/QGt4DACTKRAQV7vD07PgNDqEUBqn3FbdP4d4gYv6E5aDmKh52ro/mCT
   YuDXyqIpvMzKTJS1UBXFhQ4QOv4aW2LGKDX38fY7RPXEQ30BgsKyMcQxS
   C0FMeDpvIE228eov6gGQ9JtzzpvqiUESlKmQo4Ksf8+xwOTViTDy3skST
   A==;
X-CSE-ConnectionGUID: dcr6DQviTyOsgF+REPYZ4g==
X-CSE-MsgGUID: IYFCnYjxRXO/RX4g+dR5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217403047"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217403047"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:15 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5A3BA100034D
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 216971800523
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3E58882C0FC;
	Wed, 29 Oct 2025 00:16:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/32] python3-vector: upgrade 1.6.3 -> 1.7.0
Date: Wed, 29 Oct 2025 08:15:02 +0800
Message-ID: <20251029001505.528-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121135

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-vector_1.6.3.bb => python3-vector_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-vector_1.6.3.bb => python3-vector_1.7.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-vector_1.6.3.bb b/meta-python/recipes-devtools/python/python3-vector_1.7.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-vector_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-vector_1.7.0.bb
index 912dfb8b85..bb1e7eeed9 100644
--- a/meta-python/recipes-devtools/python/python3-vector_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-vector_1.7.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2963f0dc7a24919505850460dd1a785b"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-SRC_URI[sha256sum] = "a85149a62fcaa8a4d95214ca217f3910ea6800d79d65ef1cfb1005720b4f713a"
+SRC_URI[sha256sum] = "8b05ea2953322c74c49d2af180f7eac73ad0aa3d4c391cab896175ec4fa3d642"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


