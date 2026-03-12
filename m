Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADC0103E30D
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:46 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18745.1773312764976245957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MVKZht/O;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312765; x=1804848765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aLskXcbHoAV/nCA3R0LljDHYZX20EC6N3bw8rvs83DA=;
  b=MVKZht/OyWie1gXdXt0PgXMyKAcAuGrizfoG2u5XDme9rN2VQCv0SQV9
   fG1aympx6nU4EYY4ZXyLeeMhPeKaVBIQyjIPi3ub5RoVWL6uplsi19jnB
   cn8VChnaUGkFaZtSJsHQPwDlb+z0adoS0488IodXhIILZC1DKksK+ixgy
   4ZvqYmJ+diW1mjchJZg/4wXLZXSVHPvjxa+qAKK6TP/O2Y+3rfK4VN8vG
   l6aWZsU9aNp9Qme1fqC85FJlRdZqZwPAJMFZubzdoznnEr57MXYOHjqIT
   8Sc7ed8oVfizMbVWJ8HwlgGfIPhfcEj6JLHEKxfl2yd58pMxBV1cQaX6Y
   Q==;
X-CSE-ConnectionGUID: Ufsg31SrSAG1CXMUF+nlmw==
X-CSE-MsgGUID: ZtFHr136QjGarA0Atc7VmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232954143"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232954143"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 605201C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:43 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0B7A0C00D73
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2A01418005B4;
	Thu, 12 Mar 2026 10:52:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/64] imagemagick: upgrade 7.1.2-15 -> 7.1.2-16
Date: Thu, 12 Mar 2026 18:51:24 +0800
Message-ID: <20260312105220.1856-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125108

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* client: Fix use-after-free when creating async proxy failed
* daemon: Fix race on subscribers list when on thread
* ftp: Validate fe_size when parsing symlink target
* ftp: Check localtime() return value before use
* CVE-2026-28295: ftp: Use control connection address for PASV data
* CVE-2026-28296: ftp: Reject paths containing CR/LF characters
* gphoto2: Use g_try_realloc() instead of g_realloc()
* cdda: Reject path traversal in mount URI host
* client: Fail when URI has invalid UTF-8 chars
* Some other fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-15.bb => imagemagick_7.1.2-16.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-15.bb => imagemagick_7.1.2-16.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
index 952f8c4028..56b6c0710a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "b5fdb90dac0e6d0bf1bbd95704bbd60216a5bc23"
+SRCREV = "70563ce3759b7a55801900a11e69978a9301fbeb"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


