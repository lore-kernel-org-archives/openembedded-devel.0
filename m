Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03409C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 10:39:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.6318.1740825591020767287
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Mar 2025 02:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DKeThnKV;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f403edb4eso1692062f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740825589; x=1741430389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xg3r8RV7fasaGlrud+sXTugARRe0foHSRZJF+cu4hPI=;
        b=DKeThnKVzY7d0ihJl4pAVPN1aVPpi2LMRkNBpn8vqusumetKdwqq1UakVEJUG3KHd9
         s2trXKBBefGN/qRoKYOZ5lX3xAu0v6y+RerRxXuTlwT8A9BBxgyG96BpqwWLrlcDK1xc
         eSdZvc5LAU6ksVPixcQDrZjpyDJG5v7Xoss2LwP5LHswXL2gVe0sdIZDUDRTyy8dd90Z
         8JI576yOcOgq6u2W+C2hFYouWzCBUUrBqpl/x125Fz9O0Y7zw2CAQQ1/JvF9+vEHms/m
         +W58kxeICRTuUKwNx6onG3sRLJO7fGcfeOY7AZIUuyoqYLW6XgqRsOsO31cL1YV4qXi6
         X1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740825589; x=1741430389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg3r8RV7fasaGlrud+sXTugARRe0foHSRZJF+cu4hPI=;
        b=L/PX8/G3IrbFRWNf/yVI22UreteoQL1Z/yTJUDAjBZc2BCsUqVuSa/ujuaP/vnTGEN
         XrpaSaShV4lborP+v6XBSlq25tcXI91NxlTlc1Upy/syB9CDJ24cGuMvbrPDomyj0ltK
         7z4mOCYYgE1F7E0CS7QcE+TBFY2G7cUwk4162DWkm6avTyX5rkNSqJ/Ootw0i1Dtm5VQ
         Vwvxqbvx0qq4a0TXfr03E47ahBDovPKppPJUJ0uIUVpBoLjSUCNGkgUmKecqf4y8/jQa
         jo62ODoAXuc2D57DZDN0YaMxIIYHP1Opw4KEw7O1EyA8v/UF+UjyNPRkhzK9ctHpdxPn
         h7Zw==
X-Gm-Message-State: AOJu0YyNkRljoCD/hxYR8m/w24Ty1JNG58zUtpU9yhpPtCCSm2W9yJ2d
	OBg1y9nmDSoVMHHi9hwSFUMWEo6KsfwI18ANYHrdCIiQ0AOnTBVhL21hzy+B
X-Gm-Gg: ASbGncsnvcK4gG2nt3MQj5xkbDAVgnx8zQU3YPzCudLKic0P/4YBSz45zbV13Jv1Z7z
	AF/prRQnIPvzlCJGvhudic3D6w1a4A3rujkcaAS37ONVbA11ZP2kxZ5dJsTzuOTn5RTAaJA9eom
	rsZG47+WA2lXJbRsIDkMZlNM8XSzqiAuuOMplECwT6lBE+lKVYJN/vFH/02/ReXIiSlE9MzeuVO
	EVGZ9i1Ew6i67GeRgufzHbAJkaQSlcoFa4CeOqsj279SCnEZFuZDqjo6Rcg4YJvWnFba+CGbcFR
	MWHqNlf7xaVfkXeCA4QUOrSYQf6bWoSZggavnsUDv/8kIHtVqJHAV7qEm8m7hAXjTPSOaXdV5u6
	+jpktExFGkMFw
X-Google-Smtp-Source: AGHT+IGDy9m5uMi4uDL0pTz+zdzNfMKZzg8A1gpA2LkwmNBXbRtjQqFy3GVmAV4jnczNkPGueDXCBA==
X-Received: by 2002:a5d:598d:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-390ec7c6adbmr5397614f8f.8.1740825588853;
        Sat, 01 Mar 2025 02:39:48 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844892sm7993225f8f.64.2025.03.01.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 02:39:48 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@a-squared-projects.uk>
Subject: [meta-oe][PATCH] abseil-cpp: Backport `xpaclri` asm fix
Date: Sat,  1 Mar 2025 10:36:12 +0000
Message-Id: <20250301103611.28262-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 10:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115716

Native build on aarch64 breaks with:

| {standard input}: Assembler messages:
| {standard input}:169: Error: selected processor does not support `xpaclri'
| {standard input}:411: Error: selected processor does not support `xpaclri'
| {standard input}:859: Error: selected processor does not support `xpaclri'
| {standard input}:1140: Error: selected processor does not support `xpaclri'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
 ...-hint-space-instruction-to-strip-PAC.patch | 32 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20250127.0.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch
new file mode 100644
index 000000000000..a235797de917
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch
@@ -0,0 +1,32 @@
+From 5852b47a81e5334a667d1e12dbfa55c0f8111100 Mon Sep 17 00:00:00 2001
+From: Derek Mauro <dmauro@google.com>
+Date: Fri, 7 Feb 2025 08:49:06 -0800
+Subject: [PATCH] Actually use the hint space instruction to strip PAC bits for
+ return addresses in stack traces as the comment says
+
+https://android.googlesource.com/platform/libcore/+/71f2c75111e87091616f0f3b86bea6c4d345dad1/src/hotspot/os_cpu/linux_aarch64/pauth_linux_aarch64.inline.hpp
+
+PiperOrigin-RevId: 724360415
+Change-Id: I691160e43354131a04919765ce283e07c3c933a9
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/5852b47a81e5334a667d1e12dbfa55c0f8111100]
+---
+ absl/debugging/internal/stacktrace_aarch64-inl.inc | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/absl/debugging/internal/stacktrace_aarch64-inl.inc b/absl/debugging/internal/stacktrace_aarch64-inl.inc
+index 4490c4e13cae..dccadaeb7c24 100644
+--- a/absl/debugging/internal/stacktrace_aarch64-inl.inc
++++ b/absl/debugging/internal/stacktrace_aarch64-inl.inc
+@@ -188,7 +188,9 @@ inline void* ClearPacBits(void* ptr) {
+   // compatibility with ARM platforms that do not support pointer
+   // authentication, we use the hint space instruction XPACLRI instead. Hint
+   // space instructions behave as NOPs on unsupported platforms.
+-  asm("xpaclri" : "+r"(x30));
++#define ABSL_XPACLRI_HINT "hint #0x7;"
++  asm(ABSL_XPACLRI_HINT : "+r"(x30));  // asm("xpaclri" : "+r"(x30));
++#undef ABSL_XPACLRI_HINT
+   return x30;
+ }
+ 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
index 88e20c05776e..f217d4daf889 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
            file://0004-abseil-ppc-fixes.patch \
+           file://0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch \
           "
 
 S = "${WORKDIR}/git"

