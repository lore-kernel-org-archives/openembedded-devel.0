Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44EFCCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.24193.1761696956390770229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jgKnM7PQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696962; x=1793232962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b1xgHiwWUI3ODLjD6SG4wju2HOKwVCI/vQM9K6qcMtQ=;
  b=jgKnM7PQ2XvLJL7p1k0l+kRpCILmh+d9Swz6eNNF6DURwf9LSw8x4fK8
   EL59IO78URT0D6GeIsckv8K0BvrvYGwQSfJwVwWogas3HT/CjObuL/vSX
   rRTMn3JWEdK6a+5A/RosGXIOHLqsXklDUJWn/AUkLlCT9bbxxXyA4sKTe
   CyMG/X9tn/U9mra1dNFOFBtTY6Tz0NjRVvcigQ1qIJ91T9f9oAXz2M0Tc
   BBi4Fpm5OwUnu13DckPfOERGu7MOwlWGXW7bRkGp5LFck6krDD8pFurj+
   3ofv5kZfKw7F2Z3bHjKeziYV1zDRDgXWizR6SpN++XC1HNU6kd19yyWXv
   Q==;
X-CSE-ConnectionGUID: 9doag1p0Re6SCPidf4ugvg==
X-CSE-MsgGUID: RMyJnVGUQZCdVzV5SsaU7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217403019"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217403019"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:02 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 06DE440757C
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:01 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ADE711C00171
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1C1E2826FD1;
	Wed, 29 Oct 2025 00:15:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/32] python3-posix-ipc: upgrade 1.3.0 -> 1.3.2
Date: Wed, 29 Oct 2025 08:14:56 +0800
Message-ID: <20251029001505.528-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121129

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build_support-fix-cross-compilation-error-when-CC-is.patch
removed since it's included in 1.3.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...x-cross-compilation-error-when-CC-is.patch | 53 -------------------
 ...pc_1.3.0.bb => python3-posix-ipc_1.3.2.bb} |  6 +--
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-fix-cross-compilation-error-when-CC-is.patch
 rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.3.0.bb => python3-posix-ipc_1.3.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-fix-cross-compilation-error-when-CC-is.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-fix-cross-compilation-error-when-CC-is.patch
deleted file mode 100644
index c78d4ad726..0000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-fix-cross-compilation-error-when-CC-is.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 01134093c9150248f9ea8890a41e922159593a7f Mon Sep 17 00:00:00 2001
-From: Haixiao Yan <haixiao.yan.cn@windriver.com>
-Date: Fri, 8 Aug 2025 19:30:16 +0800
-Subject: [PATCH] build_support: fix cross-compilation error when CC is a
- multi-part command
-
-Fix the following error when cross-compiling with an environment-defined CC
-that includes flags:
-
-FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-wrs-linux-gcc
--m64 -march=nehalem -mtune=generic -mfpmath=sse -msse4.2
--fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
--Werror=format-security
---sysroot=/build-1.3.0/tmp/work/corei7-64-wrs-linux/python3-posix-ipc/1.3.0/recipe-sysroot'
-
-This happened because the CC environment variable was treated as a single
-string instead of being split into arguments. The fix uses shlex.split() to
-correctly parse CC into a list of compiler and flags, and then unpacks it when
-forming the subprocess command.
-
-Upstream-Status: Backport [https://github.com/osvenskan/posix_ipc/commit/0113409]
-
-Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
----
- build_support/discover_system_info.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
-index d1b171e4f602..1c3741f5577c 100644
---- a/build_support/discover_system_info.py
-+++ b/build_support/discover_system_info.py
-@@ -1,6 +1,7 @@
- import subprocess
- import platform
- import os
-+import shlex
- 
- # Set these to None for compile/link debugging or subprocess.PIPE to silence
- # compiler warnings and errors.
-@@ -49,7 +50,9 @@ def does_build_succeed(filename, linker_options=""):
-     #   - Some versions of Linux place the sem_xxx() functions in libpthread.
-     #     Rather than testing whether or not it's needed, I just specify it
-     #     everywhere since it's harmless to specify it when it's not needed.
--    cmd = [os.getenv("CC", "cc"),
-+    cc = os.getenv("CC", "cc")
-+    cmd = [
-+           *shlex.split(cc),
-            '-Wall',
-            '-o',
-            f'./build_support/src/{filename[:-2]}',
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
index 02d2e55bad..3431e6c7aa 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
@@ -7,11 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3d8df223c2614dbf1aabdc1ca23cc10"
 PYPI_PACKAGE = "posix_ipc"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d20876910896f47d353448"
-
-SRC_URI += " \
-    file://0001-build_support-fix-cross-compilation-error-when-CC-is.patch \
-    "
+SRC_URI[sha256sum] = "6923232111329954a8349f7d99f212b6e96b5206e77fbd39aaf1b3cb4a5e9260"
 
 # Message queue support requires librt for proper linking
 LDFLAGS += "-lrt"
-- 
2.43.0


