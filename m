Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631CAC10F13
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:53:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.57814.1702626779378199928
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUJg13LJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50bf4f97752so387444e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626777; x=1703231577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wEGD1BBzd5nq/vEqIoo6lixaAeugtKrxBWXo6an6AE=;
        b=XUJg13LJXj28dD5agBRjN5tyyiyL2/mcsTSimdjyGbUn8cLxESccsfNc6dJuXQVzfs
         mzyKvPQEnb7bRd9sFKBxo2SteRXkhmq5vMYB7uH2LsZF5ONJH7loA2ZDUdjXHYJkF8tD
         av8E24Rpe+/DmZe23mzJP+TqfY0/kE+0+j71Sxxp/RV2MLqJH1Yp9WJY2GjhVBdweDNB
         /YsUL3oSkRrfAWfDj4QyNva6M7rfPNBxfYJmub2+k1ujcsUaNXmanQA4fD0BO4IHPxeg
         FR9LSs/sBh4EqzP3aZDkYRsSUmv5upojAhQzMxmgJxYv55AEEdt9b/ZYv4GOzfGzMdzu
         x1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626777; x=1703231577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wEGD1BBzd5nq/vEqIoo6lixaAeugtKrxBWXo6an6AE=;
        b=PVVqeGEe/4EgscwQa3C5Uee3/VCza6vZWdoydvEVM/C9/w2O9yagnrLe6NuZFq/r1V
         O6zwBuvIK70C9ow0+meSDoI6BxvN3g4q0plLGibOmlKYE8DgSfVXSJwU87ZL36U5EbHJ
         R+1CMiuswCDYFeKQX2o2rwp8xtzqkqSPk9m7IJIUm4Zr/AZBLIr65H64yp6OxaWL+HWi
         rfQPKPWUS1jnzlD1sMK2Nxbi8xJBxrqhM67F/shRXKelUf+vMTSwC5AnCa2l+06IDgeV
         gtwiIsmU57uM40k5Igo2E3L6IF0f8nRNwPZD0aPbsw4Gr/nB9O0XQwBeKNkmPecJjYfW
         AcyQ==
X-Gm-Message-State: AOJu0YxXhByvQ2mGMmEoCgbytJd9s1m1DVtm/SEcyhlB4ENqgIaGwLt/
	QCeUsdQyRlI0CuTCoMv39/4sn5hqiw4=
X-Google-Smtp-Source: AGHT+IEW1hEqSO9HvIp/DhLHKnRwrNAIJLoI97FieQfV1CVNpVTdmAi3DBxSFmJ+1Myv1MRso7ONgA==
X-Received: by 2002:a19:750b:0:b0:50b:f509:a2d2 with SMTP id y11-20020a19750b000000b0050bf509a2d2mr4957204lfe.129.1702626777536;
        Thu, 14 Dec 2023 23:52:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/20] nodejs: backport (partially) python 3.12 support
Date: Fri, 15 Dec 2023 08:52:39 +0100
Message-Id: <20231215075239.3049865-20-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107513

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-build-fix-build-with-Python-3.12.patch | 55 ++++++++++++++++
 .../0001-gyp-resolve-python-3.12-issues.patch | 63 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.8.1.bb  |  4 +-
 3 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
