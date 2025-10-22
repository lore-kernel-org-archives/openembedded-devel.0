Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA403CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.4757.1761099756319695234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I/vCOj8l;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099757; x=1792635757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lBfKm+gYxTzwVZVqcV0fCf487tW7gCrobl0innbBKys=;
  b=I/vCOj8lH10s3y2ImgCJMR8HymGj/MSvcDD3DigyDWzLZ+yxzZ8e6eGd
   nP+1xHaFol/kPv8T8jsj3hNq3swiVIgKfs9wvXWperEaEsfOHcIh6I73n
   O6G6XE8xXDt7cs1nfo+oyr9kj9xnfxh3FerY47Qt5qxD7eAIi+KM52CdJ
   R24g9PNwZhhv+TBmlXlxEHdMU92TFDnnfNAvNZksvIMzr/a/CgrO5vIba
   YOPte4ydNRx7oSE+MisWRUJYXBeYeH4XFLxbYDyY+vMVajpMgG9LtehB/
   8HbPFNH6DlZ1VtM5bKssqR2FUVntQ9nDiyCW7cqqwt3wJKaL4KF1I5EG/
   Q==;
X-CSE-ConnectionGUID: 82qbMpWmTGaObODaH8z6jQ==
X-CSE-MsgGUID: iDdtxvAvS8GSfskQrEzotQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216049686"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216049686"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 92389100034D
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:34 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 546A61800EBF
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id AFF7382C0DC;
	Wed, 22 Oct 2025 02:22:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/29] bdwgc: upgrade 8.2.8 -> 8.2.10
Date: Wed, 22 Oct 2025 10:21:57 +0800
Message-ID: <20251022022227.226-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120848

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/bdwgc/{bdwgc_8.2.8.bb => bdwgc_8.2.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.8.bb => bdwgc_8.2.10.bb} (94%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.10.bb
similarity index 94%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.10.bb
index 3c8c41cc03..e611ffb006 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.10.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=dd27361ad00943bb27bc3e0589037075"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "ee59af3722e56de8404de6cd0c21c2493cc4d855"
-SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https"
+SRCREV = "2955e33aba7467d4777aa985637620f909cc2a14"
+SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https;tag=v${PV}"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


