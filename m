Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92634CA0EFC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.15381.1755679202592972223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dnvp2Wz3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679207; x=1787215207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jQkRHq2lI7G3Q33DJ7z+2zq4gPgcUBjwnXjcw5GmleQ=;
  b=Dnvp2Wz3u9sXBU/zuCmJDEAFFFLuJHqvdMcvxbE7B6HjfV+rQBZGRVuV
   VdaFONE/PvhJcbe0e4Z3Mc/dpwxo3pIApccieF8xngWYHfeyM90f73dky
   Dt/WrrX79URKitZL8hQsFP50D6ehSbWtYwOV3hx0p5/1Z9um9GBxOPjR1
   RWUkHcQtHzlF32EpfLAVfAT+ywZKCLYQXr71EKvrnxKMDdfoMaAzbpQmj
   9H1NNq9uC907OF5HjBTM2vBaZGrWCF9ZqaUJ1VKfPhbuH/X9cOLJOtDex
   ND4vRNLXQ7P7uReJYoU1P8WgN6Slbwnsus6n5raro1cL1zxjwkhX9rcSl
   Q==;
X-CSE-ConnectionGUID: JxCa48zORKih9UZMfmh9UQ==
X-CSE-MsgGUID: p1PI5lEdQPu8mnYXEeEV/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="188901720"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="188901720"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id DE32E1C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:06 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 91198C012B0
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 6EA6210003ED
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7BE4D1A007E;
	Wed, 20 Aug 2025 16:40:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/26] python3-cmake: upgrade 4.0.3 -> 4.1.0
Date: Wed, 20 Aug 2025 16:39:41 +0800
Message-ID: <20250820083945.802-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119033

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- break: drop Python 3.7, manylinux2010 & musllinux_1_1
- feat: update to CMake 4.1.0
- feat: update to OpenSSL 3.5.x
- feat: add riscv64 wheels
- feat: use a manylinux_2_35 compatible image for riscv64
- chore: remove cibuildwheel override for musllinux_armv7l

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.0.3.bb => python3-cmake_4.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.0.3.bb => python3-cmake_4.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.0.3.bb b/meta-python/recipes-devtools/python/python3-cmake_4.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.1.0.bb
index 719169e641..9ab56eb03f 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.1.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "215732f09ea8a7088fe1ab46bbd61669437217278d709fd3851bf8211e8c59e3"
+SRC_URI[sha256sum] = "bacdd21aebdf9a42e5631cfb365beb8221783fcd27c4e04f7db8b79c43fb12df"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


