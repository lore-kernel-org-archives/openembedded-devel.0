Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC3FC001E0
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:57:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.29702.1686862622306927928
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PVqgYxXK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FKutvK120678;
	Thu, 15 Jun 2023 15:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686862615;
	bh=sJB/6Os8OkouADHaUS7R2WRTswVjM47vPSSkHnW0sBA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PVqgYxXKxd1M5WWtit2sNTm1tO+ZAzoj9EQb6FgCDWxPFT27teVQopcyv16mg2jsz
	 P+HhrsKD8ei+PeC7SQZXTgJWoSpkBMBr9NYY8LZvIGhqqYkIWtzNfnFYW7MkAj8A9r
	 Ykjq6HsOm5b2bfNR5R2nd17e/acq6cYcYKDyxpzA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FKuthR011631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 15:56:55 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 15:56:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 15:56:55 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FKutXj012389;
	Thu, 15 Jun 2023 15:56:55 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <afd@ti.com>, <denis@denix.org>
CC: <Openembedded-devel@lists.openembedded.org>,
        Linus Jacobson
	<linusja@axis.com>
Subject: [meta-oe][kirkstone][PATCH 4/6] khronos-cts: Replace wayland feature dependancy with vulkan
Date: Thu, 15 Jun 2023 15:56:35 -0500
Message-ID: <20230615205637.724348-5-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615205637.724348-1-rs@ti.com>
References: <20230615205637.724348-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103330

From: Linus Jacobson <linusja@axis.com>

Khronos-cts.inc is used for building vulkan-cts or opengl-es-cts. Even
though vulkan-cts depends on vulkan-loader, which automatically
requires vulkan distro feature, it is more explicitly stated if written
here next to opengl.

Some systems do not support a windowing service (like wayland) but still
might use standard khronos GPU libraries. For these cases, wayland
dependancy is invalid.

Patch replaces the invalid wayland distro feature dependancy with
vulkan for clarity.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 87060b678..65ce7d6fc 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig cmake features_check python3native qemu
 
-ANY_OF_DISTRO_FEATURES += "opengl wayland"
+ANY_OF_DISTRO_FEATURES += "opengl vulkan"
 
 DEPENDS += "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
 
-- 
2.41.0


