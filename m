Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3375CCE7B0F
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 09:13:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9722.1695892405269317227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 02:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pvbtc2MW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7635b06aa0=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38S6ebVj020099
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 09:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=YKf9dohi8V8Kw6bPYB
	md6TzXab5O96FJY+ANkHVoeVQ=; b=pvbtc2MWcMjY2pI+1cQ41G9C/jAwmbdmO0
	XBhnsJZIDnvm0q9/XUY4JyCl556GL7xNGcy3P5AJg0U+CB46cpVYRxaUHteGpU8g
	UsU3zu9K84aymVMp5fOteM0IiwZgPkhVcyksLzKCdpm/UhxpGXq25q17SZ+Ksr5T
	egngLci9XWbjp5IzO5g6o5gKnJELClkSrPRhNPzH6nMDoeHJ3eGntiLlGXHZfo+p
	aqAgI+CM51NLpn2Y2aP84dypAQo8jI73ArX2JQ03avwFHAxVSTHs1KP5xRTl40MX
	I/Hj6zBHl3jS4/9M0IGlCIzsZjoznqqVrMSTnGtn7N8eLnsIHdTw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x4wx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 09:13:24 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 02:13:21 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.1 -> 20.5.1
Date: Thu, 28 Sep 2023 09:13:04 +0000
Message-ID: <20230928091304.4000026-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 3fTCHz09oGD5MFY_C-giJmcWegCin4DV
X-Proofpoint-GUID: 3fTCHz09oGD5MFY_C-giJmcWegCin4DV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_06,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309280078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38S6ebVj020099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 09:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105217

Update to latest release of latest LTS 20 release

    * node v20 introduces several new features and fixes many bugs and CV=
Es as shown in [1]

    * Refresh 0001-liftoff-Correct-function-signatures.patch against 20.5=
.1

    * License-Update:
       - Change zlib version 1.2.13, October 13th, 2022 to version 1.2.13=
.1, October xxth, 2022 [2]
       - Change Copyright 2023 from Ada authors to Yagiz Nizipli and Dani=
el Lemire [4]

    * Remove big-endian.patch as it is merged in v20.x [5] [6]

    * Remove below list of patches since mips32 is deleted from v8 as par=
t of update V8 to 10.7.193.13 [7] [8]
       - mips-less-memory.patch
       - 0001-mips-Use-32bit-cast-for-operand-on-mips32.patch

    * Update Using-native-binaries.patch for node_js2c, it resolved below=
 do_compile error [9]
       Error:
       /bin/sh: line 1: build/tmp/work/core2-64-poky-linux/nodejs/20.5.1/=
node-v20.5.1/out/Release/node_js2c: No such file or directory

    * Remove obsolete dtrace & etw configure options (we had: --without-<=
feature>) from the recipe [10]

https://github.com/nodejs/node/releases/tag/v20.5.1

[1] https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20=
.md
[2] https://github.com/nodejs/node/commit/f1007325753e62b13083f6e9e499fdc=
33f753d7d
[3] https://github.com/nodejs/node/commit/900ae1bda76caaa7213431a5268560b=
578ed2d55
[4] https://github.com/nodejs/node/commit/d2465369243bc4313d9840b62c2393c=
4f179ffbb
[5] https://github.com/v8/v8/commit/3cea5d5425c3a0d7d1768b3758269ac98875d=
e77
[6] https://github.com/nodejs/node/commit/f226350fcbebd4449fb0034fdaffa14=
7e4de28ea
[7] https://github.com/v8/v8/commit/a26ca5ed147dde47f02d70c5b38d8befc1c93=
cb3
[8] https://github.com/nodejs/node/commit/6bd756d7c6dfb7dc25daee329ad70df=
68c14223e
[9] https://github.com/nodejs/node/commit/4da7bc915c714989eba7eab753db9eb=
9ebd8451a
[10] https://github.com/nodejs/node/commit/aa3a572e6bee116cde69508dc29478=
b40f40551a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                              |  0
 ...8.17.bb =3D> nodejs-oe-cache-native_20.5.bb} |  0
 .../nodejs/0001-Using-native-binaries.patch   | 19 ++++++++-
 ...-liftoff-Correct-function-signatures.patch | 42 +++++++------------
 ...Use-32bit-cast-for-operand-on-mips32.patch | 34 ---------------
 .../nodejs/nodejs/big-endian.patch            | 18 --------
 .../nodejs/nodejs/mips-less-memory.patch      | 37 ----------------
 .../{nodejs_18.17.1.bb =3D> nodejs_20.5.1.bb}   |  9 +---
 8 files changed, 34 insertions(+), 125 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.17 =3D> nodej=
