Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD182C4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44609.1784715826327646981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BTsW33A2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715826; x=1816251826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6y3Xuug6JSdxw3WYrAGPzG6EjudISIFhZUxXa420DZU=;
  b=BTsW33A2C8AhPDxR3P7Tw8PzuUAdjKovoztw8rmLRpGnMX5J6saJh4aH
   02YwA69iTHiy8mecOXajKL/LTPAxHyafxh7C/yoFD5L3dc5TW8iBuRRJ4
   iabMVDrrgUxUMcWaUHEF9bfR2q84p6GJci9K5n2Cz/RSW1ct+O8e3MVcA
   fnwG8YTzY4emxB6Ss6yRgD6k62Ofmp1rMFORFweqPt64xYM3a8OBvVwPz
   SHEuKMBUgh6GEyEk4o7/VKctYetwgwYGSsSJNt3aXu3pEmG8sXtBM2xJq
   Orw4ZUswPJG6xCMA+qLX7aDs5QrcPl1wnrb1OIuuRVn6/kcaFzwU53g5U
   Q==;
X-CSE-ConnectionGUID: 8Rcb5WQYQQKEFJ+HT63hKw==
X-CSE-MsgGUID: ATDvpNXkSbmt1LDAs118aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="235655278"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="235655278"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B50BD42A306
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 67FCAC0163C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 6A213405E39;
	Wed, 22 Jul 2026 10:23:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/37] nbdkit: upgrade 1.47.9 -> 1.48.0
Date: Wed, 22 Jul 2026 18:22:53 +0800
Message-ID: <20260722102320.1019-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128380

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.47.9.bb => nbdkit_1.48.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.47.9.bb => nbdkit_1.48.0.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.9.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.48.0.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.47.9.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.48.0.bb
index 5c6c0a2e64..95e5237853 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.9.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.48.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "714956cc9901c752598a214ae72fc69a897cd3b9"
+SRCREV = "111be961359500291bd3792317b042d72bef5efd"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


