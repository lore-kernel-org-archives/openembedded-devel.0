Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92CDCD3427
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17228.1777546217967368645
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H/J7xXku;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546218; x=1809082218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2AnO4ymxM6diuJcNPZCAnryHRlJgG0fXBuOVmqKY5KA=;
  b=H/J7xXkug1oPf25tcK6wfFWlx0C1metfBhC+Fbi6+Qa385BRm5hmRGIQ
   X62eEPJzssofjYLw5whTFyYZqTUs5DZ8BUuO+1zA5brQQ3QFCQOJO/tD9
   OW1M3pclfEZzA33O/03XVTlJtYWYe0Us+WwYG8ODp77FYCVmGdG0dWSTV
   SG3K45z5sjQGP/XJLkRgSsNN949+zmohfHJJuFi2XpLpFT2PlLDbiw531
   YMuQa72hzIAcctqZh/bvPEq01MtPcqqzHABIAtuD+vH2wqGdx51+h5pU1
   uc/lJz1pJ3Yh5tb6NRY7Yc+rvVhL9xv+o8FoBScbxuS+S+zN/mJ9GwaGn
   g==;
X-CSE-ConnectionGUID: kRmON6ygSWehkNdxxKBufA==
X-CSE-MsgGUID: bfdwnC9qRq2WRXQKXMxynQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238077209"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238077209"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:16 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7E4DD1C1C709
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:16 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 39B0418002C2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CCE2B180113F;
	Thu, 30 Apr 2026 10:50:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/64] python3-cmake: upgrade 4.3.1 -> 4.3.2
Date: Thu, 30 Apr 2026 18:48:49 +0800
Message-ID: <20260430104924.1106-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126700

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.3.1.bb => python3-cmake_4.3.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.3.1.bb => python3-cmake_4.3.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.3.1.bb b/meta-python/recipes-devtools/python/python3-cmake_4.3.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.3.2.bb
index 5787b73d98..cfb1d3a2a8 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.3.2.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "6fe523413cdd2568a19a6ec297b8f869a95a3f8edaf0dd73731b81412216e00e"
+SRC_URI[sha256sum] = "5f47f5f00910c474662d09a0516413c6e9750bde73cdc52dea3988102a274e06"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


