Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E747C783B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 16:51:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 65so10242378wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=foKGihhxbQu/L08OgE9yp09L4mGbDNmAEL+tyEDzF/M=;
	b=NSUqfQQs6mxpAqovQcRlGGrgafn186n86dUbzCUqEB0CJqyH4+5Zht1mzc4AOSCc39
	scT26vMDiNYreQlGe1mlNVPFD2uV0PC46oXssF/YdodmM+Ybg9YffciGV3K+T0VpA8V9
	zXZp6YlNF2A5lBMGfpYdxOnJxw5Vi8Or62P7UIH0x7MwdBtPuvbHDP4iaG5uacOaI/VL
	T+eR12APiuvA6XEBDqbKlVFJ9D1mi7KR5Y3vhMFcj4p7ti+O/ry/tRNBaWF3ivpwqgKB
	5w5whsPzQ8Y2+7KIiHse3ukBZy+9yn3I9JUiNJ4DhlJt+GFXvrQp+Lo/sFCLl/f9xAY6
	j3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=foKGihhxbQu/L08OgE9yp09L4mGbDNmAEL+tyEDzF/M=;
	b=rieDmkuCXEZ9qGxQm1hPqGoRPdsY72MYHWCSTAJSvsMqzDMUD6QqmgNIy9J3WXSo9w
	vf/PnD9cavrXs7GrbTuV4HC0BRKOq9CeT3Mlmex99yzQRswQUOO0CWBqC3L8KxkLQNj/
	37imfQFAd9MMVeo4rwBxRnbV9Wr4SHGT13rFeF7eQlCtu3gdVwMQss1lnUzE6vz3Y9NW
	SApiVGE7jcVHQ8XgqcILTQez3cLRn6KPlPeO8x5lJCWaBwXA+ZZnk0Kyg+Bwg48jiu1x
	oJEmJxFyxYuOvXDVHo9e0XK4/aYOisdxFIf9y+7Z5Pc9ZOI8wjNIg9b3Mpz9IZXOd7O+
	FkyQ==
X-Gm-Message-State: AIVw113TH4lFPo2RyiAYMe/qsboz7jpeXm8Ow8DvqwKqRF7ynR0yUC3I
	5xAyY6OQs/M+GxRuI3c0R52x8Bl07A==
X-Received: by 10.80.176.162 with SMTP id j31mr9307716edd.186.1500742319513;
	Sat, 22 Jul 2017 09:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Sat, 22 Jul 2017 09:51:29 -0700 (PDT)
In-Reply-To: <CA+chaQeg69bHANtE_LOQhrhmVCTW7t3tWyWa9rqGFmPtecx5YA@mail.gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
	<20170718031013.44536-17-raj.khem@gmail.com>
	<CA+chaQfN+Q2wjK6DzEvK8z69V48sDX1RYOR6RSM0dQss5MdA=A@mail.gmail.com>
	<CAMKF1sp0Ctt7HT16JHcLuPzmnZEp3FDTYKy-iVum+ypfjGVJ7Q@mail.gmail.com>
	<CA+chaQeg69bHANtE_LOQhrhmVCTW7t3tWyWa9rqGFmPtecx5YA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jul 2017 09:51:29 -0700
Message-ID: <CAMKF1so8E_87-n2Vrs6Thh2Hbh284d7h2iNJU29fe4LtovsRdA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 17/17] gperftools: Upgrade to 2.6.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Jul 2017 16:51:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 22, 2017 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I would be happy to test with qemuarmv7 and/or qemuarmv8 once they are added
> to oe-core.
>
> I know some people have qemuarmv7 for long time, but as long as qemuarm in
> oe-core defaults to armv5t I'll continue to test it.

may be stop testing with thumb ISA for now

