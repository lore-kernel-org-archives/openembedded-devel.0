Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3255AC7EE22
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 09:41:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.13150.1684402899009695696
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 02:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=r3KZKEUN;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f427118644so17540525e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 02:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684402897; x=1686994897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPjAC+0IkAZ6pC5rHGvrXOcJjvo0lPDJZmEIPUkgcL0=;
        b=r3KZKEUNZzV132DBjbRkyqlQJM5Tlmu5wxNjlhdyUETEA+oi0s6lSLesAaE/jW2YpF
         WwZgvfCnJR4Qf7x+wFnGuBfUgk17xPwc9g48Lkeg03jFHeQBMAvSSXdH+viA0MKSFiHG
         UC8AJcHpWtypCCE36jOmnEqHbYsoME7cK0SJdzZRaprC+czFTBI77VqeJHKOp1SDjaBn
         nu12yAsX2THY5u9GRXsbMT2ftPSlotYhsaJhOtTcpDl2w2s+r710euBTZ/7Cj7vNEmqC
         aC+vbj1Uzk1vqu1UbtF7KdKhkFz01UkgF5UlURS+3yhSZYChd3PWJeptaz2R29upkbqM
         EdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684402897; x=1686994897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPjAC+0IkAZ6pC5rHGvrXOcJjvo0lPDJZmEIPUkgcL0=;
        b=ZwfJPlAxf/QqumBNyKC2wr8XDtZqzrO3CbX9hr8tNCiogynhQx6AUMQKOHvqTinPkx
         gxtNoTw+Cn5M2QVv1U7KYSLJXpE13Dp1inX1lmQwgVwij9XSH3FF66ePaPqFyYNNWbym
         N1qeQ5CdZcyg5beh+OUlpxxzpvZlewqrPoruLnkUFbwxWcRIYv0Uu6/vkV8lvPyX8FQW
         J/kh7MFVaDDGXMAzIrc04bvgWgRLEAr9QXwCApfQORbEy3SMPadQgWP8iuwJcxGnAv2c
         T6O/Av6OZ4XAyyiybOn98wE788iJvxXODRtZwFbyIUjDw491zzqbYZcoIbYCWtC2g+KD
         F92Q==
X-Gm-Message-State: AC+VfDy4wdA4jmY36nlRakSDpbtsVK6hdxZID8ZbrIudxGQTtDURIiFk
	6QuPeK6o8N30QnK1nUFc5L3+CK8jbaQ=
X-Google-Smtp-Source: ACHHUZ5Ddtz9ZQNtEUcwbohTCTvbShXQJPc+W2OBmA4uFDJUFT/xWG8/NO9s+HWCMYc2uV5eURVl6A==
X-Received: by 2002:a1c:f218:0:b0:3f5:bc8:e398 with SMTP id s24-20020a1cf218000000b003f50bc8e398mr1190845wmc.13.1684402897238;
        Thu, 18 May 2023 02:41:37 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y14-20020adffa4e000000b0030903371ef9sm1607844wrr.22.2023.05.18.02.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 02:41:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCHv2] nodejs: Fix build with gcc13
Date: Thu, 18 May 2023 11:41:31 +0200
Message-Id: <20230518094131.3253344-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 09:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102656

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: Fixed patch-fuzz in deps/v8/AUTHORS

 .../nodejs/nodejs/gcc13.patch                 | 75 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.19.1.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
new file mode 100644
index 0000000000..bff349739c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
@@ -0,0 +1,75 @@
+From 576aed71db7b40c90b44c623580629792a606928 Mon Sep 17 00:00:00 2001
+From: Jiawen Geng <technicalcute@gmail.com>
+Date: Fri, 14 Oct 2022 09:54:33 +0800
+Subject: [PATCH] deps: V8: cherry-pick c2792e58035f
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Original commit message:
+
+    [base] Fix build with gcc-13
+
+    See https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes.
+
+    Also see Gentoo Linux bug report: https://bugs.gentoo.org/865981
+
+    Change-Id: I421f396b02ba37e12ee70048ee33e034f8113566
+    Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/3934140
+    Reviewed-by: Clemens Backes <clemensb@chromium.org>
+    Reviewed-by: Simon Zünd <szuend@chromium.org>
+    Commit-Queue: Clemens Backes <clemensb@chromium.org>
+    Cr-Commit-Position: refs/heads/main@{#83587}
+
+Refs: https://github.com/v8/v8/commit/c2792e58035fcbaa16d0cb70998852fbeb5df4cc
+PR-URL: https://github.com/nodejs/node/pull/44961
+Fixes: https://github.com/nodejs/node/issues/43642
+Reviewed-By: Michaël Zasso <targos@protonmail.com>
+Reviewed-By: Richard Lau <rlau@redhat.com>
+Reviewed-By: Luigi Pinca <luigipinca@gmail.com>
+Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/0be1c5728173ea9ac42843058e26b6268568acf0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ deps/v8/AUTHORS                               | 1 +
+ deps/v8/src/base/logging.h                    | 1 +
+ deps/v8/src/inspector/v8-string-conversions.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/deps/v8/AUTHORS b/deps/v8/AUTHORS
+index 35c49a01..736d3df9 100644
+--- a/deps/v8/AUTHORS
++++ b/deps/v8/AUTHORS
+@@ -236,6 +236,7 @@ Vlad Burlik <vladbph@gmail.com>
+ Vladimir Krivosheev <develar@gmail.com>
+ Vladimir Shutoff <vovan@shutoff.ru>
+ Wael Almattar <waelsy123@gmail.com>
++WANG Xuerui <git@xen0n.name>
+ Wei Wu <lazyparser@gmail.com>
+ Wenlu Wang <kingwenlu@gmail.com>
+ Wenyu Zhao <wenyu.zhao@anu.edu.au>
+diff --git a/deps/v8/src/base/logging.h b/deps/v8/src/base/logging.h
+index 08db24a9..38be165f 100644
+--- a/deps/v8/src/base/logging.h
++++ b/deps/v8/src/base/logging.h
+@@ -5,6 +5,7 @@
+ #ifndef V8_BASE_LOGGING_H_
+ #define V8_BASE_LOGGING_H_
+ 
++#include <cstdint>
+ #include <cstring>
+ #include <sstream>
+ #include <string>
+diff --git a/deps/v8/src/inspector/v8-string-conversions.h b/deps/v8/src/inspector/v8-string-conversions.h
+index c1d69c18..eb33c681 100644
+--- a/deps/v8/src/inspector/v8-string-conversions.h
++++ b/deps/v8/src/inspector/v8-string-conversions.h
+@@ -5,6 +5,7 @@
+ #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
+ #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
+ 
++#include <cstdint>
+ #include <string>
+ 
+ // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. You may
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
index 0661fd6f1c..dfc4af3df5 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
+           file://gcc13.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.40.1


