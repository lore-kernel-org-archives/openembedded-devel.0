Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE156C2BA18
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 00:52:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.75016.1718671935562129687
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 17:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GPWX0yai;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45I0qCWJ045227;
	Mon, 17 Jun 2024 19:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718671932;
	bh=HUjwE0CdXQC5qHvrKEWuVkjJYc+HkcvTa+53Yorm/Yw=;
	h=From:To:CC:Subject:Date;
	b=GPWX0yaixW71Jx0szFu5RIM7zOi+BAuowuFv1b+ON+m/h63nIrNU3K8dJhG+yBe4n
	 N+NNvF4NYw+Pb8silzk/yd0GABMSIYdlbRMJ6ksI3+813/DwVJrTc8VJIjgEvly+8g
	 qlmEtZxQawMT7ci0OZTxpGxQ41KcanWF6krCK4iY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45I0qCHA119187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 19:52:12 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 19:52:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 19:52:11 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45I0qBjB090288;
	Mon, 17 Jun 2024 19:52:11 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
Subject: [meta-oe][master][PATCH] vulkan-cts: add workaround for createMeshShaderMiscTestsEXT
Date: Mon, 17 Jun 2024 19:52:03 -0500
Message-ID: <20240618005203.2022725-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 00:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110946

From: Randolph Sapp <rs@ti.com>

Remove the CXX flag "-O2" for GCC 13 and 14. There's a bug with ARM GCC
that breaks the iteration of "types" in the createMeshShaderMiscTestsEXT
function. This issue is not present for clang or x86_64 GCC 14.

It seems that the array is not initialized before the first iteration.
In testing this can result in a random value being used. This can
manifest in LINES type being processed twice, resulting in the following
error:

FATAL ERROR: Failed to initialize dEQP: Test case with non-unique name
'no_lines' added to group 'misc'.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
index 1008a5fd4..7492fe9aa 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
@@ -23,6 +23,9 @@ SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.pat
 
 TOOLCHAIN = "gcc"
 
+# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
+OECMAKE_CXX_FLAGS:remove:toolchain-gcc = "-O2"
+
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
-- 
2.45.1


