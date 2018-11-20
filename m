Return-Path: <uvv.mail@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8AB6BA11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:52:15 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id n12so1397671qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 23:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=/BizDqjC6u/LceBbfdq6BOPtF9OK8NgffgmsfdOpbYo=;
	b=fcOL0i2YnTIh2zEcho4LNjCGk1oOn82oU7Rduxl+5XIJzpEM6lCy9qlteSn/Yv+Xid
	SP+MnX8KO2RaDvYGXb1x6IKGVvGzCXrXincwG1eNmAWOmJs7CAnNoESYYF76JQtS7x/P
	Hvf4DYevs7UjhPncKKGNDCsmKbspfl4LBivN0rumy25q48IEA3Xdl1A1VqAzH9aFpBW0
	0cDMc+60X1tqjvgKNZ7pv12Uw/inj6MNoq/vmLJ8YgqegkrqoM1qhIUeNCi9w6TYOq/l
	hKm47VqPdM1TgaZsTzFjar02vJLyHcnx8F8f/tA8ja3e2PTOP67MzRIyX4xNmZfUBwFl
	LV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=/BizDqjC6u/LceBbfdq6BOPtF9OK8NgffgmsfdOpbYo=;
	b=l8NqXrobp6w6SXj/NA7DpSfzbuLjUTT6PVH83tlrdrxZck9/NKQ7ECBCKu1Sf8ksXy
	mZmDS3a+kPTwWFZrpvSnJD2z4aKMUdciAVgg62ZyTDKjVZaFRSEzixFZQv5SdGWvGbdA
	OrYnKOr4s6LyTbREoB5ZcXY/CGnsoGXMbI37ypVPBnH/G3rFNhYa1bp3ajL/wyo6F/sU
	wQ46yzlpuA+T4sT1pJjSs4nzt+ZHDSCKtfhLjnCEz6FnBBauf32tN/6fadYmFcnI1EA1
	2Veeddx4h+NKzLy9rINVt2onZ8V4h5ICTaMHxda5H9USW+TBX4sGn0DtwyZ6PWT6PP8P
	BS1g==
X-Gm-Message-State: AA+aEWZX7zBSVuYv987BmqtiP+IYHbBEcm881Oiyh6C5U8TtnwUkzB7M
	mG5aqquCYFZzJ9dA1pP7CLlJp1DDEAX51TIXa+DZPxGB+qE=
X-Google-Smtp-Source: AFSGD/VBy4qCKNasLYiKqkfF72ef/48DDeBjtML04VGogTfohAG9mlKRzAGSJW4Fpg1B6O+Ki6FmVFw03tGLlORYOsg=
X-Received: by 2002:a37:7101:: with SMTP id m1mr810404qkc.353.1542700336109;
	Mon, 19 Nov 2018 23:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20181119151819.124335-1-uvv.mail@gmail.com>
	<CAMKF1spi6ndHWCrHyw6hmdZnBdDbO4UvboNvmvSwdpBgmqX-tg@mail.gmail.com>
In-Reply-To: <CAMKF1spi6ndHWCrHyw6hmdZnBdDbO4UvboNvmvSwdpBgmqX-tg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Tue, 20 Nov 2018 08:52:04 +0100
Message-ID: <CAKHfEaidQY5axU8sfg=bneSdBBU8OuM_K+jcjgs76xcJY3M0JA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] glog: fixed the build for mips and other platforms
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
X-List-Received-Date: Tue, 20 Nov 2018 07:52:15 -0000
Content-Type: text/plain; charset="UTF-8"

I don't see that it would be supported on these architectures. At lease
this is what first paragraph on https://github.com/libunwind/libunwind says:



This library supports several architecture/operating-system combinations:



Linux/x86-64: Works well. Linux/x86: Works well. Linux/ARM: Works well.
Linux/IA-64: Works well. Linux/PARISC: Works well, but C library missing
unwind-info. HP-UX/IA-64: Mostly works but known to have some serious
limitations. MIPS: Newly added. Linux/AArch64: Works well. Linux/PPC64:
Newly added. Linux/SuperH: Newly added. FreeBSD/i386: Works well.
FreeBSD/x86-64: Newly added (FreeBSD architecture is known as amd64).
Linux/Tilegx: Newly added (64-bit mode only).



I guess if someone wants to use glog on those, glog has to be compiled
without libunwind support. In that case the libunwind check needs to fall
through without fatal message. I will change that part.



Vyacheslav


