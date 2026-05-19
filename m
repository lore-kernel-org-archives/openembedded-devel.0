Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942C3CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:52 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19026.1779190782821706291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HJx9iS++;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190782; x=1810726782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=12js3MPItQ5uYAifAODETCxbBfvUa2K0xlnwknNfAd0=;
  b=HJx9iS++Nlc+sgM/JkwRU3Y363d7EvSYV39KG3Ps6im1jx0OLD0aUzGD
   Aw7BFKp820rKpm6udFnQ075E2NgaOM4++wGqiMb5K18hf/eGgWiFuZFzA
   9TDVOerHXjtRU5ET/c9ABUdmWTZBOSqU1X76//ankKI++MRDwzJk6PZQO
   tOzve7CaSHwrjBQxUXzupwe2Jb1cA4ULfN95IHZC+0BxZPKSAwi3cvCvW
   ezXp3b2cKPqoThizv1lYen4brFOzysSy34YryMgeccXvE6FSRKG0Dj6yM
   vzHV6eRMWW+nAJhFJ+wn269xcDJ9SvnkdvaCeZhd4mNnyHoEuP0xGQ1o9
   A==;
X-CSE-ConnectionGUID: GjPrtKxDRbaQSwy3MtauTg==
X-CSE-MsgGUID: I53udwS9Tre0dglihqVcQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995158"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995158"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3FC2042A313
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:41 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E5C4AC02C5B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 658AD4059BD;
	Tue, 19 May 2026 11:39:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/38] imagemagick: upgrade 7.1.2-21 -> 7.1.2-22
Date: Tue, 19 May 2026 19:38:50 +0800
Message-ID: <20260519113921.655-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127069

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-21.bb => imagemagick_7.1.2-22.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-21.bb => imagemagick_7.1.2-22.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
index bfcdb2495d..dababfbfac 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "c86de049cefb8dd739e16f0e2fdc1ef8d2006d59"
+SRCREV = "ccf56fb3edd41389a02e4fe7a1a11a18f2b13389"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


