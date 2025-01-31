Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C696FC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 17:22:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24779.1738344160255084099
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 09:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41264e9b27=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VHMd2t013461;
	Fri, 31 Jan 2025 17:22:39 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44gf780xpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 17:22:39 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 31 Jan 2025 09:22:37 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 31 Jan 2025 09:22:36 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 3/7] nodejs: support cross compile without qemu user conditionally
Date: Fri, 31 Jan 2025 17:22:26 +0000
Message-ID: <20250131172230.687050-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250131172230.687050-1-archana.polampalli@windriver.com>
References: <20250131172230.687050-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JOrBs9Kb c=1 sm=1 tr=0 ts=679d06df cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=-LCu6K_DAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iBOFqOu9Pd5gn2CWdD4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Cd_L79ZYxu9GM5p2N6o99sRrHBuwMkrc
X-Proofpoint-GUID: Cd_L79ZYxu9GM5p2N6o99sRrHBuwMkrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2501310132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115203

From: Hongxu Jia <hongxu.jia@windriver.com>

Due to the scope of supported BSPs by qemu-user is limited, such
as a segment fault on armv9 after qemu apply commit [target/arm:
Convert LDAPR/STLR (imm) to decodetree][1]
```
|tmp-glibc/work/neoversen2-crypto-wrs-linux/nodejs/20.5.1/node-v20.5.1/out/
Release/v8-qemu-wrapper.sh: line 7: 3179613 Segmentation fault      (core dumped)
PSEUDO_UNLOAD=1 qemu-aarch64 -r 5.15 -L tmp-glibc/work/neoversen2-crypto-wrs-linux/
nodejs/20.5.1/recipe-sysroot -E LD_LIBRARY_PATH=tmp-glibc/work/neoversen2-crypto-wrs-linux/
nodejs/20.5.1/recipe-sysroot/usr/lib64:tmp-glibc/work/neoversen2-crypto-wrs-linux/
nodejs/20.5.1/recipe-sysroot/usr/lib64 "$@"
```

Upstream nodejs have cross compile support, but it needs host and target
have same bit width (e.g. a x86_64 host targeting arrch64 to produce a
64-bit binary). So:
1. If host and target have different bit width, build with QEMU user as usual;

2. If host and target have same bit width, enable notejs cross compile support:
- The build tools of nodejs is GYP[2], set CC_host, CFLAGS_host,
  CXX_host, CXXFLAGS_host, LDFLAGS_host, AR_host for host build
  which is separated with target build [3]
- Satisfy layer compatibility, set GYP variables in prefuncs of do_configure,
  do_compile and do_install other than in recipe parsing
- Add missing native packages to fix library missing on host build
- Rework libatomic.patch, explicitly link to libatomic for clang
  conditionally

[1] https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f7585dc78
[2] https://github.com/nodejs/node-gyp
[3] https://github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocumentation.md#cross-compiling

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/libatomic.patch             | 85 +++++++++++++++----
 .../recipes-devtools/nodejs/nodejs_20.16.0.bb | 80 +++++++++++------
 2 files changed, 124 insertions(+), 41 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
index cb0237309e..6b7ccb8a98 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
@@ -1,21 +1,76 @@
-Link mksnapshot with libatomic on x86
+From 15e751e4b79475fb34e4b32a3ca54119b20c564a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 17 Aug 2024 21:33:18 +0800
+Subject: [PATCH] link libatomic for clang conditionally
 
-Clang-12 on x86 emits atomic builtins
+Clang emits atomic builtin, explicitly link libatomic conditionally:
+- For target build, always link -latomic for clang as usual
+- For host build, if host and target have same bit width, cross compiling
+  is enabled, and host toolchain is gcc which does not link -latomic;
+  if host and target have different bit width, no cross compiling,
+  host build is the same with target build that requires to link
+  -latomic;
 
