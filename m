Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88104CA0FEC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4724.1755766814711947306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rEEMpkfW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766814; x=1787302814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WToMChneeoIlC5P30sBjlTFFZrUOX87FBdd3cVhhRqo=;
  b=rEEMpkfWnmQGEJtWHKySK/zpi5MEpK3a3wYxUgkzSNObbXVKPcrsMv1I
   TBZvBzs6AqvoJQIuk9794a5yHnxnCGv1NgVMd7vlZE2Ra1B8Q+3MGKfo9
   q5N8duY0Tj4BZXuiqhQMd6JyUx71xy10wgGgFSV+rANdPcL+GtARWhdM3
   6/ege+0lZqnEFYa3fRwz/k9Y73xZSnaNr1MX9NnXSNLeDrFcD9LnsUPnJ
   zY/8ppHxEglui69FJAVCZQqAS6YZbQqxPs/UQaeaAd3BpZvtewKQgSRHc
   pL2l/PbHr/kz1io/Gu81QNOqvFbv6Dx0JKRTpuBd4IzceP0uEuOe3xRnH
   g==;
X-CSE-ConnectionGUID: to/aQfgcTES6ZOG38uhQOA==
X-CSE-MsgGUID: BI+vcMl2RC636M2H7Gu+7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210706587"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210706587"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:13 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 563E88203CB
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:13 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 102B5140B058
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:13 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id ABC22826FE9
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE94E1A008B;
	Thu, 21 Aug 2025 17:00:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/21] python3-pycares: upgrade 4.9.0 -> 4.10.0
Date: Thu, 21 Aug 2025 16:59:42 +0800
Message-ID: <20250821085954.2056-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119059

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Remove unused import
- Fixup chunked TXT record test
- Remove overzealous checks
- Fix OpenBSD build
- Make result.type Final
- Idna resource reduction using a length check
- Add read & write process_fd functions
- build(deps): bump pypa/cibuildwheel from 2.23.3 to 3.0.0
- Remove context manager support
- Fixup test CI
- Refactor channel destruction logic

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.9.0.bb => python3-pycares_4.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.9.0.bb => python3-pycares_4.10.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.9.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.10.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.10.0.bb
index a8b9ba96ea..1b0b003dfc 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.10.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "8ee484ddb23dbec4d88d14ed5b6d592c1960d2e93c385d5e52b6fad564d82395"
+SRC_URI[sha256sum] = "9df70dce6e05afa5d477f48959170e569485e20dad1a089c4cf3b2d7ffbd8bf9"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.43.0


