Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89762C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:21 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24534.1786747631400063861
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cyc2b9U9;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1056520a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747631; x=1787352431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/IylRW4WnEoN7WEoAL91a4NtwiGLPrT6NHjNyBHG6s=;
        b=cyc2b9U9hHnAYPU8tqJpVeKbN/Qq2hpNd4A+bSDsfXokhRvK0JFrMmeCKKhFVL7eyA
         uE3eWOzYJ7ne6/pfAsyOF6Rd47DbXGHFVQBIdgKX/XHgW4LROUFzNP4MhMB/w0R0OjXD
         N2zQhcIvpCxbT8kyFsIC4gWkxaenvJb7M3L6t5Qv+b8cA0ZThov0yKzMjJkJFH5xuIao
         xRks2zBoSk4p5IjV+tALQrCxIN+Xk7yzEuoqcbfFgV0PUkBNpNPXlB7A0fVe4q8xzMon
         QyO4zOngHmg7v3MqyHdGBtWR68NxL4EPp2BWaincSpUOOFpuTAxZDGHdpXMLrC7N3oiO
         k/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747631; x=1787352431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/IylRW4WnEoN7WEoAL91a4NtwiGLPrT6NHjNyBHG6s=;
        b=N2KevoLcppN/+aViz/Nl2BkQojCKVUVnQ2fVo4VWTdv2bhTqWkkKYzY9lBvQk5BHfk
         lu/cVboyg5+t1JqHefvH27vvEJZaCUVwG8cihymkAKojc/yntTkKoUekRrwnGHVqUro7
         K/rLT4IgnnO59+O3UE/nUs9b63oYjfhiDGLs+ZSA1Cavtw4f3Pqd8w8oVjqcnkny8md7
         2T4PzKHh29VdYlWPxs685rWenf1CLMon3826Yes9mrR9nMqbd1OaARTONWL2pI7asHDA
         keBeVbIhRG6ueLjJbVm3sv4uAJ4Rt4daSPoZqGIvFdcPCINneEN0xcdARr1wRDKCKb49
         28Pw==
X-Gm-Message-State: AOJu0Yy0NbpbkkgBX8TxD6c7DeArelthf4NrJ9nUdR4j6LpTIKWyiRYn
	S1SAxZReErQuQyWiHfG+dTu+VVbI+Sn2oEVUK8U8qgPx3uEgT6ywOUMJmhlUojU0
X-Gm-Gg: AR+sD10c0rX6z6zBXkRrIkIwxx9JXA1cD4yaPY0ct4DHy7ZbYUJHiR0lknDFDoObDrd
	7u5w9/0dnqvUHfy41hOH6cxipZvL7DpEvEb17sWN/AO2dHnSMVDfUPInis/D1GlU+2xW1qzkoWr
	8EmmMolP49IF/MoQjXOT+8i121V8jjLNR/fLV5LffflQXg8af0F+lVEQQT3r2AJmn44rclJQluu
	stI5lrJe8CKf0wvd+yjq3ydOJtCUdo7mO0jSMSOglGoLcw3EvdA56qGdXn+vZtD53xxea1N3w6y
	7DPm72/2KC+pUrUHD/6+BYd43rfLqofwvZ78UI3dlh0xCXINnyPgD2eKhBfCVCSCgy5sN525+NN
	Tr9HcYe4rXfKy2yoWfS6uAKwNhy4GTqqwkwiacq4PPKY1CltCaHciZ0niBgbREjz62s758p5jue
	4Qv0+pFD5K2nLv1jJjPIMaY4bYeLDlfaai+iDXf5fvwHmry7/vjQSgPffcgZJgRGi0SdTy+gb9Y
	edpEB7la4s5Thi2CwfAgdgQmYOhTMyRAYBzU1b8/JxIt2p2UV1GEC+VhX1BBcUSqrlQglAWROPa
	FnqxN9MmFIDOjtA1H9lhrnTL14ke/uAG+HMzB05tVYUi9BW1xBe/wHdLdWhAnBRMmzhi5A3zDN6
	GSDevu1SROEse59wTqd4VfD7mTIwIdnO4K/uUOLUqHWswiQ==
X-Received: by 2002:a17:90b:390f:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-3931f4ba268mr12359294a91.9.1786747630711;
        Fri, 14 Aug 2026 15:47:10 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 078/109] nodejs: upgrade 24.18.1 -> 24.19.0
Date: Fri, 14 Aug 2026 15:45:04 -0700
Message-ID: <20260814224539.1523174-78-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129142

Point release. Two patches needed rebasing:
0009-Using-native-binaries.patch's context shifted because upstream added
its own '<@(emulator)' gyp variable (defaults to empty in common.gypi) to a
couple of the same action arrays this patch touches; this recipe never sets
GYP_DEFINES emulator=..., so it stays empty and our v8-qemu-wrapper.sh
insertion is unaffected either way. 0007-positional-args.patch's single-line
shebang fix (bash -> sh) was already applied on top of an unrelated wording
change upstream made to the same 3-line fixture file, just offset by one
line (context-only).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nodejs-24/0007-positional-args.patch      |  5 +-
 .../0009-Using-native-binaries.patch          | 49 ++++++++++---------
 .../{nodejs_24.18.1.bb => nodejs_24.19.0.bb}  |  2 +-
 3 files changed, 29 insertions(+), 27 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.18.1.bb => nodejs_24.19.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch
index 5fd6aee351..42b2e6c8e0 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch
@@ -9,11 +9,12 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/fixtures/run-script/node_modules/.bin/positional-args b/test/fixtures/run-script/node_modules/.bin/positional-args
-index 2d809237..3dc5314f 100755
 --- a/test/fixtures/run-script/node_modules/.bin/positional-args
 +++ b/test/fixtures/run-script/node_modules/.bin/positional-args
 @@ -1,3 +1,3 @@
 -#!/bin/bash
 +#!/bin/sh
  echo "Arguments: '$@'"
- echo "The total number of arguments are: $#"
+ echo "The total number of arguments is: $#"
+--
+2.34.1
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch
index 0178cec777..2e2d2bf3f7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch
@@ -10,25 +10,21 @@ https://git.openembedded.org/meta-openembedded/commit/?id=1c8e4a679ae382f953b2e5
 later extended and renamed in:
 https://git.openembedded.org/meta-openembedded/commit/?id=feeb172d1a8bf010490d22b8df9448b20d9d2aed
 
+Rebased on 24.19.0: upstream added its own '<@(emulator)' gyp variable
+(defaults to empty in common.gypi) to a couple of the same action arrays this
+patch touches; this recipe never sets GYP_DEFINES emulator=..., so it stays
+empty and our v8-qemu-wrapper.sh insertion is unaffected either way.
+
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- node.gyp                 | 3 +
+ node.gyp                 | 3 +++
  tools/v8_gypfiles/v8.gyp | 5 +++++
- 2 files changed, 6 insertions(+)
+ 2 files changed, 8 insertions(+)
 
 diff --git a/node.gyp b/node.gyp
-index e8e1d9f9..e60ccc10 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -320,6 +320,7 @@
-                   'action_name': 'node_mksnapshot',
-                   'process_outputs_as_sources': 1,
-                   'inputs': [
-+                    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-                     '<(node_mksnapshot_exec)',
-                     '<(node_snapshot_main)',
-                   ],
-@@ -935,6 +935,7 @@
+@@ -993,6 +993,7 @@
            'action_name': 'node_js2c',
            'process_outputs_as_sources': 1,
            'inputs': [
@@ -36,20 +32,26 @@ index e8e1d9f9..e60ccc10 100644
              '<(node_js2c_exec)',
              '<@(library_files)',
              '<@(deps_files)',
-@@ -944,6 +945,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/node_javascript.cc',
+@@ -1013,6 +1014,7 @@
            ],
            'action': [
+             '<@(emulator)',
 +            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
              '<(node_js2c_exec)',
              '<@(_outputs)',
              'lib',
-
+@@ -1072,6 +1074,7 @@
+                   'action_name': 'node_mksnapshot',
+                   'process_outputs_as_sources': 1,
+                   'inputs': [
++                    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+                     '<(node_mksnapshot_exec)',
+                     '<(node_snapshot_main)',
+                   ],
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index 42e26cd9..bc721991 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -68,6 +68,7 @@
+@@ -113,6 +113,7 @@
          {
            'action_name': 'run_torque_action',
            'inputs': [  # Order matters.
@@ -57,15 +59,15 @@ index 42e26cd9..bc721991 100644
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
              '<@(torque_files)',
            ],
-@@ -99,6 +100,7 @@
-             '<@(torque_outputs_inc)',
+@@ -145,6 +146,7 @@
            ],
            'action': [
+             '<@(emulator)',
 +            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
              '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
              '-v8-root', '<(V8_ROOT)',
-@@ -211,6 +213,7 @@
+@@ -257,6 +259,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -73,7 +75,7 @@ index 42e26cd9..bc721991 100644
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
-@@ -400,6 +403,7 @@
+@@ -443,6 +446,7 @@
              ],
            },
            'inputs': [
@@ -81,7 +83,7 @@ index 42e26cd9..bc721991 100644
              '<(mksnapshot_exec)',
            ],
            'outputs': [
-@@ -1539,6 +1543,7 @@
+@@ -1976,6 +1980,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
@@ -89,6 +91,5 @@ index 42e26cd9..bc721991 100644
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
--- 
+--
 2.34.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
index db3cba1a75..4ef05cc623 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "86d40d594bbdfcf69009a62fdf43cb19ae72b6cb5822d2bdd8349c5a1b2fa628"
+SRC_URI[sha256sum] = "f6d95e10a0431ee1067fc6aabe9f762908b4716dd35324e1ddb4b1466b76659f"
 
 S = "${UNPACKDIR}/node-v${PV}"
 

