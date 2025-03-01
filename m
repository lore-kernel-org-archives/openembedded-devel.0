Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA82C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 20:01:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.16340.1740859288061095699
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Mar 2025 12:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Y8Qm2DHr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250301200124daab1c7d3d560e6860-lvixda@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250301200124daab1c7d3d560e6860
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 01 Mar 2025 21:01:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MspvO4FdFrKhCfpuZeDTQ+Iv3TI9/h4jwFCCox0L3Ic=;
 b=Y8Qm2DHrzFzTl5vzzTbOFrxZy9vQJ3dGKuuTVCouzhhLv9KeRWm88t2wrl1ZFthNy5l4W7
 OFyx23LtvxQ0UqGOgDna23NwciH2flG7F5s+QMUNdADukbdFfI84UPwtUKqVXgeRr4F6N5oI
 6d4fmQSKLZCBudmQUrVzriLEyO/1p/WUhavwUwpA5Yyv8jDo0pQJPO0sTWaNCfNCFCibg0bu
 r4KM7ASQB8ZZqrMWEYpvQ5lb/JAWl9rk8wR9x9nbWmd5nRm770pit4/3lCocMu0gzqKK4335
 LKA4AtDBrvjs3lxaIesw3PnwFh9itpiUsRa+jwAwhWBurUKbGcy+ORnw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH] python3-grpcio(-tools): fix build concurrency issue
Date: Sat,  1 Mar 2025 21:00:35 +0100
Message-Id: <20250301200035.160451-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 20:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115717

From: Peter Marko <peter.marko@siemens.com>

Set GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS to limit spawned compiler
processes. Without this it uses all available CPUs (via
multiprocessing.cpu_count()) and can exhaust build host since there are
lot of files to compile (e.g. with 128 cores it manages to spawn 128 gcc
processes)

Note that this is a general problem for all setuptools based builds with
build_ext compilation which can either compile with 1 thread or
cpu_count threads. grpcio hot-patches setuptools and allows to set
specific build concurrency value.

(From master rev: fe582374d3ba474164005942799eb2bddc52a080)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.62.2.bb    | 4 ++++
 meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
index e05b8734d6..5b8bbe681a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
@@ -16,4 +16,8 @@ SRC_URI[sha256sum] = "5fd5e1582b678e6b941ee5f5809340be5e0724691df5299aae8226640f
 
 RDEPENDS:${PN} = "python3-grpcio"
 
+do_compile:prepend() {
+    export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
+}
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index b12b509142..3581991a56 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -38,6 +38,10 @@ BORING_SSL:aarch64 = "1"
 BORING_SSL ?= "0"
 export GRPC_BUILD_WITH_BORING_SSL_ASM = "${BORING_SSL}"
 
+do_compile:prepend() {
+    export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
+}
+
 GRPC_CFLAGS ?= ""
 GRPC_CFLAGS:append:toolchain-clang = " -fvisibility=hidden -fno-wrapv -fno-exceptions"
 export GRPC_PYTHON_CFLAGS = "${GRPC_CFLAGS}"

