Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C87D11702
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4294.1764669123322025919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=chKNDYEq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669124; x=1796205124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y1GpE73GBaJHMPDR0mUDLw2g0G9B/up44KzBEH/7V14=;
  b=chKNDYEq/F64SCOtCFLl/CBXbQtiOfFwY+5X2vi2l/tMM7uxDO9w7oHL
   Amr0xmkleTylJlOKNXaaq/L1HRqn3l9u6U/uyGSGmrRTEqG7InOUm0OS5
   1z2a7zao+s6VpafBGJvOPX+X7u+wjp8dKgPhvDGTdpMKTNtWOToswn/pT
   7Uv3DgoKdt/E/UWlHZoCV4AkoJxa6Tusk1DOnzhVTcV/uSpxeyPG69xpW
   TEAE4r/KilPcovknQzuhkVMjddLTA/Uhrbdbfff1iKbWu1ieL2tp1tBvz
   qOo/VZczYrldc2bt2G5JXTtD1d7cL4jVBedi1oQZkgCYcukmP5C2QW2qY
   g==;
X-CSE-ConnectionGUID: qW6NYK3URjyG+4QhymFfxg==
X-CSE-MsgGUID: e856HOxCSfmyS9t5pppw2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="221179404"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="221179404"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:04 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 9F28542A320
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:04 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5939C100046F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E2378101A430;
	Tue,  2 Dec 2025 09:52:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/25] python3-gmpy2: upgrade 2.2.1 -> 2.2.2
Date: Tue,  2 Dec 2025 17:51:20 +0800
Message-ID: <20251202095132.652-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122246

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gmpy2_2.2.1.bb => python3-gmpy2_2.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.2.1.bb => python3-gmpy2_2.2.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
index 15599bfad7..2196616a0e 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS += "gmp mpfr libmpc"
 
-SRC_URI[sha256sum] = "e83e07567441b78cb87544910cb3cc4fe94e7da987e93ef7622e76fb96650432"
+SRC_URI[sha256sum] = "d9b8c81e0f5e1a3cabf1ea8d154b29b5ef6e33b8f4e4c37b3da957b2dd6a3fa8"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


