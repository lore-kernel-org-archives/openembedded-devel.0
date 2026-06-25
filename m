Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA44ACDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 02:04:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2824.1782353087491294969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 19:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YT4IzULW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782353089; x=1813889089;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EbbzvJk0fxcsrYNoPOdjz4k0bhVbEwHPpb5byx2rPFI=;
  b=YT4IzULWfutvGuwxV3w2gJH6bB59LCP3D0PsanuMFbuMbdv0ixFFqpyu
   cm4do2nTyi51BvPwA60R3uEttPJq6poVzjaEfMDk1rgJii8sWjM5KKYP8
   As0hNA0vxqELYMRPLVPA/Jyon9ra+nIg4bdD28XnsCw+O8gYDFQh3gExM
   N9iF/Srf1TRJHGPohEs1L9cgF740y3J89PJj6Olhn8wbLS0Rjl6vkf0bU
   GAWsXNj8D5/8paEXj7m6BEZypKidRwuijBzVNFyIAkhP2J8zrll78OXm0
   5AhfIAcXP/I8//J/gqRItRmtrUgUkqgqzLxEiyM5oIVb+o9V4PV4B/glB
   w==;
X-CSE-ConnectionGUID: zA2fGrd9SMa/VGPquvhMOg==
X-CSE-MsgGUID: 0vI6MRLHQJ2EpRmUWf6Wzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="222945090"
X-IronPort-AV: E=Sophos;i="6.24,223,1774278000"; 
   d="scan'208";a="222945090"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 11:04:47 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B6EE942A307
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 6D8AB10CF1DD
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:45 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C09D01017307
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:43 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 4/5] ftgl: Use virtual/freeglut instead of freeglut
Date: Thu, 25 Jun 2026 10:04:36 +0800
Message-ID: <20260625020437.2824-5-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
References: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127730

Use virtual/freeglut to depends on split version of freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
index c5c547186f..eac65e7c0b 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 DEPENDS += " \
     freetype \
-    freeglut \
+    virtual/freeglut \
 "
 SRCREV = "b787042cc1d1e4861337d5f9a6727e4c6900a4f2"
 PV .= "+git"
-- 
2.43.0


