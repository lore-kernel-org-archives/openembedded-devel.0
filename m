Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8A6CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13212.1764062000741873794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R4YrcuEy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062001; x=1795598001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZADhA4ySpdwSlrD8dGuZLpoYa5BXisHfJ+VN72wav2A=;
  b=R4YrcuEyk2sOS71tFpC+F99r7O5XLUlcvEvZ7yCASRRyuqbsgJwbVRob
   hhmVeO6JIpqEWvNVNtpCB6foju3yk0BaiJFNyrmlrPwYhC6aO8e3k1Phg
   3ZoEZzaPE6YiZwZ+Tot+JVSQw9auFu7abtJHtdP7QvMOIqaXS1H0nASzL
   uE+RWClRKT7dwDUT442sVDLKIym4rujE1DRYzchNKLqTurFm3ffnp9mqq
   MicqhGqC90iB9QSKQ3wi8O+iSdix62AKOmXBe6kzKqjPByKuQXrZ50M4g
   Zp/d2+3L+Wgx0aGsA+8EXvTp7eC1WdSLhcoyDet5wpS2/kremKemBXow0
   w==;
X-CSE-ConnectionGUID: FIt+6n//Tcae5srk4xDCiQ==
X-CSE-MsgGUID: KcS2k3YsQYGbs0lj4m/Nig==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="220290174"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="220290174"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:20 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3C3101000344
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:19 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E66EAC020B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8550814001E4;
	Tue, 25 Nov 2025 09:13:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/26] python3-cmake: upgrade 4.1.2 -> 4.2.0
Date: Tue, 25 Nov 2025 17:11:45 +0800
Message-ID: <20251125091156.1376-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- ci: build with clang instead of gcc
- docs: improve links back to GitHub
- chore: add changelog exclusion for bots

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.1.2.bb => python3-cmake_4.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.1.2.bb => python3-cmake_4.2.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.1.2.bb b/meta-python/recipes-devtools/python/python3-cmake_4.2.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.2.0.bb
index ec7b8fe491..5782be0023 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.2.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "bee98458447b3a3b937b72849489e6e37ba0076d46df2fbb3af26739e1a3ed10"
+SRC_URI[sha256sum] = "7744c20e4a23e68dea276d819767d2bdbb45442cc342560b03ff693b755cd181"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


