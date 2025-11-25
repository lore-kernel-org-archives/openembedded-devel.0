Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435A0CFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13249.1764062241554356172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BHoCv/Ns;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062242; x=1795598242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sZ6VrW1q+9zfsQUDEPGMqSP5Bsw4uAfEGOKUN3Ku1+8=;
  b=BHoCv/NsnCot3Vs99keIj1UtWEQ71R4sY2OOilonnqa2VHMuH63z0KdL
   BbZxVyIW2pyN4Dbg+vOFFxIUDGC1tMbIlX93VPbRmeP8At2Dm4yhRhKCK
   WjKFmVTA/715CBAgzNJGOFzvWtTiaCOLyWQ0jXahULmqpBVzFvvp+/r25
   iGtDye2w+gpHNaL5/GY+hmXspyJ/m+BiaIp0/lOnPORw58R02HexY3BOF
   CBfgfT1TEzwGQFoQtWUr9MCht0cLbxszwpE9WjxPg7cJU8iw6C3dHE+Cm
   Lft2bPGVMsI8uxKrw7AwGJYHSIsp5yglmwYmAtpKcXjfjkw1sM6tajDWG
   g==;
X-CSE-ConnectionGUID: L6qaUdcRQG+W3R0vSTpA2w==
X-CSE-MsgGUID: 1gaLV950REOLQEqXrFux+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="219719911"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="219719911"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:21 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2821D42A31B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D0A5D1C002F8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 92C4C101A426;
	Tue, 25 Nov 2025 09:17:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/26] python3-dirty-equals: upgrade 0.10.0 -> 0.11
Date: Tue, 25 Nov 2025 17:17:05 +0800
Message-ID: <20251125091714.1420-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122043

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix nested dataclass comparison
- uprev in preparation for release
- Add tests for 3.14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-dirty-equals_0.10.0.bb => python3-dirty-equals_0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dirty-equals_0.10.0.bb => python3-dirty-equals_0.11.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.10.0.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-dirty-equals_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
index 6aa4d53cdc..098c8ae0e6 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://github.com/samuelcolvin/dirty-equals"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa97bb3778992892e226b4504b83b60c"
 
-SRC_URI[sha256sum] = "623d7a07c5ba437f1a834c6246d1e3eb97238ca70331c61a499d9aabd757b899"
+SRC_URI[sha256sum] = "f4ac74ee88f2d11e2fa0f65eb30ee4f07105c5f86f4dc92b09eb1138775027c3"
 
 S = "${UNPACKDIR}/dirty_equals-${PV}"
 
-- 
2.43.0


