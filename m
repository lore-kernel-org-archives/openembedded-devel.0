Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 93FE3605B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 10:00:30 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id a7so717034ywi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 03:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tNhy/8r7JTeRv7oCCemRIobiZ/O85WftDJANeIILKC8=;
	b=dL0QIYIG/Zrqt6CnJRpN39ZMtFnb6yi+XHOx/gjWQ+OvDTxtMiUt5DHT4bQpnqkys6
	06mn50M42Oi2+pyxYYXYnUF9L3jrJYZnxVx3k58pO8uUcpnIGg25ghXUn36yy99nsD+7
	Mey8IIuYlW99SJVHR+qUdpkLjdsD4pvwLYAoQchrJPh+UiWixMNa4ri0YGeoykE+thQn
	39I1QqDH3hUCP0MgwgCUmK+zG23yHUTIH6ot5biN0T5oWlZud4iBded3i2hmPhamfIw7
	yMPEfuHRT7WD8YyDWWnc2729gCNK2OiZTv7nuhr91oREeDI+m1xiY3kjDvBdlCKkJ5cq
	XWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tNhy/8r7JTeRv7oCCemRIobiZ/O85WftDJANeIILKC8=;
	b=Xi+R1E63q5fH7aKAx+KQjK2k3LBV7YgrvH2CUU0xW9E5hUwvv7h/lC9J6fn8xtMOPs
	Q7Xygjz5ySEbkj18E6g96vAnGfX0oreTNp9dz96+LKNvlX6AeYjOiqEXTqZJv0/v3Xmr
	qHUKY1pyVv+3W5MyTEQozjwPFi+bAQ9zc01G4E5eHeQ5A3nW9aFxSvW31b2FWKSdM8Z6
	2DIwHrDaKXbeXiBC6nejuivPOi8T+dKxKjfTG+4Z4Ebokit4pa+fWjBF6MlvDQ3RXEWN
	oU2wf33+QDn/M3nVFuvo1duUlgXinWUDIkmduEHqNiwdPPJPpL/Ziv2kWq474h/5GiIk
	WDvw==
X-Gm-Message-State: AIVw113B3RTp0eKhko9zJbqCsbfXE/BIPHAaziU+D4aUZINplKpErm4U
	irSEq+OIWUSxmNah4Oxt7ksmE2loIhDN
X-Received: by 10.129.79.17 with SMTP id d17mr8721681ywb.462.1500717630317;
	Sat, 22 Jul 2017 03:00:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Sat, 22 Jul 2017 03:00:29 -0700 (PDT)
In-Reply-To: <20170718031013.44536-17-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
	<20170718031013.44536-17-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Jul 2017 12:00:29 +0200
Message-ID: <CA+chaQfN+Q2wjK6DzEvK8z69V48sDX1RYOR6RSM0dQss5MdA=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Sat, 22 Jul 2017 10:00:30 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build with:
http://errors.yoctoproject.org/Errors/Details/148214/

