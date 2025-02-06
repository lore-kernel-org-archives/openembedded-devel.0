Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E24BC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:17 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.50829.1738869608125769224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Yqo+jz9k;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202502061920054ad70ba483c7cdc5b8-enxenf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202502061920054ad70ba483c7cdc5b8
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:20:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NIWcM3fcY6aRiNavZoLrXRK4Jv4/cPH1+UyDjmUCYyw=;
 b=Yqo+jz9kFizmVXA+8buwkrmKDij3M3zxggNx2ZZtDn3yR6WRcdpK0T3VX25Z/MrVsmjsjh
 vLfL0ZaWltOZQywVojnnMqRT6UglqJEgRVkNacw7tkMGQfxwfQyav2DFu5loJTTdtOT/YyCS
 aECgP8sNbvSuiIKVTdLNej+Z3GGdKCSeC5qlEwU+nlpwvNin+FOxKlLwS0QbEhD0gcu30w5j
 mC+eBU12d6A5wQmezJU91BSotQpjkkSfg8zwMspXySIRP5nl+utf+3tQ7gp4zJIiNKYwWVnK
 NLepjYPi6lg35eH518gRE9aY1xSKa7sULLjxJwocmC/C9Ee8XD/j8elw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 4/9] python3-grpcio: use system zlib
Date: Thu,  6 Feb 2025 20:18:58 +0100
Message-Id: <20250206191903.2324783-4-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115296

From: Peter Marko <peter.marko@siemens.com>

This also allows to remove a custom patch to maintain and corrects
license, SPDX and CVE handling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...clude-unistd.h-for-open-close-C-APIs.patch | 24 -------------------
 .../python/python3-grpcio_1.69.0.bb           |  4 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
deleted file mode 100644
index 584723e6d1..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From f84421d8ee06890e2c98c0f7c9ec6c73f88e77c3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 12 Feb 2023 21:25:04 -0800
-Subject: [PATCH] zlib: Include unistd.h for open/close C APIs
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- third_party/zlib/gzguts.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/third_party/zlib/gzguts.h b/third_party/zlib/gzguts.h
-index f937504..341a68d 100644
---- a/third_party/zlib/gzguts.h
-+++ b/third_party/zlib/gzguts.h
-@@ -18,6 +18,7 @@
- #endif
- 
- #include <stdio.h>
-+#include <unistd.h>
- #include "zlib.h"
- #ifdef STDC
- #  include <string.h>
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index 32d4fbc22a..d621f840f1 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -4,12 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS += "openssl python3-protobuf"
+DEPENDS += "openssl python3-protobuf zlib"
 
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
-           file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            "
 SRC_URI[sha256sum] = "936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5"
 
@@ -21,6 +20,7 @@ inherit pypi
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
 export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
+export GRPC_PYTHON_BUILD_SYSTEM_ZLIB = "1"
 
 GRPC_CFLAGS ?= ""
 GRPC_CFLAGS:append:toolchain-clang = " -fvisibility=hidden -fno-wrapv -fno-exceptions"

