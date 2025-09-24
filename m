Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E81CAC5BC
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8324.1758704447505519706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tq+NHeO9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704448; x=1790240448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=au282F10EkmvGdUdJaNVUIZJBaveHBtfrPePXUftdks=;
  b=tq+NHeO9ZnWzU3vShji23mc46h0OWSyyju2s9JlQVbbEWBQlPifHUj6H
   DZJFDW5YtjlxqaMxHJwirQSLHJiMx1CvInQtKMx5q6DajgSKerTrIRSQY
   0kX6x2Hsnp8dEQ3W1ssEqntHlKA+5rPKlMCWhzBuU0q4d8gWC+qOu5Wa2
   gt2VhxkRaGkeCJzw7TTaLBK3FyXiP0hqKDqFoAvxC8Mnp4ELPFG3dhUDx
   X7WNblTx479bKWOTjC+w4m1cH6RRs6wqadSBhGmTsCsztotmk8k1ugf5D
   DXzyFoKsvlkjAT148nEoGRggaxYdR1Q+j44spiH04M9kkp8A7Qmd6ntk/
   w==;
X-CSE-ConnectionGUID: cLIWS5MHSK2RF8y2zBeGgw==
X-CSE-MsgGUID: AWgaa0ybTi2TsuTVVFFq1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="217279699"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="217279699"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:47 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E93BB1002B89
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A599218029C4
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 10EE420010A2;
	Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 103621A0074;
	Wed, 24 Sep 2025 17:00:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/29] python3-regex: upgrade 2025.9.1 -> 2025.9.18
Date: Wed, 24 Sep 2025 17:00:27 +0800
Message-ID: <20250924090029.1786-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119789

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2025.9.1.bb => python3-regex_2025.9.18.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2025.9.1.bb => python3-regex_2025.9.18.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2025.9.1.bb b/meta-python/recipes-devtools/python/python3-regex_2025.9.18.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2025.9.1.bb
rename to meta-python/recipes-devtools/python/python3-regex_2025.9.18.bb
index 5dde7967e3..5ee7ea85bd 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2025.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2025.9.18.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "88ac07b38d20b54d79e704e38aa3bd2c0f8027432164226bdee201a1c0c9c9ff"
+SRC_URI[sha256sum] = "c5ba23274c61c6fef447ba6a39333297d0c247f53059dba0bca415cac511edc4"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


