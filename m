Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1D1C44511
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9501.1768995026870879916
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FHDDub7w;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995028; x=1800531028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PYXnH+JgJAhI5+6bYj1M9+5zeKPdt4mpAst8Z0gOTrY=;
  b=FHDDub7wpbvRQeUGgrPw1LaDeCr8dt16VWMvd4FDKkmRQ15gxojTKSSo
   FyyFNlIOieF5VBNzeWbisVy3mjv2Jz5Gcl+fnDUeUEZXmJj/vfM6IjIKt
   6dD/RKe3GUcGG0LwjloVQ0Pwl7BkqbWI1Gy7i6x06TbBvs2Ppk1nFY1ig
   6nv+dapPy+LuR2RVTeYukUCVsTAMqUi7CRbq5hqARgG6BWny0NJNaAK0r
   ctbrXj1jJY0bCYphRZSlZodNItTVsKlsYDXOa7Gk5l2oOQZFQADanGgq+
   t7p6s1Lud+WMpuvrI0PWz4hjS9MH4Z0cdjvzbg+eXPmysOSIhKQxOnanw
   Q==;
X-CSE-ConnectionGUID: jy4WHLYvRqqYdhhH8vVy7Q==
X-CSE-MsgGUID: RCV231CdQkO+4W+9QiCAAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="226523008"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="226523008"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:30:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 43ECB1889
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:25 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F1843C026C4
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 65FEC1404870;
	Wed, 21 Jan 2026 11:30:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/30] python3-soupsieve: upgrade 2.8.1 -> 2.8.2
Date: Wed, 21 Jan 2026 19:29:06 +0800
Message-ID: <20260121112921.857-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123706

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updted to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-soupsieve_2.8.1.bb => python3-soupsieve_2.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.1.bb => python3-soupsieve_2.8.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb
index d3fb375eba..63b5d3b2e7 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb
@@ -2,9 +2,9 @@ SUMMARY = "CSS selector library for python-beautifulsoup4"
 HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a23cdb0cf58a8b6d3d25202783bd6553"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "4cf733bc50fa805f5df4b8ef4740fc0e0fa6218cf3006269afd3f9d6d80fd350"
+SRC_URI[sha256sum] = "78a66b0fdee2ab40b7199dc3e747ee6c6e231899feeaae0b9b98a353afd48fd8"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


