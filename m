Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18791CD582F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3088.1767781753012383424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TSdnYxJx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781753; x=1799317753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XCAY0eFFsbByTSEwNs/WZgEHeSv5g/qBnkw9ASzCkr8=;
  b=TSdnYxJxGovp4N/6m2/KX+Ghs8J2GnyJJU1ErUym9FDUi6wcjZLWeC83
   SJ4QN2p/7vBVprYAqYNX5m1hcZwiMkC41f8NwkoYoeKD9rH3QFDR4mVE5
   DwTRuKa+KRhn7lvgPDE31lT9Fe7yuTLyLJTBvzJL7DbNyImVN6gwx8KLw
   2/e+OEQ9ZfmRS7BIv5tFHO/o75Pxfc9aH1bpjgiiFdHmc4+n/tjrU23Pj
   hBUW+D7uAsfx+QpadL/e9NEonB0dU37xVQT1zGBNuzoTn6P+r5NskaGgR
   7v0iR4qkoYgxFPuucjJISVkzFNixdv3BilI1AnQVBF6alu1ATd03PFzLb
   g==;
X-CSE-ConnectionGUID: MKsA2tD4RmS0bf6mqlXcvQ==
X-CSE-MsgGUID: ExxDx0IMQVCAKKZQwSt3vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="213659016"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="213659016"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 485251C1C709
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:11 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id EC6F5C060A1
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 21CF4829F3C;
	Wed,  7 Jan 2026 10:29:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/24] imlib2: upgrade 1.12.5 -> 1.12.6
Date: Wed,  7 Jan 2026 18:28:36 +0800
Message-ID: <20260107102855.228-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123203

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Y4M loader: add support for 10-bit 4:4:4
- Y4M loader: add support for 10-bit 4:2:2
- Y4M loader: add example for 8-bit mono
- Y4M loader: add support for 10-bit mono
- Y4M loader: fix support for full-range mono
- Y4M loader: fix support for odd dimensions
- Y4M loader: add support for 12/14/16-bit mono
- test/images: Remove intermediate generated file
- imlib2_view: Set title
- imlib2_view: Scale image when resizing window
- imlib2_view: A couple of fixes to previous commit
- test_load_2: Add new y4m test images
- test_load_2: Add more new y4m test images
- test_load_2: Add more new y4m test images
- autofoo: Use AM_LIBTOOLFLAGS, not LIBTOOLFLAGS
- gradients: Fix rendering of gradients in larger images
- imlib2_conv: Fix constness warning
- gradients: Better gradients with angles
- Compile cleanly with -Wdouble-promotion
- XPM loader: Add missing progress callback on incomplete image data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 66e9f8a0c4..c02e497a86 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.12.5"
-SRCREV = "df73df52ddf0e1ea40507f5ee8c6b794b328b3bc"
+PV = "1.12.6"
+SRCREV = "8c6a7640c91d7815a6318d3641554869c62cc926"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.43.0


