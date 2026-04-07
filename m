Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2F9FB5180
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 01:26:44 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70092.1775525203012877445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 18:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rj0/67qh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775525202; x=1807061202;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pGz6Ty5r5nwpljAvHxPvuRFZJe8bneoomnYPl5XDV4w=;
  b=rj0/67qhQdd8qT++18xIMxK6M6lOaCmlb9TqTrX2qiemBYEhj7aF4t3T
   5FJH3NabLMOop2Zc1hJMcGIdUjP0qjM0jQp9If0qqYYajBTcu1ZsxKs+o
   AferY38jzp+w5E2c/OA5Y4TUqdYdpz/WK1Hm02rMPLPNAbqs9pVYyexF+
   vRVEexMXulbZyymLXsN8cQpoE4+LjTti6YYLP7PiNpGkUCdcmThuFqZMU
   nYQ3AxlYmTp/lPPzYf35gR0LZVeaXXtpOBe2S80+bOAZbPDRyY+22CMH7
   VzccImPEkjaBwpFGDBEu2W3WXyUibMGBEkF/7I3RSRBcQT9Ok7kXsXTVa
   Q==;
X-CSE-ConnectionGUID: fbphv9buT1KdNGpRK93grw==
X-CSE-MsgGUID: GaB8KExwQwWHrrkNo3RHIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="235962889"
X-IronPort-AV: E=Sophos;i="6.23,164,1770562800"; 
   d="scan'208";a="235962889"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 10:26:40 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3645442A321
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 01:26:41 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D503C18019AB
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 01:26:40 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9708F1800C3D
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 01:26:38 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] [oe][meta-oe][PATCH] multipath-tools: Add kernel-module as RRECOMMENDS
Date: Tue,  7 Apr 2026 09:26:28 +0800
Message-ID: <20260407012628.20712-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 01:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126070

Service multipathd depends on kernel module dm_multipath,
so add it as RRECOMMENDS.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.12.2.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
index bfb75718f2..0c572d1bd3 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
@@ -110,6 +110,7 @@ PACKAGES =+ "${PN}-libs"
 FILES:${PN}-libs = "${base_libdir}/lib*.so.* \
                     ${base_libdir}/multipath/lib*.so*"
 RDEPENDS:${PN} += "${PN}-libs bash libgcc"
+RRECOMMENDS:${PN} = "kernel-module-dm-multipath"
 
 PROVIDES += "device-mapper-multipath"
 RPROVIDES:${PN} += "device-mapper-multipath"
-- 
2.43.0


