Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015C2CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:58 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17213.1777546181570716244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qsUw0ao7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546187; x=1809082187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=obczC2M7IML5yJJUcMM2txqayzJShgiVXrBPpxcqtjs=;
  b=qsUw0ao7TlbJHDAW8+lhs59SPRBTohVQ7DpsrYxNgNwP6500aLSRqxnM
   ECXOFXPeGPG60/zxOMHWuX/DmluVX10eDpV89huHA3Y4EDduq3xtwg5TV
   CGfnsggv0yDeGwOFAcvThhpoNI2i1KBKN/pK4nFxaw2f5UDAP2vX9bBlr
   U/5PRNtIT6fKoq2GzWdqVci4dRJOCXMpRSkNJhi5RgsvPqVR2r1OXL0MH
   gjKqYbDeSw54Z2Yv84SndN2jjC9Ecnv7roZsFMXYQ0/BIMhYQY1AmLP/u
   9XzrEnQJd38AZtnxnGaDV6JMuIyGalFyx3XSdpWg/J5tuSOaLUmqLOJ0b
   A==;
X-CSE-ConnectionGUID: EPSMYhNuSF6ZfvIxyRJQMw==
X-CSE-MsgGUID: M25NjYdlQAKs+yqy2LQv3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238077184"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238077184"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 76FF05C32
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 258CEC01296
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9B7BC180113C;
	Thu, 30 Apr 2026 10:49:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/64] glaze: upgrade 7.3.3 -> 7.4.0
Date: Thu, 30 Apr 2026 18:48:27 +0800
Message-ID: <20260430104924.1106-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126680

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.3.3.bb => glaze_7.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.3.3.bb => glaze_7.4.0.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.3.3.bb b/meta-oe/recipes-support/glaze/glaze_7.4.0.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.3.3.bb
rename to meta-oe/recipes-support/glaze/glaze_7.4.0.bb
index e733d166b2..335e1a9d7d 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.3.3.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "dbf6caec935b768546587a413e45d033480c4483"
+SRCREV = "0731509dd002db783005b14c32f9587e4818f500"
 
 inherit cmake
 
-- 
2.43.0


