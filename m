Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1490C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:42:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.23137.1745743222960971830
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 01:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CNWfcdX6;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso29550835e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745743221; x=1746348021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7hVoNdntH/fSpq5PkEsxvnsrYBnHSSjnl4StAsE/XV0=;
        b=CNWfcdX6wVbQUPy0s6jrHURX1TMPdTTqljpNMwfpNVzHSPg6hd/E9wSlKNCXBz58h2
         ZUmVP7oxWLAEo35c1zir6+M41r43q6tDNWQNiyMvPKJdrh6k4pmCmpQYeOaVbTCbMG87
         hl4J1437+XR1h58Gt9fS8hQhv7W/3K4ebHj123N6UUBqQQU1R3Hpwj4OcQ3pQev/amSg
         ViWtilVljqCtkGRnws8BMGhZL1m+lZeI2gn7sFAHRWlWwGcIYgn9qrszuKRQLtDKoAus
         6h/0VvhrPsXqQbGgwJVQbqYZoiXqCDgE7IDaB1JJRcOvGVdvuRe5BBtMfrl+djgQNNhR
         4DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745743221; x=1746348021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hVoNdntH/fSpq5PkEsxvnsrYBnHSSjnl4StAsE/XV0=;
        b=HAlo1EMuGjE/Z9IngBPsohBimIb6mvLqKP0BDEjJXQ/GZShUPUKNZXBuAHFByGjgjG
         VQifu05e867DUUHO0U74t7fFbrrvPTVlL+1oMlkHRcIOTXoQhKZsjPHAzsDHM7/zzdG7
         Quz+aDbj6VeqISVD9OnOjP4F9YZWRjtva0LO2SlzXXnOyfOKf5Q+x71k7PI7yZ3p9/z2
         BDE67AbVxfqrh9dkRri8QzeOPCc2sFMJmVoylmhW+eQYARtRfJ0lTVzDp0mlVq5gWF3N
         Fwj+xeEONoBrnXc1fmBwIyu0fjtNS0q0znLfKxM6c8m7P0ru3OVNYdHTlmcUhNyo3ipM
         qnNQ==
X-Gm-Message-State: AOJu0Ywj3m3Vjpqz2zUb4uwWvUfyZEFFve1RHLHIDLiFM4G9L300A6uE
	3Ul/gPxnqg6Cyknt04bGH0JzBWO8ljckquM0qv7cmosAzWY0wKPxV60z6nP3
X-Gm-Gg: ASbGnctYU6Oo4DaLcUem2gEwxnpt1E3B6J9Z1cTJhILWYSXu5AYizh0zN1ecNflP+Jr
	FXkeJ91+DsgNzTpFNenCqaS2qDgcPjL6x0mDyVLK2iiLOJ+S4ptbYQPrboo92LQmfQ9StmmvOrA
	fsLcJzHdx/IE87ZUgAgS5dcS9MgCW7Ei1HNd3aTk1KaQRxBngFB3X1MGnDtvgLiXHWW297OnVbz
	9Ekb3nPQDVLLuFe6G4wlegMN4obGhZZw2C5QdLvnoLsj9qyc86Ue34k5L+Ei3mpuHJA2lhOBjB6
	3zl5KIu+uyOaUl5UyYd2dULoLF5qp3l9zhReEezX8Cw+bnAJyWurbesb45VY1tqFbeX6Bv3tFq5
	P
X-Google-Smtp-Source: AGHT+IFSarRiW2aBkojM2dVGch6RJ1F+3MGcVvg2Eo/udxdQcg8uazbFeG5nk6nq1vOJ/CCYq9Rfaw==
X-Received: by 2002:a05:6000:220e:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-3a074e2f0ffmr6596143f8f.16.1745743220971;
        Sun, 27 Apr 2025 01:40:20 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07a7c39a0sm4974654f8f.101.2025.04.27.01.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:40:20 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][walnascar][PATCH 1/2] python3-posix-ipc: upgrade 1.1.1 -> 1.2.0
Date: Sun, 27 Apr 2025 08:40:11 +0000
Message-ID: <20250427084012.4224-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 08:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117164

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-default-cc-from-environment-variable.patch
removed since it's not available in 1.2.0

License-Update: Reorg and rename files; add pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
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


