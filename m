Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8A1D3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4199.1765274193324067662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uES3IH3m;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274193; x=1796810193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kDe/htER4AC+w/PE3xyqaWAf69B6/0U01fXwfq70S60=;
  b=uES3IH3my/Uod4HtzunKGHe/k/0g/Za6E1jVpafwDg1VmGfnXlZbUnV1
   rjfWYpWWkKoJXUeyjoUfWA8MPEuX6gz/OWzcpUGVmcw0y3c1ZYfmlBRDp
   uDH/Egq2qkEoIEIMshqRPK/qU7mHMfdTpcQ9ZmPaKi702tdN7NlebIKST
   xF0U/g1xagbVBbooGRYSW9ajMdR1Hyw1DKm9PQ8yXHnL04ic8eWPU3p82
   CanJvzwUHN+s372x5zg74LTMIMVvHv8GHdWTPCmzH65Pwz62VMsgvtsaL
   gF1CBmB5Fbg68h7O3otfhS1WWDVG10+zR02y7fNA7HJYlTW88D/y2n68y
   A==;
X-CSE-ConnectionGUID: eiNB7J+3RMaBnxGS5qRa5Q==
X-CSE-MsgGUID: /aF4sZpZSOqsO50RguH/ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="222613669"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="222613669"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:31 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E5F291C00192
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:31 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8E0E01C0CAC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2D98220002B7;
	Tue,  9 Dec 2025 09:56:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/38] nbdkit: upgrade 1.45.14 -> 1.45.15
Date: Tue,  9 Dec 2025 17:55:26 +0800
Message-ID: <20251209095552.690-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122416

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.45.14.bb => nbdkit_1.45.15.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.45.14.bb => nbdkit_1.45.15.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.14.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.15.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.45.14.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.45.15.bb
index c64857387f..8d820ee636 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.14.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.15.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "0492849383c2093dae738f171158b45a6d1d62fc"
+SRCREV = "d50245af5b76f71c0659d981aeefc5fdc1de621d"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


