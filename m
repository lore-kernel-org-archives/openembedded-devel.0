Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.62.1618609829753387537
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 14:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kJRxWi7b;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id d10so20061833pgf.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 14:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4HGDAc8ROG39Jh7Xzpuz6mAkYP1z1K/kXZ3ERWkekJ0=;
        b=kJRxWi7bx1QuLigUEbWKR8+xM4YoSQkQ+jdUm4uF2k8Ela/kEiBDv7op7z2PongQFy
         +9kl/+O1OkgZ5Y4ADuI/3d20CYb8n//U3UPB+UfAlSEZRYv5keLyi0E8MjHLPObUWknB
         iyA/7ZJF6LdmpyPkPqtfmdYaWTIIDOAbMh9w1Zz1xHl3yirqltKXJkJ2CIrJHvlK+5qD
         PXU0p1Bk4ckOnr/anqni5TYzLKt/IKpsOuhIp8rqHbk0Cc3j3vEE9FPnrkImz3mDYXtx
         6siSMP4denef6Dhxe9DiEx6flR+JtXr+9PpjcV4PfEPGo9qBpNntge7bRaOPLLgRbYzO
         DYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4HGDAc8ROG39Jh7Xzpuz6mAkYP1z1K/kXZ3ERWkekJ0=;
        b=b44nZpMJs5+MVYKtl+heFPyM7c45qNTx9AqiqyHfyociRkltt7YWN56/n0+XjCgZDB
         YJyabf2jkVPEMdMsB8LMdFoCWWGX78Teiq//v4K9ZNdLSLGshhAJoNK7wfblFDLNBn7W
         wld0exdGg2oEA4VrjeQeI/Lf16EYvq2uS4nSXhccKGlAMMLZ4Jf2HNHymfORqCCVdZDd
         Tp4NqUPDAROh9PMmI/QqezJxLqnh2tPtaIp5ugLa9BxmXyZXIPsluEt0ldL2vhlnbzjL
         uDt5TzFGsxM2LZy6wFtFATpnvB8Q2B+wq4uOLgKsZf4N4/n2FjGnjvABaiMnaMKFbvx+
         65kg==
X-Gm-Message-State: AOAM532xcd1F2CF/FF/k6impkVpHxsy2G7s+fFz01AgCVVoZvoW0KGAP
	hQppFMNerQgh+Cuzt59je/oeXXqNg/Oncw==
X-Google-Smtp-Source: ABdhPJzU7a1UgEWlp7lgiqK+FEFAysDBo58NRaRt56amwo+NhdwxJvJYGJYA+3AWQCPXuep+Lqm4Pw==
X-Received: by 2002:a63:ea06:: with SMTP id c6mr946511pgi.401.1618609828867;
        Fri, 16 Apr 2021 14:50:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id r1sm6540246pjo.26.2021.04.16.14.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 14:50:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Use qemu usermode to run target binaries during build
Date: Fri, 16 Apr 2021 14:50:26 -0700
Message-Id: <20210416215026.2783014-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, we have been trying to build nodejs-native and use the native
host binaries from there, which has worked out ok but always changes
when major upgrade is done, since more binaries or places are required
to be captured. This patch changes this approach to use qemu-user to run
these binaries under during cross build. This lets them run closer to
upstream build process and also removes dependency on nodejs-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/0002-Using-native-binaries.patch   | 95 +++++++++----------
 .../recipes-devtools/nodejs/nodejs_14.16.1.bb | 34 ++++++-
 2 files changed, 78 insertions(+), 51 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
index b5142dc9c1..4e890645fa 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
@@ -8,64 +8,61 @@ Subject: [PATCH] Using native binaries
  tools/v8_gypfiles/v8.gyp | 11 ++++-------
  2 files changed, 6 insertions(+), 9 deletions(-)
 
-diff --git a/node.gyp b/node.gyp
-index 8f4dc518..d9389190 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -446,7 +446,7 @@
-                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
+@@ -487,6 +487,7 @@
+               'action_name': 'run_mkcodecache',
+               'process_outputs_as_sources': 1,
+               'inputs': [
++	        '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+                 '<(mkcodecache_exec)',
                ],
