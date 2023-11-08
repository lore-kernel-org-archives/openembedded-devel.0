Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200FAC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 18:39:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.22629.1699468763086275056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 10:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UuxMITW2;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50930f126b1so9037104e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699468761; x=1700073561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUx6ytUovN2gPL5RL+i515ooDKGEtjRLR/o3WxP3gIE=;
        b=UuxMITW2WuV8oYeMu8f7NuNDwkUb0dCP9JCr5uvGss427KsPSlFnxn3Ap0oFotPIoS
         QIxKWTpCbv5piqpRIDfF8ctCgodCjbKbrKAf0gaE6749hNhs/1Zr9axxmh9huIfnpzq1
         azeBsxwD0/O4++G/ZGUK6ZC1XIAz/GgtDF8q0hU/pwGZ9T63AbK8bgCXp0KRD3NyjT0D
         i7ws0kTvg8vOv/Oo0k4ZM8mfYfmfWkHyPDHb5GNv7I7eiSEGI3KuihKPqrUBtJksYNHH
         ODAKAe+Mltv2jjJN2gOtJ+g9JjKhcNVPUBmpoTsyTyDaO9yhRSz0J1LWcCOpKPUBATCo
         BIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699468761; x=1700073561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUx6ytUovN2gPL5RL+i515ooDKGEtjRLR/o3WxP3gIE=;
        b=Y2Bs93rGg3nETCGoMU6IklRxH6TXK1cQjpyN1ThdzYYQXDdfFrZDET+ngnt131qwhU
         yjH2RXtL0MnemkfbPJPNu7XJtfep3RPxHD2S8DjhOGyUNEVt+WUlxAf7I/ZOQxtvC5xn
         wgXWXU2MTUIzU9fe89Z4nTn30ZS5IwniE7R+k7ssB4UNgGi7mqtY1IRdLV+W6gXKa/ML
         kCqxDKu9siEVhSp/wNFLggrICmNLCOXdw3O5Fe9mSDHgVmmPzdy0BsfMmS/imofn64Gn
         RLTG9jHUkj9epieWA49F9nBcVFAnV84LlQrpPYhdXM2JDTBtstS7cX/A7qShTBVQVgwK
         nOKw==
X-Gm-Message-State: AOJu0YwRg87U/AyNVSc+Bmu3oiJIs8FZp1gW5ZvBpEyJB+8Bgx2DpFPh
	po40FZya5h+MkwmPCjiI5647NHl77q7Huw==
X-Google-Smtp-Source: AGHT+IF2XtWqFlrpnxmO7aMUlBXZ+NhleW9CpTWp3BvV/mislRRIaAnfUVXXaZu+guKbIx/GU5K9gQ==
X-Received: by 2002:a05:6512:3a86:b0:509:11fa:a208 with SMTP id q6-20020a0565123a8600b0050911faa208mr2442757lfu.43.1699468760756;
        Wed, 08 Nov 2023 10:39:20 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id t7-20020ac243a7000000b005041ce44bbdsm740154lfl.5.2023.11.08.10.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:39:20 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Cc: jpewhacker@gmail.com
Subject: [meta-oe][PATCHv2] abseil-cpp: fix mingw build
Date: Wed,  8 Nov 2023 18:39:06 +0000
Message-Id: <20231108183906.1614800-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1795AFB3210438F8.15940@lists.openembedded.org>
References: <1795AFB3210438F8.15940@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 18:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106486

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
 ...-Win32Waiter-and-PthreadWaiter-on-Mi.patch | 62 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  3 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
new file mode 100644
index 000000000..db559bb16
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
@@ -0,0 +1,62 @@
+From cb7665f39e23e95e2466390c60ee5a410780a3ed Mon Sep 17 00:00:00 2001
+From: Derek Mauro <dmauro@google.com>
+Date: Wed, 8 Nov 2023 09:55:31 -0800
+Subject: [PATCH] Avoid using both Win32Waiter and PthreadWaiter on MinGW, and
+ use StdcppWaiter instead.
+
+There are various flavors of MinGW, some of which support pthread,
+and some of which support Win32. Instead of figuring out which
+platform is being used, just use the generic implementation.
+
+PiperOrigin-RevId: 580565507
+Change-Id: Ia85fd7496f1e6ebdeadb95202f0039e844826118
+Upstream-Status: Backport
+---
+ absl/synchronization/internal/pthread_waiter.h | 4 ++--
+ absl/synchronization/internal/win32_waiter.h   | 6 ++++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/absl/synchronization/internal/pthread_waiter.h b/absl/synchronization/internal/pthread_waiter.h
+index 206aefa4..23db76ad 100644
+--- a/absl/synchronization/internal/pthread_waiter.h
++++ b/absl/synchronization/internal/pthread_waiter.h
+@@ -16,7 +16,7 @@
+ #ifndef ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
+ #define ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
+ 
+-#ifndef _WIN32
++#if !defined(_WIN32) && !defined(__MINGW32__)
+ #include <pthread.h>
+ 
+ #include "absl/base/config.h"
+@@ -55,6 +55,6 @@ class PthreadWaiter : public WaiterCrtp<PthreadWaiter> {
+ ABSL_NAMESPACE_END
+ }  // namespace absl
+ 
+-#endif  // ndef _WIN32
++#endif  // !defined(_WIN32) && !defined(__MINGW32__)
+ 
+ #endif  // ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
+diff --git a/absl/synchronization/internal/win32_waiter.h b/absl/synchronization/internal/win32_waiter.h
+index 87eb617c..fdab264e 100644
+--- a/absl/synchronization/internal/win32_waiter.h
++++ b/absl/synchronization/internal/win32_waiter.h
+@@ -20,7 +20,8 @@
+ #include <sdkddkver.h>
+ #endif
+ 
+-#if defined(_WIN32) && _WIN32_WINNT >= _WIN32_WINNT_VISTA
++#if defined(_WIN32) && !defined(__MINGW32__) && \
++    _WIN32_WINNT >= _WIN32_WINNT_VISTA
+ 
+ #include "absl/base/config.h"
+ #include "absl/synchronization/internal/kernel_timeout.h"
+@@ -65,6 +66,7 @@ class Win32Waiter : public WaiterCrtp<Win32Waiter> {
+ ABSL_NAMESPACE_END
+ }  // namespace absl
+ 
+-#endif  // defined(_WIN32) && _WIN32_WINNT >= _WIN32_WINNT_VISTA
++#endif  // defined(_WIN32) && !defined(__MINGW32__) &&
++        // _WIN32_WINNT >= _WIN32_WINNT_VISTA
+ 
+ #endif  // ABSL_SYNCHRONIZATION_INTERNAL_WIN32_WAITER_H_
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 5003187d0..65ecab7d0 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
+           file://0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -32,4 +33,6 @@ EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
 
 BBCLASSEXTEND = "native nativesdk"
 
+SYSROOT_DIRS:append:class-nativesdk:mingw32 = " ${bindir}"
+
 FILES:${PN}-dev += "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
-- 
2.25.1


