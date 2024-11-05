Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1EDD2C13D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.19568.1730817440016932073
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kk6CmnU/;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5cec98cceso44062027b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817439; x=1731422239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWzQLSr+HxsPLFC9U/ANTRjIu8wBLZk24EwPceyUrKU=;
        b=kk6CmnU/jGMHHGs7BWnJxgvN73LqMGkuOx42ZEgnx38z7R48YHcE7ToD92O29YLYtm
         tVFHuV9AXc3hYyXIqUH5r3lLLpWEao47J0lQZ0s4T4Cw0obndz8hhoO8rjwrsKxC1FGb
         8N8EhZFpPj8tlGM5Usqeu8QX3bGI6vxnjRtzZuJ81JfSw/RgIl6ojxLBuGM6IiRAi/oN
         vA86xaRtp33wXypoVkTBx09rvltHumEJO9gL6aNisVgagJSV2ZLVx7qROMq9I+nCgzph
         3sTrRJkbxeHX9J+SStJrNBNaXCDhHIyceim5z5nuUfBGMs9fJZYGaG7YV0mc+EnIg1zy
         kf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817439; x=1731422239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWzQLSr+HxsPLFC9U/ANTRjIu8wBLZk24EwPceyUrKU=;
        b=A9lNJX6SNdGC/Gg3TkEpf8eUfmXKL4UNCi16Go7BqAG1Xl95yVC2b8blp06mkfPR0x
         7rS1GhJYbYg2NCXsoI92d4YqanmrMSbQCA7R+FH14Wx/UKmSvBLv+ZxFFInVSjMVYq4A
         TuBmM0NJK3rhvAyC2uXL1ayUwSIYLS4UMJxNe8REmgAwivyA+G56txKUdKShzOUiJPM4
         siKHonMJRRTXR+/3PA+PKaHdABZoUjfce7u9yWso2QlLo0w2c4xOmpZD5onYHJDi74Rh
         HMSEmo4Pa/K2VtnwxXtk1hFlAvs3ujvfYUsFFoK//aV+GPf8yQyCT+e0b+pInrihaSVj
         PSMg==
X-Gm-Message-State: AOJu0YynpeqPgmnfVwq/fK9FKtKDkl0e+u9Kaz59bqt0nDTjQcSmC+FX
	BsIDcRP1pH74mfcp4uSjV1F3BUdXjZmLIFob8uAWmSs/kUyZK3SoqG4uXg==
X-Google-Smtp-Source: AGHT+IGgvLu72pllgNrrJytY8idO8OqwOBInKM/nRxQ6ZqsGzcW6Q+KVHaPysPh5AfD3VVsTgffmzw==
X-Received: by 2002:a05:690c:9c0b:b0:6ea:7bbe:56ef with SMTP id 00721157ae682-6ea7bbe5932mr125574417b3.16.1730817438960;
        Tue, 05 Nov 2024 06:37:18 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 85/90] nodejs: cleanup
Date: Tue,  5 Nov 2024 09:35:50 -0500
Message-ID: <20241105143638.2301245-86-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113503

From: "J. S." <schonm@gmail.com>

Drop two patches which haven't been referenced by the nodejs recipe since the
20.11.0 version checkin.
  0001-build-fix-build-with-Python-3.12.patch
  0001-gyp-resolve-python-3.12-issues.patch

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2698039ac432d861465b84fc650fcaa8526c8a3c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...001-build-fix-build-with-Python-3.12.patch | 55 ----------------
 .../0001-gyp-resolve-python-3.12-issues.patch | 63 -------------------
 2 files changed, 118 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