>
> On Sat, Jul 22, 2017 at 5:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sat, Jul 22, 2017 at 3:00 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > Fails to build with:
>> > http://errors.yoctoproject.org/Errors/Details/148214/
>> >
>>
>> {standard input}: Assembler messages:
>> {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
>>
>> we need to get you off thumb1 somehow :)
>>
>> > On Tue, Jul 18, 2017 at 5:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> Fix build with musl
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>  .../0001-Fix-build-failure-for-ppc.patch           | 28 ----------
>> >>  .../gperftools/0001-fix-build-with-musl-libc.patch | 61
>> >> ++++++++++++++++++++++
>> >>  ...001-include-fcntl.h-for-loff_t-definition.patch | 28 ++++++++++
>> >>  .../{gperftools_2.5.bb => gperftools_2.6.1.bb}     | 13 ++---
>> >>  4 files changed, 96 insertions(+), 34 deletions(-)
>> >>  delete mode 100644
>> >>
>> >> meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
>> >>  create mode 100644
>> >>
>> >> meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
>> >>  create mode 100644
>> >>
>> >> meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
>> >>  rename meta-oe/recipes-support/gperftools/{gperftools_2.5.bb =>
>> >> gperftools_2.6.1.bb} (67%)
>> >>
>> >> diff --git
>> >>
>> >> a/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
>> >>
>> >> b/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
>> >> deleted file mode 100644
>> >> index 27f855d1e..000000000
>> >> ---
>> >>
>> >> a/meta-oe/recipes-support/gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
>> >> +++ /dev/null
>> >> @@ -1,28 +0,0 @@
>> >> -Subject: Fix build failure for ppc
>> >> -
>> >> -Upstream-Status: Pending
>> >> -
>> >> -Fix the following build failure.
>> >> -
>> >> -  error: 'siginfo_t' does not name a type
>> >> -
>> >> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> >> ----
>> >> - src/stacktrace_powerpc-linux-inl.h | 1 +
>> >> - 1 file changed, 1 insertion(+)
>> >> -
>> >> -diff --git a/src/stacktrace_powerpc-linux-inl.h
>> >> b/src/stacktrace_powerpc-linux-inl.h
>> >> -index 5d16fa1..a9bf775 100644
>> >> ---- a/src/stacktrace_powerpc-linux-inl.h
>> >> -+++ b/src/stacktrace_powerpc-linux-inl.h
>> >> -@@ -44,6 +44,7 @@
>> >> -
>> >> - #include <stdint.h>   // for uintptr_t
>> >> - #include <stdlib.h>   // for NULL
>> >> -+#include <signal.h>   // for siginfo_t
>> >> - #include <gperftools/stacktrace.h>
>> >> - #include <base/vdso_support.h>
>> >> -
>> >> ---
>> >> -2.8.3
>> >> -
>> >> diff --git
>> >>
>> >> a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
>> >>
>> >> b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
>> >> new file mode 100644
>> >> index 000000000..78621c7fe
>> >> --- /dev/null
>> >> +++
>> >>
>> >> b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
>> >> @@ -0,0 +1,61 @@
>> >> +From 157914941bd38f1a38bb6bd7294ca6c2bc1b8dcb Mon Sep 17 00:00:00 2001
>> >> +From: Khem Raj <raj.khem@gmail.com>
>> >> +Date: Sun, 16 Jul 2017 15:51:28 -0700
>> >> +Subject: [PATCH] fix build with musl libc
>> >> +
>> >> +Patch from https://github.com/gperftools/gperftools/pull/765/
>> >> +
>> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> +---
>> >> + configure.ac                 | 1 +
>> >> + src/malloc_hook_mmap_linux.h | 8 ++++++--
>> >> + 2 files changed, 7 insertions(+), 2 deletions(-)
>> >> +
>> >> +diff --git a/configure.ac b/configure.ac
>> >> +index b42fea3..70b49a3 100644
>> >> +--- a/configure.ac
>> >> ++++ b/configure.ac
>> >> +@@ -188,6 +188,7 @@ AC_HEADER_STDC
>> >> + AC_CHECK_TYPES([__int64])       # defined in some windows platforms
>> >> + AC_CHECK_TYPES([struct mallinfo],,, [#include <malloc.h>])
>> >> + AC_CHECK_TYPES([Elf32_Versym],,, [#include <elf.h>])   # for
>> >> vdso_support.h
>> >> ++AC_CHECK_FUNCS(__sbrk)          # for intercepting glibc memory
>> >> allocator
>> >> + AC_CHECK_FUNCS(sbrk)            # for tcmalloc to get memory
>> >> + AC_CHECK_FUNCS(geteuid)         # for turning off services when run
>> >> as
>> >> root
>> >> + AC_CHECK_FUNCS(fork)            # for the pthread_atfork setup
>> >> +diff --git a/src/malloc_hook_mmap_linux.h
>> >> b/src/malloc_hook_mmap_linux.h
>> >> +index 79ac4e3..d444635 100755
>> >> +--- a/src/malloc_hook_mmap_linux.h
>> >> ++++ b/src/malloc_hook_mmap_linux.h
>> >> +@@ -46,6 +46,10 @@
>> >> + #include <errno.h>
>> >> + #include "base/linux_syscall_support.h"
>> >> +
>> >> ++#ifndef __GLIBC__
>> >> ++typedef off64_t   __off64_t;
>> >> ++#endif
>> >> ++
>> >> + // The x86-32 case and the x86-64 case differ:
>> >> + // 32b has a mmap2() syscall, 64b does not.
>> >> + // 64b and 32b have different calling conventions for mmap().
>> >> +@@ -168,7 +172,7 @@ extern "C" void* mmap64(void *start, size_t
>> >> length,
>> >> int prot, int flags,
>> >> +   return result;
>> >> + }
>> >> +
>> >> +-# if !defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH)
>> >> ++# if defined(__GLIBC__) && (!defined(__USE_FILE_OFFSET64) ||
>> >> !defined(__REDIRECT_NTH))
>> >> +
>> >> + extern "C" void* mmap(void *start, size_t length, int prot, int
>> >> flags,
>> >> +                       int fd, off_t offset) __THROW {
>> >> +@@ -206,7 +210,7 @@ extern "C" void* mremap(void* old_addr, size_t
>> >> old_size, size_t new_size,
>> >> +   return result;
>> >> + }
>> >> +
>> >> +-#ifndef __UCLIBC__
>> >> ++#if HAVE___SBRK
>> >> + // libc's version:
>> >> + extern "C" void* __sbrk(ptrdiff_t increment);
>> >> +
>> >> +--
>> >> +2.13.3
>> >> +
>> >> diff --git
>> >>
>> >> a/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
>> >>
>> >> b/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
>> >> new file mode 100644
>> >> index 000000000..667008a5b
>> >> --- /dev/null
>> >> +++
>> >>
>> >> b/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
>> >> @@ -0,0 +1,28 @@
>> >> +From 04ea8e001501931f4dbf20288aca78469617b08a Mon Sep 17 00:00:00 2001
>> >> +From: Khem Raj <raj.khem@gmail.com>
>> >> +Date: Sun, 16 Jul 2017 19:28:17 -0700
>> >> +Subject: [PATCH] include fcntl.h for loff_t definition
>> >> +
>> >> +Fixes
>> >> +linux_syscall_support.h:2641:26: error: 'loff_t' has not been declared
>> >> +
>> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> +---
>> >> + src/base/linux_syscall_support.h | 1 +
>> >> + 1 file changed, 1 insertion(+)
>> >> +
>> >> +diff --git a/src/base/linux_syscall_support.h
>> >> b/src/base/linux_syscall_support.h
>> >> +index 85347a2..70431ca 100644
>> >> +--- a/src/base/linux_syscall_support.h
>> >> ++++ b/src/base/linux_syscall_support.h
>> >> +@@ -162,6 +162,7 @@ extern "C" {
>> >> + #include <unistd.h>
>> >> + #include <linux/unistd.h>
>> >> + #include <endian.h>
>> >> ++#include <fcntl.h>
>> >> +
>> >> + #ifdef __mips__
>> >> + /* Include definitions of the ABI currently in use.
>> >> */
>> >> +--
>> >> +2.13.3
>> >> +
>> >> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
>> >> b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
>> >> similarity index 67%
>> >> rename from meta-oe/recipes-support/gperftools/gperftools_2.5.bb
>> >> rename to meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
>> >> index 43780a5ee..946463805 100644
>> >> --- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
>> >> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
>> >> @@ -2,19 +2,20 @@ SUMMARY = "Fast, multi-threaded malloc() and nifty
>> >> performance analysis tools"
>> >>  HOMEPAGE = "http://code.google.com/p/gperftools/"
>> >>  LICENSE = "BSD"
>> >>  LIC_FILES_CHKSUM =
>> >> "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
>> >> -DEPENDS = "libunwind"
>> >> +DEPENDS += "libunwind"
>> >>
>> >> -SRC_URI =
>> >>
>> >> "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz
>> >> \
>> >> +SRCREV = "bf840dec0495e17f5c8403e68e10b9d6bf05c559"
>> >> +SRC_URI = "git://github.com/gperftools/gperftools \
>> >>             file://0001-Support-Atomic-ops-on-clang.patch \
>> >> -           file://0001-Fix-build-failure-for-ppc.patch \
>> >>             file://0001-Use-ucontext_t-instead-of-struct-ucontext.patch
>> >> \
>> >> +           file://0001-fix-build-with-musl-libc.patch \
>> >> +           file://0001-include-fcntl.h-for-loff_t-definition.patch \
>> >>             "
>> >>
>> >> -SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
>> >> -SRC_URI[sha256sum] =
>> >> "6fa2748f1acdf44d750253e160cf6e2e72571329b42e563b455bde09e9e85173"
>> >> -
>> >>  inherit autotools
>> >>
>> >> +S = "${WORKDIR}/git"
>> >> +
>> >>  # On mips, we have the following error.
>> >>  #   do_page_fault(): sending SIGSEGV to ls for invalid read access
>> >> from
>> >> 00000008
>> >>  #   Segmentation fault (core dumped)
>> >> --
>> >> 2.13.3
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>
>