new file mode 100644
index 000000000..39026d074
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch
@@ -0,0 +1,55 @@
+From 656f6c91f1da7f1e1ffb01e2de7d9026a84958b5 Mon Sep 17 00:00:00 2001
+From: Luigi Pinca <luigipinca@gmail.com>
+Date: Wed, 8 Nov 2023 21:20:53 +0100
+Subject: [PATCH] build: fix build with Python 3.12
+
+Replace `distutils.version.StrictVersion` with
+`packaging.version.Version`.
+
+Refs: https://github.com/nodejs/node/pull/50209#issuecomment-1795852539
+PR-URL: https://github.com/nodejs/node/pull/50582
+Reviewed-By: Richard Lau <rlau@redhat.com>
+Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/95534ad82f4e33f53fd50efe633d43f8da70cba6]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.py | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index 62f041ce..18fe7c14 100755
+--- a/configure.py
++++ b/configure.py
+@@ -14,8 +14,6 @@ import bz2
+ import io
+ from pathlib import Path
+ 
+-from distutils.version import StrictVersion
+-
+ # If not run from node/, cd to node/.
+ os.chdir(Path(__file__).parent)
+ 
+@@ -30,6 +28,7 @@ tools_path = Path('tools')
+ 
+ sys.path.insert(0, str(tools_path / 'gyp' / 'pylib'))
+ from gyp.common import GetFlavor
++from packaging.version import Version
+ 
+ # imports in tools/configure.d
+ sys.path.insert(0, str(tools_path / 'configure.d'))
+@@ -1565,10 +1564,10 @@ def configure_openssl(o):
+     # supported asm compiler for AVX2. See https://github.com/openssl/openssl/
+     # blob/OpenSSL_1_1_0-stable/crypto/modes/asm/aesni-gcm-x86_64.pl#L52-L69
+     openssl110_asm_supported = \
+-      ('gas_version' in variables and StrictVersion(variables['gas_version']) >= StrictVersion('2.23')) or \
+-      ('xcode_version' in variables and StrictVersion(variables['xcode_version']) >= StrictVersion('5.0')) or \
+-      ('llvm_version' in variables and StrictVersion(variables['llvm_version']) >= StrictVersion('3.3')) or \
+-      ('nasm_version' in variables and StrictVersion(variables['nasm_version']) >= StrictVersion('2.10'))
++      ('gas_version' in variables and Version(variables['gas_version']) >= Version('2.23')) or \
++      ('xcode_version' in variables and Version(variables['xcode_version']) >= Version('5.0')) or \
++      ('llvm_version' in variables and Version(variables['llvm_version']) >= Version('3.3')) or \
++      ('nasm_version' in variables and Version(variables['nasm_version']) >= Version('2.10'))
+ 
+     if is_x86 and not openssl110_asm_supported:
+       error('''Did not find a new enough assembler, install one or build with
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
new file mode 100644
index 000000000..9d878dfb8
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch
@@ -0,0 +1,63 @@
+From bf8c96ba6936050ed4a0de5bc8aeeaf2b3c50dc1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 7 Dec 2023 12:54:30 +0100
+Subject: [PATCH] gyp: resolve python 3.12 issues
+
+Upstream has updated gyp wholesale in the main branch, so
+this patch can be dropped in due time.
+
+Upstream-Status: Inappropriate [issue will be fixed upstream with the next nodejs LTS update]
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py | 4 ++--
+ tools/gyp/pylib/gyp/input.py                          | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
+index d9699a0a..173e9465 100644
+--- a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
++++ b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
+@@ -16,7 +16,7 @@ import subprocess
+ import sys
+ import threading
+ import traceback
+-from distutils.version import StrictVersion
++from packaging.version import Version
+ from gyp.common import GypError
+ from gyp.common import OrderedSet
+ 
+@@ -1183,7 +1183,7 @@ def EvalSingleCondition(cond_expr, true_dict, false_dict, phase, variables, buil
+         else:
+             ast_code = compile(cond_expr_expanded, "<string>", "eval")
+             cached_conditions_asts[cond_expr_expanded] = ast_code
+-        env = {"__builtins__": {}, "v": StrictVersion}
++        env = {"__builtins__": {}, "v": Version}
+         if eval(ast_code, env, variables):
+             return true_dict
+         return false_dict
+diff --git a/tools/gyp/pylib/gyp/input.py b/tools/gyp/pylib/gyp/input.py
+index 354958bf..ab6112e5 100644
+--- a/tools/gyp/pylib/gyp/input.py
++++ b/tools/gyp/pylib/gyp/input.py
+@@ -16,7 +16,7 @@ import subprocess
+ import sys
+ import threading
+ import traceback
+-from distutils.version import StrictVersion
++from packaging.version import Version
+ from gyp.common import GypError
+ from gyp.common import OrderedSet
+ 
+@@ -1190,7 +1190,7 @@ def EvalSingleCondition(cond_expr, true_dict, false_dict, phase, variables, buil
+         else:
+             ast_code = compile(cond_expr_expanded, "<string>", "eval")
+             cached_conditions_asts[cond_expr_expanded] = ast_code
+-        env = {"__builtins__": {}, "v": StrictVersion}
++        env = {"__builtins__": {}, "v": Version}
+         if eval(ast_code, env, variables):
+             return true_dict
+         return false_dict
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
index 65f4eb3f3..0ca0c1498 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=162595a4a2f3453a0534e60b0afe4e7b"
 
 CVE_PRODUCT = "nodejs node.js"
 
-DEPENDS = "openssl file-replacement-native"
+DEPENDS = "openssl file-replacement-native python3-packaging-native"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
@@ -27,6 +27,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Revert-io_uring-changes-from-libuv-1.46.0.patch \
            file://0002-Revert-io_uring-changes-from-libuv-1.45.0.patch \
            file://run-ptest \
+           file://0001-build-fix-build-with-Python-3.12.patch \
+           file://0001-gyp-resolve-python-3.12-issues.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.39.2


