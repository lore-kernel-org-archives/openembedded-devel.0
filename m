Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FED9E75444
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:40 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117314.1766567678208975681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LQFjBnO/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567677; x=1798103677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S2gLiqG9Y/0JiVFX2NhrWbkin+7chmd0CmxdokrWe/0=;
  b=LQFjBnO/UKG7F4+Drg6IaoCo2vTrCdUp3sK0cCkDFPjBh4tdQYGWR9ah
   kD7smUDUx+H724RJKH03e5+xPRh/sqXgDE4sK1uhew5+w7OAAVsL/h4Jm
   l7i/FA9OxiI9TuyjjT8vA1t8gHbbMf+BZp0CB1Eyif3Br6Md3UJhCDTq1
   vpaP6kPjtgY7/Vboc67DQVBlQ32FwAaW+CoXVc5oxHdUaKuMARmfRHf9j
   gLmrmKHf071Xg+7YvDTZpkWxgNCnCBMJSmn6xV/4JjUH4xARs37A0mZ2T
   HxtT+xamBLrijWWGPtVU32e5EuJuBfTyf6fOXbnBXaKWPleUrYVbSfjO4
   Q==;
X-CSE-ConnectionGUID: 8ga0MbSfR4+I/G1qXmczjQ==
X-CSE-MsgGUID: +RD+6sODRe6rtSPzlNlS0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="202755525"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="202755525"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:35 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 92D9B1C1C72D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:36 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4277B1400101
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 7E9CD2000763;
	Wed, 24 Dec 2025 09:14:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/28] python3-python-multipart: upgrade 0.0.20 -> 0.0.21
Date: Wed, 24 Dec 2025 17:12:58 +0800
Message-ID: <20251224091304.974-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122872

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Add support for Python 3.14 and drop EOL 3.8 and 3.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.20.bb => python3-python-multipart_0.0.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.20.bb => python3-python-multipart_0.0.21.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
index 71f9674ec8..29054f47a7 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
 
-SRC_URI[sha256sum] = "8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13"
+SRC_URI[sha256sum] = "7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


