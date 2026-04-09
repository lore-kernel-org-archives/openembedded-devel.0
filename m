Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B0AEA3C4E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:41 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128848.1775730880384331147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BVpzpYAN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730880; x=1807266880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZotIGj2K0P45mkkMAHtUdT7HuT//KWOa3/PMOtKv98=;
  b=BVpzpYANcIjP0u/3o0uO3j0NfQ8W6MiRoTJd4LKJi2WmP+CzEI9QAzas
   Kqvpd0IyCosUd32A+ppn3Lyl4MrcmEe89WA63qSu891Ezyr8o6vVIrWmy
   Hp6RnFlgXQHDBsnu0MpdRXMRrepVcUu0pvs+ZiyfW8rlG28AF97MklmtR
   gLDw5w4sC67Io6D4ZiV1IfomNJWLusAtMeRG3vK2EQu/1p/UtfL7loemj
   IGD1RT4saAIIHQvl9aeNCxVI+WrbCUNMLuEGDnkB4qEJ1h6lJ8McVbdcZ
   CeJ5dVrYke7cxi5CePGonml2KikSiK+q3T+X22U78vZzA323aKc5vUokQ
   Q==;
X-CSE-ConnectionGUID: rRtY+53iTHuiXbWTp8/XYw==
X-CSE-MsgGUID: /bLB96KjQ1WuX41bsauHIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="224322086"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="224322086"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D706A3FCE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:38 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8AC9F180323A
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id F0CCA4045C2;
	Thu,  9 Apr 2026 10:34:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/37] upower: upgrade 1.91.1 -> 1.91.2
Date: Thu,  9 Apr 2026 18:32:23 +0800
Message-ID: <20260409103223.1574-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126186

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Feature: Skip the systemd inhibitor when performing CriticalPowerAction
- Feature: Introduce "Auto" CriticalPowerAction using systemd-logind Sleep()
- Fix: Test CanPowerOff() availability before calling PowerOff()
- Fix: Add charge limit support for systems providing only charge_control_end_threshold

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../upower/{upower_1.91.1.bb => upower_1.91.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.91.1.bb => upower_1.91.2.bb} (95%)

diff --git a/meta-oe/recipes-support/upower/upower_1.91.1.bb b/meta-oe/recipes-support/upower/upower_1.91.2.bb
similarity index 95%
rename from meta-oe/recipes-support/upower/upower_1.91.1.bb
rename to meta-oe/recipes-support/upower/upower_1.91.2.bb
index d4107a959a..d6505974e9 100644
--- a/meta-oe/recipes-support/upower/upower_1.91.1.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.2.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "d568638d670a63a1886335b7b136f4888cb38a3b28f3f4bcdeaffcca0b0f6df8"
+SRC_URI[sha256sum] = "f07f19b78a43a5053973d95a2fe96a12ede270b8db232b2e2c4ac4186fb42539"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
-- 
2.43.0