On Mon, Nov 19, 2018 at 10:26 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Nov 19, 2018 at 7:19 AM Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
> >
> > From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> >
> > According to build log
> http://errors.yoctoproject.org/Errors/Details/201286/
> > FindLibunwind wokred only for x86, arm, and x86_64. This patch extends
> the
> > cmake module to work with mips, ia64, ppc(64) and other architectures
> supported
> > by libunwind
>
> It would be good to add riscv64 and arc to this list as well.
>
> >
> > Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> > ---
> >  ...0002-Find-Libunwind-during-configure.patch | 34 ++++++++++++++-----
> >  1 file changed, 25 insertions(+), 9 deletions(-)
> >
> > diff --git
> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> > index 3a6f824ea..4ad302cbe 100644
> > ---
> a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> > +++
> b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
> > @@ -1,11 +1,11 @@
> >  diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
> >  --- a/cmake/FindLibunwind.cmake        1970-01-01 01:00:00.000000000
> +0100
> > -+++ b/cmake/FindLibunwind.cmake        2018-11-02 14:04:35.460437058
> +0100
> > -@@ -0,0 +1,37 @@
> > ++++ b/cmake/FindLibunwind.cmake        2018-11-19 16:07:17.652031645
> +0100
> > +@@ -0,0 +1,54 @@
> >  +# - Try to find libunwind
> >  +# Once done this will define
> >  +#
> > -+#  LIBUNWIND_FOUND - system has libunwind
> > ++#  Libunwind_FOUND - system has libunwind
> >  +#  unwind - cmake target for libunwind
> >  +
> >  +find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
> > @@ -15,11 +15,24 @@ diff -uNr a/cmake/FindLibunwind.cmake
> b/cmake/FindLibunwind.cmake
> >  +
> >  +if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
> >  +    set(LIBUNWIND_ARCH "arm")
> > ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
> > ++    set(LIBUNWIND_ARCH "aarch64")
> >  +elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
> > -+        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64")
> > ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
> > ++        CMAKE_SYSTEM_PROCESSOR STREQUAL "corei7-64")
> >  +    set(LIBUNWIND_ARCH "x86_64")
> >  +elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
> >  +    set(LIBUNWIND_ARCH "x86")
> > ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc64")
> > ++    set(LIBUNWIND_ARCH "ppc64")
> > ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
> > ++    set(LIBUNWIND_ARCH "ppc32")
> > ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
> > ++    set(LIBUNWIND_ARCH "mips")
> > ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^hppa")
> > ++    set(LIBUNWIND_ARCH "hppa")
> > ++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ia64")
> > ++    set(LIBUNWIND_ARCH "ia64")
> >  +endif()
> >  +
> >  +find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}"
> DOC "unwind library platform")
> > @@ -35,13 +48,17 @@ diff -uNr a/cmake/FindLibunwind.cmake
> b/cmake/FindLibunwind.cmake
> >  +
> >  +mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
> >  +
> > ++if (NOT Libunwind_FOUND)
> > ++    message(FATAL_ERROR "Can't find libunwind library")
> > ++endif()
> > ++
> >  +add_library(unwind INTERFACE IMPORTED)
> >  +set_target_properties(unwind PROPERTIES
> >  +    INTERFACE_LINK_LIBRARIES
> "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
> >  +)
> >  diff -uNr a/CMakeLists.txt b/CMakeLists.txt
> > ---- a/CMakeLists.txt   2018-11-02 14:02:21.784835854 +0100
> > -+++ b/CMakeLists.txt   2018-11-02 14:03:16.796935594 +0100
> > +--- a/CMakeLists.txt   2018-11-19 15:55:05.293665965 +0100
> > ++++ b/CMakeLists.txt   2018-11-19 15:57:37.828381535 +0100
> >  @@ -58,7 +58,6 @@
> >   check_include_file (execinfo.h HAVE_EXECINFO_H)
> >   check_include_file (glob.h HAVE_GLOB_H)
> > @@ -91,10 +108,9 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
> >     DESTINATION lib/cmake/glog)
> >
> >   install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
> lib/cmake/glog)
> > -Binary files a/.git/index and b/.git/index differ
> >  diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
> > ---- a/glog-config.cmake.in     2018-11-02 14:02:21.784835854 +0100
> > -+++ b/glog-config.cmake.in     2018-11-02 14:03:16.796935594 +0100
> > +--- a/glog-config.cmake.in     2018-11-19 15:55:05.293665965 +0100
> > ++++ b/glog-config.cmake.in     2018-11-19 15:57:37.828381535 +0100
> >  @@ -4,4 +4,15 @@
> >
> >   @gflags_DEPENDENCY@
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

