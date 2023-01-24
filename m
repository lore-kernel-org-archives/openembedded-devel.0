Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A85AC38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 15:53:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18703.1674575575226064263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 07:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fQGHvjhu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0388b930f9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OFUjIF018220
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 15:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=N1TaypnWhx9xFXHYxGSS7Sn3sPX+FnkE47nH22ech50=;
 b=fQGHvjhuSBREen1oNUgfdxbFYVkcaxOTKXiQkdcSlhifrrHQXk8VS/Lp5/ZkoItknZDG
 pfaTTYLG1gJGqAREkk3ZYh2rd4M9BZrIWdBz1bl71SH291XClT/0i28PCAod1yr8cLMT
 tdl87QLAkAY4RUI8SsUrXs66ygckN0cSpiJIvLxui84rxrft3193GI0YAFSqvF41tLj1
 7PIeQVJhoBurVi4OS6sNlE6vbNFYUONeasVFlz9nEXZxNifNMUWKxQMaRLGHJnJ5/mdH
 AgSdM/Yv7Eng+qHp4sHDKvPJb3GUB1M++yKEeRz9n7/dhVQmKasKJoxYiwV5Fypr3qMO OQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n871a3aha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 15:52:54 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 24 Jan 2023 07:52:51 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 24 Jan 2023 07:52:48 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>,
        Archana Polampalli
	<archana.polampalli@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] Nodejs: Upgrade to 18.12.1
Date: Tue, 24 Jan 2023 15:52:39 +0000
Message-ID: <20230124155239.1124008-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bbiQgh9KwZOo5ATV7sef4iQCrryvEhxz
X-Proofpoint-GUID: bbiQgh9KwZOo5ATV7sef4iQCrryvEhxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240144
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 15:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100724

Node-18 is the current LTS release, node-19 is a development release and
node-20 is scheduled to be released until 2023-04-18 which is too late for YP-4.2
https://github.com/nodejs/release

* Refresh below two patches
   - 0001-Using-native-binaries.patch
   - 0001-liftoff-Correct-function-signatures.patch

* Copy openssl.cnf from sysroot_native to nodejs-openssl.cnf
  otherwise do_compile failed:
     make[1]: *** No rule to make target '../deps/openssl/nodejs-openssl.cnf',
     needed by 'Release/obj.target/deps/openssl/openssl.cnf'.  Stop.

* Add initial ptest support using ctest only, it covered 20% of the nodejs tests.
  There are some more tests exist to add but will require additional work.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                              |  0
 ....18.bb => nodejs-oe-cache-native_18.12.bb} |  0
 .../nodejs/0001-Using-native-binaries.patch   | 24 +++++---------
 ...-liftoff-Correct-function-signatures.patch | 32 +++++++++++++------
 .../{nodejs_16.18.1.bb => nodejs_18.12.1.bb}  | 15 ++++++---
 5 files changed, 42 insertions(+), 29 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.18 => nodejs-oe-cache-18.12}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.18.bb => nodejs-oe-cache-native_18.12.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.18.1.bb => nodejs_18.12.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.12/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.12/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.12.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.12.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
index 445aaf839..feafe38fd 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
@@ -5,32 +5,24 @@ Subject: [PATCH] Using native binaries
 
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- node.gyp                 | 2 ++
+ node.gyp                 | 1 +
  tools/v8_gypfiles/v8.gyp | 5 +++++
- 2 files changed, 7 insertions(+)
+ 2 files changed, 6 insertions(+)
 
 diff --git a/node.gyp b/node.gyp
-index 24505da7ba..7d41bd52db 100644
+index e8e1d9f9..e60ccc10 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -319,6 +319,7 @@
-               'action_name': 'run_mkcodecache',
-               'process_outputs_as_sources': 1,
-               'inputs': [
-+                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-                 '<(mkcodecache_exec)',
-               ],
-               'outputs': [
-@@ -366,6 +367,7 @@
+@@ -320,6 +320,7 @@
                    'action_name': 'node_mksnapshot',
                    'process_outputs_as_sources': 1,
                    'inputs': [
 +                    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
                      '<(node_mksnapshot_exec)',
+                     '<(node_snapshot_main)',
                    ],
-                   'outputs': [
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index ed042f8829..371b8e02c2 100644
+index 42e26cd9..bc721991 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
 @@ -68,6 +68,7 @@
@@ -57,7 +49,7 @@ index ed042f8829..371b8e02c2 100644
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
-@@ -395,6 +398,7 @@
+@@ -400,6 +403,7 @@
              ],
            },
            'inputs': [
@@ -65,7 +57,7 @@ index ed042f8829..371b8e02c2 100644
              '<(mksnapshot_exec)',
            ],
            'outputs': [
-@@ -1513,6 +1517,7 @@
+@@ -1539,6 +1543,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
index d7005ae97..c9a522d2e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
@@ -9,14 +9,20 @@ Fixes builds on mips where clang reports an error
     ^~~~
 
 Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/v8/v8/+/3235674]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- src/wasm/baseline/liftoff-assembler.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ deps/v8/src/wasm/baseline/liftoff-assembler.h               | 6 +++---
+ deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h     | 2 +-
+ deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h | 2 +-
+ .../src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h   | 2 +-
+ 4 files changed, 6 insertions(+), 6 deletions(-)
 
+diff --git a/deps/v8/src/wasm/baseline/liftoff-assembler.h b/deps/v8/src/wasm/baseline/liftoff-assembler.h
+index 22c7f73a..db4cb168 100644
 --- a/deps/v8/src/wasm/baseline/liftoff-assembler.h
 +++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-@@ -613,7 +613,7 @@ class LiftoffAssembler : public TurboAss
+@@ -646,7 +646,7 @@ class LiftoffAssembler : public TurboAssembler {
    void FinishCall(const ValueKindSig*, compiler::CallDescriptor*);
  
    // Move {src} into {dst}. {src} and {dst} must be different.
@@ -25,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    // Parallel register move: For a list of tuples <dst, src, kind>, move the
    // {src} register of kind {kind} into {dst}. If {src} equals {dst}, ignore
-@@ -759,8 +759,8 @@ class LiftoffAssembler : public TurboAss
+@@ -795,8 +795,8 @@ class LiftoffAssembler : public TurboAssembler {
    inline void MoveStackValue(uint32_t dst_offset, uint32_t src_offset,
                               ValueKind);
  
@@ -36,10 +42,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    inline void Spill(int offset, LiftoffRegister, ValueKind);
    inline void Spill(int offset, WasmValue);
+diff --git a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
+index c76fd2f4..0fffe231 100644
 --- a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
 +++ b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-@@ -658,7 +658,7 @@ void LiftoffAssembler::Store(Register ds
-     pinned = pinned | LiftoffRegList::ForRegs(dst_op.rm(), src);
+@@ -661,7 +661,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
+     pinned = pinned | LiftoffRegList{dst_op.rm(), src};
      LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
 -    Move(tmp, src, type.value_type());
@@ -47,9 +55,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
      src = tmp;
      pinned.set(tmp);
+diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
+index 36413545..48207337 100644
 --- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
 +++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-@@ -596,7 +596,7 @@ void LiftoffAssembler::Store(Register ds
+@@ -593,7 +593,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -58,9 +68,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
      src = tmp;
      pinned.set(tmp);
+diff --git a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
+index 642a7d2a..56ffcc2a 100644
 --- a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
 +++ b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-@@ -580,7 +580,7 @@ void LiftoffAssembler::Store(Register ds
+@@ -589,7 +589,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -69,3 +81,5 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
      src = tmp;
      pinned.set(tmp);
+--
+2.34.1
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
index a67948320..e96913e56 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6e54852cd826c41e80c6d80f6db00a85"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dfd7ae796baf5326016a3865ee1dc632"
 
 DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu
+inherit pkgconfig python3native qemu ptest
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -26,6 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            "
+
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
            "
@@ -35,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238"
+SRC_URI[sha256sum] = "4fa406451bc52659a290e52cfdb2162a760bd549da4b8bbebe6a29f296d938df"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -151,6 +152,7 @@ do_configure () {
 
 do_compile () {
     export LD="${CXX}"
+    install -D ${RECIPE_SYSROOT_NATIVE}/etc/ssl/openssl.cnf ${B}/deps/openssl/nodejs-openssl.cnf
     install -D ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wrapper.sh
     oe_runmake BUILDTYPE=Release
 }
@@ -159,10 +161,15 @@ do_install () {
     oe_runmake install DESTDIR=${D}
 }
 
+do_install_ptest () {
+    cp -r  ${B}/out/Release/cctest ${D}${PTEST_PATH}/
+    cp -r ${B}/test ${D}${PTEST_PATH}
+    chown -R root:root ${D}${PTEST_PATH}
+}
+
 BINARIES = " \
     bytecode_builtins_list_generator \
     ${@bb.utils.contains('PACKAGECONFIG', 'icu', 'gen-regexp-special-case', '', d)} \
-    mkcodecache \
     node_mksnapshot \
     torque \
 "
-- 
2.34.1


