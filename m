Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5A5ED7BA8
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15853.1776163192868427976
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gsNc0ieH;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163193; x=1807699193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1mIR5GJJVbJH/O6b1Qd4RQhoGtdsMQ/dac1v1pKCRNk=;
  b=gsNc0ieHPi0k6gVMd3hxGFFKV/ZM8ntgAg8gG37Tlfl9c3pFphi9Jpc+
   r+d2d2vWIk+2r5I9s0gJr1Pkn/ajLbZTpe7v02/5R8iKjOJFGdtBfSB8X
   uaGZnuv3zJhNqkbC+Ib0D2FXXdVcBS55dVF/vKcAtYfiOinMbKMwi8N3H
   apeSZ9OM0lxTZNAXubXF0lC2sEateVtOPM2z5Lh0GHLXIoGAmAqAVGgZ+
   hJVL0CstEDn/hlgS/a72i2SfCmHBQFtoXBYlsmdg40grzsk2TGd/LofNR
   HuBx9z1l4nc2aRasuphQdgSpetQTSQiH55KY/oDXhyszhKX3E7A60JnmF
   A==;
X-CSE-ConnectionGUID: nU+i1dPfSzunu4PR5rdKnA==
X-CSE-MsgGUID: Ii7QW5QdTmmYQnwkhxkGjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="215917380"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="215917380"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:51 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4F5EA1000346
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id ECF5C1800323
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 59AD614000E2;
	Tue, 14 Apr 2026 10:39:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/32] imagemagick: upgrade 7.1.2-18 -> 7.1.2-19
Date: Tue, 14 Apr 2026 18:38:21 +0800
Message-ID: <20260414103845.1728-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126312

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-18.bb => imagemagick_7.1.2-19.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-18.bb => imagemagick_7.1.2-19.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
index 49bf257cd3..18c23cb0d4 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "d4e4b2b35a573fb7d96bc64ff1a417415bbe0f4c"
+SRCREV = "9fbd2b79450e930edb95e8158d412e57a7b27e83"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


