Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E215C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:17 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.50835.1738869615328023895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BDVToBs+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202502061920138e939f8833956e20ec-lbmz9k@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202502061920138e939f8833956e20ec
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:20:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oxDoTW6sPfDjFi1/yAqMdfNM1E/5LflhQAPFUVb+758=;
 b=BDVToBs+3Hq4nJCD+UsBBPO8R/7NQpUqitBR97SHcX7Z3qRllmVRAyn8G8JFIM4gQTi7Df
 gz3SmAwSZiMd+3uOD9G0ze8fMU2wR79dlKpMr4bQTDbN/9b1K3VPF2WJWqhfdZVWkMotEtlJ
 0wDzuO6SwhBc4mkslKO0jEuxBCzivPOxsLIckMWJ93ofgmSr+QZenfAhFluaNvRxKwZ3nPYJ
 5FePMUWcmln2e0nH1PyalVFMg6JmDnUa9+izH4uNjwvaS8Yg9lKv4TKxkBOX1okeZIktvin9
 Ctdp02sI4BM+5LAkWfmjPjX3DfsOCIoa/dwEbzYUWLhtBQXM6esxlUsg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 6/9] python3-grpcio: use system re2
Date: Thu,  6 Feb 2025 20:19:00 +0100
Message-Id: <20250206191903.2324783-6-peter.marko@siemens.com>
In-Reply-To: <20250206191903.2324783-1-peter.marko@siemens.com>
References: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115298

From: Peter Marko <peter.marko@siemens.com>

This also allows to remove a custom patch to maintain and corrects
license, SPDX and CVE handling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Include-missing-cstdint-header.patch | 29 -------------------
 .../python/python3-grpcio_1.69.0.bb           |  4 +--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
deleted file mode 100644
index a2bd294a01..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0760579b4890b48ea3ab36e48f1f6fb3e7ed05f5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 30 Jan 2023 10:31:10 -0800
-Subject: [PATCH] Include missing <cstdint> header
-
-gcc 13 moved some includes around and as a result <cstdint> is
-no longer transitively included [1]. Explicitly include it for
-int32_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://code-review.googlesource.com/c/re2/+/60970]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- third_party/re2/util/pcre.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/third_party/re2/util/pcre.h b/third_party/re2/util/pcre.h
-index 896b0bd..271a005 100644
---- a/third_party/re2/util/pcre.h
-+++ b/third_party/re2/util/pcre.h
-@@ -163,6 +163,7 @@
- 
- #include "util/util.h"
- #include "re2/stringpiece.h"
-+#include <cstdint>
- 
- #ifdef USEPCRE
- #include <pcre.h>
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index ab615d38e5..f70582ea41 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -4,10 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS += "c-ares openssl python3-protobuf zlib"
+DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
-           file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            "
 SRC_URI[sha256sum] = "936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5"
@@ -21,6 +20,7 @@ CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
 export GRPC_PYTHON_BUILD_SYSTEM_CARES = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
+export GRPC_PYTHON_BUILD_SYSTEM_RE2 = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_ZLIB = "1"
 
 GRPC_CFLAGS ?= ""

