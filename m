Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E4D1125853
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:37 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18765.1773312812000181168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hAX+gnxn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312810; x=1804848810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M14WclTJn3y0tm7Vhqmbj1iJpnHWxtdTNnv+0e7T2lM=;
  b=hAX+gnxndRjqBP7W+oAYOUCNi1J3Bjc/i1UKUc+haDrKYJTBTMSRDSkn
   DiI5YrV+8fzCD6k/ctZoekM98c1w8VNDBX/nRLcmxjykNBAlNT50LlTrR
   RHGv30RpfLhBDUu8oWio9fD4C8zviPxzMvJO9IidkfBlJ5YbULcuczeO0
   mjlr7jrsshMDH+sLvmyAJw4hviZKmRwBk7W/scFmFG/YZlcGUx6hYSHQl
   IfNE5snIVlAC09jBNvI5WuRJaDglHh8hHKvqUKS6Bux7oC4WQosD2tFK3
   YHzcFhR3MwJ4PpByf9mrhdeTSJJjKIc+Ror/jM3dIYAh/tuj3Hyornb8L
   g==;
X-CSE-ConnectionGUID: VFLh63jZT0uykbEGiXeeQA==
X-CSE-MsgGUID: LKn1NutfT6uqVaNAIOo4nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233021522"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233021522"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:29 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 719DBC01B37
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:30 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2712D1809C28
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3C00718005BE;
	Thu, 12 Mar 2026 10:53:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/64] python3-cmake: upgrade 4.2.1 -> 4.2.3
Date: Thu, 12 Mar 2026 18:51:46 +0800
Message-ID: <20260312105220.1856-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125130

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix: drop manylinux1 workaround
- fix: more readable error on missing ccmake
- chore(deps): update clang to 21.1.8.1
- [Bot] Update to OpenSSL 3.5.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.2.1.bb => python3-cmake_4.2.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.2.1.bb => python3-cmake_4.2.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.2.1.bb b/meta-python/recipes-devtools/python/python3-cmake_4.2.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.2.3.bb
index 88f9ff38a0..613652b578 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.2.3.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "a07a790ca65946667c0fb286549e8e0b5a850e2f8170ae60d3418573011ca218"
+SRC_URI[sha256sum] = "7a6bc333453c9f7614c7a6e664950d309a5e1f89fa98512d537d4fde27eb8fae"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


