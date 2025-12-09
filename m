Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594C3D3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4106.1765274161246007280
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Iqu8fnCK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274161; x=1796810161;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VHszmhStrZWGgKHIMjDovODV9hVOY5c6YgGyflG6TFo=;
  b=Iqu8fnCKKEj/3aVAV4ZKmiVYZtixsPNteMllyQCj4vmcIwyINljl6FMl
   NYBx/Q/t7tnDrSW+ZljkC4yPQHPbtSoIsVACdw4u/Ny2heiKCkrCwRrCU
   dPoNg5m1zbpCweVPmAf2OtNx2SM76kDnZh+bYEgTX5pMsme1jyPnXwqD6
   j67HXp4Yl+A7KZNtiRxyVyOTpwnOfttHGCLxPYYNqe4doXlkXFRIC98CT
   /ZCPQjDKaR3xwDgA3iZJwYJNlit5wnyCDE+vmYoI2pV50hmdwf5evByIe
   gfWDdq7AzD92kcU8p/22UjwKj5EzaQg9pqqBV74ULhoqPYRt7oB26Kv/5
   g==;
X-CSE-ConnectionGUID: qGuNtXcxSO6Lqm56h6jnVw==
X-CSE-MsgGUID: zVUKkvSjQ7aUvMbXN69R9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="222613604"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="222613604"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:55:59 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 759261C1C73F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:55:59 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2CAA5C02F09
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:55:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A7D0120002BE;
	Tue,  9 Dec 2025 09:55:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/38] boost-sml: upgrade 1.1.12 -> 1.1.13
Date: Tue,  9 Dec 2025 17:55:15 +0800
Message-ID: <20251209095552.690-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122405

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Anonymous transitions in composition
- Prevent compiler options propagating to projects using SML
- Handle anonymous events with process_internal_events
- Update initial submachines of composite states upon re-entry
- zephyr: Add files to support using with zephyr RTOS
- fix typo in README
- Fallback to any_state when state-specific guard fails

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost-sml/{boost-sml_1.1.12.bb => boost-sml_1.1.13.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/boost-sml/{boost-sml_1.1.12.bb => boost-sml_1.1.13.bb} (91%)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.13.bb
similarity index 91%
rename from meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
rename to meta-oe/recipes-support/boost-sml/boost-sml_1.1.13.bb
index 0a2514237a..e04a9f46af 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 DEPENDS += "boost qemu-native"
 
-SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
-SRCREV = "cd3ef80206b71463de96d6b682cfdc99703ec147"
+SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "8015e095dab82c03eb2277258645956bcd84cbcb"
 
 
 inherit cmake
-- 
2.43.0


