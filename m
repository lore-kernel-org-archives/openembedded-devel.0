Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB74C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:42 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web08.3070.1639610099967058138
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 15:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k9oaNGvA;
 spf=pass (domain: gmail.com, ip: 209.85.210.44,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso26853144otj.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 15:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0rrWil4pl5v0qcMJqFAI3mKaSaRcJbRZvjHvZq3bw6E=;
        b=k9oaNGvA2oJItz98St0bmrw7OP/lxmBOkXvd1oGuZZrAOUiZKDvo+S7CThMe1j/G0F
         lYOL4TH1+YUgb5zumQ0oNUygdnHF0/xj4ImHz5uN64Hqfvg+a6fnIkyFbODuHGBif4GW
         LdT+EhleEUUF6iXkXSynI4qKGK2X3zX43HluJE9WYcT/oyhVN+HXo/vixN3eqZoPV6eH
         ZZXfpjn8ZI2B+5unj8ZZ2gIXZ8N9TS1vUguZH976o2ySQft4/9LvUmAsbDsCTuiTxwhW
         iycSRrUMIXoYHSdoXuL8to9LV5ibw8KTeqdHxJhBSIH6go1Z8nVAuY1G434m2ozVSY4Z
         GYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0rrWil4pl5v0qcMJqFAI3mKaSaRcJbRZvjHvZq3bw6E=;
        b=viqdLd+p0bcu2A+CgMgrsmCOMO+FkWqU0rYkWasgOh9fJb1DizmDFq3IzMM9oca+Wf
         Oz88I3uffYCyK3ubcffsbeDvoarkdhzD6wRYtW7KowTM1cs8jg6WGrYvr1Awq4sgy1XS
         lTcYof6Z2RDjDGc3pFIjUY4W/1+hzgvjn3uhJh59qNplc22XUXMqXFYbpToob2ZoWnZR
         ebhepCsPigE7xNlpQUPAEcKuj5KQMCN8AQA7rDo7M7MlyOoTzIO6s4OGbflFw/TKSJIs
         jJdMHWYW+9n6uxgYQgYiYsj9YEB2GWMUJ5X4j/RuKrPRCSu4ft3tkhe13z4AzbT7HlDt
         XnhA==
X-Gm-Message-State: AOAM531a1mL7Ez2XX9iuPkTCN7zazK4wzoKHPWwgSgZADgV8TUzuUfu/
	P3Rjd5S/F53ePZQwxXVXjUo=
X-Google-Smtp-Source: 
 ABdhPJyU14sF3rvKPdp2BE4fKlzmpCgFMu8q7OPC10TaS/8Jiid7NW5u2ezmzzkLCS/sQYT2wM7NkQ==
X-Received: by 2002:a9d:200b:: with SMTP id
 n11mr10679797ota.169.1639610098841;
        Wed, 15 Dec 2021 15:14:58 -0800 (PST)
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id m2sm766543oop.12.2021.12.15.15.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 15:14:58 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [oe][meta-oe][PATCH] jemalloc: Fix autoheader
To: openembedded-devel@lists.openembedded.org
References: <20211215183055.1939875-1-JPEWhacker@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Message-ID: <67332a7c-727b-d50a-6765-b58a311f2b6b@gmail.com>
Date: Wed, 15 Dec 2021 17:14:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211215183055.1939875-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94375

Apparently I do not understand autotools :)

Please drop this patch

