Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBBFD2D8C6
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6873.1769507028325788182
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mMh5n4iY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507028; x=1801043028;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7okHqMTaiw4dniWBk2EV9EjGiHNahJ2g/NuaA71miIU=;
  b=mMh5n4iY9H1Tri5/pILZX2CiRAG+6ufnttYLZSBFc94JITeH3BWsndlJ
   bxFHC30oDefQu4W9W5M1CcKEiwC3vjvgZH8mDP3Eh0XAy/9OUSBzBv+i5
   5Xi6guI1AJuKAZeYwNCw2x6tTNHVxH1cLoPpHTpCWduMMMuYC499N5qo4
   BK193YlKgpzABdIuCB8SONnsC8bKGWE+q2dTJ5qLQTnkvO3tnJNCusGo/
   EyOzdrmM+dGZRcz5ibrb742hi0/Dfh5pkvAp1VyeFmEqNXlmKwO3O/iC6
   feTgOyZ9W0VYPGhjQW/62ZS0L8vokCNXea8XygvaqoqH27iXLPE0yDMQn
   A==;
X-CSE-ConnectionGUID: ZPrmK2JPS8mdJEnvyZEc0Q==
X-CSE-MsgGUID: WHY0XkOqQdyKIGT9S1fUZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227219608"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="227219608"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:43:46 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4617B1C1C720
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F29D41809C2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 55F7A20000D2;
	Tue, 27 Jan 2026 09:43:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 01/25] bindfs: upgrade 1.18.3 -> 1.18.4
Date: Tue, 27 Jan 2026 17:43:15 +0800
Message-ID: <20260127094339.1081-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123913

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Merged build fix for MacFUSE
- Populate user and group cache eagerly on startup, if the cache is needed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-utils/binfs/{bindfs_1.18.3.bb => bindfs_1.18.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/binfs/{bindfs_1.18.3.bb => bindfs_1.18.4.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.3.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.4.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/binfs/bindfs_1.18.3.bb
rename to meta-filesystems/recipes-utils/binfs/bindfs_1.18.4.bb
index 1c32f443ca..a61997f703 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.3.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "fuse"
 RDEPENDS:${PN} = "fuse"
 
 SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master;tag=${PV}"
-SRCREV = "91fbfa48427c67f59c24e84f3855507531ba972c"
+SRCREV = "8cda89a91a836e106ad275b840f44485194bec91"
 
 
 inherit autotools pkgconfig gettext
-- 
2.43.0


