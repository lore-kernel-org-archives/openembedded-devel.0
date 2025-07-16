Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD843C83F37
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.15850.1752648078485723836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pttSfrGp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648081; x=1784184081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vCecj2gV5ICaiQbg72cKWmSgWCK690YOmMWLrRmAhww=;
  b=pttSfrGpq17Tb+TUoWBwACukjq8guKSPEJjnxKO7IKrL0ngls3QDZRj1
   jqGbD1NUBOfTeDxdYFo4lG6SJFwf+gz859Ueb2znBNd5cY0Tv3HE5Pgju
   1AK5iEwrRt3+lUWF2t2CVaneYuTlA3zKGYtkyN9ggU7UJZ+0IL6CuYy4S
   0u+s1xo+AzFmBMvkpG0jhMM+hufpigm8fn2eV3eIm9j6xeyaOGeLNTWoW
   Ji9Tdjcms2g46EaOzZ/QxFQUexiWc22wJxmY+QKytp8TiBL7UQxoqyrQT
   pXXj6OynGTaOEeaCd5mlWfOszgXnqhRGPaxfjncGE/6RFK0H0uyDzzLKT
   w==;
X-CSE-ConnectionGUID: g6MGc+YhQzmy2Zcu48iHcQ==
X-CSE-MsgGUID: Zom51Z+wQtC+QOpxwKOeNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="205763108"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="205763108"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0DDBF1C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 611DF1C001AB
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB63F1A0074;
	Wed, 16 Jul 2025 14:41:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/14] python3-expandvars: upgrade 1.0.0 -> 1.1.1
Date: Wed, 16 Jul 2025 14:40:58 +0800
Message-ID: <20250716064102.1813-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118579

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix: add ability to disable escape and force ${var} usage.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-expandvars_1.0.0.bb => python3-expandvars_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-expandvars_1.0.0.bb => python3-expandvars_1.1.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-expandvars_1.0.0.bb b/meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-expandvars_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
index 6741bc3826..d612a9b35b 100644
--- a/meta-python/recipes-devtools/python/python3-expandvars_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sayanarijit/expandvars"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b2e744064bd184728ac09dbfb52aaf4"
 
-SRC_URI[sha256sum] = "f04070b8260264185f81142cd85e5df9ceef7229e836c5844302c4ccfa00c30d"
+SRC_URI[sha256sum] = "98add8268b760dfee457bde1c17bf745795fdebc22b7ddab75fd3278653f1e05"
 
 inherit pypi python_hatchling python_setuptools_build_meta
 
-- 
2.43.0


