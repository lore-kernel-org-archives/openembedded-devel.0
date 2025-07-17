Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFD0C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 19:57:16 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.4744.1752782235286557300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 12:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Kb7z52TT;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HJvDIV082642;
	Thu, 17 Jul 2025 14:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752782233;
	bh=sr7ZPd+YHP/Db4LNG2GDxPFRmdARrEngrXNo8/k/SDI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Kb7z52TT37jFTAFXB5JDZsFqsmM8wFxwL/PK6f86OUVTPL/N7+i9Yd6iuVQgGcVK3
	 zpzB2ZnUKSrGQwDMZy4Z8F23Qd7HSZVdY2VyKDEmTtil9DkxPHJUo17hoUx5AR/SqK
	 vwabwWra2ZLVzgbyaqA0eyFlIyHYc6KLS5naryzw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HJvDXI2411631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 14:57:13 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 14:57:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 14:57:12 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HJvCCO2387890;
	Thu, 17 Jul 2025 14:57:12 -0500
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH 1/2] ktx-software: Add recipe v4.4.0
Date: Thu, 17 Jul 2025 14:57:11 -0500
Message-ID: <20250717195712.2538506-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717195712.2538506-1-a-christidis@ti.com>
References: <20250717195712.2538506-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 19:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118616

From: Antonios Christidis <a-christidis@ti.com>

Introduce recipe for ktx-software, version 4.4.0.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../ktx-software/ktx-software_4.4.0.bb        | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb

diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
new file mode 100644
index 0000000000..12dd31b07a
--- /dev/null
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "KTX (Khronos Texture) Library and Tools "
+DESCRIPTION = "KTX (Khronos Texture) is a lightweight container for textures for OpenGL, Vulkan and other GPU APIs."
+HOMEPAGE = "https://github.com/KhronosGroup/KTX-Software"
+
+LICENSE = "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & BSD-3-Clause & BSL-1.0 \
+	   & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark & fmt & \
+	   Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
+
+LIC_FILES_CHKSUM = "file://LICENSES/Apache-2.0.txt;md5=0f9cda00f501b4995fb04b5a5d896060"
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-1-Clause.txt;md5=2d0297124cf897c3dd4bab7bd7912adf"
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=1682a4c99124cbf1ddb401224ace3c9a"
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-3-Clause.txt;md5=5fef9006fcd0a605932b72918e7a2a8f"
+LIC_FILES_CHKSUM = "file://LICENSES/BSL-1.0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+LIC_FILES_CHKSUM = "file://LICENSES/CC-BY-3.0.txt;md5=8a2ab71e2914c55986c228f0713fa7c1"
+LIC_FILES_CHKSUM = "file://LICENSES/CC-BY-4.0.txt;md5=bef932701f4aa5f6295ee7ab0f178fa1"
+LIC_FILES_CHKSUM = "file://LICENSES/CC0-1.0.txt;md5=63a27073ad0b2673cf8d55b9e6e93971"
+LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=38aa75cf4c4c87f018227d5ec9638d75"
+LIC_FILES_CHKSUM = "file://LICENSES/Zlib.txt;md5=29cdb8962f7c50a53723ba132dd0f487"
+LIC_FILES_CHKSUM = "file://LICENSES/LicenseRef-Cesium-Trademark-Terms.txt;md5=e726b098fa91a5d873290df256cee9d3"
+LIC_FILES_CHKSUM = "file://LICENSES/LicenseRef-ETCSLA.txt;md5=0c10bc2148b5cc349d931e78b1d5d2a7"
+LIC_FILES_CHKSUM = "file://LICENSES/LicenseRef-HI-Trademark.txt;md5=d941219d000396780f9c851f062a9be7"
+LIC_FILES_CHKSUM = "file://LICENSES/LicenseRef-Kodak.txt;md5=d56356a4481789b9a0361b68b87df97d"
+LIC_FILES_CHKSUM = "file://LICENSES/LicenseRef-PNGSuite.txt;md5=8d31bcaab4e0ce8a1be335f4931ea942"
+LIC_FILES_CHKSUM = "file://LICENSES/LicenseRef-fmt.txt;md5=b9257785fc4f3803a4b71b76c1412729"
+
+SRC_URI = "git://github.com/KhronosGroup/KTX-Software.git;protocol=https;branch=main"
+SRCREV = "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
+
+inherit cmake
+
+PACKAGECONFIG[ocl_backend] = "-DBASISU_SUPPORT_OPENCL=ON, -DBASISU_SUPPORT_OPENCL=OFF, virtual/opencl-icd"
-- 
2.34.1


