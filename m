Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDBFC636D4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:00:45 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.31242.1676606443628641000
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 20:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OVwp1hrr;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id t13so159976oiw.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 20:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1uwxm8fTdqL9FRfYNYvEvmu5XAi5LT5ZmiAvuxdVJMA=;
        b=OVwp1hrrxX+xDoHhip2vxWzz/4QJzxFQexkxzHnPho6DS/XD2THqjtuH1mU5BXCeMD
         3j3owzi1wRkqAPBMWH5xsb2KBpwTSGApehT4wga4JbNMfIc1aUJ+b1iFG0zEUuolxgg2
         nxcey4DsDMLKmLNjrnahi65iMb/jFHOYmgiAjsXZ/KzbFMDugMoKmZd3vNpt28wfOCdU
         jVDs8V05HoiUuYhR6IoOMjYmMInI9rtP/xZL+BODASedxTEg116WS5CUYGUWWtvViNlN
         gEPOccNptfaRMP7GEp+c9fzATy7XOa7ugK5SLj1BwhWl5inlh41oh7g79b59VhMU2XoE
         0G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uwxm8fTdqL9FRfYNYvEvmu5XAi5LT5ZmiAvuxdVJMA=;
        b=fpsTM0gWYjLNVu/nzI0GjWVZxzRs/y8cFXWU5Z94/v+muFUf8wzErXTlexkzWDkDT7
         Lwf0fMTUymnJuN4z/nCG42AIhljj2/kq1Pm96Ncywn0zg0mnKV8ywjJY2jyyef6HYCmt
         wC8WEKxa2b2JT+Z/CpD3FZpy/5BqCvoJm/xAUBycM2dU7u1BuOcmBUKdkxTLSYHEjl/l
         bfch/15kGjbfuRXfoIXY5bogGtaDNEqyFtjO3XriCjhwhIcuQ2q6b3a/to0HOcvjgdtY
         CTmNg82HpnC0s0HwlepAl5gdOUrVlXvCezjGUlP4pbyLvdfqLvWqiSRtbjzSxVmmNYVl
         7i1g==
X-Gm-Message-State: AO0yUKUPm2BmhtsAMhckA84mHVlZIk26SftFW77uHu48+nj8JRTgsaSN
	9OxuHSvez32gQ2IG2OyugUdEG3Bk97YA0Ds7OP4=
X-Google-Smtp-Source: AK7set/odvp2qCTF07xA7v0Y4j9pqyWci1D3U024elT7pxvODehgluP5tmowBThtEjBnAztaDOZUZPlqT7BamP5YkQs=
X-Received: by 2002:a05:6808:21a5:b0:37b:592b:ec39 with SMTP id
 be37-20020a05680821a500b0037b592bec39mr381123oib.262.1676606442504; Thu, 16
 Feb 2023 20:00:42 -0800 (PST)
MIME-Version: 1.0
References: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com> <1676536403-14449-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1676536403-14449-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Feb 2023 20:00:16 -0800
Message-ID: <CAMKF1sqEwjxpYKBzngoa2Xvert-eM4haKJWtb0kVx3R+RDA2fg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] glog: upgrade 0.5.0 -> 0.6.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 04:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101120

this fails to build with clang compiler see

https://errors.yoctoproject.org/Errors/Details/690010/

