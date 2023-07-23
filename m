Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28E9C001DE
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 16:06:05 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.28742.1690128364374935741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jul 2023 09:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nDY+pUS5;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so7470906a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Jul 2023 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690128363; x=1690733163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HR39m9HgsUsUkYkTR07EFWKSxvM58LQgOZlhQR5bt4w=;
        b=nDY+pUS5VpfGDlDyJkGmtK+MNPA5F3rJ4/6g0huRju39NQL+TEh2uP2EesYlKEGAyq
         v38kmWmFrJa4yaLMPAwcP3aK4mYlmqOH6bK2ugBMFKapZ7YasYfpZRA+AjwBHhAPj+3a
         ebmpOgTy4atPLj2333sA9q+y69M7SS75RQaZtT0O7MyvHci9Dhtm8WVc3p1trhI5fDiH
         pc6NkGYGpdyzbKJh21/97V2JVgWIQgQtVwkxXkmxL7lf/q1PDa80npu5qiQznIJ3niCz
         vnh3m4YtuPRGzk/KTuFx/wjJ35ekJKgVAJzpwoNMoA3/LRPc0MJvPWrm1fo7F59T050d
         hqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690128363; x=1690733163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HR39m9HgsUsUkYkTR07EFWKSxvM58LQgOZlhQR5bt4w=;
        b=PdicDDjfjjwpitWc4TNqPt6iQa7Kp+/cApnVHYzPO59SaSqwRuqEqwoWVC2bBwP3Jg
         +z3Uyoh6BpbC2Hu8WhpFYe4/0k7gpErB/jgDbTbeVSOzUuFJjo4as0BOayCfprCI4vOO
         Jefh6crnFvknSkDvgalaMDNdzJdBAShehqPHIgpoUqSn8FYaO1JdTY6oLCLLEt55wty9
         KyyVmROZkZZ1BXybS/mRSBXhjPt41ty8egR22vIzhqu9kJIO5HpOfHnqOFfg9AW0dvSF
         v1OOgXhGhBvdnOQG98K6hRKd9sHJDqFE3KiLA3JCmEpTLgfXTZRdlb6kxH15Tv/NQKaF
         mfWA==
X-Gm-Message-State: ABy/qLYA5E4mfA5Yd4ZA+tjhhdewAfgTfbFdH4MC4gPg/p/oX3r+S1P2
	4teqSaMShgWumF/EK/riWoC57JZRLns=
X-Google-Smtp-Source: APBJJlFFZrAb2I31oanLsByCltgFk1QssOGNUmL2mhtsQLu+JvP730AloXue0/QKdLLdDhtKJy8Ynw==
X-Received: by 2002:a05:6402:14d9:b0:522:2711:86a with SMTP id f25-20020a05640214d900b005222711086amr2091474edx.15.1690128362524;
        Sun, 23 Jul 2023 09:06:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o4-20020aa7c504000000b0051495ce23absm4932629edq.10.2023.07.23.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 09:06:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] nodejs: Fix build with gcc13
Date: Sun, 23 Jul 2023 18:05:53 +0200
Message-ID: <20230723160553.2826040-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jul 2023 16:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103990

From: Khem Raj <raj.khem@gmail.com>

* MJ: remove AUTHORS modification from the original patch from
  nodejs-16, so that the same patch does apply for both 14 and 12
  versions used in dunfell

* MJ: gcc-13 isn't used for target builds in dunfell, but can be used
  on host, so this is useful backport for nodejs-native

* MJ: this fixes default nodejs-native-12, nodejs-native-14 with negative
  D_P might need additional fix on top

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nodejs/nodejs/gcc13.patch                 | 63 +++++++++++++++++++
 .../nodejs/nodejs_12.22.12.bb                 |  1 +
 .../recipes-devtools/nodejs/nodejs_14.18.1.bb |  1 +
 3 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
new file mode 100644
index 0000000000..9a448a0ba2
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
@@ -0,0 +1,63 @@
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
+    Reviewed-by: Simon Zund <szuend@chromium.org>
+    Commit-Queue: Clemens Backes <clemensb@chromium.org>
+    Cr-Commit-Position: refs/heads/main@{#83587}
+
+Refs: https://github.com/v8/v8/commit/c2792e58035fcbaa16d0cb70998852fbeb5df4cc
+PR-URL: https://github.com/nodejs/node/pull/44961
+Fixes: https://github.com/nodejs/node/issues/43642
+Reviewed-By: Michael Zasso <targos@protonmail.com>
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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
index c1d66eeffb..facc399085 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2022-43548.patch \
            file://CVE-llhttp.patch \
            file://python-3.11-invalid-mode-rU.patch \
+           file://gcc13.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
index fc886817ac..882d3f6573 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2022-32212.patch \
            file://CVE-2022-35255.patch \
            file://CVE-2022-43548.patch \
+           file://gcc13.patch \
            "
 SRC_URI:append:class-target = " \
            file://0002-Using-native-binaries-nodejs14.patch \

