Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA126C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7615.1787731779445630642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Bc3pVImC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731779; x=1819267779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mTu/tsnpHgUEkOhElrtVSzf6KYJMyBWKY1+ljd/9vzE=;
  b=Bc3pVImCP04DO4ons0hLSucLSOqz0izFEAzwCNwCMPhAJQzH+TL2BZeS
   ga7UPnnGWsHxx8yArThnUCOa3OjsA6xd9VCxrmM0LU53GsQtpx8necZfd
   c4vLqtFxkjfMRITa03+97xUhKiCvs9upG4ZQULT8edgs8Y9xRgUrN5mGM
   74VkXdXY4ShH26PhDxm5UKO0sFHVLODRuEJ3/aXwJAhLL8aldBzFLAiG5
   zAY/v9CgSkGxLXVfAW2f/OWNLwlRnHt0DR+UgiN6y/D4P09Aa8ObioMtU
   6X63IA+nH+UCzCcY06cnVSVHbBMUc3psScHf0hnhzrlf30umSmnjlKelU
   Q==;
X-CSE-ConnectionGUID: gq7KCUd1S/yV5vwQq1PqxA==
X-CSE-MsgGUID: 9t3eB354TAW2lNJxOAu4cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238886731"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="238886731"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:37 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9DDE81C1C701
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:37 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5537818000CA
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 770A614001C3;
	Wed, 26 Aug 2026 08:09:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/23] imagemagick: upgrade 7.1.2-29 -> 7.1.2-30
Date: Wed, 26 Aug 2026 16:09:07 +0800
Message-ID: <20260826080926.989-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129496

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-29.bb => imagemagick_7.1.2-30.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-29.bb => imagemagick_7.1.2-30.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-30.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-30.bb
index 0890edb8c5..87dd0cca0b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-30.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "360eda553586e389c9c725fc49df94f209a8a3c7"
+SRCREV = "344e9056f43764bfdf82456faf3bc2feee98a6fe"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