On Tue, Jul 18, 2017 at 5:10 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Fix build with musl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Fix-build-failure-for-ppc.patch           | 28 ----------
>  .../gperftools/0001-fix-build-with-musl-libc.patch | 61
> ++++++++++++++++++++++
>  ...001-include-fcntl.h-for-loff_t-definition.patch | 28 ++++++++++
>  .../{gperftools_2.5.bb => gperftools_2.6.1.bb}     | 13 ++---
>  4 files changed, 96 insertions(+), 34 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-
> Fix-build-failure-for-ppc.patch
>  create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-
> fix-build-with-musl-libc.patch
>  create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-
> include-fcntl.h-for-loff_t-definition.patch
>  rename meta-oe/recipes-support/gperftools/{gperftools_2.5.bb =>
> gperftools_2.6.1.bb} (67%)
>
> diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-
> Fix-build-failure-for-ppc.patch b/meta-oe/recipes-support/
> gperftools/gperftools/0001-Fix-build-failure-for-ppc.patch
> deleted file mode 100644
> index 27f855d1e..000000000
> --- a/meta-oe/recipes-support/gperftools/gperftools/0001-
> Fix-build-failure-for-ppc.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Subject: Fix build failure for ppc
> -
> -Upstream-Status: Pending
> -
> -Fix the following build failure.
> -
> -  error: 'siginfo_t' does not name a type
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - src/stacktrace_powerpc-linux-inl.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-
> linux-inl.h
> -index 5d16fa1..a9bf775 100644
> ---- a/src/stacktrace_powerpc-linux-inl.h
> -+++ b/src/stacktrace_powerpc-linux-inl.h
> -@@ -44,6 +44,7 @@
> -
> - #include <stdint.h>   // for uintptr_t
> - #include <stdlib.h>   // for NULL
> -+#include <signal.h>   // for siginfo_t
> - #include <gperftools/stacktrace.h>
> - #include <base/vdso_support.h>
> -
> ---
> -2.8.3
> -
> diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
> b/meta-oe/recipes-support/gperftools/gperftools/0001-
> fix-build-with-musl-libc.patch
> new file mode 100644
> index 000000000..78621c7fe
> --- /dev/null
> +++ b/meta-oe/recipes-support/gperftools/gperftools/0001-
> fix-build-with-musl-libc.patch
> @@ -0,0 +1,61 @@
> +From 157914941bd38f1a38bb6bd7294ca6c2bc1b8dcb Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 16 Jul 2017 15:51:28 -0700
> +Subject: [PATCH] fix build with musl libc
> +
> +Patch from https://github.com/gperftools/gperftools/pull/765/
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac                 | 1 +
> + src/malloc_hook_mmap_linux.h | 8 ++++++--
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index b42fea3..70b49a3 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -188,6 +188,7 @@ AC_HEADER_STDC
> + AC_CHECK_TYPES([__int64])       # defined in some windows platforms
> + AC_CHECK_TYPES([struct mallinfo],,, [#include <malloc.h>])
> + AC_CHECK_TYPES([Elf32_Versym],,, [#include <elf.h>])   # for
> vdso_support.h
> ++AC_CHECK_FUNCS(__sbrk)          # for intercepting glibc memory allocator
> + AC_CHECK_FUNCS(sbrk)            # for tcmalloc to get memory
> + AC_CHECK_FUNCS(geteuid)         # for turning off services when run as
> root
> + AC_CHECK_FUNCS(fork)            # for the pthread_atfork setup
> +diff --git a/src/malloc_hook_mmap_linux.h b/src/malloc_hook_mmap_linux.h
> +index 79ac4e3..d444635 100755
> +--- a/src/malloc_hook_mmap_linux.h
> ++++ b/src/malloc_hook_mmap_linux.h
> +@@ -46,6 +46,10 @@
> + #include <errno.h>
> + #include "base/linux_syscall_support.h"
> +
> ++#ifndef __GLIBC__
> ++typedef off64_t   __off64_t;
> ++#endif
> ++
> + // The x86-32 case and the x86-64 case differ:
> + // 32b has a mmap2() syscall, 64b does not.
> + // 64b and 32b have different calling conventions for mmap().
> +@@ -168,7 +172,7 @@ extern "C" void* mmap64(void *start, size_t length,
> int prot, int flags,
> +   return result;
> + }
> +
> +-# if !defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH)
> ++# if defined(__GLIBC__) && (!defined(__USE_FILE_OFFSET64) ||
> !defined(__REDIRECT_NTH))
> +
> + extern "C" void* mmap(void *start, size_t length, int prot, int flags,
> +                       int fd, off_t offset) __THROW {
> +@@ -206,7 +210,7 @@ extern "C" void* mremap(void* old_addr, size_t
> old_size, size_t new_size,
> +   return result;
> + }
> +
> +-#ifndef __UCLIBC__
> ++#if HAVE___SBRK
> + // libc's version:
> + extern "C" void* __sbrk(ptrdiff_t increment);
> +
> +--
> +2.13.3
> +
> diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-
> include-fcntl.h-for-loff_t-definition.patch b/meta-oe/recipes-support/
> gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
> new file mode 100644
> index 000000000..667008a5b
> --- /dev/null
> +++ b/meta-oe/recipes-support/gperftools/gperftools/0001-
> include-fcntl.h-for-loff_t-definition.patch
> @@ -0,0 +1,28 @@
> +From 04ea8e001501931f4dbf20288aca78469617b08a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 16 Jul 2017 19:28:17 -0700
> +Subject: [PATCH] include fcntl.h for loff_t definition
> +
> +Fixes
> +linux_syscall_support.h:2641:26: error: 'loff_t' has not been declared
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/base/linux_syscall_support.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/base/linux_syscall_support.h b/src/base/linux_syscall_
> support.h
> +index 85347a2..70431ca 100644
> +--- a/src/base/linux_syscall_support.h
> ++++ b/src/base/linux_syscall_support.h
> +@@ -162,6 +162,7 @@ extern "C" {
> + #include <unistd.h>
> + #include <linux/unistd.h>
> + #include <endian.h>
> ++#include <fcntl.h>
> +
> + #ifdef __mips__
> + /* Include definitions of the ABI currently in use.
>     */
> +--
> +2.13.3
> +
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
> b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> similarity index 67%
> rename from meta-oe/recipes-support/gperftools/gperftools_2.5.bb
> rename to meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> index 43780a5ee..946463805 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> @@ -2,19 +2,20 @@ SUMMARY = "Fast, multi-threaded malloc() and nifty
> performance analysis tools"
>  HOMEPAGE = "http://code.google.com/p/gperftools/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
> -DEPENDS = "libunwind"
> +DEPENDS += "libunwind"
>
> -SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/
> gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f
> 50/gperftools-2.5.tar.gz \
> +SRCREV = "bf840dec0495e17f5c8403e68e10b9d6bf05c559"
> +SRC_URI = "git://github.com/gperftools/gperftools \
>             file://0001-Support-Atomic-ops-on-clang.patch \
> -           file://0001-Fix-build-failure-for-ppc.patch \
>             file://0001-Use-ucontext_t-instead-of-struct-ucontext.patch \
> +           file://0001-fix-build-with-musl-libc.patch \
> +           file://0001-include-fcntl.h-for-loff_t-definition.patch \
>             "
>
> -SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
> -SRC_URI[sha256sum] = "6fa2748f1acdf44d750253e160cf6e
> 2e72571329b42e563b455bde09e9e85173"
> -
>  inherit autotools
>
> +S = "${WORKDIR}/git"
> +
>  # On mips, we have the following error.
>  #   do_page_fault(): sending SIGSEGV to ls for invalid read access from
> 00000008
>  #   Segmentation fault (core dumped)
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

