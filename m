Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9A1C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 19:02:47 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.30274.1741114958307962151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Mar 2025 11:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=g+f8Kid6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250304190235e323582dfa7ef04878-q8sxqa@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250304190235e323582dfa7ef04878
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 04 Mar 2025 20:02:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=V9c5bGCK0OURlmdlHeY8sOcpokee99IQhxzQZhpPRzA=;
 b=g+f8Kid6ufEA5fTMll7Azw7D+K8PuaQAAlhY2pMZRhPrSyl2vZ9/3csDDZf+XO6N780vPO
 xrXEulCkNcr3MHaKt3aWY3HHptjDvo1Gi3mDd8GphrhJlARnvoibry18qJGJ7ImhIWXm+7mO
 n6P4/xc5A45HSTvhmqeExijN/ebY7FSc2lgxQ8SJtgStFdkWRK/S5tWWHzZnoA96YQXzoSWJ
 LiacLH5H6jiAc0jx0PK+VObPT0S56umBruwIxU50h5KVV/HYABP23PoL3cyFKIPBzEzmvyJ0
 /caboxXkWpfF+crsLURQ7LeRo6YcDEWqmEYFm2E7b3KEW6uuSXA3uG/A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH] python3-grpcio(-tools): fix build concurrency issue
Date: Tue,  4 Mar 2025 19:59:58 +0100
Message-Id: <20250304185958.894117-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 19:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115742

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
 .../recipes-devtools/python/python3-grpcio-tools_1.45.0.bb    | 4 ++++
 meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
index 1e919dd3af..be851ba990 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
@@ -14,4 +14,8 @@ SRC_URI[sha256sum] = "a016cfc21e0d91b3b036d3d4f968d1fdea865dfa03524cb1fbeca84719
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
+do_compile:prepend() {
+    export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
+}
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
index ca55a7f091..56b84dab72 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
@@ -35,6 +35,10 @@ BORING_SSL:arm = "1"
 BORING_SSL ?= "0"
 export GRPC_BUILD_WITH_BORING_SSL_ASM = "${BORING_SSL}"
 
+do_compile:prepend() {
+    export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
+}
+
 GRPC_CFLAGS ?= ""
 GRPC_CFLAGS:append:toolchain-clang = " -fvisibility=hidden -fno-wrapv -fno-exceptions"
 export GRPC_PYTHON_CFLAGS = "${GRPC_CFLAGS}"

