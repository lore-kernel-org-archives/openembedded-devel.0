Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2886BC55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:17:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10297.1785820672368296495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JJTTC9vm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820673; x=1817356673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1of5ni5nuCeZA4ohML+uQkpMeehR7i8zRYzu4D9Q8jo=;
  b=JJTTC9vmwK8+QybNA2TFbNCBr+aKuNWL+gO3uXR9fgbLSHpvzecVdVKR
   XZS+0e8dSE0PGu1dilCA2shfbd92NdbW9b3FS1TMnFdbUZTbxBD4cIieC
   5te4hlNNzIf+0o2kjArIsOidmIgxcFgJO5YDqsc1DfyudKSywirqBCbz+
   qCzl/8k6s9HSUxvFpPuOpD1dvEijuFDxYDh/Si6PIQlG2Rlo/rXd/rfpY
   3NbOCZBIwouW759Kmrsj39PVTOcYuS5ai/Ke8/9vHCfHz6sl/A5xnwxCB
   XOZCuQbvkzgT+rc/rmEl8FwgUcvVluvc24F3zSCYMhGlUTJI6cUHLY3RC
   w==;
X-CSE-ConnectionGUID: v0cRNMmVRQee5ehmbxEHJw==
X-CSE-MsgGUID: 3R3lZOehRraUp/15OIsCnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="235804048"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="235804048"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:17:53 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1AF0E8204FF
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:53 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C6FC518000CC
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id CF6D91800592;
	Tue,  4 Aug 2026 05:17:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/28] pax-utils: upgrade 1.3.10 -> 1.3.11
Date: Tue,  4 Aug 2026 13:17:04 +0800
Message-ID: <20260804051726.1489-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128711

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pax-utils/{pax-utils_1.3.10.bb => pax-utils_1.3.11.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pax-utils/{pax-utils_1.3.10.bb => pax-utils_1.3.11.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.10.bb b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.11.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.10.bb
rename to meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.11.bb
index 08dfcb7545..a0f143a89a 100644
--- a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.10.bb
+++ b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.11.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "git://github.com/gentoo/pax-utils;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "d279ca563775105859f1f8c8467b8244d758cc62"
+SRCREV = "a19d74326cf0dfc5eea93a5f0bc23dc3a5a959b5"
 
 RDEPENDS:${PN} += "bash"
 
-- 
2.43.0


