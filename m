Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C34BEFD223
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42036.1772012280150233779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lNOQ9aLh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012280; x=1803548280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=whkf92kZh7fbfYSPgByEWSeWO5FbKwW8bi3TGyNC0nM=;
  b=lNOQ9aLhX60/A5WvMf6LqUWiddCmj6VAQKM4DjbTEdSEB2j2X7wOHmsb
   BdBXCHEYZBYnZT+n02mPBLPPzYZaD8X0+z+MrahgU0f42th94dI2NPW0J
   cQZqgDfPpFVAD7ASqCRoATrGuVVnjfWrL193ORZ91FJWMIB5rlyWOJ0ww
   DFdosROv8WhQoeC5DBZ7AhNb8h7JlohgTJxQ31BdfhkUnpX0RswYLZ3Ay
   4URJ/ZjtvG5UwoeVI8YJ175JcdVdwIh/1HX6hTN9VZh1bPD+jAnxA6zG+
   6o1m1oiQMt2d6ES5RVccyzIxGSF3wUnZrGgfKkBwJXAkCeUUJovx6WX0l
   w==;
X-CSE-ConnectionGUID: IgrgCa+zRC+ptG8tfRJTPA==
X-CSE-MsgGUID: kEEO99U5Ta2coeDNRhhZww==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="218424101"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="218424101"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 953C983BC
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:58 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3D3F1140060C
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 48D5F101BB42;
	Wed, 25 Feb 2026 09:37:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/33] imagemagick: upgrade 7.1.2-13 -> 7.1.2-15
Date: Wed, 25 Feb 2026 17:37:06 +0800
Message-ID: <20260225093727.1284-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124624

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-13.bb => imagemagick_7.1.2-15.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-13.bb => imagemagick_7.1.2-15.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
index 0eb072f84c..952f8c4028 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"
+SRCREV = "b5fdb90dac0e6d0bf1bbd95704bbd60216a5bc23"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


