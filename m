Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EEDC624DD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9395.1788344988469153200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nY3AoYfJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344992; x=1819880992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dmd81580urimSNTEu43qYgoZ/IV5kJ0M6sWSqJajVPE=;
  b=nY3AoYfJxEs4WQqH7k+RUAUXS6lVmo/mxleVSatTTVJaBCzVPF89WKDu
   UQOkvCtinYw9/Ku8Fyl830+hi6dUEB4cdM6G+99642pzyauHka0uMtGRY
   yrlvzhU6aPAf04tqUwxGDCmzs/kSY5R5vtltcjV+CEvb1N65ET1li27MZ
   L2AuXW3grKk2zjAIGvSBnOQmZe1nUSh5jKR5zhxBKCX0YEfL31DYc4h9A
   KnqgkIF4QCS7I5GVBBOr3r9UYP0TRqLyh4aLJaIUs4e7RSwMUoJZhH7mx
   Zl4ZwfBP6Dx0R0u5OuMQE82eI20HtSvsDNhyJlQxw9XiGXL/ItGglVOaZ
   A==;
X-CSE-ConnectionGUID: 4AeWklQOSs+QGwTl/hZNyw==
X-CSE-MsgGUID: UO7a0otRSsKfNCch3A/TQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="239767253"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="239767253"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:51 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D8DFB1C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8D7301800261
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 83BC72000770;
	Wed,  2 Sep 2026 10:29:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/34] python3-ninja: upgrade 1.13.0 -> 1.13.2
Date: Wed,  2 Sep 2026 18:28:47 +0800
Message-ID: <20260902102900.1296-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129680

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ninja_1.13.0.bb => python3-ninja_1.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ninja_1.13.0.bb => python3-ninja_1.13.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb b/meta-python/recipes-devtools/python/python3-ninja_1.13.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
rename to meta-python/recipes-devtools/python/python3-ninja_1.13.2.bb
index 35a192a268..c9e21072b2 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.13.2.bb
@@ -6,7 +6,7 @@ PYPI_PACKAGE = "ninja"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "4a40ce995ded54d9dc24f8ea37ff3bf62ad192b547f6c7126e7e25045e76f978"
+SRC_URI[sha256sum] = "525bfa3fc88aa30a4467df270fd5be6f9fcae8061d54d4df74ea1dc5abd5a975"
 
 SRC_URI += "file://no-scikit-build.patch "
 
-- 
2.43.0


