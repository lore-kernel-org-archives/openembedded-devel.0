Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95369C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:23:47 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.14862.1699453417909454261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AcGEjbvo;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50970c2115eso4780270e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699453416; x=1700058216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5TQ/Ht0ZjEWeVg715ONi5dlHQoWRLpFtQtNLgUvRofk=;
        b=AcGEjbvo7UwPphwGGv+hMMihuj8XQvPUIKDxTcqKwb+M1qHFu6XG+0qBBd6OLeFY1K
         hLuoInjQL09ofHeKP3z72poTOXKyL45wlD8dmEZOANE4ecGL9lwr3e83FU2FQVQ+p9Or
         tBVyZ+bZgmN8OmHlpgR5Sj3QminkHmhCxIDX2nfVROe6kmW0mGd+461Qno3VlwQtEvNQ
         Ejx9AwD9qD7bBtxuv0DlYWUQLanLyJz8J3sKv2zCWxfj10cm75eaOsAUba61ruD2+EmD
         7xb06a8zETeyX2sLbn5saWY49CphDKXxZn1qpxoyteZlloDKQ1nHWYGsKWqXOAp8T/Iy
         wvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699453416; x=1700058216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TQ/Ht0ZjEWeVg715ONi5dlHQoWRLpFtQtNLgUvRofk=;
        b=ELP3Oc1UTh7PiS1h+uiN21u/KWCCUk6k8DxOxbm4qglbIqWUrsgAZvZeowrLG0cPwt
         VDL5+9z1nzhZ6/BXclxBHS+a13b/E3pZcMgrCaHsmyjG0Y0mUjMGuNgeTFlMSzoJyXf6
         sJVXu7RxFSSERBgXHHG3rA35RU/L2SNRMjTBUqVlsiAmxzLNpdET8gqJ40dwDjO3z1rf
         TtFYPKUpi/xqXOS8qGMpdiS8mdjYHaA1aS7lnqDHj4tfo1DS3gnsX2ABREXQXlLAfVKw
         Fc4EE/jCB7M4mJHRw6ATkZ3caiX1EZJNGhxBQNO/DUau/qhqiQxvrUVVNxxk9JWdcdq/
         //Eg==
X-Gm-Message-State: AOJu0Yy3pPdm4uzgU/WuSfkUsO+Pbf/MSzzdOH07no13B+k2Fj8h8D84
	oINN1LbYcSDhJ3mJ9/N1ZELdU5QTSyOXOg==
X-Google-Smtp-Source: AGHT+IELEKBQ0lJ275KJvl/PNS8C3ID+8fh3mGeQqBJ4VC9wwBIyi9eifIard/+3fPr2Je/k5N+U8Q==
X-Received: by 2002:a05:6512:310c:b0:507:bc6b:38a6 with SMTP id n12-20020a056512310c00b00507bc6b38a6mr1269318lfb.33.1699453415360;
        Wed, 08 Nov 2023 06:23:35 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id x11-20020a056512130b00b00502fd9110ffsm683098lfu.294.2023.11.08.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:23:34 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Cc: jpewhacker@gmail.com
Subject: [meta-oe][PATCH] abseil-cpp: fix mingw build
Date: Wed,  8 Nov 2023 14:23:07 +0000
Message-Id: <20231108142307.1528148-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 14:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106477

Add patch to fix mingw build of abseil-cpp

  undefined reference to `absl::lts_20230802::synchronization_internal::Win32Waiter::Poke()'
  undefined reference to `absl::lts_20230802::synchronization_internal::Win32Waiter::Win32Waiter()'
  undefined reference to `absl::lts_20230802::synchronization_internal::Win32Waiter::Post()'
  undefined reference to `absl::lts_20230802::synchronization_internal::Win32Waiter::Poke()'

and include bindir to recipe sysroot to fix protobuf build.

|   The imported target "absl::log_severity" references the file
|
|      "../nativesdk-protobuf/4.23.4/recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-w64-mingw32/usr/bin/libabsl_log_severity.dll"
|
|   but this file does not exist.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 ...workaround-for-MinGW64-build-failure.patch | 28 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  3 ++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-workaround-for-MinGW64-build-failure.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-workaround-for-MinGW64-build-failure.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-workaround-for-MinGW64-build-failure.patch
new file mode 100644
index 000000000..79c2ba7d7
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-workaround-for-MinGW64-build-failure.patch
@@ -0,0 +1,28 @@
+From 2f198d4fd8e0e66a2cd7ef53f62c8c9acf356803 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Wed, 8 Nov 2023 07:18:37 +0000
+Subject: [PATCH] Add workaround for MinGW64 build failure
+
+Add extra include so that _WIN32_WINNT is defined to correct
+version when building with MinGW.
+
+Fixes #1510
+
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/1564]
+---
+ absl/synchronization/internal/win32_waiter.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/absl/synchronization/internal/win32_waiter.h b/absl/synchronization/internal/win32_waiter.h
+index 87eb617c..517829e6 100644
+--- a/absl/synchronization/internal/win32_waiter.h
++++ b/absl/synchronization/internal/win32_waiter.h
+@@ -17,6 +17,7 @@
+ #define ABSL_SYNCHRONIZATION_INTERNAL_WIN32_WAITER_H_
+ 
+ #ifdef _WIN32
++#include <windows.h>
+ #include <sdkddkver.h>
+ #endif
+ 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 5003187d0..3e4820642 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
+           file://0004-Add-workaround-for-MinGW64-build-failure.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -32,4 +33,6 @@ EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
 
 BBCLASSEXTEND = "native nativesdk"
 
+SYSROOT_DIRS:append:class-nativesdk:mingw32 = "${bindir}"
+
 FILES:${PN}-dev += "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
-- 
2.25.1


