Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891FBC64ED6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:33:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.5662.1676536426920762994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hCwhpzxb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536425; i=@fujitsu.com;
	bh=Hca0ScIMzHOa0WM7NKu0+zvxY3eIAwFFLd2qFnhBx5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hCwhpzxbeCvcokedpcpdoocCOjG0IjB+ak0aWMuLNYamw8rjS6GmcK07yAK0s+ob+
	 mX4KVxtnZ5gP1a4kx1Dum8H0XxVs9vGfebnnJ1RD98aq6y56hos6iENOsOBzhKdlLB
	 WLT3LZ4XgmmvBcqmjnLcbEu1rmCBKvwMOqhWCZUHOzA2LM3eKvFOXS1aPd8hGq/VOx
	 T7CiipimdUZvSmoALqU/IuhXQ+QPSe0kSmTVOsf+lgdn5ifziHpg/1UDr2MJfDCrr0
	 84NGmBvvmWEkFpeUIzxUEmRWsXTw+5y5a/9mdoIbbQJ9xSH3xSUg1CJsmv9kg3bIAc
	 pa2Vl7jKXcV9w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSTfj1dt
  kg1ft5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXlJSCSfoVrTP+MjUwtqp3MXJxCAk8YZRY
  8ugVI4Rzg0niwt03TBDOXkaJz8tms3cxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgI3ExqZPYDUsAqoSHxa3MYHYvAJOEs8XHWAEsSUEFCSmPHwP1ssp4CyxbcMKli5GDqBlTh
  LT30RDlAtKnJz5hAVivITEwRcvmCFaFSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdI1NNdLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlGLm8h2M2/v+6h1ilORgUhLlLdZ9myzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  nfDM6CcYFFqempFWmYOMI5g0hIcPEoivIJXgNK8xQWJucWZ6RCpU4yWHN+/XdzLzHH1yhUgOX
  v2v/3MQix5+XmpUuK8S18ANQiANGSU5sGNg8X6JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjEr
  CvNEgU3gy80rgtr4COogJ6KAFzGAHlSQipKQamMT/b4ri+nXuk9ySd51qMzlSjll23JQUEn05
  qdsiJSV2W7xb8+yWGYvb/Sruf6zRD7ootG1fG+f/zxJPl7zudPj1Rn6DXvKfya5Wndf22zIUV
  ClOnGtj4Kqg2J4Qv/Xtok2MPs1JGlVfk3KmiWYp1qTZuJxlstBd/Tnrb9nNvyZiPxfsMPZZdf
  ToftFnv0/sYti+dNKhf153O93Wmp/Q3BhV0CIjavImU5zpZvPuPMbf2/SjpzRbOxk94jvIEB7
  H8mpFiKD2n823Kx8fTG9UfNqnFD5lra+RlbFX6RzP+fwqB+J+ck3+4dSyKnFe5wMjP5eZFr6O
  6tP+mUpZPdbn/RLqWdhvKNXo5JST/rRXiaU4I9FQi7moOBEAvP6j0HADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1676536424!90366!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26065 invoked from network); 16 Feb 2023 08:33:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:33:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7D57C1000DB
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:44 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7192C1000C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:33:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] glog: upgrade 0.5.0 -> 0.6.0
Date: Thu, 16 Feb 2023 16:33:22 +0800
Message-ID: <1676536403-14449-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
References: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101093

From: Wang Mingyu <wangmy@fujitsu.com>

libexecinfo.patch
refreshed for new version.

