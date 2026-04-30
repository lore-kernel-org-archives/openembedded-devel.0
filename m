Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5028ECD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17435.1777546187581658225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MZgXWz/z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546187; x=1809082187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V2V9o35q2nrfQHHpfJjPSzyHyTf3mICh+PEY5YSCbIw=;
  b=MZgXWz/zWbzxGK/6ZY34qkBez7x6/FSVqxdgUmrFmro1d5Nb/n2eDP69
   M2pu/fzI5zUQpxQXDE3KfcaVx8B3GXcTd4iIPYMm5Bh/MO87LcwYJP05f
   +1YTl0qqo80YgViZWHSswXxDr1lUBs/pQ499cu1X2mZhCp8CnyxDa1v/t
   Pp/8H+GoMFNaddDnUzZXzM1tRqiwVfMKtt1qAiTPaasy57DUDeVSooOtL
   OQpchaCrJJWsFxETtClGl+94900opchRz7y7l9MUfoC/cxUrFXn7MEI8G
   cTbUv4adx0n3p1nU0yjS7r9Lime/xpweo7llV9b6667oySkxXI6mL6VFM
   w==;
X-CSE-ConnectionGUID: c5c5WrspQeO560gTlwGtFg==
X-CSE-MsgGUID: 1cv4rkxoS9C1WbOYwumdJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116183"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116183"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:46 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 21A1B1002BAD
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D13F1C0022B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6E9A21801130;
	Thu, 30 Apr 2026 10:49:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/64] imagemagick: upgrade 7.1.2-19 -> 7.1.2-21
Date: Thu, 30 Apr 2026 18:48:30 +0800
Message-ID: <20260430104924.1106-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126681

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-19.bb => imagemagick_7.1.2-21.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-19.bb => imagemagick_7.1.2-21.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
index 18c23cb0d4..bfcdb2495d 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "9fbd2b79450e930edb95e8158d412e57a7b27e83"
+SRCREV = "c86de049cefb8dd739e16f0e2fdc1ef8d2006d59"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


