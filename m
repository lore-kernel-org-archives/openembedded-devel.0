Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA43ECD6EA
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 12:54:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44322.1770900836296370582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 04:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNOdIvcs;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-480142406b3so63526055e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 04:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770900835; x=1771505635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAwgfZ1Ql0iRERgu4Wlc2DIXXKoPtsqJe0asMyoE4EI=;
        b=NNOdIvcsObHBdZkZGDNeThdXuspYj5XfNe4gRQseyTayKV1FUR/WGRDQoUvN/NDR84
         hB6ktyvDA0xu+HijknzPFdincCFWtck4SgNl5KeQO/DoWJsBQwuxcAVEU0SF29sIUlxA
         02vA4I13fqWaXzDj1lSe9wPEWTGa6Gwc4sPBcbNw8hl6u8M3c+e9sFXxW0MjrrpCdV9u
         t77xRJrrxplzclT2XNh0XPXJqANV79YE1nXdpYPWed7Oida9aVkkz+kLYlE0ArutEi2c
         TcDqfGbMdlz7+QUsr+bqdh7m56r9+hQO4no7v3X+DOfGXmIHVVX2OVBtxuvgm4e2CAmC
         1UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770900835; x=1771505635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BAwgfZ1Ql0iRERgu4Wlc2DIXXKoPtsqJe0asMyoE4EI=;
        b=YElBOCMpGewTlsBF0coHzE45T7OqWaC8KIjOhIJTT+2k+RAjcfJ1Jru0ldJpkxMBW1
         43PPj/WNuHgOn8GaETVmyR6KSpt5oynGQcFGpMoO+cX/7+Oa2rg61CjPbG+J0Voe0AUd
         Bto0cSS2CD8R5YWdlG/HaAOtRLScqGoCZcMYX7+Jegk6vokLzyWw3y/0PnJOPjKleOKF
         AsBciT9S7Cihcj21RQ6cwKdPOxwsmR6Y3jHYwE7Hieg1ejZht4Jg83jeDzkUSsGTf2Kp
         ytccps26SixNd2gJM2u53BORJGIuf6FWYrO+idKeIMpXIc6MTbUqJc5aLn2KshMdnzRv
         D+kA==
X-Gm-Message-State: AOJu0YzVsK4MWCWxoozT6SC+zuUrnaMMhvpDcXE3+l//MVe3jrAbq8Em
	OQdNzhgP0kX9ZmxNdYC0iTFru3E6JE27zJ+1DlRS6JcZZV+pEiDp/2DlkZquqg==
X-Gm-Gg: AZuq6aI2tW1o9UnY6nogdUxScc/egT/dsB/G9xmGu4ceYrVwNQaGfbOSq4hkK3s7HDB
	1zmMKoTBRAbY6v4/PO1cRdwbp/rJ2h0cf1gKcobRLbp8hP9rRPH+dnPA6ZAFPSODrh6+VZXcNg9
	0rX7U7TFPpKDpnVqnsr86fY3b0pFDm11J8ymY+gr4YfeVhPRWsaDrTMmpGFoH3XlsGrz0MijpDR
	XW5U25gNmRbzB5BX5h3XUgo2SYZN8iTHuUA4W4WpKYXVc5f5mVST+FlXwROQZd8XLv/VpaFrlNW
	fRDOh8fBwFZuBLImKNS2eliV9qbBAdmqBl9Jib4s2rBIkX2gZiwkJ81ws5igeXlObr4B4jvndiA
	wqEKLKCdy5KkxEyKsHbOHePYEGfeY8Ez09Sz2dz4YEphY6/tIGOulGxUxuC3agZrpy0WXI+5JL+
	qT4s6LTIgVUMxqDF5L3aLm
X-Received: by 2002:a05:600c:450d:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483656c560bmr37198415e9.14.1770900834540;
        Thu, 12 Feb 2026 04:53:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a5bf1efsm89236015e9.0.2026.02.12.04.53.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:53:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] nodejs: detect NEON correctly for aarch64
Date: Thu, 12 Feb 2026 13:53:51 +0100
Message-ID: <20260212125351.962556-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212125351.962556-1-skandigraun@gmail.com>
References: <20260212125351.962556-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 12:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124354

The llhttp vendored dependency of nodejs takes advantage of Arm NEON
instructions when they are available, however they are detected by
checking for an outdated CPU feature macro: it checks for __ARM_NEON__,
however it is not defined by new compilers for aarch64, rather they
set __ARM_NEON. The Arm C extension guide[1] refers to __ARM_NEON macro
aswell.

This patch changes the detection to check for both macros when detecting
the availability of NEON instructions.

The code this patch modifies is generated, so the patch itself isn't
suitable for upstream submission, as the root cause of the error is
in the generator itself. A PR has been submitted[2] to the generator
project to rectify this issue.

[1]: https://developer.arm.com/documentation/ihi0053/d/ - pdf, section 6.9
[2]: https://github.com/nodejs/llparse/pull/84

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-detect-aarch64-Neon-correctly.patch  | 51 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_22.22.0.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch
new file mode 100644
index 0000000000..15de2c1119
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch
@@ -0,0 +1,51 @@
+From 41ec2d5302b77be27ca972102c29ce12471ed4b0 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 12 Feb 2026 11:09:44 +0100
+Subject: [PATCH 2/2] detect aarch64 Neon correctly
+
+The llhttp vendored dependency of nodejs takes advantage of Arm NEON
+instructions when they are available, however they are detected by
+checking for an outdated CPU feature macro: it checks for __ARM_NEON__,
+however it is not defined by new compilers for aarch64, rather they
+set __ARM_NEON. The Arm C extension guide[1] refers to __ARM_NEON macro
+aswell.
+
+This patch changes the detection to check for both macros when detecting
+the availability of NEON instructions.
+
+The code this patch modifies is generated, so the patch itself isn't
+suitable for upstream submission, as the root cause of the error is
+in the generator itself. A PR has been submitted[2] to the generator
+project to rectify this issue.
+
+[1]: https://developer.arm.com/documentation/ihi0053/d/ - pdf, section 6.9
+[2]: https://github.com/nodejs/llparse/pull/84
+
+Upstream-Status: Inappropriate [see above]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ deps/llhttp/src/llhttp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
+index a0e59e50..b069bbbb 100644
+--- a/deps/llhttp/src/llhttp.c
++++ b/deps/llhttp/src/llhttp.c
+@@ -10,7 +10,7 @@
+  #endif  /* _MSC_VER */
+ #endif  /* __SSE4_2__ */
+ 
+-#ifdef __ARM_NEON__
++#if defined(__ARM_NEON__) || defined(__ARM_NEON)
+  #include <arm_neon.h>
+ #endif  /* __ARM_NEON__ */
+ 
+@@ -2625,7 +2625,7 @@ static llparse_state_t llhttp__internal__run(
+         goto s_n_llhttp__internal__n_header_value_otherwise;
+       }
+       #endif  /* __SSE4_2__ */
+-      #ifdef __ARM_NEON__
++      #if defined(__ARM_NEON__) || defined(__ARM_NEON)
+       while (endp - p >= 16) {
+         uint8x16_t input;
+         uint8x16_t single;
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
index ea547f6fd2..fe6f6461cd 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-custom-env.patch \
            file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
            file://0001-fix-arm-Neon-intrinsics-types.patch \
+           file://0001-detect-aarch64-Neon-correctly.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \

