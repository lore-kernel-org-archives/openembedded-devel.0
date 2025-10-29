Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC50CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.24188.1761696923998102196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q7A0rq2y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696925; x=1793232925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yhvTf8/iBA9cxlafdNuBEdKn8lWVcy9AZkg/jdthhMs=;
  b=q7A0rq2ymkPGawBzjENzNHQmCHvLJsS2l2ZWX6QnhutddzBxRZVB4swq
   xi27LQosBj60X283k6EoY1/qumCzSb7L+8MiY+bK3eYuJwLMxPjkiFfph
   GiYLAiumjZ0Kk4+RDPuOGxaa1mR82/NYaC5Ro4zpwmQJ8s3SjLHflzuR4
   r8kKXPtJTvrMQypnU3XCmRxLaHTtXmLuF4HMgGm6n+5oO5ao31hC+Greq
   XwdbS2Cem/XpPGhVS54S74I4P3I0awu68qSxpZ6dVND7L2kai8LtvJy7u
   woDsJc5pPJ5auZ8RCW16UiOiHpd4CJrHg7nrz60NNuwa0ZRn3aBOWW51w
   Q==;
X-CSE-ConnectionGUID: W3LpZ6qpTWqVvvq/XO2rGg==
X-CSE-MsgGUID: PCc294QvTEKBjONM/GZttQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217368340"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217368340"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:24 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 21CF6407579
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:24 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D2EB9C000A8
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3A51382C0FE;
	Wed, 29 Oct 2025 00:15:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 05/32] libcompress-raw-bzip2-perl: upgrade 2.213 -> 2.214
Date: Wed, 29 Oct 2025 08:14:38 +0800
Message-ID: <20251029001505.528-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121111

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...zip2-perl_2.213.bb => libcompress-raw-bzip2-perl_2.214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.213.bb => libcompress-raw-bzip2-perl_2.214.bb} (79%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.214.bb
similarity index 79%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.214.bb
index 409216fe69..b0feb40b71 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.214.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Bzip2"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=cd551ef796cc7fa34351ced771a3a7f9"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=d9968e06481ca195215d0f29ba557f98"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "8d75d3d366c9101ca18061b00d438d3da39478c06159147dea3c666770577c7b"
+SRC_URI[sha256sum] = "b0810a4d6e1a402892840564e6589e6ecd39cb87561bc556f171b78e900079cb"
 
 DEPENDS += "bzip2"
 
-- 
2.43.0


