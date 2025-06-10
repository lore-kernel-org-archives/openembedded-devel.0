Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F318C7114A
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.77950.1749526423368694869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cpYQEkrY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526424; x=1781062424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kOXYa8O1bB93tB9dxsC3/hIomH0kPDCpA0bTgrfQgAk=;
  b=cpYQEkrYSBU/DQzYm8dlUlb0dAzPvYimGG4iko3qowD4k988+pDPSoE1
   yHmF+zl+W+21ddHTALYjTcFc7DIYqIt54WUoi5BVzaP8OpPXLVifyQ42O
   p/s4XG7EsVgp7EXOklPQAcC3Oaj9B4WDn0VFcV87gAF+KBp9304EFPhFa
   bwr3iHrtW7PVaW1keyxNIsXSR17S84C1O+gnK1ZZGQiIcaMYTRBLom1ZK
   meN0bV+ge/ANX4kE9eYS2dvormzIHSDH1aaWktC1QqKDaiwYA3wgCZ7cr
   uotoQn1Q6hSazLGIZuhZ7HvwQrabkU40+85oWWIgW14/62a2n9Bjhg845
   Q==;
X-CSE-ConnectionGUID: UtCTz08YRk2UwIvf1/ssfw==
X-CSE-MsgGUID: WnhHsx7rQiy0gQYb4I5IMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="201453584"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="201453584"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E380D8E1B
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B770BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:39 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 925471A009A;
	Tue, 10 Jun 2025 11:33:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/64] libass: upgrade 0.17.3 -> 0.17.4
Date: Tue, 10 Jun 2025 11:32:39 +0800
Message-ID: <20250610033330.924-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117805

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- add new API to prune old events from memory
- ass_prune_events for manual pruning
- ass_configure_prune to set up automatic pruning
- add ASS_OVERRIDE_BIT_BLUR flag
- fontconfig: fix minor memory leaks in pathological font setups
- coretext: fix build on older compilers or Mac OS X 10.5
- checkasm: fix build for older compilers
- aarch64: fix assembly build on strict compilers due to oversized align
- meson: improve ASM configuration on x86 Android
- meson: align MSVC warnings and optimisations closer to gcc-like compilers
- meson can now build all dev utility executables

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libass/{libass_0.17.3.bb => libass_0.17.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libass/{libass_0.17.3.bb => libass_0.17.4.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.17.3.bb b/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/libass/libass_0.17.3.bb
rename to meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
index 3dd678f055..297b7c01e8 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.17.3.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 DEPENDS = "fontconfig freetype fribidi harfbuzz"
 
 SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master"
-SRCREV = "e46aedea0a0d17da4c4ef49d84b94a7994664ab5"
+SRCREV = "bbb3c7f1570a4a021e52683f3fbdf74fe492ae84"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.43.0


