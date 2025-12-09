Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C6FD3B7FC
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4186.1765274168216639472
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QTiSzIC/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274167; x=1796810167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M5+DgJxkDpEclGQwRWP/FyMi8RPDqZwsrHM2Xl8JU30=;
  b=QTiSzIC/DH/qdm1k3osXEMjTBljcMQUaT1i00Kq+ilOf4kOQTYdy/8F+
   2d0frGMUq3D5dg7tSbdm5AXxG5auO9AoBuT2xRtbk0ojMUb98qE3BTUdg
   ecm87UqshYh7IJDg2bBvWBFpO4K157L0nbUsiavCxHc7x1Dtn1dvoH2D0
   zUuuQUccCtsrojRdxBSzRRTdLviVP8KuvHC2xo9MM0AF9aQJZLlqfmA46
   SEX2obz1vDuggPQVOBjUfNcRtlJJM87PJaXkvSm8EAiU5wKDi1vG9SDZ8
   Mtq/i0KM677tnxHgvZ9pR4QOUY7tvuUvGvyaZizXkJnGivh/Qs4TazyOw
   w==;
X-CSE-ConnectionGUID: bND2DIIIRrShZxTs9KU+bQ==
X-CSE-MsgGUID: pYsNItwvR46ziEqatnkPkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="210559988"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="210559988"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:05 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A9E781000355
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:06 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6112CC026CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id F0E8220002B2;
	Tue,  9 Dec 2025 09:56:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/38] jsoncons: upgrade 1.4.3 -> 1.5.0
Date: Tue,  9 Dec 2025 17:55:19 +0800
Message-ID: <20251209095552.690-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122409

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.4.3.bb => jsoncons_1.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.4.3.bb => jsoncons_1.5.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.4.3.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.5.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.4.3.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.5.0.bb
index f5e19e4191..1321f824ee 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.4.3.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.5.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "6170b71ee6f2cd64958fc7a14e6f04b36f523d90"
+SRCREV = "95a220dff2d927f15e1fe0c7dac2821b7134e4c9"
 
 
 inherit cmake
-- 
2.43.0


