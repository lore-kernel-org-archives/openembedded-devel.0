Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0DFCCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5573.1759990105519662960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l/r2+UxY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990111; x=1791526111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V4NqTNThNNUbXMmZwX7iNReWQvx5nUyE17jRfmjD72o=;
  b=l/r2+UxYyNfgbJxjKsIC6UQJUmSppRNkAWlbZAydUWEqMUdWONI+oq3r
   55p3UVjYiHoba8O/c7HPz2A4zURAw0OGxAxb22OhNfbXjaluux5AUtleW
   WPM6ZV13V1ZFdLUj2+v7Hrs1EDSUthbWXwymHeQ210GKF19mrqlykWpdt
   1+z0kQoaqOYqf63ocWe/QXqKerMUexQp9kiPXyKDSaQomnGeHDqPieWrA
   ArE/f3GI4aNJJGE27PopsdZ+cxsWHR3tuqfmKE651Q86lSjijhXc2ly7C
   wcvZljqKDZ4Ho1sDMR+8CgeGtXq695BLS0t6/w8cxIT5K4PbZ3bVcnceg
   g==;
X-CSE-ConnectionGUID: 5PlhlKSGQxmqWOqHOIV7JA==
X-CSE-MsgGUID: 8F0f6mLARayMCgBnXlJINQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="214800311"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="214800311"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:31 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 54BA842A33B
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:30 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 127FD1000461
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A28D81003100;
	Thu,  9 Oct 2025 06:08:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/22] python3-apispec: upgrade 6.8.3 -> 6.8.4
Date: Thu,  9 Oct 2025 14:07:55 +0800
Message-ID: <20251009060809.445-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120405

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.8.3.bb => python3-apispec_6.8.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.8.3.bb => python3-apispec_6.8.4.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.8.3.bb b/meta-python/recipes-devtools/python/python3-apispec_6.8.4.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-apispec_6.8.3.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.8.4.bb
index c34aacf124..822af0fbaa 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.8.4.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "0823235aa171187fc0fb1dfd28211ebcf5fe7768b2a7e1929d06671e162439ae"
+SRC_URI[sha256sum] = "fd0ed14af71a2949d9aeb96b72ce1517cb4a48a5c55667cd0483b7ed33156a2a"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.43.0


