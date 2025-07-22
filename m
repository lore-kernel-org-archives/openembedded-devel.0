Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F055BC87FCA
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4286.1753153988028971761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O+PT9ZEM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153988; x=1784689988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Vip/jzKdO7DUm+caKEl0cPCN/UV5YRa5Y1HXFPE/Jw=;
  b=O+PT9ZEMu2g4fXHZ+1KULvVkH5VUvcWHqLF42HTqQDHvrsjou/ehwIqh
   tm78z07D4d8MRbYXbMZKk56jdRQwUMUFjzCPBeCytnoidEGhbvXsh7Jwb
   0TJr/wSptWDCszGgBs4N6Htnr0MAlIudbT7XVKwVtC3T+qQXJRz4eJdTC
   7qd4n8Y2t6F24SEu4+0+rEsKlpPcNk7ZyPMKH7hRxJ8o/BEtu7s9KnlEn
   1qCAnqJFtmFJSVx9Akuanf8DLdtwQqDTeaZIb0lsKXNdd4SbzKq8ZvABt
   c5j7ipOgJx9PhhDBQrJFeL6d51dRO+cdRHmKH8Ol9e7B0CrT0jqWmJfZn
   A==;
X-CSE-ConnectionGUID: MOKddtuSSOqpjyqUgq0Miw==
X-CSE-MsgGUID: sFevBJrMS8iAyEK9YQRkuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="207510934"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="207510934"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6B51D1C00086
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D2C3E180032F
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:05 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C72AA1A0074;
	Tue, 22 Jul 2025 11:13:02 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 11/21] python3-grpcio-tools: upgrade 1.72.1 -> 1.73.1
Date: Tue, 22 Jul 2025 11:12:19 +0800
Message-ID: <20250722031245.884-11-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118675

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-protobuf-Disable-musttail-attribute-on-mips.patch | 6 +++---
 ...0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch | 7 ++-----
 ...pcio-tools_1.72.1.bb => python3-grpcio-tools_1.73.1.bb} | 2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.72.1.bb => python3-grpcio-tools_1.73.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index cb12fb4983..0293cfe650 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -1,4 +1,4 @@
-From ded393c799d4d970d69a75c458f3672b03099aeb Mon Sep 17 00:00:00 2001
+From 668d3e577073e51cc7e98b42d89c1e2b9b4e04b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Sep 2022 19:09:15 -0700
 Subject: [PATCH] protobuf: Disable musttail attribute on mips
@@ -13,10 +13,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
-index 56f995e..4d36c2f 100644
+index edd6d51..6ddaf80 100644
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -227,6 +227,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
+@@ -235,6 +235,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
  #error PROTOBUF_TAILCALL was previously defined
  #endif
  #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 439b337bda..b779d1441a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -1,4 +1,4 @@
-From f1bf68aaa5417bcb7ad4996f1be8d2c0f53c521c Mon Sep 17 00:00:00 2001
+From 1f1f174ed3ca28bdf8bbb479eb1d948d934dcc53 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 17 Feb 2021 13:38:55 -0800
 Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
@@ -27,7 +27,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 1a997df..86e3ad1 100644
+index ff27e67..964baf4 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -90,9 +90,11 @@ def check_linker_need_libatomic():
@@ -54,6 +54,3 @@ index 1a997df..86e3ad1 100644
          stdin=PIPE,
          stdout=PIPE,
          stderr=PIPE,
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.73.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.73.1.bb
index 52d68c71a9..d380c3b1cf 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.73.1.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "a11afb21d0e960eb41f3c3053206e9271ec42579582c13193b99a0dca6be86d1"
+SRC_URI[sha256sum] = "6e06adec3b0870f5947953b0ef8dbdf2cebcdff61fb1fe08120cc7483c7978aa"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


