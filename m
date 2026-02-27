Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876E5FD7F7E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92759.1772187336528821947
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PL+Ahg0Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187335; x=1803723335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=02RBXkjhy3/YqklfQ6EsUvrZgaybvL4+p2NNHZFbiKU=;
  b=PL+Ahg0ZSqbdER8yQCA8O+N3WMwSQtBMcJlj0dzjb8/NDpPcQFn2MVF/
   Ff2B2f/TmDYqtbpO1LjqXJx0kudReqb+BdbMPjy4wXppTRhyFMRkUD8p8
   68S7xcNoIUgTC2CqUCwdHB5wmC67y3QHHympMo8PBWHr6T0Yrnuie84af
   8UP024Z8FfT+mWUlO9OgjQ76IeBolQp1PdET8ggWdc6LV13FXDEYEi9km
   Jfm1k/P5U0rWBdozFptzphZXdSOQwEkGLXIWzhp6cnG1WKTKa8sPkI4+G
   r5GxY6l+m3pVnxDpG4Ep7zPaGgeiTom1SVT8XeSiwAqC6M3z4Dr4TdaaZ
   w==;
X-CSE-ConnectionGUID: us2bmZHpQ5K6uPH/a+hhvw==
X-CSE-MsgGUID: ssZBi1bwTk2K0qUehBAfLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231300035"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231300035"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 029B51C0009A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:35 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A774E1C00F93
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D72A3180059F;
	Fri, 27 Feb 2026 10:15:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 45/52] upower: upgrade 1.91.0 -> 1.91.1
Date: Fri, 27 Feb 2026 18:13:20 +0800
Message-ID: <20260227101327.1432-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124745

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix: a resource leak (!294)
- Fix: a NULL exception caused by a Non-NULL GError pointer
- Fix client API: crashing when printing the error message from a NULL GError pointer
- Fix: ACPI reports -NaN capacity value
- Feature: Skip CriticalPowerAction when performing battery recalibration
- Deprecate: capacity_level and luminosity property
- CI: Add a tartan LLVM static analysis
- Feature: History supports voltage item

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../upower/{upower_1.91.0.bb => upower_1.91.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.91.0.bb => upower_1.91.1.bb} (95%)

diff --git a/meta-oe/recipes-support/upower/upower_1.91.0.bb b/meta-oe/recipes-support/upower/upower_1.91.1.bb
similarity index 95%
rename from meta-oe/recipes-support/upower/upower_1.91.0.bb
rename to meta-oe/recipes-support/upower/upower_1.91.1.bb
index b81d0c2971..d4107a959a 100644
--- a/meta-oe/recipes-support/upower/upower_1.91.0.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "954f8ee8d1422c813615862bc6249cb9b31ace1d905fd1f06549c4e47f4ba401"
+SRC_URI[sha256sum] = "d568638d670a63a1886335b7b136f4888cb38a3b28f3f4bcdeaffcca0b0f6df8"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
-- 
2.43.0


