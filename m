Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B94C4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:25:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44803.1784715894694883556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qihMfowH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715895; x=1816251895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l7ZnWAE8PkJMt3tcTeYllpiiDWqpWWcKsCEZ0EC20Zg=;
  b=qihMfowHXc50WfHbvUQqUHuPJo2bRf2Y3RVcpVB+QNNSkT6OSHEBT0BL
   F40XTTCPJxhUE7ArGR7ArnsHLbBRwnL/KmVGf3sMvvxDwIgBBQqycEt+m
   pCVev08cSNrTabCh5zof09sIzqSTOPUDT9crdeSVt02tzT8zqOD3jP9ol
   zQbtMEgXoFt4liaelY/Wen2iC8BDOT0g6xma3jqAGzhSgpcxaCsylohhO
   Ef9xBlAimSlgfxM5KPeDySyW3VCxP7j94eyW/m8lZUtdz5gP8kUXz5SJp
   zprryZrpLzVnNgfAQGYgjrVpPVV5VlmLYhXukU8W1ICrX9MmvtebJeitA
   g==;
X-CSE-ConnectionGUID: kSAqu0AMQ2OQrwxqi4GXjg==
X-CSE-MsgGUID: SyWyJrV5QtS/iJnM01wCrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="251743134"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="251743134"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:53 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1D3B0C0182E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:53 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C91E11400126
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DB5F94046B3;
	Wed, 22 Jul 2026 10:24:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 36/37] xfsprogs: upgrade 7.0.1 -> 7.1.1
Date: Wed, 22 Jul 2026 18:23:19 +0800
Message-ID: <20260722102320.1019-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128406

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsprogs/{xfsprogs_7.0.1.bb => xfsprogs_7.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_7.0.1.bb => xfsprogs_7.1.1.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.1.1.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.1.1.bb
index 5116072701..38d049ea68 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.1.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0003-doc-man-support-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "4a8ca83a7acb8cd92c997d63b69ae64f170056b366a2924a753e47d4bb4b8b06"
+SRC_URI[sha256sum] = "063edc31ba8e85c95c7faf9be465a04898bba7c6e622fdd9b146eed4ca5415e8"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.43.0


