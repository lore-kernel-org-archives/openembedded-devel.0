Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0780FD7F87
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92474.1772187342837186585
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pkyMh3Rm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187343; x=1803723343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N+PCqMyOAoTAJ0X4X8pfiu9DRaex40qZ8oNtiOVc2wg=;
  b=pkyMh3RmKE4zOtacvfaMH6LSz3N07NEJ6rhYcJPcRY+kVvXpyQ4cx/tz
   PBCEbssPw1d+jzidE2XjkaQSlQ8xh30FW3N8hE3qLbu8iIpa3dW+GgX9D
   ByiRcHxCS5GH9QVGzLiG/BERpvcs0xYckDXaosrVs70ldvH4gbPMzwSdv
   B0Vwy9dz9xFDrEXAnA8Ts3N3L/ISh5B6rginh3N8OoHZJ24e/RYfdCaiP
   NW49iNJyuzSOsS3eycVmSOr3Abn/+P2mTcHIke9RE2iF+0d2W51FtBaZq
   4UaAsWpH7Ti0aGp4o9cEUhsgcS2YYZQcugySDDI2v+F2IReUNdwySr44X
   A==;
X-CSE-ConnectionGUID: qCV6y8i9Qc6oCl1hAb0yPw==
X-CSE-MsgGUID: el0GTi3HQxKa6f4XJXWXTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219940804"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219940804"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6713A1000372
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:41 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1BF67C02E4B
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4D2B6180059F;
	Fri, 27 Feb 2026 10:15:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 48/52] valkey: upgrade 9.0.2 -> 9.0.3
Date: Fri, 27 Feb 2026 18:13:23 +0800
Message-ID: <20260227101327.1432-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124748

From: Wang Mingyu <wangmy@fujitsu.com>

Security fixes
-----------------
(CVE-2025-67733) RESP Protocol Injection via Lua error_reply
(CVE-2026-21863) Remote DoS with malformed Valkey Cluster bus message
(CVE-2026-27623) Reset request type after handling empty requests

Bug fixes
------------
Avoids crash during MODULE UNLOAD when ACL rules reference a module command and subcommand
Fix server assert on ACL LOAD when current user loses permission to channels
Fix bug causing no response flush sometimes when IO threads are busy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valkey/{valkey_9.0.2.bb => valkey_9.0.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.2.bb => valkey_9.0.3.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.3.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.3.bb
index 419efab17c..1842befdee 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "1ac4cfe4c877a6cb8cb2e28fa7094055ac06f64b"
+SRCREV = "6e63ad9ccdceea562a6ea9ea9df9160c0d1109d6"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.43.0


