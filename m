Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CD8C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 22:52:50 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.1592.1634770369991754185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 15:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fQCu7SCC;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so1645835pji.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 15:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqlrDGe1nbg+u2poYg25BPSqw+f+A8VTetLNp19FYhw=;
        b=fQCu7SCCSlQP3TDGtT2GSEuICu2KxL3EVpQKBA8a8ChPp5E1SP48Gs11q/M79U4SL6
         UPMgTU965tSWDlf9ixkXQWQg5mJGfYonKmicGElwPvgEVjVw9iM/UEhdoFaFOCIns3wo
         9KUpv+Qw54enCoqiaUm9PUZjFDeb/LdixfbUT+WBX6d5i6O7Y4mGs9xlcrjGpzbq6LnI
         nPsKL0/91M8o0gRwI/1SdD0HAPwGewxUO+WZtVyB3zWCnIFd7alba/2fz//QYH7yPNcB
         R1n/Kj21djxSDdHdREDYWxQ1Ty7RYpvEijF2fchp8bvSZB56DsFOtahxHL92yyXOu57l
         FQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqlrDGe1nbg+u2poYg25BPSqw+f+A8VTetLNp19FYhw=;
        b=1XW/LpSHhCpe/cpAAahndbWO8I9sghdYc5gTmSxSGEHZZJvT9aB5yjkjQ7ED5mNzig
         F1ByIwObzHkp2/2b0CpwmR6TqUdCGm3WoOLGr0SfIOPdc7zsmpgH/Vap0jMzdKMo8hIQ
         P+/X2TtL8RjYSgIhOtp7aw4WT7hna7S6yhesAtamdkUadZ05XmVji/u28EkM7bQFIIlB
         VLunT44B8NEbyUBaB2WrDcy01C6Pb6stoqODHPBVDwcASiKd19985k6+Jnz9J6WNufn1
         tiJwM7A1Cpt1VSq1wJybIdJekqncX+A1LaTCNf/T95d0J9KSfpav90i7WGJfCwFEFbIE
         b1mQ==
X-Gm-Message-State: AOAM532jUfFJK0PGHFryoeINvPcTsGOL1HvQJwjUyVvpT3GHyFM+KPqW
	phpDjOFE1xSNRJ7Tq0BXGekezQRRA/wi0w==
X-Google-Smtp-Source: 
 ABdhPJz2YDH1bb/FOmeHyKUlsbD+ICfsv2tjY6tU+uRQCKBFFGwgfKwvqJkC5bWFvtBK3+pcoQnTYA==
X-Received: by 2002:a17:902:654b:b0:13d:c967:9cbd with SMTP id
 d11-20020a170902654b00b0013dc9679cbdmr1773054pln.88.1634770368786;
        Wed, 20 Oct 2021 15:52:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id q6sm3135151pgc.1.2021.10.20.15.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 15:52:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Upgrade to 16.11.1
Date: Wed, 20 Oct 2021 15:52:46 -0700
Message-Id: <20211020225246.659813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 22:52:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93506

* This is new LTS release
* Add patch to fix build on mips/mips64
* Add patch to build with new c-ares 2.17+
* Enhance native binaries patch to include additional native torque use
* Drop mips-warnings.patch and python 3.10 support patch which is
  already available in 16.x
