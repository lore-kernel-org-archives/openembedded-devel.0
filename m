Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1929C001B1
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:57:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.29697.1686862619354264741
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TjefChWZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FKut26052171;
	Thu, 15 Jun 2023 15:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686862615;
	bh=FGYwROR3W9iBIO1TS/aDXSzjFHTONS0E7D/AC5GIULc=;
	h=From:To:CC:Subject:Date;
	b=TjefChWZFh379K/UczX7SyyRsp49V9d5G4upkypGfpJS4ySj8XGd5Gn4twCYMWgA1
	 dvyFfhYTNmmpGNJCwUmJ67OzmZoE1Mqge18YjDi1nbU18Td2V9L+n9090EZH/aVGEo
	 BKSaVaHkblVI3l2jjacYBWvywO9iOhPJszJDeOSs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FKutn6058907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 15:56:55 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 15:56:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 15:56:55 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FKutXf012389;
	Thu, 15 Jun 2023 15:56:55 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <afd@ti.com>, <denis@denix.org>
CC: <Openembedded-devel@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-oe][kirkstone][PATCH 0/6] Backport everything relevant to using cts with Weston >= 10
Date: Thu, 15 Jun 2023 15:56:31 -0500
Message-ID: <20230615205637.724348-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103326

From: Randolph Sapp <rs@ti.com>

Backport everything relevant to getting opengl-es-cts up and running on
newer versions of wayland protocols and subsequently Weston 10.

Khem Raj (2):
  vulkan-cts,opengl-es-cts: Upgrade to1.3.3.1 and 3.2.8 respectively
  vulkan-cts,opengl-es-cts: Fix build with gcc-13

Linus Jacobson (1):
  khronos-cts: Replace wayland feature dependancy with vulkan

Randolph Sapp (2):
  glfw: add packageconfig and wayland dependencies
  opengl-es-cts: 3.2.8.0 -> 3.2.9.3

Ross Burton (1):
  khronos-cts: fix build when python3-build-native is present

 meta-oe/recipes-core/glfw/glfw_3.3.bb         | 14 ++-
 ...ude-limits-header-for-numeric_limits.patch | 88 -------------------
 .../files/0001-Include-missing-cstdint.patch  | 34 +++++++
 .../files/0001-Remove-dead-variable-984.patch | 34 +++++++
 ...-GCC-11-uninit-variable-warnings-946.patch | 73 ---------------
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 37 ++++++++
 .../files/0001-include-missing-cstdint.patch  | 61 +++++++++++++
 ...0001-use-library-sonames-for-linking.patch | 20 +----
 ...01-vulkancts-Include-missing-cstdint.patch | 32 +++++++
 .../vk-gl-cts/files/0001-vulkancts.patch      | 40 ---------
 .../vk-gl-cts/files/gen-framework-path.patch  | 20 +++++
 .../vk-gl-cts/khronos-cts.inc                 | 43 ++++++---
 .../vk-gl-cts/opengl-es-cts_3.2.7.0.bb        | 31 -------
 .../vk-gl-cts/opengl-es-cts_3.2.9.3.bb        | 36 ++++++++
 .../vk-gl-cts/vulkan-cts_1.2.6.0.bb           | 24 -----
 .../vk-gl-cts/vulkan-cts_1.3.3.1.bb           | 34 +++++++
 16 files changed, 334 insertions(+), 287 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb

-- 
2.41.0


