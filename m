Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F292FC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 18:18:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1519.1718734681827310277
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 11:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cQxRk+H3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45IIHuvb104333;
	Tue, 18 Jun 2024 13:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718734676;
	bh=ZYLOGqOtsrIsz4xVDC7IfZkF+ChqM6EVPDvSe59L0TM=;
	h=From:To:CC:Subject:Date;
	b=cQxRk+H3sGlZc1/qhyrgPiBDwXYEgXQLTbiQnDjkzEFOJ4Bn9M8KYoiZ2XiCGySnQ
	 h+0NWFwwFQB6++ZUHmUMkMG6kyzYiE5w+bZzh7E27GNuOm6bkXO3J23Rw6W+l5VQVG
	 euW7CjKD8YGWA0xbV9DYjBhQtb+5mR7F3dVZ2I08=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45IIHuEZ070605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 13:17:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 13:17:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 13:17:56 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45IIHtfc004993;
	Tue, 18 Jun 2024 13:17:55 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
Subject: [meta-oe][master][PATCHv2] vulkan-cts: add workaround for createMeshShaderMiscTestsEXT
Date: Tue, 18 Jun 2024 13:17:45 -0500
Message-ID: <20240618181745.3889828-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 18:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110954

From: Randolph Sapp <rs@ti.com>

Remove the CXX flag "-O2" for GCC 13 and 14 on aarch64 platforms.
There's a bug with ARM GCC that breaks the iteration of "types" in the
createMeshShaderMiscTestsEXT function. This issue is not present for
clang or x86_64 GCC 14.

It seems that the array is not initialized before the first iteration.
In testing this can result in a random value being used. This can
manifest in LINES type being processed twice, resulting in the following
error:

FATAL ERROR: Failed to initialize dEQP: Test case with non-unique name
'no_lines' added to group 'misc'.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: Apply this specifically to aarch64 platforms since armv7 doesn't seem to
have this issue...

 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
index 1008a5fd4..78492e21b 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
@@ -23,6 +23,9 @@ SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.pat
 
 TOOLCHAIN = "gcc"
 
+# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
+OECMAKE_CXX_FLAGS:remove:toolchain-gcc:aarch64 = "-O2"
+
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
-- 
2.45.1