deleted file mode 100644
index 39026d0742..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 656f6c91f1da7f1e1ffb01e2de7d9026a84958b5 Mon Sep 17 00:00:00 2001
-From: Luigi Pinca <luigipinca@gmail.com>
-Date: Wed, 8 Nov 2023 21:20:53 +0100
-Subject: [PATCH] build: fix build with Python 3.12
-
-Replace `distutils.version.StrictVersion` with
-`packaging.version.Version`.
-
-Refs: https://github.com/nodejs/node/pull/50209#issuecomment-1795852539
-PR-URL: https://github.com/nodejs/node/pull/50582
-Reviewed-By: Richard Lau <rlau@redhat.com>
-Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/95534ad82f4e33f53fd50efe633d43f8da70cba6]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.py | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/configure.py b/configure.py
-index 62f041ce..18fe7c14 100755
---- a/configure.py
-+++ b/configure.py
-@@ -14,8 +14,6 @@ import bz2
- import io
- from pathlib import Path
- 
--from distutils.version import StrictVersion
--
- # If not run from node/, cd to node/.
- os.chdir(Path(__file__).parent)
- 
-@@ -30,6 +28,7 @@ tools_path = Path('tools')
- 
- sys.path.insert(0, str(tools_path / 'gyp' / 'pylib'))
- from gyp.common import GetFlavor
-+from packaging.version import Version
- 
- # imports in tools/configure.d
- sys.path.insert(0, str(tools_path / 'configure.d'))
-@@ -1565,10 +1564,10 @@ def configure_openssl(o):
-     # supported asm compiler for AVX2. See https://github.com/openssl/openssl/
-     # blob/OpenSSL_1_1_0-stable/crypto/modes/asm/aesni-gcm-x86_64.pl#L52-L69
-     openssl110_asm_supported = \
--      ('gas_version' in variables and StrictVersion(variables['gas_version']) >= StrictVersion('2.23')) or \
--      ('xcode_version' in variables and StrictVersion(variables['xcode_version']) >= StrictVersion('5.0')) or \
--      ('llvm_version' in variables and StrictVersion(variables['llvm_version']) >= StrictVersion('3.3')) or \
--      ('nasm_version' in variables and StrictVersion(variables['nasm_version']) >= StrictVersion('2.10'))
-+      ('gas_version' in variables and Version(variables['gas_version']) >= Version('2.23')) or \
-+      ('xcode_version' in variables and Version(variables['xcode_version']) >= Version('5.0')) or \
-+      ('llvm_version' in variables and Version(variables['llvm_version']) >= Version('3.3')) or \
-+      ('nasm_version' in variables and Version(variables['nasm_version']) >= Version('2.10'))
- 
-     if is_x86 and not openssl110_asm_supported:
-       error('''Did not find a new enough assembler, install one or build with
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
deleted file mode 100644
index 9d878dfb8d..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From bf8c96ba6936050ed4a0de5bc8aeeaf2b3c50dc1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Dec 2023 12:54:30 +0100
-Subject: [PATCH] gyp: resolve python 3.12 issues
-
-Upstream has updated gyp wholesale in the main branch, so
-this patch can be dropped in due time.
-
-Upstream-Status: Inappropriate [issue will be fixed upstream with the next nodejs LTS update]
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py | 4 ++--
- tools/gyp/pylib/gyp/input.py                          | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
-index d9699a0a..173e9465 100644
---- a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
-+++ b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
-@@ -16,7 +16,7 @@ import subprocess
- import sys
- import threading
- import traceback
--from distutils.version import StrictVersion
-+from packaging.version import Version
- from gyp.common import GypError
- from gyp.common import OrderedSet
- 
-@@ -1183,7 +1183,7 @@ def EvalSingleCondition(cond_expr, true_dict, false_dict, phase, variables, buil
-         else:
-             ast_code = compile(cond_expr_expanded, "<string>", "eval")
-             cached_conditions_asts[cond_expr_expanded] = ast_code
--        env = {"__builtins__": {}, "v": StrictVersion}
-+        env = {"__builtins__": {}, "v": Version}
-         if eval(ast_code, env, variables):
-             return true_dict
-         return false_dict
-diff --git a/tools/gyp/pylib/gyp/input.py b/tools/gyp/pylib/gyp/input.py
-index 354958bf..ab6112e5 100644
---- a/tools/gyp/pylib/gyp/input.py
-+++ b/tools/gyp/pylib/gyp/input.py
-@@ -16,7 +16,7 @@ import subprocess
- import sys
- import threading
- import traceback
--from distutils.version import StrictVersion
-+from packaging.version import Version
- from gyp.common import GypError
- from gyp.common import OrderedSet
- 
-@@ -1190,7 +1190,7 @@ def EvalSingleCondition(cond_expr, true_dict, false_dict, phase, variables, buil
-         else:
-             ast_code = compile(cond_expr_expanded, "<string>", "eval")
-             cached_conditions_asts[cond_expr_expanded] = ast_code
--        env = {"__builtins__": {}, "v": StrictVersion}
-+        env = {"__builtins__": {}, "v": Version}
-         if eval(ast_code, env, variables):
-             return true_dict
-         return false_dict
--- 
-2.39.2
-
-- 
2.43.0


