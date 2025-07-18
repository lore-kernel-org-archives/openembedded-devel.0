Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0408BC83F34
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 15:03:24 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.906.1752851002022682817
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 08:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F28appCp;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56IF3HlW275793;
	Fri, 18 Jul 2025 10:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752850997;
	bh=UZhgWOoSzOOWHjjRCtdd59Oavdk1imzep4vZ8ftnh14=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=F28appCp1HoGwpmhDn25QI4LsbwHBcytCItiZAHnbVsi/r+xTMIuQoAJnk7lEWYyb
	 KQbqf/r+qEha2M1dU+YBhJXHo6XTLq+8xgu82y+PhBuCu45Pt6x7mHlSsYmynVHPIT
	 TvYzh8Oz0QMC7YNvDRCnQ4flcRwTzyMFOP/es53g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56IF3HQM1095592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 18 Jul 2025 10:03:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 18
 Jul 2025 10:03:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 18 Jul 2025 10:03:16 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56IF3Gvx3684945;
	Fri, 18 Jul 2025 10:03:16 -0500
From: <a-christidis@ti.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>,
        <Ross.Burton@arm.com>
Subject: [meta-oe][master][PATCH v2 1/2] ktx-software: Add recipe v4.4.0
Date: Fri, 18 Jul 2025 10:03:15 -0500
Message-ID: <20250718150316.2579996-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718150316.2579996-1-a-christidis@ti.com>
References: <20250718150316.2579996-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 15:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118629

From: Antonios Christidis <a-christidis@ti.com>

Introduce recipe for ktx-software, version 4.4.0.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Removed individual LIC_FILES_CHKSUMs of all the LICENSE files. Instead
  now the recipe has 1 LIC_FILES_CHKSUM to REUSE.toml which states which
  parts of the project have what licenses attached to them. If licenses
  change/new ones get added, REUSE.toml should change.

 .../ktx-software/ktx-software_4.4.0.bb           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb

diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
new file mode 100644
index 0000000000..dda72e5237
--- /dev/null
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "KTX (Khronos Texture) Library and Tools "
+DESCRIPTION = "KTX (Khronos Texture) is a lightweight container for textures for OpenGL, Vulkan and other GPU APIs."
+HOMEPAGE = "https://github.com/KhronosGroup/KTX-Software"
+
+LICENSE = "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & BSD-3-Clause & BSL-1.0 \
+	   & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark & fmt & \
+	   Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
+
+LIC_FILES_CHKSUM = "file://REUSE.toml;md5=45910de791d599e6ba472f6fa506f391"
+
+SRC_URI = "git://github.com/KhronosGroup/KTX-Software.git;protocol=https;branch=main"
+SRCREV = "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
+
+inherit cmake
+
+PACKAGECONFIG[ocl_backend] = "-DBASISU_SUPPORT_OPENCL=ON, -DBASISU_SUPPORT_OPENCL=OFF, virtual/opencl-icd"
-- 
2.34.1