On 12/15/21 12:30 PM, Joshua Watt wrote:
> Fixes configure.ac to comply with more recent autoconf instead of
> disabling autoheader
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   ...1-Support-latest-version-of-autoconf.patch | 877 ++++++++++++++++++
>   .../jemalloc/jemalloc_5.2.1.bb                |   3 +-
>   2 files changed, 878 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/jemalloc/files/0001-Support-latest-version-of-autoconf.patch
>
> diff --git a/meta-oe/recipes-devtools/jemalloc/files/0001-Support-latest-version-of-autoconf.patch b/meta-oe/recipes-devtools/jemalloc/files/0001-Support-latest-version-of-autoconf.patch
> new file mode 100644
> index 000000000..b59bce54d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jemalloc/files/0001-Support-latest-version-of-autoconf.patch
> @@ -0,0 +1,877 @@
> +From 1c3438dae66e699cf3c5f519d2f981b31d61122d Mon Sep 17 00:00:00 2001
> +From: Joshua Watt <JPEWhacker@gmail.com>
> +Date: Wed, 15 Dec 2021 12:17:49 -0600
> +Subject: [PATCH] Support latest version of autoconf
> +
> +Newer versions of autoconf requires the description field to be
> +specified for AC_DEFINE or it will emit errors like:
> +
> + autoheader: warning: missing template: JEMALLOC_BACKGROUND_THREAD
> +
> +Upstream-Status: Submitted [https://github.com/jemalloc/jemalloc/pull/2177]
> +Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> +---
> + configure.ac | 235 ++++++++++++++++++++++++++-------------------------
> + 1 file changed, 118 insertions(+), 117 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 261d81c0..ab366315 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -237,11 +237,11 @@ fi
> + if test "x$GCC" = "xyes" ; then
> +   JE_CFLAGS_ADD([-std=gnu11])
> +   if test "x$je_cv_cflags_added" = "x-std=gnu11" ; then
> +-    AC_DEFINE_UNQUOTED([JEMALLOC_HAS_RESTRICT])
> ++    AC_DEFINE_UNQUOTED([JEMALLOC_HAS_RESTRICT], [ ], [ ])
> +   else
> +     JE_CFLAGS_ADD([-std=gnu99])
> +     if test "x$je_cv_cflags_added" = "x-std=gnu99" ; then
> +-      AC_DEFINE_UNQUOTED([JEMALLOC_HAS_RESTRICT])
> ++      AC_DEFINE_UNQUOTED([JEMALLOC_HAS_RESTRICT], [ ], [ ])
> +     fi
> +   fi
> +   JE_CFLAGS_ADD([-Wall])
> +@@ -319,7 +319,7 @@ AC_SUBST([EXTRA_CXXFLAGS])
> +
> + AC_C_BIGENDIAN([ac_cv_big_endian=1], [ac_cv_big_endian=0])
> + if test "x${ac_cv_big_endian}" = "x1" ; then
> +-  AC_DEFINE_UNQUOTED([JEMALLOC_BIG_ENDIAN], [ ])
> ++  AC_DEFINE_UNQUOTED([JEMALLOC_BIG_ENDIAN], [ ], [ ])
> + fi
> +
> + if test "x${je_cv_msvc}" = "xyes" -a "x${ac_cv_header_inttypes_h}" = "xno"; then
> +@@ -339,7 +339,7 @@ else
> +     AC_MSG_ERROR([Unsupported pointer size: ${ac_cv_sizeof_void_p}])
> +   fi
> + fi
> +-AC_DEFINE_UNQUOTED([LG_SIZEOF_PTR], [$LG_SIZEOF_PTR])
> ++AC_DEFINE_UNQUOTED([LG_SIZEOF_PTR], [$LG_SIZEOF_PTR], [ ])
> +
> + AC_CHECK_SIZEOF([int])
> + if test "x${ac_cv_sizeof_int}" = "x8" ; then
> +@@ -349,7 +349,7 @@ elif test "x${ac_cv_sizeof_int}" = "x4" ; then
> + else
> +   AC_MSG_ERROR([Unsupported int size: ${ac_cv_sizeof_int}])
> + fi
> +-AC_DEFINE_UNQUOTED([LG_SIZEOF_INT], [$LG_SIZEOF_INT])
> ++AC_DEFINE_UNQUOTED([LG_SIZEOF_INT], [$LG_SIZEOF_INT], [ ])
> +
> + AC_CHECK_SIZEOF([long])
> + if test "x${ac_cv_sizeof_long}" = "x8" ; then
> +@@ -359,7 +359,7 @@ elif test "x${ac_cv_sizeof_long}" = "x4" ; then
> + else
> +   AC_MSG_ERROR([Unsupported long size: ${ac_cv_sizeof_long}])
> + fi
> +-AC_DEFINE_UNQUOTED([LG_SIZEOF_LONG], [$LG_SIZEOF_LONG])
> ++AC_DEFINE_UNQUOTED([LG_SIZEOF_LONG], [$LG_SIZEOF_LONG], [ ])
> +
> + AC_CHECK_SIZEOF([long long])
> + if test "x${ac_cv_sizeof_long_long}" = "x8" ; then
> +@@ -369,7 +369,7 @@ elif test "x${ac_cv_sizeof_long_long}" = "x4" ; then
> + else
> +   AC_MSG_ERROR([Unsupported long long size: ${ac_cv_sizeof_long_long}])
> + fi
> +-AC_DEFINE_UNQUOTED([LG_SIZEOF_LONG_LONG], [$LG_SIZEOF_LONG_LONG])
> ++AC_DEFINE_UNQUOTED([LG_SIZEOF_LONG_LONG], [$LG_SIZEOF_LONG_LONG], [ ])
> +
> + AC_CHECK_SIZEOF([intmax_t])
> + if test "x${ac_cv_sizeof_intmax_t}" = "x16" ; then
> +@@ -381,7 +381,7 @@ elif test "x${ac_cv_sizeof_intmax_t}" = "x4" ; then
> + else
> +   AC_MSG_ERROR([Unsupported intmax_t size: ${ac_cv_sizeof_intmax_t}])
> + fi
> +-AC_DEFINE_UNQUOTED([LG_SIZEOF_INTMAX_T], [$LG_SIZEOF_INTMAX_T])
> ++AC_DEFINE_UNQUOTED([LG_SIZEOF_INTMAX_T], [$LG_SIZEOF_INTMAX_T], [ ])
> +
> + AC_CANONICAL_HOST
> + dnl CPU-specific settings.
> +@@ -411,8 +411,8 @@ case "${host_cpu}" in
> + 	HAVE_CPU_SPINWAIT=0
> + 	;;
> + esac
> +-AC_DEFINE_UNQUOTED([HAVE_CPU_SPINWAIT], [$HAVE_CPU_SPINWAIT])
> +-AC_DEFINE_UNQUOTED([CPU_SPINWAIT], [$CPU_SPINWAIT])
> ++AC_DEFINE_UNQUOTED([HAVE_CPU_SPINWAIT], [$HAVE_CPU_SPINWAIT], [ ])
> ++AC_DEFINE_UNQUOTED([CPU_SPINWAIT], [$CPU_SPINWAIT], [ ])
> +
> + AC_ARG_WITH([lg_vaddr],
> +   [AS_HELP_STRING([--with-lg-vaddr=<lg-vaddr>], [Number of significant virtual address bits])],
> +@@ -477,7 +477,7 @@ typedef unsigned __int32 uint32_t;
> +         LG_VADDR="${je_cv_lg_vaddr}"
> +       fi
> +       if test "x${LG_VADDR}" != "xerror" ; then
> +-        AC_DEFINE_UNQUOTED([LG_VADDR], [$LG_VADDR])
> ++        AC_DEFINE_UNQUOTED([LG_VADDR], [$LG_VADDR], [ ])
> +       else
> +         AC_MSG_ERROR([cannot determine number of significant virtual address bits])
> +       fi
> +@@ -499,7 +499,7 @@ typedef unsigned __int32 uint32_t;
> +     fi
> +     ;;
> + esac
> +-AC_DEFINE_UNQUOTED([LG_VADDR], [$LG_VADDR])
> ++AC_DEFINE_UNQUOTED([LG_VADDR], [$LG_VADDR], [ ])
> +
> + LD_PRELOAD_VAR="LD_PRELOAD"
> + so="so"
> +@@ -627,7 +627,7 @@ case "${host}" in
> + 	;;
> +   *-*-freebsd*)
> + 	abi="elf"
> +-	AC_DEFINE([JEMALLOC_SYSCTL_VM_OVERCOMMIT], [ ])
> ++	AC_DEFINE([JEMALLOC_SYSCTL_VM_OVERCOMMIT], [ ], [ ])
> + 	force_lazy_lock="1"
> + 	;;
> +   *-*-dragonfly*)
> +@@ -644,11 +644,11 @@ case "${host}" in
> + 	dnl syscall(2) and secure_getenv(3) are exposed by _GNU_SOURCE.
> + 	JE_APPEND_VS(CPPFLAGS, -D_GNU_SOURCE)
> + 	abi="elf"
> +-	AC_DEFINE([JEMALLOC_PURGE_MADVISE_DONTNEED_ZEROS], [ ])
> +-	AC_DEFINE([JEMALLOC_HAS_ALLOCA_H])
> +-	AC_DEFINE([JEMALLOC_PROC_SYS_VM_OVERCOMMIT_MEMORY], [ ])
> +-	AC_DEFINE([JEMALLOC_THREADED_INIT], [ ])
> +-	AC_DEFINE([JEMALLOC_C11_ATOMICS])
> ++	AC_DEFINE([JEMALLOC_PURGE_MADVISE_DONTNEED_ZEROS], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_HAS_ALLOCA_H], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_PROC_SYS_VM_OVERCOMMIT_MEMORY], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_THREADED_INIT], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_C11_ATOMICS], [ ], [ ])
> + 	force_tls="0"
> + 	if test "${LG_SIZEOF_PTR}" = "3"; then
> + 	  default_retain="1"
> +@@ -658,11 +658,11 @@ case "${host}" in
> + 	dnl syscall(2) and secure_getenv(3) are exposed by _GNU_SOURCE.
> + 	JE_APPEND_VS(CPPFLAGS, -D_GNU_SOURCE)
> + 	abi="elf"
> +-	AC_DEFINE([JEMALLOC_PURGE_MADVISE_DONTNEED_ZEROS], [ ])
> +-	AC_DEFINE([JEMALLOC_HAS_ALLOCA_H])
> +-	AC_DEFINE([JEMALLOC_PROC_SYS_VM_OVERCOMMIT_MEMORY], [ ])
> +-	AC_DEFINE([JEMALLOC_THREADED_INIT], [ ])
> +-	AC_DEFINE([JEMALLOC_USE_CXX_THROW], [ ])
> ++	AC_DEFINE([JEMALLOC_PURGE_MADVISE_DONTNEED_ZEROS], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_HAS_ALLOCA_H], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_PROC_SYS_VM_OVERCOMMIT_MEMORY], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_THREADED_INIT], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_USE_CXX_THROW], [ ], [ ])
> + 	if test "${LG_SIZEOF_PTR}" = "3"; then
> + 	  default_retain="1"
> + 	fi
> +@@ -671,10 +671,10 @@ case "${host}" in
> + 	dnl syscall(2) and secure_getenv(3) are exposed by _GNU_SOURCE.
> + 	JE_APPEND_VS(CPPFLAGS, -D_GNU_SOURCE)
> + 	abi="elf"
> +-	AC_DEFINE([JEMALLOC_HAS_ALLOCA_H])
> +-	AC_DEFINE([JEMALLOC_SYSCTL_VM_OVERCOMMIT], [ ])
> +-	AC_DEFINE([JEMALLOC_THREADED_INIT], [ ])
> +-	AC_DEFINE([JEMALLOC_USE_CXX_THROW], [ ])
> ++	AC_DEFINE([JEMALLOC_HAS_ALLOCA_H], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_SYSCTL_VM_OVERCOMMIT], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_THREADED_INIT], [ ], [ ])
> ++	AC_DEFINE([JEMALLOC_USE_CXX_THROW], [ ], [ ])
> + 	;;
> +   *-*-netbsd*)
> + 	AC_MSG_CHECKING([ABI])
> +@@ -763,7 +763,7 @@ AC_CHECK_HEADERS([malloc.h], [
> +                 AC_MSG_RESULT([no])
> +          ])
> + ])
> +-AC_DEFINE_UNQUOTED([JEMALLOC_USABLE_SIZE_CONST], [$JEMALLOC_USABLE_SIZE_CONST])
> ++AC_DEFINE_UNQUOTED([JEMALLOC_USABLE_SIZE_CONST], [$JEMALLOC_USABLE_SIZE_CONST], [ ])
> + AC_SUBST([abi])
> + AC_SUBST([RPATH])
> + AC_SUBST([LD_PRELOAD_VAR])
> +@@ -801,7 +801,7 @@ JE_COMPILABLE([__attribute__ syntax],
> +               [],
> +               [je_cv_attribute])
> + if test "x${je_cv_attribute}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_ATTR], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_ATTR], [ ], [ ])
> +   if test "x${GCC}" = "xyes" -a "x${abi}" = "xelf"; then
> +     JE_CFLAGS_ADD([-fvisibility=hidden])
> +     JE_CXXFLAGS_ADD([-fvisibility=hidden])
> +@@ -829,7 +829,7 @@ JE_COMPILABLE([alloc_size attribute], [#include <stdlib.h>],
> +               [je_cv_alloc_size])
> + JE_CFLAGS_RESTORE()
> + if test "x${je_cv_alloc_size}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_ATTR_ALLOC_SIZE], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_ATTR_ALLOC_SIZE], [ ], [ ])
> + fi
> + dnl Check for format(gnu_printf, ...) attribute support.
> + JE_CFLAGS_SAVE()
> +@@ -840,7 +840,7 @@ JE_COMPILABLE([format(gnu_printf, ...) attribute], [#include <stdlib.h>],
> +               [je_cv_format_gnu_printf])
> + JE_CFLAGS_RESTORE()
> + if test "x${je_cv_format_gnu_printf}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_ATTR_FORMAT_GNU_PRINTF], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_ATTR_FORMAT_GNU_PRINTF], [ ], [ ])
> + fi
> + dnl Check for format(printf, ...) attribute support.
> + JE_CFLAGS_SAVE()
> +@@ -851,7 +851,7 @@ JE_COMPILABLE([format(printf, ...) attribute], [#include <stdlib.h>],
> +               [je_cv_format_printf])
> + JE_CFLAGS_RESTORE()
> + if test "x${je_cv_format_printf}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_ATTR_FORMAT_PRINTF], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_ATTR_FORMAT_PRINTF], [ ], [ ])
> + fi
> +
> + dnl Check for format_arg(...) attribute support.
> +@@ -863,7 +863,7 @@ JE_COMPILABLE([format(printf, ...) attribute], [#include <stdlib.h>],
> +               [je_cv_format_arg])
> + JE_CFLAGS_RESTORE()
> + if test "x${je_cv_format_arg}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_ATTR_FORMAT_ARG], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_ATTR_FORMAT_ARG], [ ], [ ])
> + fi
> +
> + dnl Support optional additions to rpath.
> +@@ -955,11 +955,11 @@ else
> + fi]
> + )
> + if test "x$JEMALLOC_PREFIX" = "x" ; then
> +-  AC_DEFINE([JEMALLOC_IS_MALLOC])
> ++  AC_DEFINE([JEMALLOC_IS_MALLOC], [ ], [ ])
> + else
> +   JEMALLOC_CPREFIX=`echo ${JEMALLOC_PREFIX} | tr "a-z" "A-Z"`
> +-  AC_DEFINE_UNQUOTED([JEMALLOC_PREFIX], ["$JEMALLOC_PREFIX"])
> +-  AC_DEFINE_UNQUOTED([JEMALLOC_CPREFIX], ["$JEMALLOC_CPREFIX"])
> ++  AC_DEFINE_UNQUOTED([JEMALLOC_PREFIX], ["$JEMALLOC_PREFIX"], [ ])
> ++  AC_DEFINE_UNQUOTED([JEMALLOC_CPREFIX], ["$JEMALLOC_CPREFIX"], [ ])
> + fi
> + AC_SUBST([JEMALLOC_PREFIX])
> + AC_SUBST([JEMALLOC_CPREFIX])
> +@@ -967,42 +967,42 @@ AC_SUBST([JEMALLOC_CPREFIX])
> + AC_ARG_WITH([export],
> +   [AS_HELP_STRING([--without-export], [disable exporting jemalloc public APIs])],
> +   [if test "x$with_export" = "xno"; then
> +-  AC_DEFINE([JEMALLOC_EXPORT],[])
> ++  AC_DEFINE([JEMALLOC_EXPORT],[], [ ])
> + fi]
> + )
> +
> + public_syms="aligned_alloc calloc dallocx free mallctl mallctlbymib mallctlnametomib malloc malloc_conf malloc_message malloc_stats_print malloc_usable_size mallocx smallocx_${jemalloc_version_gid} nallocx posix_memalign rallocx realloc sallocx sdallocx xallocx"
> + dnl Check for additional platform-specific public API functions.
> + AC_CHECK_FUNC([memalign],
> +-	      [AC_DEFINE([JEMALLOC_OVERRIDE_MEMALIGN], [ ])
> ++	      [AC_DEFINE([JEMALLOC_OVERRIDE_MEMALIGN], [ ], [ ])
> + 	       public_syms="${public_syms} memalign"])
> + AC_CHECK_FUNC([valloc],
> +-	      [AC_DEFINE([JEMALLOC_OVERRIDE_VALLOC], [ ])
> ++	      [AC_DEFINE([JEMALLOC_OVERRIDE_VALLOC], [ ], [ ])
> + 	       public_syms="${public_syms} valloc"])
> +
> + dnl Check for allocator-related functions that should be wrapped.
> + wrap_syms=
> + if test "x${JEMALLOC_PREFIX}" = "x" ; then
> +   AC_CHECK_FUNC([__libc_calloc],
> +-		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_CALLOC], [ ])
> ++		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_CALLOC], [ ], [ ])
> + 		 wrap_syms="${wrap_syms} __libc_calloc"])
> +   AC_CHECK_FUNC([__libc_free],
> +-		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_FREE], [ ])
> ++		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_FREE], [ ], [ ])
> + 		 wrap_syms="${wrap_syms} __libc_free"])
> +   AC_CHECK_FUNC([__libc_malloc],
> +-		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_MALLOC], [ ])
> ++		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_MALLOC], [ ], [ ])
> + 		 wrap_syms="${wrap_syms} __libc_malloc"])
> +   AC_CHECK_FUNC([__libc_memalign],
> +-		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_MEMALIGN], [ ])
> ++		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_MEMALIGN], [ ], [ ])
> + 		 wrap_syms="${wrap_syms} __libc_memalign"])
> +   AC_CHECK_FUNC([__libc_realloc],
> +-		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_REALLOC], [ ])
> ++		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_REALLOC], [ ], [ ])
> + 		 wrap_syms="${wrap_syms} __libc_realloc"])
> +   AC_CHECK_FUNC([__libc_valloc],
> +-		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_VALLOC], [ ])
> ++		[AC_DEFINE([JEMALLOC_OVERRIDE___LIBC_VALLOC], [ ], [ ])
> + 		 wrap_syms="${wrap_syms} __libc_valloc"])
> +   AC_CHECK_FUNC([__posix_memalign],
> +-		[AC_DEFINE([JEMALLOC_OVERRIDE___POSIX_MEMALIGN], [ ])
> ++		[AC_DEFINE([JEMALLOC_OVERRIDE___POSIX_MEMALIGN], [ ], [ ])
> + 		 wrap_syms="${wrap_syms} __posix_memalign"])
> + fi
> +
> +@@ -1020,7 +1020,7 @@ AC_ARG_WITH([private_namespace],
> +   [JEMALLOC_PRIVATE_NAMESPACE="${with_private_namespace}je_"],
> +   [JEMALLOC_PRIVATE_NAMESPACE="je_"]
> + )
> +-AC_DEFINE_UNQUOTED([JEMALLOC_PRIVATE_NAMESPACE], [$JEMALLOC_PRIVATE_NAMESPACE])
> ++AC_DEFINE_UNQUOTED([JEMALLOC_PRIVATE_NAMESPACE], [$JEMALLOC_PRIVATE_NAMESPACE], [ ])
> + private_namespace="$JEMALLOC_PRIVATE_NAMESPACE"
> + AC_SUBST([private_namespace])
> +
> +@@ -1040,7 +1040,7 @@ AC_ARG_WITH([malloc_conf],
> +   [JEMALLOC_CONFIG_MALLOC_CONF=""]
> + )
> + config_malloc_conf="$JEMALLOC_CONFIG_MALLOC_CONF"
> +-AC_DEFINE_UNQUOTED([JEMALLOC_CONFIG_MALLOC_CONF], ["$config_malloc_conf"])
> ++AC_DEFINE_UNQUOTED([JEMALLOC_CONFIG_MALLOC_CONF], ["$config_malloc_conf"], [ ])
> +
> + dnl Substitute @je_@ in jemalloc_protos.h.in, primarily to make generation of
> + dnl jemalloc_protos_jet.h easy.
> +@@ -1129,7 +1129,7 @@ fi
> + [enable_debug="0"]
> + )
> + if test "x$enable_debug" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_DEBUG], [ ])
> ++  AC_DEFINE([JEMALLOC_DEBUG], [ ], [ ])
> + fi
> + if test "x$enable_debug" = "x1" ; then
> +   AC_DEFINE([JEMALLOC_DEBUG], [ ])
> +@@ -1164,7 +1164,7 @@ fi
> + [enable_stats="1"]
> + )
> + if test "x$enable_stats" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_STATS], [ ])
> ++  AC_DEFINE([JEMALLOC_STATS], [ ], [ ])
> + fi
> + AC_SUBST([enable_stats])
> +
> +@@ -1180,7 +1180,7 @@ fi
> + [enable_experimental_smallocx="0"]
> + )
> + if test "x$enable_experimental_smallocx" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_EXPERIMENTAL_SMALLOCX_API])
> ++  AC_DEFINE([JEMALLOC_EXPERIMENTAL_SMALLOCX_API], [ ], [ ])
> + fi
> + AC_SUBST([enable_experimental_smallocx])
> +
> +@@ -1234,7 +1234,7 @@ if test "x$backtrace_method" = "x" -a "x$enable_prof_libunwind" = "x1" ; then
> +   fi
> +   if test "x${enable_prof_libunwind}" = "x1" ; then
> +     backtrace_method="libunwind"
> +-    AC_DEFINE([JEMALLOC_PROF_LIBUNWIND], [ ])
> ++    AC_DEFINE([JEMALLOC_PROF_LIBUNWIND], [ ], [ ])
> +   fi
> + fi
> +
> +@@ -1257,7 +1257,7 @@ if test "x$backtrace_method" = "x" -a "x$enable_prof_libgcc" = "x1" \
> +   fi
> +   if test "x${enable_prof_libgcc}" = "x1" ; then
> +     backtrace_method="libgcc"
> +-    AC_DEFINE([JEMALLOC_PROF_LIBGCC], [ ])
> ++    AC_DEFINE([JEMALLOC_PROF_LIBGCC], [ ], [ ])
> +   fi
> + else
> +   enable_prof_libgcc="0"
> +@@ -1278,7 +1278,7 @@ if test "x$backtrace_method" = "x" -a "x$enable_prof_gcc" = "x1" \
> +      -a "x$GCC" = "xyes" ; then
> +   JE_CFLAGS_ADD([-fno-omit-frame-pointer])
> +   backtrace_method="gcc intrinsics"
> +-  AC_DEFINE([JEMALLOC_PROF_GCC], [ ])
> ++  AC_DEFINE([JEMALLOC_PROF_GCC], [ ], [ ])
> + else
> +   enable_prof_gcc="0"
> + fi
> +@@ -1293,19 +1293,19 @@ if test "x$enable_prof" = "x1" ; then
> +   dnl Heap profiling uses the log(3) function.
> +   JE_APPEND_VS(LIBS, $LM)
> +
> +-  AC_DEFINE([JEMALLOC_PROF], [ ])
> ++  AC_DEFINE([JEMALLOC_PROF], [ ], [ ])
> + fi
> + AC_SUBST([enable_prof])
> +
> + dnl Indicate whether adjacent virtual memory mappings automatically coalesce
> + dnl (and fragment on demand).
> + if test "x${maps_coalesce}" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_MAPS_COALESCE], [ ])
> ++  AC_DEFINE([JEMALLOC_MAPS_COALESCE], [ ], [ ])
> + fi
> +
> + dnl Indicate whether to retain memory (rather than using munmap()) by default.
> + if test "x$default_retain" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_RETAIN], [ ])
> ++  AC_DEFINE([JEMALLOC_RETAIN], [ ], [ ])
> + fi
> +
> + dnl Enable allocation from DSS if supported by the OS.
> +@@ -1322,7 +1322,7 @@ else
> + fi
> +
> + if test "x$have_dss" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_DSS], [ ])
> ++  AC_DEFINE([JEMALLOC_DSS], [ ], [ ])
> + fi
> +
> + dnl Support the junk/zero filling option by default.
> +@@ -1337,7 +1337,7 @@ fi
> + [enable_fill="1"]
> + )
> + if test "x$enable_fill" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_FILL], [ ])
> ++  AC_DEFINE([JEMALLOC_FILL], [ ], [ ])
> + fi
> + AC_SUBST([enable_fill])
> +
> +@@ -1365,7 +1365,7 @@ if test "x${je_cv_utrace}" = "xno" ; then
> +   enable_utrace="0"
> + fi
> + if test "x$enable_utrace" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_UTRACE], [ ])
> ++  AC_DEFINE([JEMALLOC_UTRACE], [ ], [ ])
> + fi
> + AC_SUBST([enable_utrace])
> +
> +@@ -1381,7 +1381,7 @@ fi
> + [enable_xmalloc="0"]
> + )
> + if test "x$enable_xmalloc" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_XMALLOC], [ ])
> ++  AC_DEFINE([JEMALLOC_XMALLOC], [ ], [ ])
> + fi
> + AC_SUBST([enable_xmalloc])
> +
> +@@ -1398,7 +1398,7 @@ fi
> + [enable_cache_oblivious="1"]
> + )
> + if test "x$enable_cache_oblivious" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_CACHE_OBLIVIOUS], [ ])
> ++  AC_DEFINE([JEMALLOC_CACHE_OBLIVIOUS], [ ], [ ])
> + fi
> + AC_SUBST([enable_cache_oblivious])
> +
> +@@ -1414,7 +1414,7 @@ fi
> + [enable_log="0"]
> + )
> + if test "x$enable_log" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_LOG], [ ])
> ++  AC_DEFINE([JEMALLOC_LOG], [ ], [ ])
> + fi
> + AC_SUBST([enable_log])
> +
> +@@ -1430,7 +1430,7 @@ fi
> + [enable_readlinkat="0"]
> + )
> + if test "x$enable_readlinkat" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_READLINKAT], [ ])
> ++  AC_DEFINE([JEMALLOC_READLINKAT], [ ], [ ])
> + fi
> + AC_SUBST([enable_readlinkat])
> +
> +@@ -1447,7 +1447,7 @@ fi
> + [enable_opt_safety_checks="0"]
> + )
> + if test "x$enable_opt_safety_checks" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_OPT_SAFETY_CHECKS], [ ])
> ++  AC_DEFINE([JEMALLOC_OPT_SAFETY_CHECKS], [ ], [ ])
> + fi
> + AC_SUBST([enable_opt_safety_checks])
> +
> +@@ -1461,9 +1461,9 @@ void foo (void) {
> + 	}
> + ], [je_cv_gcc_builtin_unreachable])
> + if test "x${je_cv_gcc_builtin_unreachable}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_INTERNAL_UNREACHABLE], [__builtin_unreachable])
> ++  AC_DEFINE([JEMALLOC_INTERNAL_UNREACHABLE], [__builtin_unreachable], [ ])
> + else
> +-  AC_DEFINE([JEMALLOC_INTERNAL_UNREACHABLE], [abort])
> ++  AC_DEFINE([JEMALLOC_INTERNAL_UNREACHABLE], [abort], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -1483,9 +1483,9 @@ JE_COMPILABLE([a program using __builtin_ffsl], [
> + 	}
> + ], [je_cv_gcc_builtin_ffsl])
> + if test "x${je_cv_gcc_builtin_ffsl}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_INTERNAL_FFSLL], [__builtin_ffsll])
> +-  AC_DEFINE([JEMALLOC_INTERNAL_FFSL], [__builtin_ffsl])
> +-  AC_DEFINE([JEMALLOC_INTERNAL_FFS], [__builtin_ffs])
> ++  AC_DEFINE([JEMALLOC_INTERNAL_FFSLL], [__builtin_ffsll], [ ])
> ++  AC_DEFINE([JEMALLOC_INTERNAL_FFSL], [__builtin_ffsl], [ ])
> ++  AC_DEFINE([JEMALLOC_INTERNAL_FFS], [__builtin_ffs], [ ])
> + else
> +   JE_COMPILABLE([a program using ffsl], [
> +   #include <stdio.h>
> +@@ -1498,9 +1498,9 @@ else
> + 	}
> +   ], [je_cv_function_ffsl])
> +   if test "x${je_cv_function_ffsl}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_INTERNAL_FFSLL], [ffsll])
> +-    AC_DEFINE([JEMALLOC_INTERNAL_FFSL], [ffsl])
> +-    AC_DEFINE([JEMALLOC_INTERNAL_FFS], [ffs])
> ++    AC_DEFINE([JEMALLOC_INTERNAL_FFSLL], [ffsll], [ ])
> ++    AC_DEFINE([JEMALLOC_INTERNAL_FFSL], [ffsl], [ ])
> ++    AC_DEFINE([JEMALLOC_INTERNAL_FFS], [ffs], [ ])
> +   else
> +     AC_MSG_ERROR([Cannot build without ffsl(3) or __builtin_ffsl()])
> +   fi
> +@@ -1517,8 +1517,8 @@ JE_COMPILABLE([a program using __builtin_popcountl], [
> + 	}
> + ], [je_cv_gcc_builtin_popcountl])
> + if test "x${je_cv_gcc_builtin_popcountl}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_INTERNAL_POPCOUNT], [__builtin_popcount])
> +-  AC_DEFINE([JEMALLOC_INTERNAL_POPCOUNTL], [__builtin_popcountl])
> ++  AC_DEFINE([JEMALLOC_INTERNAL_POPCOUNT], [__builtin_popcount], [ ])
> ++  AC_DEFINE([JEMALLOC_INTERNAL_POPCOUNTL], [__builtin_popcountl], [ ])
> + fi
> +
> + AC_ARG_WITH([lg_quantum],
> +@@ -1527,7 +1527,7 @@ AC_ARG_WITH([lg_quantum],
> +   [LG_QUANTA="$with_lg_quantum"],
> +   [LG_QUANTA="3 4"])
> + if test "x$with_lg_quantum" != "x" ; then
> +-  AC_DEFINE_UNQUOTED([LG_QUANTUM], [$with_lg_quantum])
> ++  AC_DEFINE_UNQUOTED([LG_QUANTUM], [$with_lg_quantum], [ ])
> + fi
> +
> + AC_ARG_WITH([lg_page],
> +@@ -1579,7 +1579,7 @@ if test "x${je_cv_lg_page}" != "x" ; then
> +   LG_PAGE="${je_cv_lg_page}"
> + fi
> + if test "x${LG_PAGE}" != "xundefined" ; then
> +-   AC_DEFINE_UNQUOTED([LG_PAGE], [$LG_PAGE])
> ++   AC_DEFINE_UNQUOTED([LG_PAGE], [$LG_PAGE], [ ])
> + else
> +    AC_MSG_ERROR([cannot determine value for LG_PAGE])
> + fi
> +@@ -1616,7 +1616,7 @@ if test "x${LG_PAGE}" != "xundefined" -a \
> +         "${je_cv_lg_hugepage}" -lt "${LG_PAGE}" ; then
> +   AC_MSG_ERROR([Huge page size (2^${je_cv_lg_hugepage}) must be at least page size (2^${LG_PAGE})])
> + fi
> +-AC_DEFINE_UNQUOTED([LG_HUGEPAGE], [${je_cv_lg_hugepage}])
> ++AC_DEFINE_UNQUOTED([LG_HUGEPAGE], [${je_cv_lg_hugepage}], [ ])
> +
> + dnl ============================================================================
> + dnl Enable libdl by default.
> +@@ -1637,7 +1637,7 @@ dnl ============================================================================
> + dnl Configure pthreads.
> +
> + if test "x$abi" != "xpecoff" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_PTHREAD], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_PTHREAD], [ ], [ ])
> +   AC_CHECK_HEADERS([pthread.h], , [AC_MSG_ERROR([pthread.h is missing])])
> +   dnl Some systems may embed pthreads functionality in libc; check for libpthread
> +   dnl first, but try libc too before failing.
> +@@ -1655,7 +1655,7 @@ dnl Check if we have dlsym support.
> +         [AC_CHECK_LIB([dl], [dlsym], [LIBS="$LIBS -ldl"], [have_dlsym="0"])]),
> +       [have_dlsym="0"])
> +     if test "x$have_dlsym" = "x1" ; then
> +-      AC_DEFINE([JEMALLOC_HAVE_DLSYM], [ ])
> ++      AC_DEFINE([JEMALLOC_HAVE_DLSYM], [ ], [ ])
> +     fi
> +   else
> +     have_dlsym="0"
> +@@ -1667,7 +1667,7 @@ dnl Check if we have dlsym support.
> +   pthread_atfork((void *)0, (void *)0, (void *)0);
> + ], [je_cv_pthread_atfork])
> +   if test "x${je_cv_pthread_atfork}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_HAVE_PTHREAD_ATFORK], [ ])
> ++    AC_DEFINE([JEMALLOC_HAVE_PTHREAD_ATFORK], [ ], [ ])
> +   fi
> +   dnl Check if pthread_setname_np is available with the expected API.
> +   JE_COMPILABLE([pthread_setname_np(3)], [
> +@@ -1676,7 +1676,7 @@ dnl Check if we have dlsym support.
> +   pthread_setname_np(pthread_self(), "setname_test");
> + ], [je_cv_pthread_setname_np])
> +   if test "x${je_cv_pthread_setname_np}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_HAVE_PTHREAD_SETNAME_NP], [ ])
> ++    AC_DEFINE([JEMALLOC_HAVE_PTHREAD_SETNAME_NP], [ ], [ ])
> +   fi
> + fi
> +
> +@@ -1708,7 +1708,7 @@ JE_COMPILABLE([clock_gettime(CLOCK_MONOTONIC_COARSE, ...)], [
> + 	clock_gettime(CLOCK_MONOTONIC_COARSE, &ts);
> + ], [je_cv_clock_monotonic_coarse])
> + if test "x${je_cv_clock_monotonic_coarse}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_CLOCK_MONOTONIC_COARSE])
> ++  AC_DEFINE([JEMALLOC_HAVE_CLOCK_MONOTONIC_COARSE], [ ], [ ])
> + fi
> +
> + dnl check for CLOCK_MONOTONIC.
> +@@ -1724,7 +1724,7 @@ JE_COMPILABLE([clock_gettime(CLOCK_MONOTONIC, ...)], [
> + #endif
> + ], [je_cv_clock_monotonic])
> + if test "x${je_cv_clock_monotonic}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_CLOCK_MONOTONIC])
> ++  AC_DEFINE([JEMALLOC_HAVE_CLOCK_MONOTONIC], [ ], [ ])
> + fi
> +
> + dnl Check for mach_absolute_time().
> +@@ -1734,7 +1734,7 @@ JE_COMPILABLE([mach_absolute_time()], [
> + 	mach_absolute_time();
> + ], [je_cv_mach_absolute_time])
> + if test "x${je_cv_mach_absolute_time}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_MACH_ABSOLUTE_TIME])
> ++  AC_DEFINE([JEMALLOC_HAVE_MACH_ABSOLUTE_TIME], [ ], [ ])
> + fi
> +
> + dnl Use syscall(2) (if available) by default.
> +@@ -1762,7 +1762,7 @@ if test "x$enable_syscall" = "x1" ; then
> +                 [je_cv_syscall])
> +   JE_CFLAGS_RESTORE()
> +   if test "x$je_cv_syscall" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_USE_SYSCALL], [ ])
> ++    AC_DEFINE([JEMALLOC_USE_SYSCALL], [ ], [ ])
> +   fi
> + fi
> +
> +@@ -1772,7 +1772,7 @@ AC_CHECK_FUNC([secure_getenv],
> +               [have_secure_getenv="0"]
> +              )
> + if test "x$have_secure_getenv" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_SECURE_GETENV], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_SECURE_GETENV], [ ], [ ])
> + fi
> +
> + dnl Check if the GNU-specific sched_getcpu function exists.
> +@@ -1781,7 +1781,7 @@ AC_CHECK_FUNC([sched_getcpu],
> +               [have_sched_getcpu="0"]
> +              )
> + if test "x$have_sched_getcpu" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_SCHED_GETCPU], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_SCHED_GETCPU], [ ], [ ])
> + fi
> +
> + dnl Check if the GNU-specific sched_setaffinity function exists.
> +@@ -1790,7 +1790,7 @@ AC_CHECK_FUNC([sched_setaffinity],
> +               [have_sched_setaffinity="0"]
> +              )
> + if test "x$have_sched_setaffinity" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_SCHED_SETAFFINITY], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_SCHED_SETAFFINITY], [ ], [ ])
> + fi
> +
> + dnl Check if the Solaris/BSD issetugid function exists.
> +@@ -1799,7 +1799,7 @@ AC_CHECK_FUNC([issetugid],
> +               [have_issetugid="0"]
> +              )
> + if test "x$have_issetugid" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_ISSETUGID], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_ISSETUGID], [ ], [ ])
> + fi
> +
> + dnl Check whether the BSD-specific _malloc_thread_cleanup() exists.  If so, use
> +@@ -1811,7 +1811,7 @@ AC_CHECK_FUNC([_malloc_thread_cleanup],
> +               [have__malloc_thread_cleanup="0"]
> +              )
> + if test "x$have__malloc_thread_cleanup" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_MALLOC_THREAD_CLEANUP], [ ])
> ++  AC_DEFINE([JEMALLOC_MALLOC_THREAD_CLEANUP], [ ], [ ])
> +   wrap_syms="${wrap_syms} _malloc_thread_cleanup"
> +   force_tls="1"
> + fi
> +@@ -1824,7 +1824,7 @@ AC_CHECK_FUNC([_pthread_mutex_init_calloc_cb],
> +               [have__pthread_mutex_init_calloc_cb="0"]
> +              )
> + if test "x$have__pthread_mutex_init_calloc_cb" = "x1" ; then
> +-  AC_DEFINE([JEMALLOC_MUTEX_INIT_CB])
> ++  AC_DEFINE([JEMALLOC_MUTEX_INIT_CB], [ ], [ ])
> +   wrap_syms="${wrap_syms} _malloc_prefork _malloc_postfork"
> + fi
> +
> +@@ -1854,7 +1854,7 @@ if test "x${enable_lazy_lock}" = "x1" -a "x${abi}" = "xpecoff" ; then
> + fi
> + if test "x$enable_lazy_lock" = "x1" ; then
> +   if test "x$have_dlsym" = "x1" ; then
> +-    AC_DEFINE([JEMALLOC_LAZY_LOCK], [ ])
> ++    AC_DEFINE([JEMALLOC_LAZY_LOCK], [ ], [ ])
> +   else
> +     AC_MSG_ERROR([Missing dlsym support: lazy-lock cannot be enabled.])
> +   fi
> +@@ -1887,7 +1887,7 @@ else
> + fi
> + AC_SUBST([enable_tls])
> + if test "x${enable_tls}" = "x1" ; then
> +-  AC_DEFINE_UNQUOTED([JEMALLOC_TLS], [ ])
> ++  AC_DEFINE_UNQUOTED([JEMALLOC_TLS], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -1908,7 +1908,7 @@ JE_COMPILABLE([C11 atomics], [
> +     return r == 0;
> + ], [je_cv_c11_atomics])
> + if test "x${je_cv_c11_atomics}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_C11_ATOMICS])
> ++  AC_DEFINE([JEMALLOC_C11_ATOMICS], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -1923,7 +1923,7 @@ JE_COMPILABLE([GCC __atomic atomics], [
> +     return after_add == 1;
> + ], [je_cv_gcc_atomic_atomics])
> + if test "x${je_cv_gcc_atomic_atomics}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_GCC_ATOMIC_ATOMICS])
> ++  AC_DEFINE([JEMALLOC_GCC_ATOMIC_ATOMICS], [ ], [ ])
> +
> +   dnl check for 8-bit atomic support
> +   JE_COMPILABLE([GCC 8-bit __atomic atomics], [
> +@@ -1935,7 +1935,7 @@ if test "x${je_cv_gcc_atomic_atomics}" = "xyes" ; then
> +       return after_add == 1;
> +   ], [je_cv_gcc_u8_atomic_atomics])
> +   if test "x${je_cv_gcc_u8_atomic_atomics}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_GCC_U8_ATOMIC_ATOMICS])
> ++    AC_DEFINE([JEMALLOC_GCC_U8_ATOMIC_ATOMICS], [ ], [ ])
> +   fi
> + fi
> +
> +@@ -1950,7 +1950,7 @@ JE_COMPILABLE([GCC __sync atomics], [
> +     return (before_add == 0) && (after_add == 1);
> + ], [je_cv_gcc_sync_atomics])
> + if test "x${je_cv_gcc_sync_atomics}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_GCC_SYNC_ATOMICS])
> ++  AC_DEFINE([JEMALLOC_GCC_SYNC_ATOMICS], [ ], [ ])
> +
> +   dnl check for 8-bit atomic support
> +   JE_COMPILABLE([GCC 8-bit __sync atomics], [
> +@@ -1961,7 +1961,7 @@ if test "x${je_cv_gcc_sync_atomics}" = "xyes" ; then
> +       return (before_add == 0) && (after_add == 1);
> +   ], [je_cv_gcc_u8_sync_atomics])
> +   if test "x${je_cv_gcc_u8_sync_atomics}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_GCC_U8_SYNC_ATOMICS])
> ++    AC_DEFINE([JEMALLOC_GCC_U8_SYNC_ATOMICS], [ ], [ ])
> +   fi
> + fi
> +
> +@@ -1986,7 +1986,7 @@ JE_COMPILABLE([Darwin OSAtomic*()], [
> + 	}
> + ], [je_cv_osatomic])
> + if test "x${je_cv_osatomic}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_OSATOMIC], [ ])
> ++  AC_DEFINE([JEMALLOC_OSATOMIC], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -1998,7 +1998,7 @@ JE_COMPILABLE([madvise(2)], [
> + 	madvise((void *)0, 0, 0);
> + ], [je_cv_madvise])
> + if test "x${je_cv_madvise}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_MADVISE], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_MADVISE], [ ], [ ])
> +
> +   dnl Check for madvise(..., MADV_FREE).
> +   JE_COMPILABLE([madvise(..., MADV_FREE)], [
> +@@ -2007,12 +2007,12 @@ if test "x${je_cv_madvise}" = "xyes" ; then
> + 	madvise((void *)0, 0, MADV_FREE);
> + ], [je_cv_madv_free])
> +   if test "x${je_cv_madv_free}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_PURGE_MADVISE_FREE], [ ])
> ++    AC_DEFINE([JEMALLOC_PURGE_MADVISE_FREE], [ ], [ ])
> +   elif test "x${je_cv_madvise}" = "xyes" ; then
> +     case "${host_cpu}" in i686|x86_64)
> +         case "${host}" in *-*-linux*)
> +-            AC_DEFINE([JEMALLOC_PURGE_MADVISE_FREE], [ ])
> +-            AC_DEFINE([JEMALLOC_DEFINE_MADVISE_FREE], [ ])
> ++            AC_DEFINE([JEMALLOC_PURGE_MADVISE_FREE], [ ], [ ])
> ++            AC_DEFINE([JEMALLOC_DEFINE_MADVISE_FREE], [ ], [ ])
> + 	    ;;
> +         esac
> +         ;;
> +@@ -2026,7 +2026,7 @@ if test "x${je_cv_madvise}" = "xyes" ; then
> + 	madvise((void *)0, 0, MADV_DONTNEED);
> + ], [je_cv_madv_dontneed])
> +   if test "x${je_cv_madv_dontneed}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_PURGE_MADVISE_DONTNEED], [ ])
> ++    AC_DEFINE([JEMALLOC_PURGE_MADVISE_DONTNEED], [ ], [ ])
> +   fi
> +
> +   dnl Check for madvise(..., MADV_DO[NT]DUMP).
> +@@ -2037,7 +2037,7 @@ if test "x${je_cv_madvise}" = "xyes" ; then
> + 	madvise((void *)0, 0, MADV_DODUMP);
> + ], [je_cv_madv_dontdump])
> +   if test "x${je_cv_madv_dontdump}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_MADVISE_DONTDUMP], [ ])
> ++    AC_DEFINE([JEMALLOC_MADVISE_DONTDUMP], [ ], [ ])
> +   fi
> +
> +   dnl Check for madvise(..., MADV_[NO]HUGEPAGE).
> +@@ -2052,7 +2052,7 @@ case "${host_cpu}" in
> +     ;;
> +   *)
> +   if test "x${je_cv_thp}" = "xyes" ; then
> +-    AC_DEFINE([JEMALLOC_HAVE_MADVISE_HUGE], [ ])
> ++    AC_DEFINE([JEMALLOC_HAVE_MADVISE_HUGE], [ ], [ ])
> +   fi
> +   ;;
> + esac
> +@@ -2078,7 +2078,7 @@ AC_CACHE_CHECK([for __builtin_clz],
> +                                [je_cv_builtin_clz=no])])
> +
> + if test "x${je_cv_builtin_clz}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_BUILTIN_CLZ], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_BUILTIN_CLZ], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -2097,7 +2097,7 @@ JE_COMPILABLE([Darwin os_unfair_lock_*()], [
> + 	#endif
> + ], [je_cv_os_unfair_lock])
> + if test "x${je_cv_os_unfair_lock}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_OS_UNFAIR_LOCK], [ ])
> ++  AC_DEFINE([JEMALLOC_OS_UNFAIR_LOCK], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -2123,7 +2123,7 @@ if test "x${enable_zone_allocator}" = "x1" ; then
> +   if test "x${abi}" != "xmacho"; then
> +     AC_MSG_ERROR([--enable-zone-allocator is only supported on Darwin])
> +   fi
> +-  AC_DEFINE([JEMALLOC_ZONE], [ ])
> ++  AC_DEFINE([JEMALLOC_ZONE], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -2144,16 +2144,17 @@ AC_SUBST([enable_initial_exec_tls])
> + if test "x${je_cv_tls_model}" = "xyes" -a \
> +        "x${enable_initial_exec_tls}" = "x1" ; then
> +   AC_DEFINE([JEMALLOC_TLS_MODEL],
> +-            [__attribute__((tls_model("initial-exec")))])
> ++            [__attribute__((tls_model("initial-exec")))],
> ++            [ ])
> + else
> +-  AC_DEFINE([JEMALLOC_TLS_MODEL], [ ])
> ++  AC_DEFINE([JEMALLOC_TLS_MODEL], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> + dnl Enable background threads if possible.
> +
> + if test "x${have_pthread}" = "x1" -a "x${je_cv_os_unfair_lock}" != "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_BACKGROUND_THREAD])
> ++  AC_DEFINE([JEMALLOC_BACKGROUND_THREAD], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +@@ -2173,7 +2174,7 @@ extern void *(* __realloc_hook)(void *ptr, size_t size);
> + ], [je_cv_glibc_malloc_hook])
> + if test "x${je_cv_glibc_malloc_hook}" = "xyes" ; then
> +   if test "x${JEMALLOC_PREFIX}" = "x" ; then
> +-    AC_DEFINE([JEMALLOC_GLIBC_MALLOC_HOOK], [ ])
> ++    AC_DEFINE([JEMALLOC_GLIBC_MALLOC_HOOK], [ ], [ ])
> +     wrap_syms="${wrap_syms} __free_hook __malloc_hook __realloc_hook"
> +   fi
> + fi
> +@@ -2188,7 +2189,7 @@ extern void *(* __memalign_hook)(size_t alignment, size_t size);
> + ], [je_cv_glibc_memalign_hook])
> + if test "x${je_cv_glibc_memalign_hook}" = "xyes" ; then
> +   if test "x${JEMALLOC_PREFIX}" = "x" ; then
> +-    AC_DEFINE([JEMALLOC_GLIBC_MEMALIGN_HOOK], [ ])
> ++    AC_DEFINE([JEMALLOC_GLIBC_MEMALIGN_HOOK], [ ], [ ])
> +     wrap_syms="${wrap_syms} __memalign_hook"
> +   fi
> + fi
> +@@ -2202,7 +2203,7 @@ JE_COMPILABLE([pthreads adaptive mutexes], [
> +   pthread_mutexattr_destroy(&attr);
> + ], [je_cv_pthread_mutex_adaptive_np])
> + if test "x${je_cv_pthread_mutex_adaptive_np}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_HAVE_PTHREAD_MUTEX_ADAPTIVE_NP], [ ])
> ++  AC_DEFINE([JEMALLOC_HAVE_PTHREAD_MUTEX_ADAPTIVE_NP], [ ], [ ])
> + fi
> +
> + JE_CFLAGS_SAVE()
> +@@ -2221,7 +2222,7 @@ JE_COMPILABLE([strerror_r returns char with gnu source], [
> + ], [je_cv_strerror_r_returns_char_with_gnu_source])
> + JE_CFLAGS_RESTORE()
> + if test "x${je_cv_strerror_r_returns_char_with_gnu_source}" = "xyes" ; then
> +-  AC_DEFINE([JEMALLOC_STRERROR_R_RETURNS_CHAR_WITH_GNU_SOURCE], [ ])
> ++  AC_DEFINE([JEMALLOC_STRERROR_R_RETURNS_CHAR_WITH_GNU_SOURCE], [ ], [ ])
> + fi
> +
> + dnl ============================================================================
> +--
> +2.33.0
> +
> diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
> index 17a04e11a..65b676920 100644
> --- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
> +++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
>   
>   SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https \
>              file://0001-Makefile.in-make-sure-doc-generated-before-install.patch \
> +           file://0001-Support-latest-version-of-autoconf.patch \
>              file://run-ptest \
>   "
>   
> @@ -24,8 +25,6 @@ S = "${WORKDIR}/git"
>   
>   inherit autotools ptest
>   
> -EXTRA_AUTORECONF += "--exclude=autoheader"
> -
>   EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
>   
>   do_install:append() {

