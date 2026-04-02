Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2F81112250
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:21 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7066.1775096049332419609
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zrg3Tv3p;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096049; x=1806632049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pCvnDc/7/VwQCXeU/lrCYBkJQr7w5QKm9Tu8Foeoyr8=;
  b=Zrg3Tv3pNJtlR5cbtpdu5qM6X1e7D6PK5BiFIHKe6rwMb2q4bIZdHKJu
   pcbGfg+uR9db9GEdjHV/NRsXHG/pWXRADytEMpCupcPTj2K5C4Kehp8kW
   kJZ9s4LGpWtMu22dEg8biWGsaYA5G1+xbb2S/Tnwsxe27suD327LwdOaU
   nVQtvQw2WFqPqqFWxvGKTdVzyS9RrCo2mq4YTZfMWm/lhRXDNcDhTa8zt
   wZ6EEiwn1u0plTdB+rMuvFtiSkEpro35baBx8592kNoaHvHMOruSRENL4
   qhb74OUJ6GO77CEWNTkusHhkzTqzkEzDV7QBCsh5oFIJDBT7JuUA+9+IA
   g==;
X-CSE-ConnectionGUID: ulIufu2WTY+ema1qt/8ySA==
X-CSE-MsgGUID: QgORKBO0TLiKw4LiBIQlcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="234940460"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="234940460"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:07 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A87E0407540
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5447F1C4B539
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CFDFD1003740;
	Thu,  2 Apr 2026 02:14:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/39] b4: upgrade 0.15.0 -> 0.15.1
Date: Thu,  2 Apr 2026 10:13:17 +0800
Message-ID: <20260402021355.1324-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125917

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/b4/{b4_0.15.0.bb => b4_0.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/b4/{b4_0.15.0.bb => b4_0.15.1.bb} (79%)

diff --git a/meta-oe/recipes-devtools/b4/b4_0.15.0.bb b/meta-oe/recipes-devtools/b4/b4_0.15.1.bb
similarity index 79%
rename from meta-oe/recipes-devtools/b4/b4_0.15.0.bb
rename to meta-oe/recipes-devtools/b4/b4_0.15.1.bb
index 4da95e12eb..beb8dcbd27 100644
--- a/meta-oe/recipes-devtools/b4/b4_0.15.0.bb
+++ b/meta-oe/recipes-devtools/b4/b4_0.15.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit pypi python_pep517 python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4cfd99a27af9cabe319fe21ba20af695f68c65904c63731c4fc5a30ea38da7c8"
+SRC_URI[sha256sum] = "e48c44bb579fadabb1fc3f15bf1874afd721bc1a63fba10c96f568bc1f47ccb3"
 
 RDEPENDS:${PN} += " \
     python3-mailbox \
-- 
2.43.0


