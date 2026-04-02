Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD76111225A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7216.1775096131714999810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IC9872yI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096132; x=1806632132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GPHs0bBWRX1WPJS/uvRczYcYVlHzzkU/wWwdw1WGUEw=;
  b=IC9872yIdDrOCVTy42T8v6X+8So1jPeZH1KUgNXw40RP79C19mwspIvd
   CoaQtPeUNXkrsobrFIRlObtiGveyGnye0yuXZrk/h67pifC05mofRW2Pa
   T1pwW/mRu8kFcuYhwjHcYsDh2TZGAVH29FYTqeoexcYeq1PT8vQGTMj9o
   PThPWcfPVhny5soyr8K0VN716mqw0eQWc9fZFcFjS6HvNusVHWuxZJf56
   HQAdWIYMbDIu29XixuhAhLw2hWJRjICu5Z+n8GLHsxs1fdpBBecHio/Bi
   L0VvxKAJNaDjLDgQKqLV4CKG0ycu0VNKz4r/SMJm0sl+ewIEwTi3SAIF3
   g==;
X-CSE-ConnectionGUID: ceajHGhGRr+GN02AKW0xwQ==
X-CSE-MsgGUID: /iYgPCyrQtC0CNd2sz07Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235451174"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235451174"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:30 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3916E1000359
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:30 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DC6CDC012B8
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E31CC1003743;
	Thu,  2 Apr 2026 02:15:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/39] parallel: upgrade 20260222 -> 20260322
Date: Thu,  2 Apr 2026 10:13:30 +0800
Message-ID: <20260402021355.1324-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125930

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20260222.bb => parallel_20260322.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20260222.bb => parallel_20260322.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20260222.bb b/meta-oe/recipes-extended/parallel/parallel_20260322.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20260222.bb
rename to meta-oe/recipes-extended/parallel/parallel_20260322.bb
index cf01b783bb..5a9980e66f 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20260222.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20260322.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "c6272a48972a0f2fdd3f39560d698f3c5abd3d8a4de40d52f9772f3a03ae1f48"
+SRC_URI[sha256sum] = "764680e932f4d0d21cf0329bd9f9eed659895de16836001f6491533b822befe0"
 
 inherit autotools bash-completion
 
-- 
2.43.0


