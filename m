Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBBBCAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8318.1758704442458090056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HEJEXOgZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704445; x=1790240445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b+4UA9bvAhC2/ezCWR1EggdekEKGqRo5YcVP4tvbY5o=;
  b=HEJEXOgZFXglwuiiyO7/oYxeSph4RFNCcpowyyrYlYmgt2Ak9UygxRXA
   T9SNC4cGgmC4Oe6Nt0x3WO/YzGCwOOh1a5uWnVKFvAlCa31X45C00ffcP
   pH9ZkCI32XputZ+zogmmyp9Jhv1jEcBvmJ98LMgJG7NzdDHKJJkEAiwyd
   s8U/NBKLMEp8Y/zz0C/AZxiK9HokC+eMDYkYO3AnK6EYfr1/qjoOlZS3N
   Goo6nK57M6VnwkDDkyFAfILS0GRoJZxjfPcQ9oxMZ/IQcHETiGtrW/DUy
   WW+pDGKXPs/5rfyoItXdFXo4Ax3e+XHk90Z7QfsAEx+WRPgnwXFjVQ6vt
   Q==;
X-CSE-ConnectionGUID: qu5xKQTKRQ+OOcwTvXBAEw==
X-CSE-MsgGUID: BuoFSwzfQd+Aj/Of5hERzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="217279680"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="217279680"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:45 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9472B1420
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:44 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4E234C01622
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id B5F2E1802196;
	Wed, 24 Sep 2025 09:00:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AAB761A0087;
	Wed, 24 Sep 2025 17:00:39 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/29] python3-grpcio-reflection: upgrade 1.74.0 -> 1.75.0
Date: Wed, 24 Sep 2025 17:00:21 +0800
Message-ID: <20250924090029.1786-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119782

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.74.0.bb => python3-grpcio-reflection_1.75.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.74.0.bb => python3-grpcio-reflection_1.75.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.74.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.74.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.0.bb
index 914abbf589..107f350fd0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.74.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "c7327d2520dcdac209872ebf57774c3239646dad882e4abb4ad7bebccaca2c83"
+SRC_URI[sha256sum] = "60bb9865f5411ad589420eadcdd7e0c338c0aabedf5d4cd07363d5bf7da9c972"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


