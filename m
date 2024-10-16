Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE7FD2A542
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:11:19 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.31734.1729105313903087976
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0Ti5VCm;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e39bf12830so1110457b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729105313; x=1729710113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aItUvCPuKrWcWmhAmV5581GIgzA3kKaACkD+kpXjZY=;
        b=K0Ti5VCmF/bYbiLm97e8kQGSsOzaCS4PMna9sRvnTHdL1XVzZdh4Mm5AiENuId3yDQ
         ZtjLcOGYNWODW0HYJB98GdBiW/2mP35/c+jYfmt5o32iBtCQhrpEC+GPKE+CsYcEMfIJ
         2XyBWD+2gXwBdSBdaYOaKgAy8eRg/rnktXTQhF3L/Wph5Fv9idamZA5tpG0DoNK/pafH
         /ldtrkCZRPylXKEAHNW7uHxU74oR8012wWyFhtBFxsy3z7Cip/YXar/Ls7fUrZmFhh/V
         HeLtX/v6M3i9hnJG+W6kFYZB2t3BE7f41f0WVE8QG0+jqLK295MPes/VrsewU/tMERcu
         Hm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729105313; x=1729710113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aItUvCPuKrWcWmhAmV5581GIgzA3kKaACkD+kpXjZY=;
        b=hMxH3V2R6+o0EVyPllIK0AUsILJCg2oouo9IoBiffpi9ERUxIpGsxM+7vpuXnCmBhC
         TL2yEqC6Au4KY/lybeKNidF+j/wqER2Fih48/fd/F1Kword/bQIbuNwUF6YevAQwnDsf
         KtLu7a3EF/k68LbUaXe1uS/7yHejqPpCMvBJTxfPcHSqusXOFlnES42DWttwWQnsWCfC
         vHizB5DQxsxnIsVozK9JkK+QActh9Ky4ogHS/20BsJ7vNBLi7p6mRDT/SaavpYmWULWn
         z0eWqYBqOpcipGJzAK9gth5dPukS2VrDvCuCRm3yzQFruZSAu5G2zHZ4qkHU1hipzQ+V
         MiHQ==
X-Gm-Message-State: AOJu0Ywadr0mAP3/t27vgnjIuhLYbpTl7IVjOu1F3TstlyQJEEu+Wimj
	LSiu/xP42TaOuNreycYEIvHrlZ5XKSir7vJ0oAg2UKA/qG/8jRGQGwlHBg==
X-Google-Smtp-Source: AGHT+IEDNoDAmU39SmcLThxyxOmIrjYjlAfen9CbRZ5xhGq2N9upxCiXXHzUIPIIPhsapWJbA02G4Q==
X-Received: by 2002:a05:690c:6106:b0:6db:da0e:d166 with SMTP id 00721157ae682-6e5a3da0898mr6625127b3.12.1729105312402;
        Wed, 16 Oct 2024 12:01:52 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e3c6a76e21sm8026097b3.41.2024.10.16.12.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:01:52 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH][master][scarthgap] nodejs: cleanup
Date: Wed, 16 Oct 2024 15:01:22 -0400
Message-ID: <20241016190122.21786-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112941

Drop two patches which haven't been referenced by the nodejs recipe since the
20.11.0 version checkin.
  0001-build-fix-build-with-Python-3.12.patch
  0001-gyp-resolve-python-3.12-issues.patch

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...001-build-fix-build-with-Python-3.12.patch | 55 ----------------
 .../0001-gyp-resolve-python-3.12-issues.patch | 63 -------------------
 2 files changed, 118 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
deleted file mode 100644
index 39026d074..000000000
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
index 9d878dfb8..000000000
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


