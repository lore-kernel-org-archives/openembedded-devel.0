Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CCAD3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:10 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4184.1765274165117888948
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ncUPnt81;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274165; x=1796810165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=teFS6Jh+XODhNv6DodnB4XVOkpc2uEEoAQsErbRqxy0=;
  b=ncUPnt81cI9QovdmzwTNskTTJnk1OmXSfy3pqGO33t8SR2i7PuXM8EkI
   ZGAYWcMt3LfpeO/Xjbe52w4rOS496eE63FyN7d/+1E4TIBH7dx2VXUbeC
   B7Om5m8r9eHZixjmbDimW2nhApmYQzNyQSgNjYBTPJWP8zTO+r4wjB9ZE
   /SDaLPxpdSY1U9NK1ON7dcqmJS73w/6w5utdVfBt3554U3jkwpslegBEo
   FG/tw4QKv3Quq568uRq1/osSLYgtPir1AeetvENAkHlmkgNVz2ZaYEr+K
   64QoskhKKGc08FLutj7k99uXH8o/+NwXETEwH4YkJ5F4A5I8dgl6P4TsS
   w==;
X-CSE-ConnectionGUID: Jc/x4A/uS8a8v8pDaGpxSQ==
X-CSE-MsgGUID: Y4Wzg5gHShysrRGjkvvnlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="225876825"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="225876825"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:03 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 82BE742A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:03 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3924118019A0
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id CCE7520002B9;
	Tue,  9 Dec 2025 09:56:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/38] exiftool: upgrade 13.42 -> 13.43
Date: Tue,  9 Dec 2025 17:55:17 +0800
Message-ID: <20251209095552.690-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122407

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added support for a couple of new Android QuickTime Keys tags
- Added date/time formatting for RIFF DateCreated
- Added ability to read/write (but not create/delete) the HEIF Mirroring tag
- Added a new SonyModelID
- Added a new Canon LensType
- Decode ShutterCount for the Canon EOS R6 Mark III
- Decode another Samsung trailer tag
- Convert invalid Panasonic AFPointPosition to 'n/a'
- Fixed issue extracting timed GPS from some Wolfbox G900 MP4 videos

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_13.42.bb => exiftool_13.43.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.42.bb => exiftool_13.43.bb} (92%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.42.bb b/meta-oe/recipes-devtools/perl/exiftool_13.43.bb
similarity index 92%
rename from meta-oe/recipes-devtools/perl/exiftool_13.42.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.43.bb
index 5d97cf5838..5f973098b3 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.42.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.43.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "a162a723be10dac03b3037f7cc64c1f9c480448e"
-SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
+SRCREV = "dbd6def5620f4d7e4ab02d9ee5de498263ea73c1"
+SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
     perl \
-- 
2.43.0


