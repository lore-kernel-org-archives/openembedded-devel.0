Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FFDC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9726.1788344967445285697
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IMkQA+GL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344967; x=1819880967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AklxPdybwW2zDUbHw02RgwKYP1wev4IBzZ+qIPIKBvY=;
  b=IMkQA+GLVTwxDyVUlzdpKQ4MxvEH89BYHX4VMt9GClRGwtk47Evb2gd3
   SF/chqAUX22vSvpnZK3izFwkxwY3mlFKcJMb+EK0lquJ8NEJa/g4GDoEq
   Kop34GI/ANDG6Z9bB891KNqiRNtqG+UR6l1QqnimyM6XUTh4eazo7j+bV
   YinhViCXCnoz3x178fG7876YfDz28ufNWa8smqLMVFO6J2D09PwNdFN98
   RhFmpGVKq2+9iKpI7V64BidBsXJscjUAXA7lKmM/sJhn+6amhux5o+KDL
   sCWtDqmzfGtdiY3kO2ASsnAZRIL3ehW99NsTUlugvp3TcnJYP1+yKf0xB
   w==;
X-CSE-ConnectionGUID: MKydoXf+Rga7JDT6LZeopg==
X-CSE-MsgGUID: VCWml807Q3O/t8zGDuaY4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241060683"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241060683"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:26 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DF6F81002B8B
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:25 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 95A0A14003F9
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 96CC52000224;
	Wed,  2 Sep 2026 10:29:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/34] python3-cmake: upgrade 4.4.2 -> 4.4.3
Date: Wed,  2 Sep 2026 18:28:37 +0800
Message-ID: <20260902102900.1296-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129670

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.4.2.bb => python3-cmake_4.4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.4.2.bb => python3-cmake_4.4.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb b/meta-python/recipes-devtools/python/python3-cmake_4.4.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.4.3.bb
index 5450c33c1d..fcc898db37 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.4.3.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "6af2e0585239627f85f49a8f90761ce4560c671daae1d5e8d2b5f059dc7d22de"
+SRC_URI[sha256sum] = "b0c2703ec0a624649dd184c0ac5ee4c7f5fe5ef35eb82f9da44f5a0903adb2b6"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