Changelog:
===========
    bazel: Use glog 0.5.0 in README
    Expose IsGoogleLoggingInitialized() in public API.
    Fix cmake configuration for cygwin environment
    Allow updating vmodule levels after vmodule level has been cached
    Export COPYING
    cmake: fixed msvc snprintf detection (fixes #668)
    cmake: allow to override -fPIC
    cmake: export <atomic> availability (fixes #667)
    Remove ubuntu1604 from presubmit.yml
    bazel: add GLOG_CUSTOM_PREFIX_SUPPORT
    log messages periodically (time-based)
    ci: support more targets
    cmake: prefer linking against gflags::gflags (fixes #683)
    Fix syscall deprecation warning on macOS >= 10.12
    fixed exception specification mismatch
    readme: fix wrong header id
    eliminate warnings
    fixed additional warnings
    Add an static cast to compare unsigned with unsigned
    Fix: not implement virtual class when WITH_CUSTOM_PREFIX on
    Change size type in AnnotateBenignRaceSized to size_t from long
    Fix link error for Emscripten
    raw_logging.h depends on type definition in logging.h.
    export OS_* defines (fixes #715)
    Fix syscall warning in Bazel Build
    Add -Werror to Bazel presubmits
    added gmock support
    Support stack unwind on Android
    add linux github workflow
    ci: replace generated headers by templates
    add mock log test
    added log cleaner tests and fixed paths
    Make LogCleaner support relative paths
    cmake: Fix incorrect relative-path concatenation
    Restore the stream format after writing the log prefix
    fix glog-modules.cmake install
    protect VLOG by use_logging
    Fix log filename format
    Add Zhuoran Shen to AUTHORS and CONTRIBUTORS
    ci: reworked windows builds
    cmake: set CMP0074 policy
    ci: use codecov token
    Added gmtoff() method in 'LogMessageTime' to get GMT offset
    LogCleaner: Fix relative paths and add a new test
    eliminate msvc warnings
    cmake: require at least version 3.16
    ci: enable warnings as errors
    LogCleaner: make overdue_days_ unsigned int
    ci: remove deprecated msvc runner
    provide backward compatible send overload
    run clang-tidy
    eliminate clang warnings
    ensure _Unwind_Backtrace to actually be available
    cmake: do not search for platform specific unwind
    revert to signed int atomics
    Add the "FLAG_log_year_in_prefix"
    use uint32 for --max-log-size
    stdcxx: eliminate excessive use of std::string::c_str()
    cmake: require at least gflags 2.2.2
    Changed my Email ID
    On Solaris, GetHostName() returns empty string
    LogCleaner: avoid scanning logs too frequently
    libglog.pc: Set Libs.private for static linking
    cmake: enable custom prefix by default
    simplify flags export
    rename GOOGLE_GLOG_DLL_DECL to GLOG_EXPORT
    cmake_package_config_generate: Fix CMake warnings with CMake 3.23
    Tests: Respect TEST_TMPDIR, TMPDIR, TMP environmental variables
    Add the logtostdout and colorlogtostdout flag to allow logging to stdout
    Add clang-cl.exe to Bazel CI
    Fix "'GLOG_EXPORT' macro redefined" on clang-cl
    Fix namespace resolution issue in LOG_EVERY_T

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glog/glog/libexecinfo.patch               | 23 ++++++++++++++-----
 .../glog/{glog_0.5.0.bb => glog_0.6.0.bb}     |  2 +-
 2 files changed, 18 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/glog/{glog_0.5.0.bb => glog_0.6.0.bb} (95%)

diff --git a/meta-oe/recipes-support/glog/glog/libexecinfo.patch b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
index 927c269a6..a791a40db 100644
--- a/meta-oe/recipes-support/glog/glog/libexecinfo.patch
+++ b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
@@ -1,4 +1,8 @@
-Link libexecinfo if its found, this is needed for musl based systems
+From 19d00c15710840910a7397252c14d612746631fe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Mar 2021 14:58:40 -0800
+Subject: [PATCH] Link libexecinfo if its found, this is needed for musl based
+ systems
 
 Fixes
 ld: libglog.so.0.4.0: undefined reference to `backtrace'
@@ -6,17 +10,24 @@ ld: libglog.so.0.4.0: undefined reference to `backtrace'
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 846b444..1553358 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -144,6 +144,7 @@ check_cxx_compiler_flag (-Wunnamed-type-
- check_symbol_exists (snprintf cstdio HAVE_SNPRINTF)
+@@ -162,6 +162,7 @@ cmake_pop_check_state ()
+ check_cxx_symbol_exists (snprintf cstdio HAVE_SNPRINTF)
  
  check_library_exists (dbghelp UnDecorateSymbolName "" HAVE_DBGHELP)
 +check_library_exists (execinfo backtrace "" HAVE_EXECINFO)
  
  check_cxx_source_compiles ("
  #include <cstdlib>
-@@ -584,6 +585,10 @@ if (Unwind_FOUND)
+@@ -629,6 +630,10 @@ if (Unwind_FOUND)
    set (Unwind_DEPENDENCY "find_dependency (Unwind ${Unwind_VERSION})")
  endif (Unwind_FOUND)
  
@@ -25,5 +36,5 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +endif (HAVE_EXECINFO)
 +
  if (HAVE_DBGHELP)
-    target_link_libraries (glog PUBLIC dbghelp)
- endif (HAVE_DBGHELP)
+   target_link_libraries (glog PRIVATE dbghelp)
+   set (glog_libraries_options_for_static_linking "${glog_libraries_options_for_static_linking} -ldbghelp")
diff --git a/meta-oe/recipes-support/glog/glog_0.5.0.bb b/meta-oe/recipes-support/glog/glog_0.6.0.bb
similarity index 95%
rename from meta-oe/recipes-support/glog/glog_0.5.0.bb
rename to meta-oe/recipes-support/glog/glog_0.6.0.bb
index 61581d96d..18291600c 100644
--- a/meta-oe/recipes-support/glog/glog_0.5.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://libexecinfo.patch \
 "
 
-SRCREV = "8f9ccfe770add9e4c64e9b25c102658e3c763b73"
+SRCREV = "b33e3bad4c46c8a6345525fd822af355e5ef9446"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


