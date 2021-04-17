Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.1705.1618683584667074240
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 11:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ca+QAMRl;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso467282pjs.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FYyVWKxk+0HNNYXmtXDeUQ7akXO6Rlog1Jj94XM4F1Y=;
        b=Ca+QAMRlJiXCcB+rJ+9Vg2vz5u8oF41scbxSXZ0hVln14vfO/Fz7P5tFzWoy4TymGi
         O2jUh1eDPhmBB2E9jAF761HF3kGWXM09s2Ya0+CTHUXMVGuj7UGZKwN3IUW+iTwQMN5s
         NpQlN3ec8N1G3yUaiju/TsJX32sjDDiNUlkC5igDTSm1fHpFGdXyeDhetoNJHSLLi85f
         lvhSID3CRIWEW1jIf/nJIQYAaLSDGXxIQUGFuoOECZ3wTOw4ygaIgmiUy36iI2DuUkc0
         /n8LRb51454t9glZIc/P/XGc6EvQsO4L1auC3/dtKsnSBPxYbpe6m5h8osrPtXQaybaZ
         9HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FYyVWKxk+0HNNYXmtXDeUQ7akXO6Rlog1Jj94XM4F1Y=;
        b=WX5uDrf8q3Y7wbw5h0w41hJcSzQH5uZbfE7lSfh/DSIZXSfRtuQSvhY8wytbdNzyq1
         Fwj9V56ouiWAD3Ck8rnyXsvbGk+QIr7WkFxo6I4QmmSxNSRAwfJ860qSyjo9u8ehYzIf
         Tf8eT8FLL3n0m7/A/MrO61DwwL0+R5oTDrdAweD/dvJcOvugvhLV8LidI+CXv+WAIjnv
         SUFPl7vLTKmGIzBFUgU5OrKKnnfFSjxI/89AtTeLKswS1C5DbgdOoJYV9+6+BJg7ggEU
         LEg4wl8Bs3EGExKvddxYikTc5GjoGdQ9KyqFPGRkY7KOMezQN4J5LviYidEs7OW/R34l
         VrxA==
X-Gm-Message-State: AOAM531LwvUxAWTdCX2ic/qI3dK1aN4BThDcQHHr5CoKKm1564uqh0az
	jlqN3dfXw5aSXgzKDD5nAyiPd46KxrYvbg==
X-Google-Smtp-Source: ABdhPJw6POllQuM0V42CUy9Mhxg0q/OUQHxgajWF922HxfQFZSPEp6m0TJTNt0I7LC97LpFsdgHUcQ==
X-Received: by 2002:a17:90b:1948:: with SMTP id nk8mr13973537pjb.154.1618683583778;
        Sat, 17 Apr 2021 11:19:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t19sm8393225pjs.1.2021.04.17.11.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 11:19:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 3/3] nodejs: Do not use native host nodejs binaries
Date: Sat, 17 Apr 2021 11:19:38 -0700
Message-Id: <20210417181938.3824401-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210417181938.3824401-1-raj.khem@gmail.com>
References: <20210417181938.3824401-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the wordlength of the binaries which are used for generating inputs
during build should match the target, currently, if world lengths are
not same for build host and target then wrong code is being generated,
so we have two options, use qemu usermode to run the target binaries as
it is during build, which works but takes longer to build and qemu
segfaults on some architectures e.g. mips, second option is to require
multilib toolchain on host and then use matching wordlength for host
binaries. It also means nodejs-native dependency can be dropped which is
kind of nice

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use host binaries instead of qemu usermode

 meta-oe/README                                |  2 +-
 ...te-additional-libs-for-host-binaries.patch | 93 +++++++++++++++++++
 .../nodejs/0002-Using-native-binaries.patch   | 71 --------------
 .../recipes-devtools/nodejs/nodejs_14.16.1.bb | 24 ++---
 4 files changed, 103 insertions(+), 87 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Delete-additional-libs-for-host-binaries.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch

diff --git a/meta-oe/README b/meta-oe/README
index 98f671d7c2..f9aad66f6b 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -7,7 +7,7 @@ URI: git://github.com/openembedded/openembedded-core.git
 branch: master
 revision: HEAD
 
-luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
+luajit and nodejs recipes require host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
 packages to fullfit this might have different names on different host distributions
 e.g. on archlinux based distributions install prerequisites like below
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Delete-additional-libs-for-host-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Delete-additional-libs-for-host-binaries.patch
new file mode 100644
index 0000000000..e3d1afbaf9
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Delete-additional-libs-for-host-binaries.patch
@@ -0,0 +1,93 @@
+From fbf9c3dedc4114065a6db8718daed3dbc98a743c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Apr 2021 09:39:27 -0700
+Subject: [PATCH] Delete additional libs for host binaries
+
+While building host tools during cross build, these libs are not needed
+and would need additional deps if desired to be linked in
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/icu/icu-generic.gyp | 4 ++++
+ tools/v8_gypfiles/v8.gyp  | 7 +++++++
+ 2 files changed, 11 insertions(+)
+
+--- a/tools/icu/icu-generic.gyp
++++ b/tools/icu/icu-generic.gyp
+@@ -522,6 +522,7 @@
+       'target_name': 'genrb',
+       'type': 'executable',
+       'toolsets': [ 'host' ],
++      'libraries!':[ '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
+       'dependencies': [ 'icutools' ],
+       'sources': [
+         '<@(icu_src_genrb)'
+@@ -538,6 +539,7 @@
+       'target_name': 'iculslocs',
+       'toolsets': [ 'host' ],
+       'type': 'executable',
++      'libraries!':[ '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
+       'dependencies': [ 'icutools' ],
+       'sources': [
+         'iculslocs.cc',
+@@ -550,6 +552,7 @@
+       'target_name': 'icupkg',
+       'toolsets': [ 'host' ],
+       'type': 'executable',
++      'libraries!':[ '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
+       'dependencies': [ 'icutools' ],
+       'sources': [
+         '<@(icu_src_icupkg)',
+@@ -561,6 +564,7 @@
+       'target_name': 'genccode',
+       'toolsets': [ 'host' ],
+       'type': 'executable',
++      'libraries!':[ '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
+       'dependencies': [ 'icutools' ],
+       'sources': [
+         '<@(icu_src_genccode)',
+--- a/tools/v8_gypfiles/v8.gyp
++++ b/tools/v8_gypfiles/v8.gyp
+@@ -1310,6 +1310,7 @@
+     {
+       'target_name': 'bytecode_builtins_list_generator',
+       'type': 'executable',
++      'libraries!':[ '-licui18n', '-licuuc', '-licudata', '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
+       'conditions': [
+         ['want_separate_host_toolset', {
+           'toolsets': ['host'],
+@@ -1333,6 +1334,8 @@
+     {
+       'target_name': 'mksnapshot',
+       'type': 'executable',
++      'libraries!':[ '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
++      'library_dirs':[ '../../../../staging_dir/hostpkg/share/icu/current/lib' ],
+       'dependencies': [
+         'v8_base_without_compiler',
+         'v8_compiler_for_mksnapshot',
+@@ -1354,6 +1357,7 @@
+     {
+       'target_name': 'torque',
+       'type': 'executable',
++      'libraries!':[ '-licui18n', '-licuuc', '-licudata', '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
+       'dependencies': [
+         'torque_base',
+         # "build/win:default_exe_manifest",
+@@ -1392,6 +1396,7 @@
+     {
+       'target_name': 'torque-language-server',
+       'type': 'executable',
++      'libraries!':[ '-licui18n', '-licuuc', '-licudata', '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
+       'conditions': [
+         ['want_separate_host_toolset', {
+           'toolsets': ['host'],
+@@ -1419,6 +1424,8 @@
+     {
+       'target_name': 'gen-regexp-special-case',
+       'type': 'executable',
++      'libraries!':[ '-lcrypto', '-lssl', '-lz', '-lhttp_parser', '-luv', '-lnghttp2', '-lcares', '-lbrotlienc', '-lbrotlidec' ],
++      'library_dirs':[ '../../../../staging_dir/hostpkg/share/icu/current/lib' ],
+       'dependencies': [
+         'v8_libbase',
+         # "build/win:default_exe_manifest",
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
deleted file mode 100644
index b5142dc9c1..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00 2001
-From: Guillaume Burel <guillaume.burel@stormshield.eu>
-Date: Fri, 3 Jan 2020 11:25:54 +0100
-Subject: [PATCH] Using native binaries
-
----
- node.gyp                 |  4 ++--
- tools/v8_gypfiles/v8.gyp | 11 ++++-------
- 2 files changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/node.gyp b/node.gyp
-index 8f4dc518..d9389190 100644
---- a/node.gyp
-+++ b/node.gyp
-@@ -446,7 +446,7 @@
-                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
-               ],
-               'action': [
--                '<@(_inputs)',
-+                'mkcodecache',
-                 '<@(_outputs)',
-               ],
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
---- a/tools/v8_gypfiles/v8.gyp
-+++ b/tools/v8_gypfiles/v8.gyp
-@@ -140,7 +140,8 @@
-             '<@(torque_outputs)',
-           ],
-           'action': [
--            '<@(_inputs)',
-+            'torque',
-+            '<@(torque_files)',
-             '-o', '<(torque_output_root)/torque-generated',
-             '-v8-root', '<(V8_ROOT)'
-           ],
-@@ -247,9 +248,7 @@
-             '<(generate_bytecode_builtins_list_output)',
-           ],
-           'action': [
--            'python',
--            '<(V8_ROOT)/tools/run.py',
--            '<@(_inputs)',
-+            'bytecode_builtins_list_generator',
-             '<@(_outputs)',
-           ],
-         },
-@@ -1396,9 +1395,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
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
index 32bdd713b5..3cf69cea00 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
@@ -4,9 +4,8 @@ LICENSE = "MIT & BSD & Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=85bf260d8b6de1588f57abc5dc66587c"
 
 DEPENDS = "openssl"
-DEPENDS_append_class-target = " nodejs-native"
 
-inherit pkgconfig python3native
+inherit pkgconfig python3native siteinfo
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -22,9 +21,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://big-endian.patch \
            file://mips-warnings.patch \
            file://v8-call-new-ListFormatter-createInstance.patch \
-           "
-SRC_URI_append_class-target = " \
-           file://0002-Using-native-binaries.patch \
+           file://0001-Delete-additional-libs-for-host-binaries.patch \
            "
 SRC_URI[sha256sum] = "e44adbbed6756c2c1a01258383e9f00df30c147b36e438f6369b5ef1069abac3"
 
@@ -61,20 +58,17 @@ PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
 PACKAGECONFIG[shared] = "--shared"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
-# We don't want to cross-compile during target compile,
-# and we need to use the right flags during host compile,
-# too.
 EXTRA_OEMAKE = "\
-    CC.host='${CC}' \
-    CFLAGS.host='${CPPFLAGS} ${CFLAGS}' \
-    CXX.host='${CXX}' \
-    CXXFLAGS.host='${CPPFLAGS} ${CXXFLAGS}' \
-    LDFLAGS.host='${LDFLAGS}' \
-    AR.host='${AR}' \
-    \
     builddir_name=./ \
 "
 
+FORCE32BIT = "${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
+EXTRA_OEMAKE_append_class-target = "\
+    CC.host='${BUILD_CC} ${FORCE32BIT}' \
+    CXX.host='${BUILD_CXX} ${FORCE32BIT}' \
+    AR.host='${BUILD_AR}' \
+"
+
 python do_unpack() {
     import shutil
 
-- 
2.31.1

