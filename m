Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D6C54798
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 00:15:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9156.1709856925418102321
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 16:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jkrkbic/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709856925; x=1741392925;
  h=from:to:cc:subject:date:message-id;
  bh=H4X5WG6U2IC5Yyrb6SYIhijNfXf7qk7B55jC0Em6LnE=;
  b=Jkrkbic/gyY8F8fgvSp5Ucaf9cS/T4NRkQ61h4BPE935OHG7BQog9U0c
   z99YwAb6MgB0W4rO+Dj2FzQKTMVj9jFf+ADAUTE1KMGNZj12G99CR/DAV
   whH7M5hlkpYXCsjHV+OKHuvA8xnwec+XcSVcOl1mRVpQmKOv5uJcgphWk
   A9JNrLjFeKZzqMPgULKOOJP7mSGwxl6lBFMMkgb0cEAG1SflpD4eV/Ezb
   259WEUvF5USi3IWBIDVD+HODaBb/3VhuPQPE9ZLa/wY1CJ4mwpKCv4oah
   +j4XFMEymzfpxHXbcjlUzbYnDG8vwPtAgSZ+fYJgvQiVl65plF5JK/kOx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="140043912"
X-IronPort-AV: E=Sophos;i="6.07,107,1708354800"; 
   d="scan'208";a="140043912"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 09:15:22 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 265C310A8C7
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 09:15:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 592D6F6B5
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 09:15:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC9A52C59C4
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 09:15:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 669081A006B;
	Fri,  8 Mar 2024 08:15:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH V2] abseil-cpp: upgrade 20230802.1 -> 20240116.1
Date: Fri,  8 Mar 2024 08:15:10 +0800
Message-Id: <1709856910-618-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28238.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28238.003
X-TMASE-Result: 10--5.808800-10.000000
X-TMASE-MatchedRID: N25sXaafkGCjz0nOeth/yTo39wOA02LhpxAd6mi1Ga1ULhp+W/a9mcLc
	MUuTFJzB0IbXXp0CcMwSuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKad9zRQbgSRmsfiDc5Dxk7dHdcfU63y8xPDr6l
	sDXOZho1D1Abw8VvNQDvg2AyPRTe+UUpG8SniXOOOnF2j8nBWbJScvOTX4jHP447xhO06ewi15I
	FUNL+ETxO4FvTZs+ZxszYb0YTsqV3T+rpu/K1HOxqtsVI8KrJpdZBUXm5+cmsicqvB+icULaRnu
	wdqIKHsWdkA+xaE9xfD/aJAhh3s4rsq/7BhdGyASEYfcJF0pRVn4Ir4HFD2TNBBNXB5b9MwqmL1
	cVOc1wAFGg5z5A0y4MVgWP2b5R3gJubTjnUZUjd0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR4
	+zsDTtD12T7q2dIUsCBgrWML7y/d6Ic7SEv5VC7/xCxKX3rRjodRyLWmDzjA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 00:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109211

From: Wang Mingyu <wangmy@fujitsu.com>

0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
revmoed since it's included in 20240116.1.

Changelog:
===========
-Added absl::NoDestructor<T> to simplify defining static types that do not need
 to be destructed upon program exit.
-Added configurable verbose logging (also known as VLOG).
-Added absl::Overload(), which returns a functor that provides overloads based
 on the functors passed to it.
