Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E91111225C
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:32 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7214.1775096124709632293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tItrHdUY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096124; x=1806632124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GK5kNMoxPit4PYm8oUk8KPYXBDTTsC6TzUyPNrLx8do=;
  b=tItrHdUY7grPb7ymsNrdDd0JgnH/1k2LccMHkyZ2P6vJy6smYrHEb3le
   76zz5XqDODLEQdIA6x166jop4BnW3Rl8PJOaGfY5C7z52qNoWxyThpp83
   6OTDUUtczibh0Xupdf6sR7fNlD+rxGw2Ebm5KDkhRf65inzWg5vRHVzRk
   hG+S/wArtNKPboaWCv0govg/ILeiJxJV2+OhLaZDyXCN3Yy4tP0EOowTT
   OxzUBCSpCJUTgAGwn2qS50N7bg0/I3X/0ituN7wwzjeNDdDuRD+n7Qry1
   hzjKfZeTBFFlbqW6VDobi9rjsB1/p3Fp5iKmb5lXyFJ9eHEXPe4EPZKrp
   w==;
X-CSE-ConnectionGUID: xSOn3GpsTqy/1CkAr0cbuw==
X-CSE-MsgGUID: oO8ZGYSFTKCW5+K7KY1YNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="234940626"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="234940626"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 42C1F8203DD
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:23 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F1C97C00546
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A4DB31003740;
	Thu,  2 Apr 2026 02:15:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/39] libharu: upgrade 2.4.5 -> 2.4.6
Date: Thu,  2 Apr 2026 10:13:26 +0800
Message-ID: <20260402021355.1324-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125926

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- TTF security fixes
- Fix #334 - HPDF_FAILD_TO_ALLOC_MEM missing
- Compatibility with Higher version of Delphi
- Remove restriction on user password to be different from owner password
- Fix various typos
- Fix Build error for Win32 (x86) due to modifier mismatch #350
- CMakeLists.txt: install docs and bindings to DOCDIR
- Adapt CMake scripts for WebAssembly compilation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libharu/{libharu_2.4.5.bb => libharu_2.4.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libharu/{libharu_2.4.5.bb => libharu_2.4.6.bb} (83%)

diff --git a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb b/meta-oe/recipes-support/libharu/libharu_2.4.6.bb
similarity index 83%
rename from meta-oe/recipes-support/libharu/libharu_2.4.5.bb
rename to meta-oe/recipes-support/libharu/libharu_2.4.6.bb
index 0ad4bd92c0..714cccbc3c 100644
--- a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
+++ b/meta-oe/recipes-support/libharu/libharu_2.4.6.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=924546dab2bef90e370d7c0c090ddcf0"
 
 DEPENDS += "libpng zlib"
 
-SRC_URI = "git://github.com/libharu/libharu.git;branch=master;protocol=https"
-SRCREV = "8fe5a738541a04642885fb7a75b2b5b9c5b416fa"
+SRC_URI = "git://github.com/libharu/libharu.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "3467749fd1c0ab6ca6ed424d053b1ea53c1bf67c"
 
 
 inherit cmake
-- 
2.43.0


