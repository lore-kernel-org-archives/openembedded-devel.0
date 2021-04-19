Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.989.1618866285965722106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 14:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QFp5z29k;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id y1so2806628plg.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 14:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FLdiJGq83fMoUUfyDqkddzQQMXW7AqCZwUw8/kUacv4=;
        b=QFp5z29kZU6PmHWEsnWBQcrjlg2KDpGOtKLRwX11c/BW27SYj8logWqtFNdyhzo/Fl
         eDMnBbiY7P6UxuFY0f3qenNZGlsR5XUSNxqQp1WZO0tHwFs18qAWu3Fk/to8pwCYo77o
         KBybnV5pxoyzTH4D1MvbrRvb53aoL9kojMZogA6fyesRnlP203nKKBbNwbo0/IBgmCF3
         gFFXu3JTA7wGHO0pSnVIfN0VumyYP4zK8xaxaLJit+66odLGo8RSycSFRK1iSIZ5/x9j
         XV/3ntY4EnHC59JvHifwqBdZM42IKkTnfecizoQzElLUTj4/VZWdCi/uhseVb0S8I1W8
         Dxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FLdiJGq83fMoUUfyDqkddzQQMXW7AqCZwUw8/kUacv4=;
        b=W6H+s2ZwaKVRWRqiz3bmYrREfhzbcpDOOOcr40Wrkm42sA+uX9LXsb81Yxgmm4ZAHk
         ilbnZlRJ/4Z/+mrzTjxjaHR5eoTJktG4E8d+GZPO4ZA/xNYfs4l1U/XktAjsRcqe46nZ
         MJ8fWW55x16urO21T5QZ5D8ZMBESv9hCvxeOZhgO4mERkUBZmWc8ngB3xfMPgWTlGQak
         bwUpfX7KtpuKQIdqQ2WDfsRD5uzRuAn5QRUpcKOZIIg4qATPgYQ3qaFJb9gFL23BWcCG
         XR2pb2NuqmvByzYCjJaGLk1pdB1ZAMiIznGaGBHAoRSBcKpEiJWpuqPelQovwb/mdgtZ
         JHTg==
X-Gm-Message-State: AOAM5328v51Bvghu+FLPorCV+WMfVkDyKAUi9qY7FKRDQY/SZ8rROtwg
	jz1z6FqzVjhMBy/5dTQzUoR1lkyUB+nRXw==
X-Google-Smtp-Source: ABdhPJz2jbe5NeOP2c4VGYPXDeA6yJJEsJucK4FbyExBW12VDVxqFR3CIAm58XuZGPWW0nkejiyMlQ==
X-Received: by 2002:a17:90a:4290:: with SMTP id p16mr1105974pjg.120.1618866285061;
        Mon, 19 Apr 2021 14:04:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id b7sm305439pjq.36.2021.04.19.14.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 14:04:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3 3/4] nodejs: Use qemu usermode to run target binaries during build
Date: Mon, 19 Apr 2021 14:04:39 -0700
Message-Id: <20210419210440.2446040-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419210440.2446040-1-raj.khem@gmail.com>
References: <20210419210440.2446040-1-raj.khem@gmail.com>
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
 .../nodejs/0002-Using-native-binaries.patch   | 93 +++++++++----------
 .../recipes-devtools/nodejs/nodejs_14.16.1.bb | 34 ++++++-
 2 files changed, 74 insertions(+), 53 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
index b5142dc9c1..c6fc2dcd76 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
@@ -8,64 +8,55 @@ Subject: [PATCH] Using native binaries
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
++                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
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
++                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
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
-           ],
-           'action': [
--            '<@(_inputs)',
-+            'torque',
-+            '<@(torque_files)',
-             '-o', '<(torque_output_root)/torque-generated',
-             '-v8-root', '<(V8_ROOT)'
+@@ -220,6 +220,7 @@
+         {
+           'action_name': 'run_torque_action',
+           'inputs': [  # Order matters.
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
+             '<@(torque_files)',
            ],
-@@ -247,9 +248,7 @@
-             '<(generate_bytecode_builtins_list_output)',
+@@ -351,6 +352,7 @@
+         {
+           'action_name': 'generate_bytecode_builtins_list_action',
+           'inputs': [
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
            ],
-           'action': [
--            'python',
--            '<(V8_ROOT)/tools/run.py',
--            '<@(_inputs)',
-+            'bytecode_builtins_list_generator',
-             '<@(_outputs)',
+           'outputs': [
+@@ -533,6 +535,7 @@
+             ],
+           },
+           'inputs': [
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(mksnapshot_exec)',
            ],
-         },
-@@ -1396,9 +1395,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
+           'outputs': [
+@@ -1448,6 +1451,7 @@
+         {
+           'action_name': 'run_gen-regexp-special-case_action',
+           'inputs': [
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
            ],
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
+           'outputs': [
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