-Fixes
-| module-compiler.cc:(.text._ZN2v88internal4wasm12_GLOBAL__N_123ExecuteCompilationUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8CountersEiNS2_19CompileBaselineOnlyE+0x558): un
-defined reference to `__atomic_load'
+Fix:
+|tmp-glibc/work/core2-64-wrs-linux/nodejs/20.13.0/node-v20.13.0/out/Release/node_js2c: error while loading shared libraries: libatomic.so.1: cannot open shared object file: No such file or directory
 
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [OE specific]
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ node.gyp                 | 13 ++++++++++++-
+ tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/node.gyp b/node.gyp
+index b425f443..f296f35c 100644
+--- a/node.gyp
++++ b/node.gyp
+@@ -487,7 +487,18 @@
+         ],
+       }],
+       ['OS == "linux" and llvm_version != "0.0"', {
+-        'libraries': ['-latomic'],
++        'target_conditions': [
++           ['_toolset=="host"', {
++             'conditions': [
++               ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=="0"', {
++                 'libraries': ['-latomic'],
++               }],
++             ],
++           }],
++           ['_toolset=="target"', {
++             'libraries': ['-latomic'],
++           }],
++        ],
+       }],
+     ],
+   },
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index b23263cf..dcabf4ca 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -1436,6 +1436,7 @@
-     {
-       'target_name': 'mksnapshot',
-       'type': 'executable',
-+      'libraries': [ '-latomic' ],
-       'dependencies': [
-         'v8_base_without_compiler',
-         'v8_compiler_for_mksnapshot',
+@@ -1100,9 +1100,18 @@
+         # Platforms that don't have Compare-And-Swap (CAS) support need to link atomic library
+         # to implement atomic memory access
+         ['v8_current_cpu in ["mips64", "mips64el", "ppc", "arm", "riscv64", "loong64"]', {
+-          'link_settings': {
+-            'libraries': ['-latomic', ],
+-          },
++          'target_conditions': [
++             ['_toolset=="host"', {
++               'conditions': [
++                 ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=="0"', {
++                   'libraries': ['-latomic'],
++                 }],
++               ],
++             }],
++             ['_toolset=="target"', {
++               'libraries': ['-latomic', ],
++             }],
++           ],
+         }],
+       ],
+     },  # v8_base_without_compiler
+--
+2.35.5
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
index 3517fe6dc7..55a9843314 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cef54676c547a5bbab44aa8be3be9ef7"
 
 CVE_PRODUCT = "nodejs node.js"
 
-DEPENDS = "openssl file-replacement-native python3-packaging-native"
+DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-native"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest
+inherit pkgconfig python3native qemu ptest siteinfo
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -24,15 +24,12 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
+           file://libatomic.patch \
            file://run-ptest \
            "
-
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
            "
-SRC_URI:append:toolchain-clang:x86 = " \
-           file://libatomic.patch \
-           "
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
@@ -66,28 +63,14 @@ ARCHFLAGS ?= ""
 
 PACKAGECONFIG ??= "ares brotli icu zlib"
 
-PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
-PACKAGECONFIG[brotli] = "--shared-brotli,,brotli"
-PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
+PACKAGECONFIG[ares] = "--shared-cares,,c-ares c-ares-native"
+PACKAGECONFIG[brotli] = "--shared-brotli,,brotli brotli-native"
+PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu icu-native"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
 PACKAGECONFIG[shared] = "--shared"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
-# We don't want to cross-compile during target compile,
-# and we need to use the right flags during host compile,
-# too.
-EXTRA_OEMAKE = "\
-    CC.host='${CC} -pie -fPIE' \
-    CFLAGS.host='${CPPFLAGS} ${CFLAGS}' \
-    CXX.host='${CXX} -pie -fPIE' \
-    CXXFLAGS.host='${CPPFLAGS} ${CXXFLAGS}' \
-    LDFLAGS.host='${LDFLAGS}' \
-    AR.host='${AR}' \
-    \
-    builddir_name=./ \
-"
-
 EXTRANATIVEPATH += "file-native"
 
 python prune_sources() {
@@ -110,9 +93,11 @@ do_unpack[postfuncs] += "prune_sources"
 # V8's JIT infrastructure requires binaries such as mksnapshot and
 # mkpeephole to be run in the host during the build. However, these
 # binaries must have the same bit-width as the target (e.g. a x86_64
-# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
-# depending on a third Yocto toolchain, we just build those binaries
-# for the target and run them on the host with QEMU.
+# host targeting ARMv6 needs to produce a 32-bit binary).
+# 1. If host and target have the different bit width, run those
+#    binaries for the target and run them on the host with QEMU.
+# 2. If host and target have the same bit width, enable upstream
+#    cross crompile support and no QEMU
 python do_create_v8_qemu_wrapper () {
     """Creates a small wrapper that invokes QEMU to run some target V8 binaries
     on the host."""
@@ -120,6 +105,10 @@ python do_create_v8_qemu_wrapper () {
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
     qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
                                     qemu_libdirs)
+
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
+        qemu_cmd = ""
+
     wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
         wrapper_file.write("""#!/bin/sh
@@ -138,6 +127,14 @@ addtask create_v8_qemu_wrapper after do_configure before do_compile
 
 LDFLAGS:append:x86 = " -latomic"
 
+export CC_host
+export CFLAGS_host
+export CXX_host
+export CXXFLAGS_host
+export LDFLAGS_host
+export AR_host
+export HOST_AND_TARGET_SAME_WIDTH
+
 CROSS_FLAGS = "--cross-compiling"
 CROSS_FLAGS:class-native = "--no-cross-compiling"
 
@@ -179,4 +176,35 @@ RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \
 PACKAGES =+ "${PN}-systemtap"
 FILES:${PN}-systemtap = "${datadir}/systemtap"
 
+do_configure[prefuncs] += "set_gyp_variables"
+do_compile[prefuncs] += "set_gyp_variables"
+do_install[prefuncs] += "set_gyp_variables"
+python set_gyp_variables () {
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "0":
+        # We don't want to cross-compile during target compile,
+        # and we need to use the right flags during host compile,
+        # too.
+        d.setVar("CC_host", d.getVar("CC") + " -pie -fPIE")
+        d.setVar("CFLAGS_host", d.getVar("CFLAGS"))
+        d.setVar("CXX_host", d.getVar("CXX") + " -pie -fPIE")
+        d.setVar("CXXFLAGS_host", d.getVar("CXXFLAGS"))
+        d.setVar("LDFLAGS_host", d.getVar("LDFLAGS"))
+        d.setVar("AR_host", d.getVar("AR"))
+    elif d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
+        # Enable upstream cross crompile support
+        d.setVar("CC_host", d.getVar("BUILD_CC"))
+        d.setVar("CFLAGS_host", d.getVar("BUILD_CFLAGS"))
+        d.setVar("CXX_host", d.getVar("BUILD_CXX"))
+        d.setVar("CXXFLAGS_host", d.getVar("BUILD_CXXFLAGS"))
+        d.setVar("LDFLAGS_host", d.getVar("BUILD_LDFLAGS"))
+        d.setVar("AR_host", d.getVar("BUILD_AR"))
+}
+python __anonymous () {
+    # 32 bit target and 64 bit host (x86-64 or aarch64) have different bit width
+    if d.getVar("SITEINFO_BITS") == "32" and "64" in d.getVar("BUILD_ARCH"):
+        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
+    else:
+        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
+}
+
 BBCLASSEXTEND = "native"
-- 
2.40.0


