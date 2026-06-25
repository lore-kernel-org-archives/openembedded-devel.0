Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4453CDE006
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7226.1782378103826109171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vu1stUdc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378104; x=1813914104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xp9K7OS8C5ofCg8hdAF119yk74v92oo5c0N4mO+qeik=;
  b=Vu1stUdcmMOLCvBzFSNw4UmAAyjiHxKeboSsNNZ8Nlr0gSBIA385O8vF
   3r0Aw/V7NiT+3hwi+iuhZz4wCQoOoOSyRv4Fw5VUDScntkhMIpM3cV4RF
   IXPACGiWmJiTOm7P9zF/qHPzgDUqrGL0wdyXeQJzTxA5STv7ksiFhd/9z
   OanwRdWgddfRrRDelQ/GNFKMEnwqhq5FnWI3E06hdQ2nDl4Q2uMd4zRDR
   qImT6nbRE/K8idXIQDC4rBvQ3g8KXB+TJwjjtPsyFaQIdBE60KMrxsQrI
   LGXvxK+wK16URZDvUcXCecqobOHbKJwWh4R7NeFh1rgSYs+MlFduzCly9
   A==;
X-CSE-ConnectionGUID: 3OTCezXLQx6TShzACT+sXg==
X-CSE-MsgGUID: 5pSnROZ2TAy/5e3pJJIA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743102"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743102"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:42 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3E2EE100281A
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:42 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EC5D78267AB
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F1385101732D;
	Thu, 25 Jun 2026 09:01:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 07/47] libio-compress-perl: upgrade 2.220 -> 2.221
Date: Thu, 25 Jun 2026 17:00:47 +0800
Message-ID: <20260625090127.1563-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127739

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibio-compress-perl_2.220.bb => libio-compress-perl_2.221.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.220.bb => libio-compress-perl_2.221.bb} (93%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.220.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.221.bb
similarity index 93%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.220.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.221.bb
index 05c8dd2e82..3a35cf53c7 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.220.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.221.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b617
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "9d96ea291f2c54ef367c7396b857d93ba1ac1c4b2f1bce13ed8a3e5f3eebb627"
+SRC_URI[sha256sum] = "af42c9c9104adf7d772d255c0d9a404a3462ea45e7bc42d06da0a0b51de3d0ae"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
-- 
2.43.0


