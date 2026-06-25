Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FEDCDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 02:04:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2729.1782353084823071423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 19:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hCyfVZ7k;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782353086; x=1813889086;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ig0JlccesGqVFTex6AELhf1L6ZbLgCwpaiP94/3xpQk=;
  b=hCyfVZ7kKzma7v3eN9OtjjRIhbdWvPIKTMfMn3pDSuxMdu28VZtc/csY
   rLLzapFlos8UttnW+5D7/zfpizni/KA3LpxDu8XbnpXeNRa25Q3PzcFaO
   S11gVJyoCd4ezTn+i2mTOpkGTihqZDWBs9hMl+8lY4K3PTOZRAD4cnlvU
   ryB5RHYPzzToUDSmy2CRMp8zgQoHfAA1s8mLjbFYhImgPPx9ERlRp22/M
   f5HMyaUB7se46jx4t+GX7K1nhuNtSvuSpRdCTf4twCxReX/wR2QFdP9OO
   Ecpn1VK12PXCby8B7NISjrm/1d74CDbLaplwFBZNraO7KITMusOfvMuIL
   w==;
X-CSE-ConnectionGUID: y4dDE9tfRFWK/OQhrcMvdQ==
X-CSE-MsgGUID: mccJ+HuIS8GxUOWbb5mbdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245178266"
X-IronPort-AV: E=Sophos;i="6.24,223,1774278000"; 
   d="scan'208";a="245178266"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 11:04:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0ED051C000F8
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B9D211C4E0D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:42 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1CEC81017308
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:40 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 2/5] freeglut: Add virtual/freeglut to PROVIDES
Date: Thu, 25 Jun 2026 10:04:34 +0800
Message-ID: <20260625020437.2824-3-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
References: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127728

Since commit f7735c920472 ("freeglut: split normal and gles packages")
in meta-oe, the freeglut recipe only provides the classic OpenGL version,
while the GLES-compatible variant is now available as freeglut-gles.

The jasper,ftgl and opencl-cts fail to configure when depending on freeglut in a
GLES-only build environment, because freeglut's do_configure cannot
locate the legacy OpenGL libraries.
So add virtual/freeglut to provide split version of freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
index f9fe540c63..314a3a7052 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[x11] = ",,virtual/libx11 libice libxmu libglu libxrandr libxext"
 # error by clang16+ and this is not really a problem
 CFLAGS += "-Wno-implicit-function-declaration"
 
-PROVIDES += "mesa-glut"
+PROVIDES += "mesa-glut virtual/freeglut"
 
 DEPENDS = "virtual/libgl libxi"
 
-- 
2.43.0