s-oe-cache-20.5}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.17.bb =
=3D> nodejs-oe-cache-native_20.5.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-=
32bit-cast-for-operand-on-mips32.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/big-endian.pat=
ch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memo=
ry.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.17.1.bb =3D> nodejs_20=
.5.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cach=
e
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-=
cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cac=
he
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.=
bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-bin=
aries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-bi=
naries.patch
index 66e10a0d0..0178cec77 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.p=
atch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.p=
atch
@@ -12,7 +12,7 @@ https://git.openembedded.org/meta-openembedded/commit/?=
id=3Dfeeb172d1a8bf010490d22
=20
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- node.gyp                 | 1 +
+ node.gyp                 | 3 +
  tools/v8_gypfiles/v8.gyp | 5 +++++
  2 files changed, 6 insertions(+)
=20
@@ -28,6 +28,23 @@ index e8e1d9f9..e60ccc10 100644
                      '<(node_mksnapshot_exec)',
                      '<(node_snapshot_main)',
                    ],
+@@ -935,6 +935,7 @@
+           'action_name': 'node_js2c',
+           'process_outputs_as_sources': 1,
+           'inputs': [
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(node_js2c_exec)',
+             '<@(library_files)',
+             '<@(deps_files)',
+@@ -944,6 +945,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/node_javascript.cc',
+           ],
+           'action': [
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+             '<(node_js2c_exec)',
+             '<@(_outputs)',
+             'lib',
+
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
 index 42e26cd9..bc721991 100644
 --- a/tools/v8_gypfiles/v8.gyp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-=
function-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-l=
iftoff-Correct-function-signatures.patch
index c9a522d2e..5af87d866 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-functio=
n-signatures.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-functio=
n-signatures.patch
@@ -1,6 +1,6 @@
 From dc3652c0abcdf8573fd044907b19d8eda7ca1124 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Oct 2021 12:49:58 -0700
+Date: Mon, 3 Jul 2023 12:33:16 +0000
 Subject: [PATCH] [liftoff] Correct function signatures
=20
 Fixes builds on mips where clang reports an error
@@ -13,16 +13,15 @@ Upstream-Status: Submitted [https://chromium-review.g=
ooglesource.com/c/v8/v8/+/3
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
  deps/v8/src/wasm/baseline/liftoff-assembler.h               | 6 +++---
- deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h     | 2 +-
  deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h | 2 +-
- .../src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h   | 2 +-
- 4 files changed, 6 insertions(+), 6 deletions(-)
+ deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/deps/v8/src/wasm/baseline/liftoff-assembler.h b/deps/v8/src=
/wasm/baseline/liftoff-assembler.h
-index 22c7f73a..db4cb168 100644
+index aef63c64..f2a11b01 100644
 --- a/deps/v8/src/wasm/baseline/liftoff-assembler.h
 +++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-@@ -646,7 +646,7 @@ class LiftoffAssembler : public TurboAssembler {
+@@ -717,7 +717,7 @@ class LiftoffAssembler : public MacroAssembler {
    void FinishCall(const ValueKindSig*, compiler::CallDescriptor*);
 =20
    // Move {src} into {dst}. {src} and {dst} must be different.
@@ -31,7 +30,7 @@ index 22c7f73a..db4cb168 100644
 =20
    // Parallel register move: For a list of tuples <dst, src, kind>, mov=
e the
    // {src} register of kind {kind} into {dst}. If {src} equals {dst}, i=
gnore
-@@ -795,8 +795,8 @@ class LiftoffAssembler : public TurboAssembler {
+@@ -884,8 +884,8 @@ class LiftoffAssembler : public MacroAssembler {
    inline void MoveStackValue(uint32_t dst_offset, uint32_t src_offset,
                               ValueKind);
 =20
@@ -42,24 +41,11 @@ index 22c7f73a..db4cb168 100644
 =20
    inline void Spill(int offset, LiftoffRegister, ValueKind);
    inline void Spill(int offset, WasmValue);
-diff --git a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h b/d=
eps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-index c76fd2f4..0fffe231 100644
---- a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-+++ b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-@@ -661,7 +661,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regi=
ster offset_reg,
-     pinned =3D pinned | LiftoffRegList{dst_op.rm(), src};
-     LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
-     // Save original value.
--    Move(tmp, src, type.value_type());
-+    Move(tmp, src, type.value_type().kind());
-=20
-     src =3D tmp;
-     pinned.set(tmp);
 diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h=
 b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-index 36413545..48207337 100644
+index 96cba24c..53e1842d 100644
 --- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
 +++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-@@ -593,7 +593,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regi=
ster offset_reg,
+@@ -592,7 +592,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regi=
ster offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -68,11 +54,11 @@ index 36413545..48207337 100644
 =20
      src =3D tmp;
      pinned.set(tmp);
-diff --git a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64=
.h b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-index 642a7d2a..56ffcc2a 100644
---- a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-+++ b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-@@ -589,7 +589,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regi=
ster offset_reg,
+diff --git a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h=
 b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
+index 1d6ae09e..397e82b2 100644
+--- a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
++++ b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64.h
+@@ -286,7 +286,7 @@ void LiftoffAssembler::Store(Register dst_addr, Regi=
ster offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -82,4 +68,4 @@ index 642a7d2a..56ffcc2a 100644
      src =3D tmp;
      pinned.set(tmp);
 --
-2.34.1
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-c=
ast-for-operand-on-mips32.patch b/meta-oe/recipes-devtools/nodejs/nodejs/=
0001-mips-Use-32bit-cast-for-operand-on-mips32.patch
deleted file mode 100644
index a0242d8e1..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for=
-operand-on-mips32.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e65dde8db17da5acddeef7eb9316199c4e5e0811 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Apr 2022 12:40:25 -0700
-Subject: [PATCH] mips: Use 32bit cast for operand on mips32
-
-Fixes
-deps/v8/src/compiler/backend/mips/code-generator-mips.cc: In member func=
tion 'void v8::internal::compiler::CodeGenerator::AssembleReturn(v8::inte=
rnal::compiler::InstructionOperand*)':
-../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4233:48: err=
or: call of overloaded 'Operand(int64_t)' is ambiguous
- 4233 |                 Operand(static_cast<int64_t>(0)));
-      |                                                ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- deps/v8/src/compiler/backend/mips/code-generator-mips.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc b/=
deps/v8/src/compiler/backend/mips/code-generator-mips.cc
-index 2b8197e..b226140 100644
---- a/deps/v8/src/compiler/backend/mips/code-generator-mips.cc
-+++ b/deps/v8/src/compiler/backend/mips/code-generator-mips.cc
-@@ -4230,7 +4230,7 @@ void CodeGenerator::AssembleReturn(InstructionOper=
and* additional_pop_count) {
-     } else if (FLAG_debug_code) {
-       __ Assert(eq, AbortReason::kUnexpectedAdditionalPopValue,
-                 g.ToRegister(additional_pop_count),
--                Operand(static_cast<int64_t>(0)));
-+                Operand(static_cast<int32_t>(0)));
-     }
-   }
-   // Functions with JS linkage have at least one parameter (the receive=
r).
---=20
-2.36.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch b/me=
ta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
deleted file mode 100644
index 529381842..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-https://github.com/v8/v8/commit/878ccb33bd3cf0e6dc018ff8d15843f585ac07be
-
-did some automated cleanups but it missed big-endian code.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/deps/v8/src/runtime/runtime-utils.h
-+++ b/deps/v8/src/runtime/runtime-utils.h
-@@ -126,7 +126,7 @@ static inline ObjectPair MakePair(Object
- #if defined(V8_TARGET_LITTLE_ENDIAN)
-   return x.ptr() | (static_cast<ObjectPair>(y.ptr()) << 32);
- #elif defined(V8_TARGET_BIG_ENDIAN)
--  return y->ptr() | (static_cast<ObjectPair>(x->ptr()) << 32);
-+  return y.ptr() | (static_cast<ObjectPair>(x.ptr()) << 32);
- #else
- #error Unknown endianness
- #endif
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patc=
h b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
deleted file mode 100644
index 16776cb76..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Description: mksnapshot uses too much memory on 32-bit mipsel
-Author: J=C3=A9r=C3=A9my Lal <kapouer@melix.org>
-Last-Update: 2020-06-03
-Forwarded: https://bugs.chromium.org/p/v8/issues/detail?id=3D10586
-
-This ensures that we reserve 500M instead of 2G range for codegen
-ensures that qemu-mips can allocate such large ranges
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Imported from debian https://salsa.debian.org/js-team/nodejs/-/blob/mast=
er-12.x/debian/patches/mips-less-memory.patch
-https://buildd.debian.org/status/fetch.php?pkg=3Dnodejs&arch=3Dmipsel&ve=
r=3D12.17.0~dfsg-2&stamp=3D1591050388&raw=3D0
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/deps/v8/src/common/globals.h
-+++ b/deps/v8/src/common/globals.h
-@@ -224,7 +224,7 @@ constexpr size_t kMinimumCodeRangeSize =3D
- constexpr size_t kMinExpectedOSPageSize =3D 64 * KB;  // OS page on PPC=
 Linux
- #elif V8_TARGET_ARCH_MIPS
- constexpr bool kPlatformRequiresCodeRange =3D false;
--constexpr size_t kMaximalCodeRangeSize =3D 2048LL * MB;
-+constexpr size_t kMaximalCodeRangeSize =3D 512 * MB;
- constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;
- constexpr size_t kMinExpectedOSPageSize =3D 4 * KB;  // OS page.
- #else
---- a/deps/v8/src/codegen/mips/constants-mips.h
-+++ b/deps/v8/src/codegen/mips/constants-mips.h
-@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInIn
- namespace v8 {
- namespace internal {
-=20
--constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 4096;
-+constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 1024;
-=20
- // --------------------------------------------------------------------=
---------
- // Registers and FPURegisters.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.5.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb
index ee5e848bf..6bb0f7fab 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE =3D "http://nodejs.org"
 LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Ap=
ache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbc1f9ebe76be76f163e3b675303ad=
9cd"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D059ecf3a6f87111685e51b611b956=
3e5"
=20
 CVE_PRODUCT =3D "nodejs node.js"
=20
@@ -22,11 +22,8 @@ COMPATIBLE_HOST:powerpc =3D "null"
 SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch =
\
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
-           file://big-endian.patch \
-           file://mips-less-memory.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
-           file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://run-ptest \
            "
=20
@@ -39,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
 SRC_URI:append:toolchain-clang:powerpc64le =3D " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] =3D "f215cf03d0f00f07ac0b674c6819f804c1542e16f152da04=
980022aeccf5e65a"
+SRC_URI[sha256sum] =3D "439c71aa2f38c2861657bfa538e99191a571258066cbfd45=
48586049c8134190"
=20
 S =3D "${WORKDIR}/node-v${PV}"
=20
@@ -148,8 +145,6 @@ do_configure () {
     # $TARGET_ARCH settings don't match --dest-cpu settings
     python3 configure.py --verbose --prefix=3D${prefix} \
                --shared-openssl \
-               --without-dtrace \
-               --without-etw \
                --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH'),=
 d)}" \
                --dest-os=3Dlinux \
                --libdir=3D${baselib} \
--=20
2.40.0


