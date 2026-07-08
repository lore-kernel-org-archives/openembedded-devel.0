Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87111C44507
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4897.1783503917836852504
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cm7Fix36;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503928; x=1815039928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Nq+TSyODlYLplSRxwSvwixZJ1hYfcrCXiQDeOjHS4s=;
  b=cm7Fix36v0ByIJRi70v5NlsMycO1qMXDhtghdddDlRc+Qi4WCuGl99xT
   ESzpKbnuJYJEal0UU/kW4mIZ5NEc+fZXaP/LRHXqEhnKKJskpX79w+gBg
   450JXo17fbb0byLCJMiqB+aw5CMb4g03kyyMyOHLuaTLuyutIczOkTHCP
   5M0/1gTUoyNjosoUwxTOvhhSBOco7d6BCQfZYtncl+C9ThjziflG4nzkc
   1Hd9E+QOq4Essz+SjoBXGgxRKLooDzCweSQY5aDxkbYNpUd2ROjglFeoZ
   mMCQIyOqRzOZnkgayNz7alLO+vWGWR3HcAVM7UwiqTj4savfH/foviZjv
   g==;
X-CSE-ConnectionGUID: mbKS4/ThQfOhPb+WkGEEYA==
X-CSE-MsgGUID: +U+zTp3ARWGJY5q4IyFPYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="234654556"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="234654556"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:27 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5D4FF1C01686
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:27 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 132FA82775A
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 46785180112F;
	Wed,  8 Jul 2026 09:45:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/37] libxmp: upgrade 4.7.0 -> 4.7.1
Date: Wed,  8 Jul 2026 17:44:18 +0800
Message-ID: <20260708094508.2060-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128078

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add xmp_set_player(ctx, XMP_PLAYER_DEFPAN, 50) to relevant examples
  in libxmp.rst and in the examples directory, clarify it must be
  used BEFORE calling xmp_load_module, and recommend its usage.
- Fix crashes and other bugs in the smix API.
- Rewrite the smix API WAV loader to support stereo samples.
- Fix XM channel default instrument memory (should be no instrument).
- Fix IT high offset being applied when no Oxx effect is present.
- Fix IT offsets >length setting the offset to sample end instead of 0
  in new effects mode.
- Fix conversion of MED synth/hybrid finetune.
- Fix Magnetic Fields Packer track loading and optimize tracks.
- Fix path_join when loading a module from the current directory.
- Fix loading truncated Startrekker AM instruments.
- Startrekker AM instruments now take precedence over sampled
  instruments in the same slot (fixes GTS/fa.worse face.mod and
  WOTW/intro 12.mod).
- Fix StarTrekker AM instrument envelope, P.FALL, and FQ toneporta
  bugs by reimplementing these features using extras (fixes
  Epsilon (ES)/frankie.mod, WOTW/intro 12.mod, maybe others).
- Allow Archimedes MUSX modules to load if the SDAT instrument
  subchunk is broken (fixes 5-OverPar).
- Fix various -fsanitize=shift-base warnings:
- Prevent overflow read in lha depacker pm2 decoder.
- Add OS/2 EMX makefiles for KLIBC environment. Build tested under linux
  using cross-os2emx toolchain at https://github.com/komh/cross-os2emx
- Build the PDF without date information to improve reproducibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmp/{libxmp_4.7.0.bb => libxmp_4.7.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.0.bb => libxmp_4.7.1.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.0.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.7.0.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb
index 22e41aa7cb..4e87ee275f 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.0.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "8a4fdf7d09aedc921de537853b59e1d15b534f24"
+SRCREV = "12f76e4bf1dd6765e3bf46cbc1ff35c4a4551671"
 
-- 
2.43.0


