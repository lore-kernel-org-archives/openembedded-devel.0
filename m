Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C7ACD6E67
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21486.1780394896004415168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EmKgtWyi;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394896; x=1811930896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DQQhfw2qDNhQxFlcnE8VISwBwpaj8+k6Ey3mKd+pRiE=;
  b=EmKgtWyigyNt+s8w0k7BPpdBRYY3mRod94Ob9qA04V6cH/VqKl7ZDcy5
   mpENJWj45uAUPnKtdstganoilOmFyidRI0VFAAUE6Nry1pUy0Ml+yNoXI
   kMtRyXyIMZUNJ/A0UtGgS8CxCvth31ESbfarOs0NIA9gg9SJK5OCuFTWR
   jjRBJvSLIHFWD+WrCLCPD57gVX0QKdg5ozPl+HimfnSvVa+mVrIqBm3zb
   5aA7SPvdHl+w8HhQPR6+CZeFsgaljoQGz+NFahzVMNnC2rnW3x8BQWMv7
   3aSZiY4Oy4kNuUDSuwGluGYkmhguq3PtPwEhL7+ix67oaj/JZN3IZZotB
   A==;
X-CSE-ConnectionGUID: ahtxA7v5S/ifW0OgG9MXEA==
X-CSE-MsgGUID: Q8Vsc5LsSV+i5KJb/MCqGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="220405961"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="220405961"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:14 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6118F8204D8
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:14 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 17744C05A2E
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 14752180051C;
	Tue,  2 Jun 2026 10:08:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/38] imagemagick: upgrade 7.1.2-23 -> 7.1.2-24
Date: Tue,  2 Jun 2026 18:07:23 +0800
Message-ID: <20260602100755.2117-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127329

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-23.bb => imagemagick_7.1.2-24.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-23.bb => imagemagick_7.1.2-24.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
index 480f9d9a06..98e1ccdc6e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "6a10c829fb645e0de1408030e6e0f67e820b0c98"
+SRCREV = "271b6bc4cbbd3e52e6768c5daeac9e9ed7a139f8"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


