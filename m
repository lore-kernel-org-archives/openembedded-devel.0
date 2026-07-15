Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D025DC44511
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3438.1784111994956034428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pBuDsuFn;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112000; x=1815648000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ItnQshnMHpDNfMxBxWWqYAaM4nSq2bXCXvTm2+1+Ri4=;
  b=pBuDsuFnROUkyJQS5PqVK0ajjw67yAU6Y2mqU77Gw3yIzhGcnO6EPVCx
   74AyBydyU9AqMR22oXIcnlLolIz2K75/ZNxxborxm2FYW+Xu6jhcwZbTd
   60MGvQBfeCRXBjZDFCCvZ2gwQAqeZYiJiFnDVxIDUkhTLNo+k/7+wD7Kc
   AZz4CRwa5hMjoFzg9jr2F1cGzzH1INBmmv0t1jGBCnavxOGi2zVEmJ2XR
   xQOF5TNBVOfMy5MIsCRKVY1PARUB5mNlxuSW48cQVhjBIuFk3wsx3K1g3
   8i2eyXo0VBkKSrLGVYSsebn/HWqVSjG+d4xlz6fiAZsNIBXICbTuDGpvw
   Q==;
X-CSE-ConnectionGUID: C86JauD4ROeh0RFads97WQ==
X-CSE-MsgGUID: BMMY8DuKTSGtJfDzl54HFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218896"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218896"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:59 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 85D1C1C00094
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:59 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 32085C00FC4
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3C3D0180113F;
	Wed, 15 Jul 2026 10:39:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/44] python3-cmake: upgrade 4.3.4 -> 4.4.0
Date: Wed, 15 Jul 2026 18:38:45 +0800
Message-ID: <20260715103914.2120-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128188

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- ci: secure GitHub Actions workflows
- chore(ci): use manylinux clang install script
- [Bot] Update to CMake 4.4.0
- docs: polish docs and fix stale references

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.3.4.bb => python3-cmake_4.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.3.4.bb => python3-cmake_4.4.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.3.4.bb b/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.3.4.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
index 60c3c82cd9..bd7722ccd5 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "c97e84a62cf71aaa4f012da5aea411b432b1361d78e6421f987679869aa0fa7a"
+SRC_URI[sha256sum] = "933eb5977ecc5226e47d702d1c412b69f77ca00f59a4660c80b436cf7d5472de"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


