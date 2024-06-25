Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886B4C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 20:39:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7967.1719347985311154110
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 13:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IhC6mtEQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45PKdfxK028586;
	Tue, 25 Jun 2024 15:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719347981;
	bh=OK8bIf5GHfROnpiHhqwNNzC4w1RX/ditEq9RZ8d04WM=;
	h=From:To:CC:Subject:Date;
	b=IhC6mtEQvqzuEEW+lzV7rY3vhKo1/O2P0FfeNX/f6/m0L0CWWfxatAkMyQvCfubZq
	 QoGcNQ/B3nTO0xZeRw08s1a/cGHAuB/tcG3Z+vtz/nCvyQRt1pCyHuerzizAq5h+6b
	 TeA02WVT3K1mzLghjj5+2n1I1FvvVsZFEDTzJwJQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45PKdfJ9026992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Jun 2024 15:39:41 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Jun 2024 15:39:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Jun 2024 15:39:40 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45PKdes6048685;
	Tue, 25 Jun 2024 15:39:40 -0500
From: <rs@ti.com>
To: <akuster808@gmail.com>
CC: <raj.khem@gmail.com>, <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>,
        <Openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH] vulkan-cts: add workaround for createMeshShaderMiscTestsEXT
Date: Tue, 25 Jun 2024 15:38:50 -0500
Message-ID: <20240625203850.2042879-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 20:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111079

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

Backport this patch to scarthgap since it also uses an affected version of GCC.

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


