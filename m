Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16377CAC5B6
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.15418.1758015722613435364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cvjvu4x1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015723; x=1789551723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xjLp+blZn2r+wWhbU3nYKv5rQa/Pi1xQTq0jL5EBrO4=;
  b=Cvjvu4x1Rk0G/miGlfLSsCS+03D5EbiCFbGP4KEsJQPaF/Y95g8JQND+
   zuXY6mDdOv8Ebc23Vdb80HcURrJxY9csLFwk0ForKnuhIxot27UgKB9+X
   4n1Eo6F3t0vKbg2n55R/kxnm1E/8MVfhq9RuWiI8yhbR2bnu2IJINp5xp
   SzmVnhaPAtH7fnN21iShtGrpdUkBGtGqO1m4+z/wnb/B6q/v432Sx99Z6
   BxiBO8pLLGjE97Sd5D54Q0C6Qttqv9qT6n8SuyPECYCd7B3++GvfrsNkn
   fFTuosZU/Yz8lTEypWTLb7yyyAcgpVGV5C07sHUsLpL2bC0fLjm1ezQUH
   w==;
X-CSE-ConnectionGUID: uWHVR41gTpqiS1nHCpXkYQ==
X-CSE-MsgGUID: WiB6YyAbTlKAo1ZJdli0tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212969196"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212969196"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:01 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A9A501002B87
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:00 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 659FA18000CD
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id D3EDF1400ADF;
	Tue, 16 Sep 2025 09:41:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 791101A007E;
	Tue, 16 Sep 2025 17:41:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/42] cjson: upgrade 1.7.18 -> 1.7.19
Date: Tue, 16 Sep 2025 17:41:12 +0800
Message-ID: <20250916094152.1479-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119425

From: Wang Mingyu <wangmy@fujitsu.com>

0001-allow-build-with-cmake-4.patch
refreshed for 1.7.19

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cjson/cjson/0001-allow-build-with-cmake-4.patch      | 9 +++------
 .../cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb}           | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} (97%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch
index 7bd608ca0a..05b19d257a 100644
--- a/meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch
+++ b/meta-oe/recipes-devtools/cjson/cjson/0001-allow-build-with-cmake-4.patch
@@ -1,4 +1,4 @@
-From 8622490d650ba4d107561a0e8f3cf881fa0247c7 Mon Sep 17 00:00:00 2001
+From 13a050b263ab53c1dc8d05b12e65c21da7c054b3 Mon Sep 17 00:00:00 2001
 From: Alper Ak <alperyasinak1@gmail.com>
 Date: Tue, 8 Jul 2025 15:09:11 +0300
 Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
@@ -26,7 +26,7 @@ Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 36a6cb5..9428da5 100644
+index c7ca27f..59e4af5 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -1,5 +1,5 @@
@@ -35,7 +35,4 @@ index 36a6cb5..9428da5 100644
 +cmake_minimum_required(VERSION 3.5)
  
  project(cJSON
-     VERSION 1.7.18
--- 
-2.43.0
-
+     VERSION 1.7.19
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
similarity index 97%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
index 7ece0065ba..d914018331 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
            file://0001-allow-build-with-cmake-4.patch \
          "
-SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
+SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 
 inherit cmake pkgconfig ptest
 
-- 
2.43.0


