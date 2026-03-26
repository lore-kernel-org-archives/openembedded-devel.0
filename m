Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EAC10A3D6D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45657.1774526263215662373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ULthfOWN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526265; x=1806062265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mqg2rduYhkbpdivYq6L5qigXbo4IKO4gBNVpws+qAAk=;
  b=ULthfOWN5UIMNpDdlRlsbHv782N5GIZKnztiEW5Xts+9DKKKmV0w8dU2
   ZTmkgc4m9qaFQWHa5NM0W5DZssQ1yYKGKdMWsbJeUH4ejfjrSkZFPtOy3
   TcW5W5iYC+0EfVzKohpULQTtePvSkBNOCGhSLEiHEURD54AeW+sKhYQsb
   QpRTYMh7n4hn3fM4auoMKeHOdGrocyvj1Q5wKPX/4ELQvCo50EDOXSxod
   4UjHEGscCCu8cTWlw365I+TJ7k8Dq43EKndTaLHQlQFAFGdCfJJOxqe+J
   d01owwgyUKPlGwFPQITIOxP/WK5bKC5/r/YOXdIR9QBU2pEnSiHhMVH6P
   A==;
X-CSE-ConnectionGUID: FHAQ/LA0R+mn2qes0pVvmg==
X-CSE-MsgGUID: STOAdBFgTbi3pIieTqHphQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647301"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647301"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:44 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CF28B1002815
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 89099C01815
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 38218180714D;
	Thu, 26 Mar 2026 11:57:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/63] python3-kiwisolver: upgrade 1.4.9 -> 1.5.0
Date: Thu, 26 Mar 2026 19:56:10 +0800
Message-ID: <20260326115634.1199-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125695

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
==========
- add support for CMakeLists
- implement more move constructor in the C++ code
- add C++ tests
- add support for GraalPy
- add RiscV support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-kiwisolver_1.4.9.bb => python3-kiwisolver_1.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.9.bb => python3-kiwisolver_1.5.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.9.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.5.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.9.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.5.0.bb
index f84a427446..6669559fcc 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.5.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A fast implementation of the Cassowary constraint solver"
 HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27a71439e89b80e41dc526a4b8bbfa2f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a2c756dc2da8fbde2a254cae9a9320e"
 
-SRC_URI[sha256sum] = "c3b22c26c6fd6811b0ae8363b95ca8ce4ea3c202d3d0975b2914310ceb1bcc4d"
+SRC_URI[sha256sum] = "d4193f3d9dc3f6f79aaed0e5637f45d98850ebf01f7ca20e69457f3e8946b66a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


