Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9EDC3ABA3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35400.1745311776746154296
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HBSslFtF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311778; x=1776847778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NS2AM5onsUnzNyDLxQtto/8mKu7XlHH73UzJIP6adFg=;
  b=HBSslFtFqwtsKSxnV4P0pJn2sdvyGnIBsmnJXXLWSs4m7+K+QEDlkXT1
   3Lhkt1DPPVy4DKLCO3F4+5qMn7NnEF5mTh2pPnW9o8q2fwK/kPDtmYxar
   F4nUuIwmsIrcAQaJw9NXrdcoNwN5ZpWozCu/wyY7XFRtFfoHRvMyqEXoX
   B0fREgh7B1G+AogPuANOGtzAwMejNDvXJJRancweqrDY+QxsnkdVMyDpf
   q4CKB/ROBeJNr9po8U0Wb5JErAYMRBnNNtt4U+uexbxXZabfIXDpVSyLD
   OusXX5rh8Ju2KLZUp3SUXdn78PJZvTj2M6kzICPLwmWYvMiGo/NtbMLhF
   A==;
X-CSE-ConnectionGUID: j+hQRPcGTPKBn6XaYXtoww==
X-CSE-MsgGUID: kXpxwH4ERha996potIwmWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197342741"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197342741"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0759719503
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA933D3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 684611A0078;
	Tue, 22 Apr 2025 16:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/30] python3-posix-ipc: upgrade 1.1.1 -> 1.2.0
Date: Tue, 22 Apr 2025 16:49:15 +0800
Message-Id: <1745311761-1912-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117036

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-default-cc-from-environment-variable.patch
removed since it's not available in 1.2.0

License-Update: Reorg and rename files; add pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...default-cc-from-environment-variable.patch | 45 -------------------
 ...pc_1.1.1.bb => python3-posix-ipc_1.2.0.bb} |  6 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch
 rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.1.1.bb => python3-posix-ipc_1.2.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch
deleted file mode 100644
index 86829869a2..0000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2db4d9974052e28f25252b3204a73dd25de1dd89 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sat, 25 Jan 2025 13:09:00 +0100
-Subject: [PATCH] Use default cc from environment variable
-
-In case the system uses a custom c compiler instead of cc
-(e.g. for cross-compiling), probing system features can
-fail or can misidentify the features due to the incorrect C compiler.
-
-Instead of using only "cc" for probing features, check if the CC environment
-variable has a custom C compiler set. If it is present, use that instead of
-"cc". If it is not present, fall back to "cc".
-
-Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/56]
----
- prober.py | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/prober.py b/prober.py
-index 48432b7..ace6d3b 100644
---- a/prober.py
-+++ b/prober.py
-@@ -52,14 +52,17 @@ def print_bad_news(value_name, default):
- def does_build_succeed(filename, linker_options=""):
-     # Utility function that returns True if the file compiles and links
-     # successfully, False otherwise.
--    # Two things to note here --
-+    # Three things to note here --
-     #   - If there's a linker option like -lrt, it needs to come *after*
-     #     the specification of the C file or linking will fail on Ubuntu 11.10
-     #     (maybe because of the gcc version?)
-     #   - Some versions of Linux place the sem_xxx() functions in libpthread.
-     #     Rather than testing whether or not it's needed, I just specify it
-     #     everywhere since it's harmless to specify it when it's not needed.
--    cmd = "cc -Wall -o ./prober/foo ./prober/%s %s -lpthread" % (filename, linker_options)
-+    #   - In case the used C compiler is not cc, take it from the CC environment
-+    #     variable
-+    cc = os.getenv("CC", "cc")
-+    cmd = "%s -Wall -o ./prober/foo ./prober/%s %s -lpthread" % (cc, filename, linker_options)
- 
-     p = subprocess.Popen(cmd, shell=True, stdout=STDOUT, stderr=STDERR)
- 
--- 
-2.48.1
-
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index c29996de53..29e1b35122 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -2,13 +2,11 @@ DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queue
 HOMEPAGE = "https://semanchuk.com/philip/posix_ipc/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=513d94a7390d4d72f3475e2d45c739b5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1a4f3bd729df04bf68f66ef877e9c7c9"
 
 PYPI_PACKAGE = "posix_ipc"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7"
-
-SRC_URI += "file://0001-Use-default-cc-from-environment-variable.patch"
+SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
 inherit setuptools3 pypi
-- 
2.43.0


