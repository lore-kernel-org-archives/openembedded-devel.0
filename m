Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4D5C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 20:58:06 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.4704.1740776283889962688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Feb 2025 12:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Im/eJ2oS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250228205800b65c3d439e35f3b2e9-xam3vf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250228205800b65c3d439e35f3b2e9
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 28 Feb 2025 21:58:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RxE3TNBIE3tn0SQCpnMgKznotFbuQs6eL9sI+DG7Ru0=;
 b=Im/eJ2oS96Q4Z6xrS361BhJlQ6X6PD8jrCz/llo62e0dHJboiVBRPU0N2JY4HZzzE4uNcH
 Uk4jV5zDLA5CfVNmu53kGa/w61Viqc9mMd0b+egKHHiAfo0tgyPHfY60/epAU94hOFZSFnNa
 ljsGTW3dQ05A/Fx6P6ofIvyZeBh64Ap9aKf2qQy3OS3G9nUfdvzqRinNmzMJzi5NCyal24tX
 TlOoirJoqdjNruCGafvnh1WB+u4MJ6sADWnIe5Pqc277TT2N+Iok4QqaDMANgKKvD8AakzB+
 rLg9sncxOAqovBrWbC/0C6EslCp4Cmol1btnYoFoxRQDdgV2KTG7M6sg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH] python3-grpcio(-tools): fix build concurrency issue
Date: Fri, 28 Feb 2025 21:57:10 +0100
Message-Id: <20250228205710.1739487-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 20:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115711

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

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.70.0.bb    | 4 ++++
 meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
index 8af6bb5714..38440edbee 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "e578fee7c1c213c8e471750d92631d00f178a15479fb2cb3b939a07fc1
 
 RDEPENDS:${PN} = "python3-grpcio"
 
+do_compile:prepend() {
+    export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT += "grpc:grpc"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
index 5af05ca2c9..b858a3b050 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
@@ -29,6 +29,10 @@ export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_RE2 = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_ZLIB = "1"
 
+do_compile:prepend() {
+    export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
+}
+
 GRPC_CFLAGS ?= ""
 GRPC_CFLAGS:append:toolchain-clang = " -fvisibility=hidden -fno-wrapv -fno-exceptions"
 export GRPC_PYTHON_CFLAGS = "${GRPC_CFLAGS}"

