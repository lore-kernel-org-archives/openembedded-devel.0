Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A4ECCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.4769.1761099796459184843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JUN0GuL1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099796; x=1792635796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/qliTLmzC4puYTe0QRN9zT72UUrZ5wlsReZsjwzVEh0=;
  b=JUN0GuL1H3FVJcXCOQp/QT39SihrEHEV+cndnKRCYPRYuFI3nhTBOi+n
   tvwifnpoFrE/4FoFDnNGvIEHOYhE/u5U74SrE6dIvY1ZyYY96JGXXz1UE
   6HGPt1GACJTPWoVKK4tNscFbivy9cBpyUp68NQAYCro93JWTicxBEVSWg
   Lk6RH68V2uA6ELNN3jRm2oqyHFIweiVNa0FXv1mxXOs+eGOxYQzYGUkoS
   obSB7DBMYABAJzw4ehiOMQs3V+ep5asjEy3qiN4EQ49bg9Td04AbPTOwV
   cLtF01dFaFXwS0jiqEnvt9N+Vvsd+3mUuiu5W+cr2ODUJxnzYlYNsHv3O
   Q==;
X-CSE-ConnectionGUID: 6CbMp/OERN+wlJNMJzjuDg==
X-CSE-MsgGUID: 86NdN5oQTDa1tYQvdEqtTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216736344"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216736344"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:15 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E28B6C0009E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 98F328D204C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DDC2582C0E7;
	Wed, 22 Oct 2025 02:23:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/29] python3-moteus: upgrade 0.3.92 -> 0.3.93
Date: Wed, 22 Oct 2025 10:22:17 +0800
Message-ID: <20251022022227.226-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120868

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.92.bb => python3-moteus_0.3.93.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.92.bb => python3-moteus_0.3.93.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.92.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.93.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.92.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.93.bb
index f4d4aadd5e..a9235fef4f 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.92.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.93.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "65db1f35e2e3899d9b02852ecc5c00388805b1f7bd8245a47e2c13515b3c3bf3"
+SRC_URI[sha256sum] = "6d61382935e752536d547c7398a2d6f949a2a8d890580a68994a02309f599fc6"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


