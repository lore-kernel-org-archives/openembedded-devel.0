Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6EACA1018
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8055.1756890211904423080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YMxN1HZq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890211; x=1788426211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5v4l2MH2rtgyPM8udDc5TVGChrQ3mdj+2EAhClULWC8=;
  b=YMxN1HZqqIwlgKX3QcQlBztFegtk3OpDflfIOfw8xOtBfzYqyBuPWrS+
   Vrn1/E+dTRyTKoHN1eH28I25NYcvmw/MbeA7VM2mt6okyt6CcYQyrLgqE
   vCvpLPq2BcGPBtpU2NHy38u22QGIFm51yRaqdXmw843nJCe94O8wfy+Uk
   qjUD6UtIUH9soMyo/jpt8+dVO6mN/OB8zIth2OWOn2P32cAEMWxTBTWKm
   YcxbshWQ/8lDEXYWtDHeBEk5h4noO/L6BmGbXeG+NZNnoAi9qTmFHQAYp
   6AfqEfx3fqv4ysecwZebiCU5EFvK+A4ggwccPZrHqIB/33KKKXJuT3htH
   g==;
X-CSE-ConnectionGUID: Az4PdKxcQnqCNpQ/gZp3jQ==
X-CSE-MsgGUID: oZ7NE+kvSKqd5icZnS1sfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="212051738"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="212051738"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:29 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 22CFE82070B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CCBDCC5B468
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id B144D2005D22
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 455301A008B;
	Wed,  3 Sep 2025 17:03:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/56] hwloc: upgrade 2.12.1 -> 2.12.2
Date: Wed,  3 Sep 2025 17:02:31 +0800
Message-ID: <20250903090317.2002-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119210

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/hwloc/{hwloc_2.12.1.bb => hwloc_2.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hwloc/{hwloc_2.12.1.bb => hwloc_2.12.2.bb} (93%)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.12.1.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.12.2.bb
similarity index 93%
rename from meta-oe/recipes-extended/hwloc/hwloc_2.12.1.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_2.12.2.bb
index f56142dffd..b7478c9a9a 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.12.1.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.12.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
 SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.12/downloads/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "38a90328bb86259f9bb2fe1dc57fd841e111d1e6358012bef23dfd95d21dc66b"
+SRC_URI[sha256sum] = "563e61d70febb514138af0fac36b97621e01a4aacbca07b86e7bd95b85055ba0"
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.12/"
 
 inherit autotools bash-completion pkgconfig
-- 
2.43.0