-Bzlmod is now officially supported (previously it was supported by the community).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Win32Waiter-and-PthreadWaiter-on-Mi.patch | 62 -------------------
 ...20230802.1.bb => abseil-cpp_20240116.1.bb} | 37 +++--------
 2 files changed, 9 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20230802.1.bb => abseil-cpp_20240116.1.bb} (59%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
deleted file mode 100644
index db559bb16..000000000
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From cb7665f39e23e95e2466390c60ee5a410780a3ed Mon Sep 17 00:00:00 2001
-From: Derek Mauro <dmauro@google.com>
-Date: Wed, 8 Nov 2023 09:55:31 -0800
-Subject: [PATCH] Avoid using both Win32Waiter and PthreadWaiter on MinGW, and
- use StdcppWaiter instead.
-
-There are various flavors of MinGW, some of which support pthread,
-and some of which support Win32. Instead of figuring out which
-platform is being used, just use the generic implementation.
-
-PiperOrigin-RevId: 580565507
-Change-Id: Ia85fd7496f1e6ebdeadb95202f0039e844826118
-Upstream-Status: Backport
----
- absl/synchronization/internal/pthread_waiter.h | 4 ++--
- absl/synchronization/internal/win32_waiter.h   | 6 ++++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/absl/synchronization/internal/pthread_waiter.h b/absl/synchronization/internal/pthread_waiter.h
-index 206aefa4..23db76ad 100644
---- a/absl/synchronization/internal/pthread_waiter.h
-+++ b/absl/synchronization/internal/pthread_waiter.h
-@@ -16,7 +16,7 @@
- #ifndef ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
- #define ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
- 
--#ifndef _WIN32
-+#if !defined(_WIN32) && !defined(__MINGW32__)
- #include <pthread.h>
- 
- #include "absl/base/config.h"
-@@ -55,6 +55,6 @@ class PthreadWaiter : public WaiterCrtp<PthreadWaiter> {
- ABSL_NAMESPACE_END
- }  // namespace absl
- 
--#endif  // ndef _WIN32
-+#endif  // !defined(_WIN32) && !defined(__MINGW32__)
- 
- #endif  // ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
-diff --git a/absl/synchronization/internal/win32_waiter.h b/absl/synchronization/internal/win32_waiter.h
-index 87eb617c..fdab264e 100644
---- a/absl/synchronization/internal/win32_waiter.h
-+++ b/absl/synchronization/internal/win32_waiter.h
-@@ -20,7 +20,8 @@
- #include <sdkddkver.h>
- #endif
- 
--#if defined(_WIN32) && _WIN32_WINNT >= _WIN32_WINNT_VISTA
-+#if defined(_WIN32) && !defined(__MINGW32__) && \
-+    _WIN32_WINNT >= _WIN32_WINNT_VISTA
- 
- #include "absl/base/config.h"
- #include "absl/synchronization/internal/kernel_timeout.h"
-@@ -65,6 +66,7 @@ class Win32Waiter : public WaiterCrtp<Win32Waiter> {
- ABSL_NAMESPACE_END
- }  // namespace absl
- 
--#endif  // defined(_WIN32) && _WIN32_WINNT >= _WIN32_WINNT_VISTA
-+#endif  // defined(_WIN32) && !defined(__MINGW32__) &&
-+        // _WIN32_WINNT >= _WIN32_WINNT_VISTA
- 
- #endif  // ABSL_SYNCHRONIZATION_INTERNAL_WIN32_WAITER_H_
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
similarity index 59%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
index 17db7b2e4..82b2d20e0 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
@@ -1,24 +1,26 @@
 SUMMARY = "Abseil is a cpp library like STL"
 DESCRIPTION = "Abseil provides pieces missing from the C++ standard. Contains \
 additional useful libraries like algorithm, container, debugging, hash, memory, \
-meta, numeric, strings, synchronization, time, types and utility."
+meta, numeric, strings, synchronization, time, types and utility"
 HOMEPAGE = "https://abseil.io/"
 SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "fb3621f4f897824c0dbe0615fa94543df6192f30"
-BRANCH = "lts_2023_08_02"
+SRCREV = "2f9e432cce407ce0ae50676696666f33a77d42ac"
+BRANCH = "lts_2024_01_16"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
-           file://0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch \
           "
 
 S = "${WORKDIR}/git"
 
+ASNEEDED:class-native = ""
+ASNEEDED:class-nativesdk = ""
+
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
@@ -26,29 +28,8 @@ EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                  -DABSL_ENABLE_INSTALL=ON \
                 "
 
-SYSROOT_DIRS:append:class-nativesdk:mingw32 = " ${bindir}"
-
-PACKAGES_DYNAMIC = "^libabsl-*"
-PACKAGES_DYNAMIC:class-native = ""
-
-PACKAGESPLITFUNCS =+ "split_dynamic_packages"
-
-python split_dynamic_packages() {
-    libdir = d.getVar('libdir')
-
-    libpackages = do_split_packages(
-        d,
-        root=libdir,
-        file_regex=r'^libabsl_(.*)\.so\..*$',
-        output_pattern='libabsl-%s',
-        description="abseil shared library %s",
-        prepend=True,
-        extra_depends='',
-    )
-    if libpackages:
-        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(libpackages))
-}
+BBCLASSEXTEND = "native nativesdk"
 
-ALLOW_EMPTY:${PN} = "1"
+SYSROOT_DIRS:append:class-nativesdk:mingw32 = " ${bindir}"
 
-BBCLASSEXTEND = "native nativesdk"
+FILES:${PN}-dev += "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
-- 
2.34.1


