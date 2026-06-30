Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B3CC44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:11 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17264.1782811387067945287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FQvFOkwG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811387; x=1814347387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfAewftBHWtVNE0NNUyPN11PXGOfbjWRaQr4Aw4ALHQ=;
  b=FQvFOkwGGRecqQFK3O22TffJDzItS2x4fYooVJKczo6MtsPqEL1vsfso
   KtB3rUPiEqMp3SHO5cWlcYXIX28JXLSm8eFw0xveTQZtMahmTgH9Kq+9D
   zksybq6FVAUfsOXkJrKdfNipZ8x0MIMf5w5Fae0F4HLTMPa1SjNeyLIrs
   BOwtUJfn5ArJRXsBkfh+PvVUaar/HgBgNSHj9OOCR6x8m5GOhaGKtY03m
   dR6humuJFqWVkHkv+mKWJDDKSKv1I3MtL/62CKUb5H2Oj7h7M3ApaZUaI
   TBkK2k8GarS3NiQ53H4GxzM8Mz2dYWlzU+xYEfJAbmg9N4MKRoXyDlcnJ
   Q==;
X-CSE-ConnectionGUID: Ogo/ip1EQqKl/d32EjuJvw==
X-CSE-MsgGUID: ZTZ6oBzrTEGa4R5NZLH5tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245748264"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245748264"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:23:05 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6460BAD8C
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:05 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1B33C101D683
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3A382826FEE;
	Tue, 30 Jun 2026 09:23:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 35/37] swagger-ui: upgrade 5.32.7 -> 5.32.8
Date: Tue, 30 Jun 2026 17:22:03 +0800
Message-ID: <20260630092206.322-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127977

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.7.bb => swagger-ui_5.32.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.7.bb => swagger-ui_5.32.8.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
index 788a8f5638..cd8b56cc01 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.7.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "bf6a8f05dcde5904cab31e666e80e456a05782f2"
+SRCREV = "4e0d3f88de7db0395a80ef0541ff428f0926d484"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


