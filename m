Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF5AC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 16:32:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.29728.1754497926380904411
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 09:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Cl1sBxM1;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576GW4m8615356;
	Wed, 6 Aug 2025 11:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754497924;
	bh=cAVbiFgijrU3qwUi0oA1StLDUco6ptqjmIycPY49nAs=;
	h=From:To:CC:Subject:Date;
	b=Cl1sBxM1isLFz2LB2Yz0FF1waDkCOUwBPbXDkbnHXWBAGYW/lQ7tn+M4TdXJkjA2m
	 5kRHZUKyOYMOjc/Yb7c9Psp2GDl8ypXvIClADkCjgk1wKq0VcHAsNmTwUuTU4tBxPw
	 h/lG7pM1wxKt/rXKeKfrh6ed9mE6MbtZ5BaPpTiI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576GW4Im256363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 11:32:04 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 11:32:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 11:32:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576GW4jw4122112;
	Wed, 6 Aug 2025 11:32:04 -0500
From: <rs@ti.com>
To: <akuster808@gmail.com>, <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <reatmon@ti.com>,
        <a-christidis@ti.com>
Subject: [meta-oe][scarthgap] vulkan-cts: allow vulkan versions > 1.3
Date: Wed, 6 Aug 2025 11:29:40 -0500
Message-ID: <20250806162939.71883-2-rs@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 16:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118893

From: Randolph Sapp <rs@ti.com>

Backport a patch from upstream that allows vulkan-cts to work with
Vulkan version greater than 1.3. Previously any unknown Vulkan versions
will return 0 when we attempt to locate the minimum version with
minVulkanAPIVersion.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...e-CTS-with-unknown-versions-of-Vulka.patch | 41 +++++++++++++++++++
 .../vk-gl-cts/vulkan-cts_1.3.7.3.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-Allow-running-the-CTS-with-unknown-versions-of-Vulka.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-Allow-running-the-CTS-with-unknown-versions-of-Vulka.patch b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-Allow-running-the-CTS-with-unknown-versions-of-Vulka.patch
new file mode 100644
index 0000000000..2797acf416
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-Allow-running-the-CTS-with-unknown-versions-of-Vulka.patch
@@ -0,0 +1,41 @@
+From 954b523a998933b1edbe9af3fe7b1c74595cf148 Mon Sep 17 00:00:00 2001
+From: Lorenzo Dal Col <lorenzo@khronosgroup.org>
+Date: Tue, 17 Sep 2024 17:18:20 +0200
+Subject: [PATCH] Allow running the CTS with unknown versions of Vulkan in the
+ driver
+
+This will default to VK_API_MAX_FRAMEWORK_VERSION, which at this time is 1.3.x.
+VK-GL-CTS issue: 5165
+Components: Framework, Vulkan
+Affects: None
+
+Change-Id: I954d0144db9ff5f3848c81df61dd263505b17ac2
+Upstream-Status: Backport [https://github.com/KhronosGroup/VK-GL-CTS/commit/609c09b3163d86d7e4819fbfc00a616e364f14f0]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ external/vulkancts/framework/vulkan/vkApiVersion.cpp | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/external/vulkancts/framework/vulkan/vkApiVersion.cpp b/external/vulkancts/framework/vulkan/vkApiVersion.cpp
+index d996cb0e6..8720df52a 100644
+--- a/external/vulkancts/framework/vulkan/vkApiVersion.cpp
++++ b/external/vulkancts/framework/vulkan/vkApiVersion.cpp
+@@ -134,7 +134,14 @@ deUint32 minVulkanAPIVersion(deUint32 lhs, deUint32 rhs)
+ 	for (auto it = begin(commonPredecessors); it != end(commonPredecessors); ++it)
+ 		if (isApiVersionPredecessor(rhs, *it) && isApiVersionPredecessor(lhs, *it))
+ 			return *it;
+-	return 0;
++
++#ifndef CTS_USES_VULKANSC
++    // If we got to this point, it means we are dealing with an unknown version.
++    // We assume it to be valid, and we default to VK_API_MAX_FRAMEWORK_VERSION which is generated from the spec.
++    return VK_API_MAX_FRAMEWORK_VERSION;
++#else
++    return VKSC_API_MAX_FRAMEWORK_VERSION;
++#endif
+ }
+ 
+ } // vk
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
index 7492fe9aa4..cc80549eeb 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
@@ -19,6 +19,7 @@ SRCREV_video-parser = "138bbe048221d315962ddf8413aa6a08cc62a381"
 
 SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
             file://0001-vulkan-cts-include-missing-cstdint.patch \
+            file://0001-Allow-running-the-CTS-with-unknown-versions-of-Vulka.patch \
 "
 
 TOOLCHAIN = "gcc"
-- 
2.50.1


