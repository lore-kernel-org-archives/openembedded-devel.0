Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.13118.1586357732718999964
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 07:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ObLcjHUr;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 14so150389qtp.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2020 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zB5GMV6uNZEqlyqIWomDzWPSsxBn7n7+Bm3hWbX902Y=;
        b=ObLcjHUr/QiqKuXoNMJFfnpcGFq0rUbVhvPoeK+rPMRRKdwGaBljf7YVDglpJqk0EV
         rxRvmfp5JIFR4cnX5IdAsbcDWYbdy+WcGn8NnAFuB9XeDhFUD6LsWajhYENx7VaGhtJM
         JwHJPorjWrNaxsBdL/OPhqXN8fznxawzSaKtYcflavEg6T5OCAjHiHxLRjS8nJl2eUZR
         0zHnUARqgd5y4Kfw50AepnW/rGUKopNpxlNtBFjjK7JxRMZLN2v8sfurCWy6nk1DLlW2
         CxwgpQFZ0hyRpMVgwJuBtGJpW27XA6vsavNQ1bvJ4Bk7Hs8bHoSZ0lg1dKVXfxeOHjCt
         8Zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zB5GMV6uNZEqlyqIWomDzWPSsxBn7n7+Bm3hWbX902Y=;
        b=b/aSi6N8qDv8ULtR2zIxETf4dICutUkg/xMMuk8hU80aayw4TpiE3eDmTC8OVflroG
         amDICti91Id4ZVIjAh4wE5hgp9PI1PPaug9D0KhOhjkXwxbwAuqjTQlJkkrYcqc+wRj7
         Wqy4JT1AL3z6bXWM4hZs8eENbD16cB8ODOh5nojw5Bz6NC4qWPl89zQyzNxzy4aCibE/
         tQ2yxXnTX2WKcz5v/vUG6QrBfxzAkmZDG0vHMh2boJ7LXL2VJOqzz1H4ild/5RlAPiKK
         iC/7Sg+J4AL7GxWW8wXAcO5twFYHrKCPESw1w+6zSNtEQPUzZh5bhEv0PMV4oiQk7bAw
         dqqw==
X-Gm-Message-State: AGi0Pua0wBB3mrk01+d1BoUlPs4MsDW33bC4yOVoeotoOKHXRyxGOMED
	wst7zeFolo4ziGuIkx828evjGr0S7xKHn0/zkuM=
X-Google-Smtp-Source: APiQypKoXl2eP77TLjsH7o+dIB6leZNrEpIXSaD3Yxfw9vEb5ycpXWMJAgo3Axh+q6JLjLy/tgXQZdoxFSuUMjXA2JE=
X-Received: by 2002:ac8:3003:: with SMTP id f3mr55417qte.293.1586357724634;
 Wed, 08 Apr 2020 07:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200408045040.569849-1-anuj.mittal@intel.com>
In-Reply-To: <20200408045040.569849-1-anuj.mittal@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Apr 2020 07:54:58 -0700
Message-ID: <CAMKF1sobSw__mGVcBaFyt71GJcW0HvHrf1xf_Hr3xg47C38L5w@mail.gmail.com>
Subject: Re: [oe] [PATCH] tbb: upgrade 2017 -> 2020.1
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Fails on arm
http://errors.yoctoproject.org/Errors/Details/401494/