* Refresh rest of patches against 16.x base

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-jinja-tests.py-add-py-3.10-fix.patch | 41 -----------
 ...-liftoff-Correct-function-signatures.patch | 71 +++++++++++++++++++
 ...4-Do-not-use-mminimal-toc-with-clang.patch |  7 +-
 ...nstall-both-binaries-and-use-libdir.patch} | 36 ++++++----
 .../nodejs/0002-Using-native-binaries.patch   | 20 ++++--
 .../nodejs/nodejs/libatomic.patch             |  2 +-
 .../nodejs/nodejs/mips-warnings.patch         | 19 -----
 .../nodejs/nodejs/system-c-ares.patch         | 24 +++++++
 .../{nodejs_14.18.1.bb => nodejs_16.11.1.bb}  | 18 ++---
 9 files changed, 145 insertions(+), 93 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
 rename meta-oe/recipes-devtools/nodejs/nodejs/{0003-Install-both-binaries-and-use-libdir.patch => 0002-Install-both-binaries-and-use-libdir.patch} (72%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_14.18.1.bb => nodejs_16.11.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch
deleted file mode 100644
index b2a2da959d..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e1d838089cd461d9efcf4d29d9f18f65994d2d6b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 3 Oct 2021 22:48:39 +0200
-Subject: [PATCH] jinja/tests.py: add py 3.10 fix
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- deps/v8/third_party/jinja2/tests.py      | 2 +-
- tools/inspector_protocol/jinja2/tests.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/deps/v8/third_party/jinja2/tests.py b/deps/v8/third_party/jinja2/tests.py
-index 0adc3d4..b14f85f 100644
---- a/deps/v8/third_party/jinja2/tests.py
-+++ b/deps/v8/third_party/jinja2/tests.py
-@@ -10,7 +10,7 @@
- """
- import operator
- import re
--from collections import Mapping
-+from collections.abc import Mapping
- from jinja2.runtime import Undefined
- from jinja2._compat import text_type, string_types, integer_types
- import decimal
-diff --git a/tools/inspector_protocol/jinja2/tests.py b/tools/inspector_protocol/jinja2/tests.py
-index 0adc3d4..b14f85f 100644
---- a/tools/inspector_protocol/jinja2/tests.py
-+++ b/tools/inspector_protocol/jinja2/tests.py
-@@ -10,7 +10,7 @@
- """
- import operator
- import re
--from collections import Mapping
-+from collections.abc import Mapping
- from jinja2.runtime import Undefined
- from jinja2._compat import text_type, string_types, integer_types
- import decimal
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
new file mode 100644
index 0000000000..d7005ae972
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
@@ -0,0 +1,71 @@
+From dc3652c0abcdf8573fd044907b19d8eda7ca1124 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Oct 2021 12:49:58 -0700
+Subject: [PATCH] [liftoff] Correct function signatures
+
+Fixes builds on mips where clang reports an error
+../deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h:661:5: error: no matching member function for call to 'Move'
+    Move(tmp, src, type.value_type());
+    ^~~~
+
+Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/v8/v8/+/3235674]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/wasm/baseline/liftoff-assembler.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/deps/v8/src/wasm/baseline/liftoff-assembler.h
++++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h
+@@ -613,7 +613,7 @@ class LiftoffAssembler : public TurboAss
+   void FinishCall(const ValueKindSig*, compiler::CallDescriptor*);
+ 
+   // Move {src} into {dst}. {src} and {dst} must be different.
+-  void Move(LiftoffRegister dst, LiftoffRegister src, ValueKind);
++  void Move(LiftoffRegister dst, LiftoffRegister src, ValueKind kind);
+ 
+   // Parallel register move: For a list of tuples <dst, src, kind>, move the
+   // {src} register of kind {kind} into {dst}. If {src} equals {dst}, ignore
+@@ -759,8 +759,8 @@ class LiftoffAssembler : public TurboAss
+   inline void MoveStackValue(uint32_t dst_offset, uint32_t src_offset,
+                              ValueKind);
+ 
+-  inline void Move(Register dst, Register src, ValueKind);
+-  inline void Move(DoubleRegister dst, DoubleRegister src, ValueKind);
++  inline void Move(Register dst, Register src, ValueKind kind);
++  inline void Move(DoubleRegister dst, DoubleRegister src, ValueKind kind);
+ 
+   inline void Spill(int offset, LiftoffRegister, ValueKind);
+   inline void Spill(int offset, WasmValue);
+--- a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
++++ b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
+@@ -658,7 +658,7 @@ void LiftoffAssembler::Store(Register ds
+     pinned = pinned | LiftoffRegList::ForRegs(dst_op.rm(), src);
+     LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
+     // Save original value.
+-    Move(tmp, src, type.value_type());
++    Move(tmp, src, type.value_type().kind());
+ 
+     src = tmp;
+     pinned.set(tmp);
+--- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
++++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
+@@ -596,7 +596,7 @@ void LiftoffAssembler::Store(Register ds
+     pinned.set(dst_op.rm());
+     LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
+     // Save original value.
+-    Move(tmp, src, type.value_type());
++    Move(tmp, src, type.value_type().kind());
+ 
+     src = tmp;
+     pinned.set(tmp);
+--- a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
++++ b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
+@@ -580,7 +580,7 @@ void LiftoffAssembler::Store(Register ds
+     pinned.set(dst_op.rm());
+     LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
+     // Save original value.
+-    Move(tmp, src, type.value_type());
++    Move(tmp, src, type.value_type().kind());
+ 
+     src = tmp;
+     pinned.set(tmp);
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
index 00b2e9baa9..4773f05109 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
@@ -10,11 +10,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  common.gypi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/common.gypi b/common.gypi
-index ee91fb1d..049c8f8c 100644
 --- a/common.gypi
 +++ b/common.gypi
-@@ -413,7 +413,7 @@
+@@ -417,7 +417,7 @@
              'ldflags': [ '-m32' ],
            }],
            [ 'target_arch=="ppc64" and OS!="aix"', {
@@ -23,6 +21,3 @@ index ee91fb1d..049c8f8c 100644
              'ldflags': [ '-m64' ],
            }],
            [ 'target_arch=="s390x"', {
--- 
-2.32.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
similarity index 72%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
index 6223920990..5cb2e97015 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
@@ -1,10 +1,7 @@
-From 5b22fac923d1ca3e9fefb97f5a171124a88f5e22 Mon Sep 17 00:00:00 2001
+From 62ddf8499747fb1e366477d666c0634ad50039a9 Mon Sep 17 00:00:00 2001
 From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
 Date: Tue, 19 Mar 2019 23:22:40 -0400
-Subject: [PATCH] Install both binaries and use libdir.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
+Subject: [PATCH 2/2] Install both binaries and use libdir.
 
 This allows us to build with a shared library for other users while
 still providing the normal executable.
@@ -22,23 +19,29 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 16 insertions(+), 12 deletions(-)
 
 diff --git a/configure.py b/configure.py
-index e6f7e4db..6cf5c45d 100755
+index 6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f3978067537abf9f0f0 100755
 --- a/configure.py
 +++ b/configure.py
-@@ -626,6 +626,12 @@ parser.add_option('--shared',
+@@ -721,10 +721,16 @@ parser.add_argument('--shared',
+     dest='shared',
+     default=None,
      help='compile shared library for embedding node in another project. ' +
           '(This mode is not officially supported for regular applications)')
  
-+parser.add_option('--libdir',
++parser.add_argument('--libdir',
 +    action='store',
 +    dest='libdir',
 +    default='lib',
 +    help='a directory to install the shared library into')
 +
- parser.add_option('--without-v8-platform',
+ parser.add_argument('--without-v8-platform',
      action='store_true',
      dest='without_v8_platform',
-@@ -1202,6 +1208,7 @@ def configure_node(o):
+     default=False,
+     help='do not initialize v8 platform during node.js startup. ' +
+@@ -1305,10 +1311,11 @@ def configure_node(o):
+     o['variables']['debug_nghttp2'] = 'false'
+ 
    o['variables']['node_no_browser_globals'] = b(options.no_browser_globals)
  
    o['variables']['node_shared'] = b(options.shared)
@@ -46,11 +49,15 @@ index e6f7e4db..6cf5c45d 100755
    node_module_version = getmoduleversion.get_version()
  
    if options.dest_os == 'android':
+     shlib_suffix = 'so'
+   elif sys.platform == 'darwin':
 diff --git a/tools/install.py b/tools/install.py
-index 729b416f..9bfc6234 100755
+index 41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace2257c239a7e9263 100755
 --- a/tools/install.py
 +++ b/tools/install.py
-@@ -121,22 +121,19 @@ def subdir_files(path, dest, action):
+@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):
+   for subdir, files_in_path in ret.items():
+     action(files_in_path, subdir + '/')
  
  def files(action):
    is_windows = sys.platform == 'win32'
@@ -82,3 +89,8 @@ index 729b416f..9bfc6234 100755
  
    if 'true' == variables.get('node_use_dtrace'):
      action(['out/Release/node.d'], 'lib/dtrace/node.d')
+ 
+   # behave similarly for systemtap
+-- 
+2.33.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
index c6fc2dcd76..8db1f1dd54 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
@@ -10,7 +10,7 @@ Subject: [PATCH] Using native binaries
 
 --- a/node.gyp
 +++ b/node.gyp
-@@ -487,6 +487,7 @@
+@@ -294,6 +294,7 @@
                'action_name': 'run_mkcodecache',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -18,7 +18,7 @@ Subject: [PATCH] Using native binaries
                  '<(mkcodecache_exec)',
                ],
                'outputs': [
-@@ -512,6 +513,7 @@
+@@ -319,6 +320,7 @@
                'action_name': 'node_mksnapshot',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -28,7 +28,7 @@ Subject: [PATCH] Using native binaries
                'outputs': [
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -220,6 +220,7 @@
+@@ -68,6 +68,7 @@
          {
            'action_name': 'run_torque_action',
            'inputs': [  # Order matters.
@@ -36,7 +36,15 @@ Subject: [PATCH] Using native binaries
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
              '<@(torque_files)',
            ],
-@@ -351,6 +352,7 @@
+@@ -99,6 +100,7 @@
+             '<@(torque_outputs_inc)',
+           ],
+           'action': [
++	    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
+             '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
+             '-v8-root', '<(V8_ROOT)',
+@@ -225,6 +227,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -44,7 +52,7 @@ Subject: [PATCH] Using native binaries
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
-@@ -533,6 +535,7 @@
+@@ -415,6 +418,7 @@
              ],
            },
            'inputs': [
@@ -52,7 +60,7 @@ Subject: [PATCH] Using native binaries
              '<(mksnapshot_exec)',
            ],
            'outputs': [
-@@ -1448,6 +1451,7 @@
+@@ -1548,6 +1552,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
index cdf6bc8e23..cb0237309e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -1336,6 +1336,7 @@
+@@ -1436,6 +1436,7 @@
      {
        'target_name': 'mksnapshot',
        'type': 'executable',
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch b/meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch
deleted file mode 100644
index 1a773f23d8..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/mips-warnings.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add explicit static cast to fix narrowing warning
-
-Fixes
-deps/v8/src/codegen/mips/assembler-mips.cc:3556:44: error: non-constant-expression cannot be narrowed from type 'int' to 'size_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/deps/v8/src/codegen/mips/assembler-mips.cc
-+++ b/deps/v8/src/codegen/mips/assembler-mips.cc
-@@ -3553,7 +3553,7 @@ void Assembler::GrowBuffer() {
-                                reloc_info_writer.last_pc() + pc_delta);
- 
-   // Relocate runtime entries.
--  Vector<byte> instructions{buffer_start_, pc_offset()};
-+  Vector<byte> instructions{buffer_start_, static_cast<size_t>(pc_offset())};
-   Vector<const byte> reloc_info{reloc_info_writer.pos(), reloc_size};
-   for (RelocIterator it(instructions, reloc_info, 0); !it.done(); it.next()) {
-     RelocInfo::Mode rmode = it.rinfo()->rmode();
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch b/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
new file mode 100644
index 0000000000..141889ad23
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
@@ -0,0 +1,24 @@
+keep nodejs compatible with c-ares 1.17.1
+
+Upstream-Status: Inappropriate [c-ares specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/cares_wrap.h
++++ b/src/cares_wrap.h
+@@ -22,7 +22,15 @@
+ # include <netdb.h>
+ #endif  // __POSIX__
+ 
+-# include <ares_nameser.h>
++#if defined(__ANDROID__) || \
++    defined(__MINGW32__) || \
++    defined(__OpenBSD__) || \
++    defined(_MSC_VER)
++
++# include <nameser.h>
++#else
++# include <arpa/nameser.h>
++#endif
+ 
+ namespace node {
+ namespace cares_wrap {
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index 76ff980997..beed833c09 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6768abdfc4dae4fde59d6b4df96930f3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=12f6b053282af96a218353ae7aff7cd8"
 
 DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
@@ -18,12 +18,12 @@ COMPATIBLE_HOST:riscv32 = "null"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
-           file://0003-Install-both-binaries-and-use-libdir.patch \
+           file://0002-Install-both-binaries-and-use-libdir.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
-           file://mips-warnings.patch \
            file://mips-less-memory.patch \
-           file://0001-jinja-tests.py-add-py-3.10-fix.patch \
+           file://system-c-ares.patch \
+           file://0001-liftoff-Correct-function-signatures.patch \
            "
 SRC_URI:append:class-target = " \
            file://0002-Using-native-binaries.patch \
@@ -34,7 +34,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed"
+SRC_URI[sha256sum] = "67587f4de25e30a9cc0b51a6033eca3bc82d7b4e0d79bb84a265e88f76ab6278"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -56,10 +56,11 @@ ARCHFLAGS:arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
                     bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', '--with-arm-fpu=vfpv3-d16', \
                     bb.utils.contains('TUNE_FEATURES', 'vfpv3', '--with-arm-fpu=vfpv3', \
                     '--with-arm-fpu=vfp', d), d), d)}"
-GYP_DEFINES:append:mipsel = " mips_arch_variant='r1' "
+ARCHFLAGS:append:mips = " --v8-lite-mode"
+ARCHFLAGS:append:mipsel = " --v8-lite-mode"
 ARCHFLAGS ?= ""
 
-PACKAGECONFIG ??= "brotli icu zlib"
+PACKAGECONFIG ??= "ares brotli icu zlib"
 
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[brotli] = "--shared-brotli,,brotli"
@@ -87,7 +88,7 @@ python do_unpack() {
     import shutil
 
     bb.build.exec_func('base_do_unpack', d)
-
+    shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
     if 'ares' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/cares', True)
     if 'brotli' in d.getVar('PACKAGECONFIG'):
@@ -137,6 +138,7 @@ do_configure () {
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
     python3 configure.py --prefix=${prefix} --cross-compiling \
+               --shared-openssl \
                --without-dtrace \
                --without-etw \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
-- 
2.33.1


