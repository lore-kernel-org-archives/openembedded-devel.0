Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7656CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76503.1781000987360731933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D2L2+9zL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000987; x=1812536987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQN5hQ7RGH/ncDou7s5gxpyihkfzwDQ+ax6Kn7JTdzM=;
  b=D2L2+9zL5H7w2VrjzF5itKA2sjR5SWL5443JP1UEjskaSvRxgSwcfBjx
   X6lajVZSIjSkLL59KoLMOAzSd50tWuiljyV2gVwRE6rIGZwgJ7W8bYIi3
   +5bCLfZyyENMFbyTdLv6SBbzITRFh1VqWOyuAMZYMhS9eOu9PkbKJtAyD
   feNob/7kjXo4QOjfGXDWRs9X0MO+xk6ftA5yuEEiSLKsq/nwkhpSiSD7h
   Dm8Um/A0L5sXZRMLECb2U8FCftpBKteHHrLbn/RFKUNcH7TzKAsiFkdj3
   VrFj+pqoyVL29axXpbCW52gfG3VfJkWzatP21/Iu+TvvYa5eUGzM/Z6f5
   w==;
X-CSE-ConnectionGUID: 3PWXMMgARJKDc+wGmCZp+w==
X-CSE-MsgGUID: ECNa0otbTO+68UOF2vQw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="241652291"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="241652291"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:46 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ECF051000340
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:45 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9ED921C0094C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A2FC710003C5;
	Tue,  9 Jun 2026 10:29:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/30] imagemagick: upgrade 7.1.2-24 -> 7.1.2-25
Date: Tue,  9 Jun 2026 18:28:51 +0800
Message-ID: <20260609102913.2204-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127462

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-24.bb => imagemagick_7.1.2-25.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-24.bb => imagemagick_7.1.2-25.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
index 98e1ccdc6e..4a0cc0e1ff 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "271b6bc4cbbd3e52e6768c5daeac9e9ed7a139f8"
+SRCREV = "04a04eaaa22f721f204c4bf4c6b24b08b1afe5c5"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0