On Tue, Apr 7, 2020 at 9:50 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Remove patches that are not needed anymore and fix the recipe to point
> to new source location. Also remove the compilation tweaks that don't
> seem to be required anymore.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../0002-linux-Fix-gcc-version-check.patch    | 57 -------------------
>  .../tbb/tbb/cross-compile.patch               | 39 -------------
>  meta-oe/recipes-support/tbb/tbb/tbb.pc        |  4 +-
>  .../tbb/{tbb.bb => tbb_2020.2.bb}             | 22 ++-----
>  4 files changed, 7 insertions(+), 115 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
>  rename meta-oe/recipes-support/tbb/{tbb.bb => tbb_2020.2.bb} (77%)
>
> diff --git a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
> deleted file mode 100644
> index 9824b61e9..000000000
> --- a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From aee098f1bf0511c6b5544de3170a9e8b51673b60 Mon Sep 17 00:00:00 2001
> -From: Pierre Le Magourou <plemagourou@softbankrobotics.com>
> -Date: Tue, 23 Jan 2018 15:25:50 +0100
> -Subject: [PATCH] linux.gcc: Fix cross compilation error.
> -
> -When cross compiling on linux with gcc, the host gcc was used instead of
> -the cross gcc to set compilation flags according to gcc version.
> -
> -When the cross gcc was in version 5.X and the host gcc in version 7.X,
> -tbb was compiled with the -flifetime-dse=1 flag that does not exist on
> -gcc 5.X.
> ----
> - build/linux.gcc.inc | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
> -index 5c1889c..a4d6698 100644
> ---- a/build/linux.gcc.inc
> -+++ b/build/linux.gcc.inc
> -@@ -41,29 +41,29 @@ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> - C_FLAGS = $(CPLUS_FLAGS)
> -
> - # gcc 4.2 and higher support OpenMP
> --ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
> -+ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
> -     OPENMP_FLAG = -fopenmp
> - endif
> -
> - # gcc 4.8 and later support RTM intrinsics, but require command line switch to enable them
> --ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
> -+ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
> -     RTM_KEY = -mrtm
> - endif
> -
> - # gcc 4.0 and later have -Wextra that is used by some our customers.
> --ifneq (,$(shell gcc -dumpversion | egrep  "^([4-9])"))
> -+ifneq (,$(shell $(CC) -dumpversion | egrep  "^([4-9])"))
> -     TEST_WARNING_KEY += -Wextra
> - endif
> -
> - # gcc 5.0 and later have -Wsuggest-override option
> - # enable it via a pre-included header in order to limit to C++11 and above
> --ifneq (,$(shell gcc -dumpversion | egrep  "^([5-9])"))
> -+ifneq (,$(shell $(CC) -dumpversion | egrep  "^([5-9])"))
> -     INCLUDE_TEST_HEADERS = -include $(tbb_root)/src/test/harness_preload.h
> - endif
> -
> - # gcc 6.0 and later have -flifetime-dse option that controls
> - # elimination of stores done outside the object lifetime
> --ifneq (,$(shell gcc -dumpversion | egrep  "^([6-9])"))
> -+ifneq (,$(shell $(CC) -dumpversion | egrep  "^([6-9])"))
> -     # keep pre-contruction stores for zero initialization
> -     DSE_KEY = -flifetime-dse=1
> - endif
> ---
> -2.15.1
> -
> diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
> deleted file mode 100644
> index d54b307ee..000000000
> --- a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -Upstream-Status: unsuitable
> ----
> - build/linux.gcc.inc |    5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -Index: tbb2017_20170118oss/build/linux.gcc.inc
> -===================================================================
> ---- tbb2017_20170118oss.orig/build/linux.gcc.inc
> -+++ tbb2017_20170118oss/build/linux.gcc.inc
> -@@ -32,8 +32,9 @@ DYLIB_KEY = -shared
> - EXPORT_KEY = -Wl,--version-script,
> - LIBDL = -ldl
> -
> --CPLUS = g++
> --CONLY = gcc
> -+CPLUS = $(CXX)
> -+CONLY = $(CC)
> -+CPLUS_FLAGS = $(CXXFLAGS)
> - LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
> - LIBS += -lpthread -lrt
> - LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> -Index: tbb2017_20170118oss/build/linux.clang.inc
> -===================================================================
> ---- tbb2017_20170118oss.orig/build/linux.clang.inc
> -+++ tbb2017_20170118oss/build/linux.clang.inc
> -@@ -31,8 +31,9 @@ DYLIB_KEY = -shared
> - EXPORT_KEY = -Wl,--version-script,
> - LIBDL = -ldl
> -
> --CPLUS = clang++
> --CONLY = clang
> -+CPLUS = $(CXX)
> -+CONLY = $(CC)
> -+CPLUS_FLAGS = $(CXXFLAGS)
> - LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
> - LIBS += -lpthread -lrt
> - LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-support/tbb/tbb/tbb.pc
> index 644b64fbf..4f9da1140 100644
> --- a/meta-oe/recipes-support/tbb/tbb/tbb.pc
> +++ b/meta-oe/recipes-support/tbb/tbb/tbb.pc
> @@ -5,7 +5,7 @@ includedir=${prefix}/include
>
>  Name: Threading Building Blocks
>  Description: Intel's parallelism library for C++
> -URL: http://www.threadingbuildingblocks.org/
> -Version: 3.0+r018
> +URL: https://software.intel.com/en-us/tbb
> +Version: 2020.2
>  Libs: -L${libdir} -ltbb
>  Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb_2020.2.bb
> similarity index 77%
> rename from meta-oe/recipes-support/tbb/tbb.bb
> rename to meta-oe/recipes-support/tbb/tbb_2020.2.bb
> index 911139b0d..67464ab72 100644
> --- a/meta-oe/recipes-support/tbb/tbb.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2020.2.bb
> @@ -3,28 +3,18 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
>      performance without having to be a threading expert. It represents a \
>      higher-level, task-based parallelism that abstracts platform details \
>      and threading mechanism for performance and scalability."
> -HOMEPAGE = "http://threadingbuildingblocks.org/"
> +HOMEPAGE = "https://software.intel.com/en-us/tbb"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> -PRDATE = "20170412"
> -BRANCH = "tbb_2017"
> -SRCREV = "a2cfdfe946933cbe38bffe1d8086ae36f06691a3"
> -PV = "${PRDATE}+${SRCPV}"
> -SRC_URI = "git://github.com/01org/tbb;branch=${BRANCH} \
> -           file://cross-compile.patch \
> +BRANCH = "tbb_2020"
> +SRCREV = "60b7d0a78f8910976678ba63a19fdaee22c0ef65"
> +SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
>             file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
> -           file://0002-linux-Fix-gcc-version-check.patch \
>             file://tbb.pc \
>  "
>
>  S = "${WORKDIR}/git"
> -
> -COMPILER ?= "gcc"
> -COMPILER_toolchain-clang = "clang"
> -
> -do_compile() {
> -    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH} runtime=cc4
> -}
> +PE = "1"
>
>  do_install() {
>      install -d ${D}${includedir} ${D}${libdir}
> @@ -44,5 +34,3 @@ do_install() {
>  # ...
>  # | make[1]: *** [concurrent_queue.o] Error 1
>  ARM_INSTRUCTION_SET = "arm"
> -SECURITY_CFLAGS_append = " -fPIC"
> -
> --
> 2.25.2
>
> 