-               'action': [
--                '<@(_inputs)',
-+                'mkcodecache',
-                 '<@(_outputs)',
+               'outputs': [
+@@ -512,6 +513,7 @@
+               'action_name': 'node_mksnapshot',
+               'process_outputs_as_sources': 1,
+               'inputs': [
++	        '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+                 '<(node_mksnapshot_exec)',
                ],
-             },
-@@ -471,7 +471,7 @@
-                 '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
-               ],
-               'action': [
--                '<@(_inputs)',
-+                'node_mksnapshot',
-                 '<@(_outputs)',
-               ],
-             },
-diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index a506a67d..c91f7dde 100644
+               'outputs': [
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -140,7 +140,8 @@
-             '<@(torque_outputs)',
+@@ -220,7 +220,8 @@
+         {
+           'action_name': 'run_torque_action',
+           'inputs': [  # Order matters.
+-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
++	    '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
+             '<@(torque_files)',
            ],
-           'action': [
--            '<@(_inputs)',
-+            'torque',
-+            '<@(torque_files)',
-             '-o', '<(torque_output_root)/torque-generated',
-             '-v8-root', '<(V8_ROOT)'
+           'outputs': [
+@@ -351,7 +352,8 @@
+         {
+           'action_name': 'generate_bytecode_builtins_list_action',
+           'inputs': [
+-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
++	    '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
            ],
-@@ -247,9 +248,7 @@
+           'outputs': [
              '<(generate_bytecode_builtins_list_output)',
+@@ -533,6 +535,7 @@
+             ],
+           },
+           'inputs': [
++	    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(mksnapshot_exec)',
            ],
-           'action': [
--            'python',
--            '<(V8_ROOT)/tools/run.py',
--            '<@(_inputs)',
-+            'bytecode_builtins_list_generator',
-             '<@(_outputs)',
+           'outputs': [
+@@ -1448,7 +1451,8 @@
+         {
+           'action_name': 'run_gen-regexp-special-case_action',
+           'inputs': [
+-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
++	    '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
            ],
-         },
-@@ -1396,9 +1395,7 @@
+           'outputs': [
              '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
-           ],
-           'action': [
--            'python',
--            '<(V8_ROOT)/tools/run.py',
--            '<@(_inputs)',
-+            'gen-regexp-special-case',
-             '<@(_outputs)',
-           ],
-         },
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
index 32bdd713b5..aef83cc31c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
@@ -4,9 +4,9 @@ LICENSE = "MIT & BSD & Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=85bf260d8b6de1588f57abc5dc66587c"
 
 DEPENDS = "openssl"
-DEPENDS_append_class-target = " nodejs-native"
+DEPENDS_append_class-target = " qemu-native"
 
-inherit pkgconfig python3native
+inherit pkgconfig python3native qemu
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -93,6 +93,35 @@ python do_unpack() {
         shutil.rmtree(d.getVar('S') + '/deps/zlib', True)
 }
 
+# V8's JIT infrastructure requires binaries such as mksnapshot and
+# mkpeephole to be run in the host during the build. However, these
+# binaries must have the same bit-width as the target (e.g. a x86_64
+# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
+# depending on a third Yocto toolchain, we just build those binaries
+# for the target and run them on the host with QEMU.
+python do_create_v8_qemu_wrapper () {
+    """Creates a small wrapper that invokes QEMU to run some target V8 binaries
+    on the host."""
+    qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
+                    d.expand('${STAGING_DIR_HOST}${base_libdir}')]
+    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST', True),
+                                    qemu_libdirs)
+    wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
+    with open(wrapper_path, 'w') as wrapper_file:
+        wrapper_file.write("""#!/bin/sh
+
+# This file has been generated automatically.
+# It invokes QEMU to run binaries built for the target in the host during the
+# build process.
+
+%s "$@"
+""" % qemu_cmd)
+    os.chmod(wrapper_path, 0o755)
+}
+
+do_create_v8_qemu_wrapper[dirs] = "${B}"
+addtask create_v8_qemu_wrapper after do_configure before do_compile
+
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
     export LD="${CXX}"
@@ -110,6 +139,7 @@ do_configure () {
 
 do_compile () {
     export LD="${CXX}"
+    install -Dm 0755 ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wrapper.sh
     oe_runmake BUILDTYPE=Release
 }
 
-- 
2.31.1

