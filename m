Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7195D10A1E8E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46404.1774526215931929982
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yb+zw9p1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526215; x=1806062215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pn/ije5XxqahJkTIW2a7gIrp7VKFyNit/d4422bglL8=;
  b=Yb+zw9p1xP5GfAZ6lTHFpWPIl/DJXAOziANZBXfl/+BN3hggKoDDJm+q
   Dj3g5E1digmolNPX1H958PgnNkx2BUbI/16ZlqNTcVylzvI0abcqxKr17
   Ja7IjFjj3dQzSY5D5b+3vbzmD8dzIOHTymQcLvT/84uXkA+FN52WoHftG
   uPyjmFHDlsUcRnt2VLq0+xaHyCMxPLf/rSTHeNyGSkCzIQne3F6LUkced
   UkkUyyOsBPferiyAj+Tv2ylsLQ28Mi4g56I6q9E4gBVY+9/aqtQWOOtiD
   sOeExqgC8rZ2rQ2eGKYVasPXIcRVnB+ZBCGqoyNGC6MhCkckmxu7tk7Ea
   Q==;
X-CSE-ConnectionGUID: EojXWm1wSiC0Rtn6e9VPdg==
X-CSE-MsgGUID: OUHdvaXUTmipgfBFgbp2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213520792"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213520792"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:54 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 339911570
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id DABAA18009EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 60722180714B;
	Thu, 26 Mar 2026 11:56:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/63] fuse3: upgrade 3.18.1 -> 3.18.2
Date: Thu, 26 Mar 2026 19:55:38 +0800
Message-ID: <20260326115634.1199-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125663

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.18.1.bb => fuse3_3.18.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fuse/{fuse3_3.18.1.bb => fuse3_3.18.2.bb} (97%)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.18.1.bb b/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
similarity index 97%
rename from meta-oe/recipes-support/fuse/fuse3_3.18.1.bb
rename to meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
index a29e1820d7..5a0c894e86 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.18.1.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz"
-SRC_URI[sha256sum] = "dd395c88f29c7540bbdd0b830260ab8092ccb241bb6e66f603643f715fb9322c"
+SRC_URI[sha256sum] = "f01de85717e20adf5f98aff324acd85dd73d61a5ca3834d573dcf0bd6e54a298"
 
 S = "${UNPACKDIR}/fuse-${PV}"
 
-- 
2.43.0