On Thu, Feb 16, 2023 at 12:33 AM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> libexecinfo.patch
> refreshed for new version.
>
> Changelog:
> ===========
>     bazel: Use glog 0.5.0 in README
>     Expose IsGoogleLoggingInitialized() in public API.
>     Fix cmake configuration for cygwin environment
>     Allow updating vmodule levels after vmodule level has been cached
>     Export COPYING
>     cmake: fixed msvc snprintf detection (fixes #668)
>     cmake: allow to override -fPIC
>     cmake: export <atomic> availability (fixes #667)
>     Remove ubuntu1604 from presubmit.yml
>     bazel: add GLOG_CUSTOM_PREFIX_SUPPORT
>     log messages periodically (time-based)
>     ci: support more targets
>     cmake: prefer linking against gflags::gflags (fixes #683)
>     Fix syscall deprecation warning on macOS >= 10.12
>     fixed exception specification mismatch
>     readme: fix wrong header id
>     eliminate warnings
>     fixed additional warnings
>     Add an static cast to compare unsigned with unsigned
>     Fix: not implement virtual class when WITH_CUSTOM_PREFIX on
>     Change size type in AnnotateBenignRaceSized to size_t from long
>     Fix link error for Emscripten
>     raw_logging.h depends on type definition in logging.h.
>     export OS_* defines (fixes #715)
>     Fix syscall warning in Bazel Build
>     Add -Werror to Bazel presubmits
>     added gmock support
>     Support stack unwind on Android
>     add linux github workflow
>     ci: replace generated headers by templates
>     add mock log test
>     added log cleaner tests and fixed paths
>     Make LogCleaner support relative paths
>     cmake: Fix incorrect relative-path concatenation
>     Restore the stream format after writing the log prefix
>     fix glog-modules.cmake install
>     protect VLOG by use_logging
>     Fix log filename format
>     Add Zhuoran Shen to AUTHORS and CONTRIBUTORS
>     ci: reworked windows builds
>     cmake: set CMP0074 policy
>     ci: use codecov token
>     Added gmtoff() method in 'LogMessageTime' to get GMT offset
>     LogCleaner: Fix relative paths and add a new test
>     eliminate msvc warnings
>     cmake: require at least version 3.16
>     ci: enable warnings as errors
>     LogCleaner: make overdue_days_ unsigned int
>     ci: remove deprecated msvc runner
>     provide backward compatible send overload
>     run clang-tidy
>     eliminate clang warnings
>     ensure _Unwind_Backtrace to actually be available
>     cmake: do not search for platform specific unwind
>     revert to signed int atomics
>     Add the "FLAG_log_year_in_prefix"
>     use uint32 for --max-log-size
>     stdcxx: eliminate excessive use of std::string::c_str()
>     cmake: require at least gflags 2.2.2
>     Changed my Email ID
>     On Solaris, GetHostName() returns empty string
>     LogCleaner: avoid scanning logs too frequently
>     libglog.pc: Set Libs.private for static linking
>     cmake: enable custom prefix by default
>     simplify flags export
>     rename GOOGLE_GLOG_DLL_DECL to GLOG_EXPORT
>     cmake_package_config_generate: Fix CMake warnings with CMake 3.23
>     Tests: Respect TEST_TMPDIR, TMPDIR, TMP environmental variables
>     Add the logtostdout and colorlogtostdout flag to allow logging to stdout
>     Add clang-cl.exe to Bazel CI
>     Fix "'GLOG_EXPORT' macro redefined" on clang-cl
>     Fix namespace resolution issue in LOG_EVERY_T
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../glog/glog/libexecinfo.patch               | 23 ++++++++++++++-----
>  .../glog/{glog_0.5.0.bb => glog_0.6.0.bb}     |  2 +-
>  2 files changed, 18 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-support/glog/{glog_0.5.0.bb => glog_0.6.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-support/glog/glog/libexecinfo.patch b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
> index 927c269a6..a791a40db 100644
> --- a/meta-oe/recipes-support/glog/glog/libexecinfo.patch
> +++ b/meta-oe/recipes-support/glog/glog/libexecinfo.patch
> @@ -1,4 +1,8 @@
> -Link libexecinfo if its found, this is needed for musl based systems
> +From 19d00c15710840910a7397252c14d612746631fe Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 8 Mar 2021 14:58:40 -0800
> +Subject: [PATCH] Link libexecinfo if its found, this is needed for musl based
> + systems
>
>  Fixes
>  ld: libglog.so.0.4.0: undefined reference to `backtrace'
> @@ -6,17 +10,24 @@ ld: libglog.so.0.4.0: undefined reference to `backtrace'
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +---
> + CMakeLists.txt | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 846b444..1553358 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -144,6 +144,7 @@ check_cxx_compiler_flag (-Wunnamed-type-
> - check_symbol_exists (snprintf cstdio HAVE_SNPRINTF)
> +@@ -162,6 +162,7 @@ cmake_pop_check_state ()
> + check_cxx_symbol_exists (snprintf cstdio HAVE_SNPRINTF)
>
>   check_library_exists (dbghelp UnDecorateSymbolName "" HAVE_DBGHELP)
>  +check_library_exists (execinfo backtrace "" HAVE_EXECINFO)
>
>   check_cxx_source_compiles ("
>   #include <cstdlib>
> -@@ -584,6 +585,10 @@ if (Unwind_FOUND)
> +@@ -629,6 +630,10 @@ if (Unwind_FOUND)
>     set (Unwind_DEPENDENCY "find_dependency (Unwind ${Unwind_VERSION})")
>   endif (Unwind_FOUND)
>
> @@ -25,5 +36,5 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +endif (HAVE_EXECINFO)
>  +
>   if (HAVE_DBGHELP)
> -    target_link_libraries (glog PUBLIC dbghelp)
> - endif (HAVE_DBGHELP)
> +   target_link_libraries (glog PRIVATE dbghelp)
> +   set (glog_libraries_options_for_static_linking "${glog_libraries_options_for_static_linking} -ldbghelp")
> diff --git a/meta-oe/recipes-support/glog/glog_0.5.0.bb b/meta-oe/recipes-support/glog/glog_0.6.0.bb
> similarity index 95%
> rename from meta-oe/recipes-support/glog/glog_0.5.0.bb
> rename to meta-oe/recipes-support/glog/glog_0.6.0.bb
> index 61581d96d..18291600c 100644
> --- a/meta-oe/recipes-support/glog/glog_0.5.0.bb
> +++ b/meta-oe/recipes-support/glog/glog_0.6.0.bb
> @@ -11,7 +11,7 @@ SRC_URI = " \
>      file://libexecinfo.patch \
>  "
>
> -SRCREV = "8f9ccfe770add9e4c64e9b25c102658e3c763b73"
> +SRCREV = "b33e3bad4c46c8a6345525fd822af355e5ef9446"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101093): https://lists.openembedded.org/g/openembedded-devel/message/101093
> Mute This Topic: https://lists.openembedded.org/mt/97002188/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

