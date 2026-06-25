Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B13DCDE005
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 02:04:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2823.1782353086664857361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 19:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QJoxSfdW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782353087; x=1813889087;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tQtTbq2hZTQMU5Ziqdo05enDaM9jElNi8wOAWKa0vtM=;
  b=QJoxSfdWIKOXWo2OzsF+8HB0jsNL5IP7lmfEACym36B82OVuEADOX5Ui
   AzezNYizkZ9SUgFPx7eAGKgy8xzuBJM2jTVGpXyoGWo6ibS+tsj7Sicaz
   /ruPFWemX63cj7zqOh8A/JSdHsRz572k6KNayyYesvdxX7psqcqpt99YJ
   /w336cpevRuf33q5JyuNSJiTnhClYs8Z+gJcDeTOusoSkY8mJWWrQNIsS
   Emnbx1xKS6DfrjtJ36/KDOD9Uy8hEvskDtQ/kh/sYVONnChWIA7kkgOgn
   AbHjYiasY/ZyZ/2JWiLPJJjf/SKNRnf+w3sfkJKG5kt9PECswZS2/Fbxb
   A==;
X-CSE-ConnectionGUID: RWTKIyoqScerwdc6tfbUcg==
X-CSE-MsgGUID: 1jIvMdXGRpCw1QLQW5hMiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245245101"
X-IronPort-AV: E=Sophos;i="6.24,223,1774278000"; 
   d="scan'208";a="245245101"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 11:04:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 64FB11000346
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:44 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 199991C4E0CD
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:44 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7056F1017302
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:42 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 3/5] jasper: Use virtual/freeglut instead of freeglut
Date: Thu, 25 Jun 2026 10:04:35 +0800
Message-ID: <20260625020437.2824-4-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
References: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127729

Use virtual/freeglut to depends on split version of freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
index b48fff7081..004231d556 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl
 		   jpeg"
 
 PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=ON,-DJAS_ENABLE_LIBJPEG=OFF,jpeg,"
-PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,freeglut,"
+PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,virtual/freeglut,"
 
 do_install:append() {
     chrpath -d ${D}${bindir}/jasper
-- 
2.43.0


