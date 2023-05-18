Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADF7C7EE24
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 09:33:15 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.12930.1684402386575017575
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 02:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=V2+TnjkM;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-95fde138693so199904066b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684402385; x=1686994385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwuscvX6/Oj3vqy1tCUNm+2vsNuTWzqFVJL4RzoyIiE=;
        b=V2+TnjkMzRvc03CXdXjxIxla6F05ELZtbYVnIO3bZxQLtLoSBLQ3T5tPkbqagpzEg2
         3FgaF8PbvISzQb6Ya9cBjLUzESSd2mv8YkZ2wgFUgOPMl0PbnBZruh1309Ua8VXwDg9M
         A9VFGZcHBncwIrfvDytXTFZRwOgOQuyEh1+33tHW9u8y1ZJJMQF7HkV1iqxw6NuRDYQ/
         hDJkYJTA/8EhvPGLXICpitrzee7n0+/kkGT1j3cCuospRRFmND5G0ljRZGfvsRQRbTtg
         ijMlfX1A5qBiidI+FKsMac3lotTJswQx/fPQV7ZOJZdRo+R2U0z94JhBFAP2WNIiEkX1
         qUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684402385; x=1686994385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwuscvX6/Oj3vqy1tCUNm+2vsNuTWzqFVJL4RzoyIiE=;
        b=ZwhZziwDuokQUbJjfiGweVv9eB2i6Bk/yBnTyVTqtdWEDt5nzBEUu3nuNLHwelY6kl
         hNnF7JNeKf04qolRttrLl3nqJpCYftjXqHKmdAFHXXQ4+xAIJTQEwqCuWM6MUMEQOZMN
         5VM/x1BsdGfEGRAacWOwooK/zuy+wl+x/IbHAH1t1DPle9dvj8MlbRXfjL4iMFhuhBHX
         wMaayi/owtxb9P3E4asqBBz/KDa0Xz61hNwITJ4lBd/SgJT5plYFVknGijQtsvOLQWOC
         6SeJNhNoSwY0g90DRD0avfwmorPAnjGjpgx3dgh2561B0TSaX4jsKnHTl55J8N27Mk6V
         eQmw==
X-Gm-Message-State: AC+VfDwddaaBb87i3ctjyoM9j9eXsrssS2zI4j8wHBkIZl6t37SeuoKB
	WtOzHfNS4TPRtXNarkN7w4kXuIajjWI=
X-Google-Smtp-Source: ACHHUZ6D0GGkYsTGwNiP9EQ5lqefd4QoCnWWDHJSz7zw+iKYoNvMvAFLUWrHx/NNUfXM4+os682vtQ==
X-Received: by 2002:a17:907:1688:b0:969:df2e:d7d1 with SMTP id hc8-20020a170907168800b00969df2ed7d1mr5275243ejc.24.1684402384845;
        Thu, 18 May 2023 02:33:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m14-20020a170906258e00b0096f272206b3sm712218ejb.125.2023.05.18.02.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 02:33:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] nodejs: Fix build with gcc13
Date: Thu, 18 May 2023 11:33:01 +0200
Message-Id: <20230518093301.2938164-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518093301.2938164-1-Martin.Jansa@gmail.com>
References: <20230518093301.2938164-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 09:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102655

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nodejs/nodejs/gcc13.patch                 | 70 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.19.1.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
new file mode 100644
index 0000000000..be82c3369c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
@@ -0,0 +1,70 @@
+From 0be1c5728173ea9ac42843058e26b6268568acf0 Mon Sep 17 00:00:00 2001
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
+ common.gypi                                   | 2 +-
+ deps/v8/AUTHORS                               | 1 +
+ deps/v8/src/base/logging.h                    | 1 +
+ deps/v8/src/inspector/v8-string-conversions.h | 1 +
+ 4 files changed, 4 insertions(+), 1 deletion(-)
+
+--- a/deps/v8/AUTHORS
++++ b/deps/v8/AUTHORS
+@@ -247,6 +247,7 @@ Vlad Burlik <vladbph@gmail.com>
+ Vladimir Krivosheev <develar@gmail.com>
+ Vladimir Shutoff <vovan@shutoff.ru>
+ Wael Almattar <waelsy123@gmail.com>
++WANG Xuerui <git@xen0n.name>
+ Wei Wu <lazyparser@gmail.com>
+ Wenlu Wang <kingwenlu@gmail.com>
+ Wenming Yang <yangwenming@bytedance.com>
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


