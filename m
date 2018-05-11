Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A693577E8C;
	Fri, 11 May 2018 17:45:07 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p9-v6so2720891pgc.9;
	Fri, 11 May 2018 10:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vja+I6QGUQ9jB1TNKnYfannnSfkj7L4pTEvjtCQSmkQ=;
	b=pGhvLSHtJa5xufi0HWenAP3tQh7bqUc/kBqPb5AtxWgj8Z9ELrx7LQMZoSgcjex0bV
	lPqYHqRy3elsLIOSzA8n4hJ7s5jh0+K3tqAJGid4pvEVXV7zBH+oFBqf9CiIZh/f36zY
	HtDtnPrgdgdd2f/XxSAmpeC+BTXtwoHHLB/a07YSVEWAANZ7Zpm78Y1NvH4l9CkFO+gV
	1q74G0sKG7+q5UeljkBm7i6Qbkk04v1K1DhTrN92Bo7BAkOau7TBanJ82ZTgfJW1LtsA
	uMzPP5pHKPWjRelAEy8xOyZanuILcolv1Ty085LqxGV1RIuraFImFm/0SEOlgiY/qwZ0
	DMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vja+I6QGUQ9jB1TNKnYfannnSfkj7L4pTEvjtCQSmkQ=;
	b=sMcQZDKYVfh41KI1qhrngnDZuzQfeahHzFTSiW75OyxP5IXx1vB+WqgJCsrFEGlilL
	lNQ6JVhf8Ps3+lgCHs0uGxXe1e1adQy0RmFZMbWY6OVflyOOYKH+y8to8NIThxxOI9GH
	Yp9Q6/yZxkV9+KuHHasxn+WeuZmUjh6WJgaS235y57TYTJLz3R2D41CjSElJsVq/e7oQ
	lUDrgoTiyw/ot7Nnq8lSK7rlQW/MvfD5JNFa+sWt356mif8YoV2xxVurukjxAmHSXvk+
	OJ+xYP4Dbe+0Lep2/yigTysD2jT9DUaDD1FYS8qCHDdCxCZojcOy7hmxFteu4O02bLMd
	dX6A==
X-Gm-Message-State: ALKqPwfpROnmqbMT2D8W18WkX+W6C6Ze6iGpU5KpLQcAls1bf6P4shH3
	9+RQN93D4LAZkoXVNXX8Xm2NsThli4Xsu81RTcg=
X-Google-Smtp-Source: AB8JxZpqCIt80FcDNHrbfLdRwF0eC8KdJG4hx6G3aejzBHOs2Li+qEX2n1eVgWcvVs732fOl2AM+aT8hA3mGJDu5VhA=
X-Received: by 2002:a65:58c2:: with SMTP id e2-v6mr10095pgu.204.1526060708050; 
	Fri, 11 May 2018 10:45:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.139.145 with HTTP; Fri, 11 May 2018 10:44:37 -0700 (PDT)
In-Reply-To: <CA+chaQf=rcC_tU+vJs+Ccas86OiV8zZ901sxnAvqA=AVPyqLGw@mail.gmail.com>
References: <152585929079.27246.16259308060481767272@git.openembedded.org>
	<20180509094811.2F73823742D@git.openembedded.org>
	<CA+chaQf=rcC_tU+vJs+Ccas86OiV8zZ901sxnAvqA=AVPyqLGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 May 2018 10:44:37 -0700
Message-ID: <CAMKF1spEW+dY4R+YObdtLr+NXK=D8MHK1gBjeBWD1hD-wBrTZA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 03/19: gcc-runtime: Disable gcc version of libssp
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
X-List-Received-Date: Fri, 11 May 2018 17:45:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 3:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Should perl-ptest runtime depend on libssp with these changes applied?
>

it should not. We use ssp impl directly from glibc/musl now. libssp
should be removed from rdeps.

> Or should there be something like VIRTUAL-RUNTIME_libssp in e.g.
> meta/conf/distro/include/tclibc-glibc.inc to replace RUNTIMELIBSSP:
> meta/recipes-devtools/gcc/gcc-runtime.inc:RUNTIMELIBSSP ?= ""
> meta/recipes-devtools/gcc/gcc-runtime.inc:RUNTIMELIBSSP_mingw32 ?= "libssp"
>
> and to be used from perl-ptest?
> meta/recipes-devtools/perl/perl-ptest.inc:RDEPENDS_${PN}-ptest +=
> "${PN}-modules ${PN}-doc ${PN}-misc sed libssp"
>
> I've noticed this in do_rootfs failure:
>
>  * Solver encountered 1 problem(s):
>  * Problem 1/1:
>  *   - nothing provides libssp needed by perl-ptest-5.24.1-r0.3.raspberrypi3
>
>
>
> On Wed, May 9, 2018 at 11:48 AM <git@git.openembedded.org> wrote:
>>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 6c14f99936f8c8c9b9d9f40a6b0c69675ea9a566
>> Author: Khem Raj <raj.khem@gmail.com>
>> AuthorDate: Fri Apr 13 22:39:07 2018 -0700
>>
>>     gcc-runtime: Disable gcc version of libssp
>>
>>     libssp is implemented fully in glibc as well as in musl
>>     so we really do not need the gcc version of this library
>>     except may be for mingw, where we keep it enabled anyway
>>     gcc in OE is built with the knowledge that C library
>>     already provides libssp implementation, we should therefore
>>     not need the gcc implementation of same.
>>
>>     libssp_nonshared piece is a detail which is needed when gcc
>>     is the compiler, in glibc this is part of libc_nonshared.a
>>     already and libc_nonshared.a is linked always when linking
>>     with -lc becuase libc.so in glibc is actually a linker script
>>
>>     GROUP ( /usr/lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED (
>> /usr/lib/ld-linux-x86-64.so.2 ) )
>>
>>     which automatically links in the needed runtime bits, this however
>>     is not the case for musl, where core SSP APIs are implemented in full
>>     but compiler specific runtime isn't, for this we add a new package
>>     called libssp_nonshared which generate the needed runtime stub
>>     and gcc is already carrying patch to link to libssp_nonshared.a
>>     on musl
>>
>>     This should fix a long standing problem where static PIE executable
>>     were not buildable with OE since it was conflicting SSP implementation
>>     one from C library and the other one from gcc and we end up with
>>     duplicate symbol errors during linking.
>>
>>     Backport a patch from trunk which enhances enable|disable-libssp
>>     to not only disable building libssp but also not emit the gcc
>>     specs to use it for subsequent linking when stack-protector options
>>     are used on compiler cmdline
>>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-7.3.inc              |   7 +-
>>  ...049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch | 204
>> +++++++++++++++++++++
>>  meta/recipes-devtools/gcc/gcc-runtime.inc          |   4 +-
>>  3 files changed, 212 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc
>> b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> index d968c32..0586182 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> @@ -72,6 +72,7 @@ SRC_URI = "\
>>
>> file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
>>             file://0047-sync-gcc-stddef.h-with-musl.patch \
>>             file://0048-gcc-Enable-static-PIE.patch \
>> +           file://0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch \
>>             file://fix-segmentation-fault-precompiled-hdr.patch \
>>             file://no-sse-fix-test-case-failures.patch \
>>             ${BACKPORTS} \
>> @@ -93,10 +94,12 @@ FORTRAN = ""
>>  JAVA = ""
>>
>>  LTO = "--enable-lto"
>> +SSP ?= "--disable-libssp"
>> +SSP_mingw32 = "--enable-libssp"
>>
>>  EXTRA_OECONF_BASE = "\
>>      ${LTO} \
>> -    --enable-libssp \
>> +    ${SSP} \
>>      --enable-libitm \
>>      --disable-bootstrap \
>>      --disable-libmudflap \
>> @@ -120,7 +123,7 @@ EXTRA_OECONF_INITIAL = "\
>>      --disable-plugin \
>>      --enable-decimal-float=no \
>>      --without-isl \
>> -    gcc_cv_libc_provides_ssp=yes \
>> +    --disable-libssp \
>>  "
>>
>>  EXTRA_OECONF_PATHS = "\
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch
>> b/meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch
>> new file mode 100644
>> index 0000000..7c53c95
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch
>> @@ -0,0 +1,204 @@
>> +From 9815bd97561c778ee0bc0c17f245e88e66570111 Mon Sep 17 00:00:00 2001
>> +From: sandra <sandra@138bc75d-0d04-0410-961f-82ee72b054a4>
>> +Date: Wed, 1 Nov 2017 02:14:19 +0000
>> +Subject: [PATCH] 2017-10-31  Sandra Loosemore  <sandra@codesourcery.com>
>> +
>> +       gcc/
>> +       * configure.ac (--enable-libssp): New.
>> +       (gcc_cv_libc_provides_ssp): Check for explicit setting before
>> +       trying to determine target-specific default.  Adjust indentation.
>> +       * configure: Regenerated.
>> +       * doc/install.texi (Configuration): Expand --disable-libssp
>> +       documentation.
>> +
>> +
>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@254288
>> 138bc75d-0d04-0410-961f-82ee72b054a4
>> +---
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Backport [https://patchwork.ozlabs.org/patch/823049/]
>> +
>> + gcc/ChangeLog        |  9 +++++++++
>> + gcc/configure        | 26 +++++++++++++++++++++++---
>> + gcc/configure.ac     | 24 ++++++++++++++++++++----
>> + gcc/doc/install.texi |  3 ++-
>> + 4 files changed, 54 insertions(+), 8 deletions(-)
>> +
>> +Index: gcc-7.3.0/gcc/configure.ac
>> +===================================================================
>> +--- gcc-7.3.0.orig/gcc/configure.ac
>> ++++ gcc-7.3.0/gcc/configure.ac
>> +@@ -5719,10 +5719,25 @@ if test x$gcc_cv_solaris_crts = xyes; th
>> +           [Define if the system-provided CRTs are present on Solaris.])
>> + fi
>> +
>> ++AC_ARG_ENABLE(libssp,
>> ++[AS_HELP_STRING([--enable-libssp], [enable linking against libssp])],
>> ++[case "${enableval}" in
>> ++  yes|no)
>> ++    ;;
>> ++  *)
>> ++    AC_MSG_ERROR([unknown libssp setting $enableval])
>> ++    ;;
>> ++esac], [])
>> ++
>> + # Test for stack protector support in target C library.
>> + AC_CACHE_CHECK(__stack_chk_fail in target C library,
>> +-      gcc_cv_libc_provides_ssp,
>> +-      [gcc_cv_libc_provides_ssp=no
>> ++  gcc_cv_libc_provides_ssp,
>> ++  [gcc_cv_libc_provides_ssp=no
>> ++  if test "x$enable_libssp" = "xno"; then
>> ++    gcc_cv_libc_provides_ssp=yes
>> ++  elif test "x$enable_libssp" = "xyes"; then
>> ++    gcc_cv_libc_provides_ssp=no
>> ++  else
>> +     case "$target" in
>> +        *-*-musl*)
>> +        # All versions of musl provide stack protector
>> +@@ -5759,8 +5774,9 @@ AC_CACHE_CHECK(__stack_chk_fail in targe
>> +        AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
>> +            [echo "no __stack_chk_fail on this target"])
>> +         ;;
>> +-  *) gcc_cv_libc_provides_ssp=no ;;
>> +-    esac])
>> ++       *) gcc_cv_libc_provides_ssp=no ;;
>> ++    esac
>> ++  fi])
>> +
>> + if test x$gcc_cv_libc_provides_ssp = xyes; then
>> +   AC_DEFINE(TARGET_LIBC_PROVIDES_SSP, 1,
>> +Index: gcc-7.3.0/gcc/doc/install.texi
>> +===================================================================
>> +--- gcc-7.3.0.orig/gcc/doc/install.texi
>> ++++ gcc-7.3.0/gcc/doc/install.texi
>> +@@ -1658,7 +1658,8 @@ not be built.
>> +
>> + @item --disable-libssp
>> + Specify that the run-time libraries for stack smashing protection
>> +-should not be built.
>> ++should not be built or linked against.  On many targets library support
>> ++is provided by the C library instead.
>> +
>> + @item --disable-libquadmath
>> + Specify that the GCC quad-precision math library should not be built.
>> +Index: gcc-7.3.0/gcc/configure
>> +===================================================================
>> +--- gcc-7.3.0.orig/gcc/configure
>> ++++ gcc-7.3.0/gcc/configure
>> +@@ -940,6 +940,7 @@ enable_fix_cortex_a53_843419
>> + with_glibc_version
>> + enable_gnu_unique_object
>> + enable_linker_build_id
>> ++enable_libssp
>> + enable_default_ssp
>> + with_long_double_128
>> + with_gc
>> +@@ -1679,6 +1680,7 @@ Optional Features:
>> +                           extension on glibc systems
>> +   --enable-linker-build-id
>> +                           compiler will always pass --build-id to linker
>> ++  --enable-libssp         enable linking against libssp
>> +   --enable-default-ssp    enable Stack Smashing Protection as default
>> +   --enable-maintainer-mode
>> +                           enable make rules and dependencies not useful
>> (and
>> +@@ -18450,7 +18452,7 @@ else
>> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>> +   lt_status=$lt_dlunknown
>> +   cat > conftest.$ac_ext <<_LT_EOF
>> +-#line 18436 "configure"
>> ++#line 18455 "configure"
>> + #include "confdefs.h"
>> +
>> + #if HAVE_DLFCN_H
>> +@@ -18556,7 +18558,7 @@ else
>> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>> +   lt_status=$lt_dlunknown
>> +   cat > conftest.$ac_ext <<_LT_EOF
>> +-#line 18542 "configure"
>> ++#line 18561 "configure"
>> + #include "confdefs.h"
>> +
>> + #if HAVE_DLFCN_H
>> +@@ -25234,6 +25236,7 @@ $as_echo "#define HAVE_AS_SPARC5_VIS4 1"
>> +
>> + fi
>> +
>> ++
>> +     { $as_echo "$as_me:${as_lineno-$LINENO}: checking assembler for
>> SPARC6 instructions" >&5
>> + $as_echo_n "checking assembler for SPARC6 instructions... " >&6; }
>> + if test "${gcc_cv_as_sparc_sparc6+set}" = set; then :
>> +@@ -25270,6 +25273,7 @@ $as_echo "#define HAVE_AS_SPARC6 1" >>co
>> +
>> + fi
>> +
>> ++
>> +     { $as_echo "$as_me:${as_lineno-$LINENO}: checking assembler for LEON
>> instructions" >&5
>> + $as_echo_n "checking assembler for LEON instructions... " >&6; }
>> + if test "${gcc_cv_as_sparc_leon+set}" = set; then :
>> +@@ -28947,6 +28951,18 @@ $as_echo "#define HAVE_SOLARIS_CRTS 1" >
>> +
>> + fi
>> +
>> ++# Check whether --enable-libssp was given.
>> ++if test "${enable_libssp+set}" = set; then :
>> ++  enableval=$enable_libssp; case "${enableval}" in
>> ++  yes|no)
>> ++    ;;
>> ++  *)
>> ++    as_fn_error "unknown libssp setting $enableval" "$LINENO" 5
>> ++    ;;
>> ++esac
>> ++fi
>> ++
>> ++
>> + # Test for stack protector support in target C library.
>> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking __stack_chk_fail in
>> target C library" >&5
>> + $as_echo_n "checking __stack_chk_fail in target C library... " >&6; }
>> +@@ -28954,6 +28970,11 @@ if test "${gcc_cv_libc_provides_ssp+set}
>> +   $as_echo_n "(cached) " >&6
>> + else
>> +   gcc_cv_libc_provides_ssp=no
>> ++  if test "x$enable_libssp" = "xno"; then
>> ++    gcc_cv_libc_provides_ssp=yes
>> ++  elif test "x$enable_libssp" = "xyes"; then
>> ++    gcc_cv_libc_provides_ssp=no
>> ++  else
>> +     case "$target" in
>> +        *-*-musl*)
>> +        # All versions of musl provide stack protector
>> +@@ -29001,8 +29022,9 @@ else
>> + fi
>> +
>> +         ;;
>> +-  *) gcc_cv_libc_provides_ssp=no ;;
>> ++       *) gcc_cv_libc_provides_ssp=no ;;
>> +     esac
>> ++  fi
>> + fi
>> + { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>> $gcc_cv_libc_provides_ssp" >&5
>> + $as_echo "$gcc_cv_libc_provides_ssp" >&6; }
>> +@@ -29037,18 +29059,15 @@ fi
>> +
>> +
>> + # Test for <sys/sdt.h> on the target.
>> +-
>> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the
>> target C library" >&5
>> +-$as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
>> +-have_sys_sdt_h=no
>> ++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
>> ++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
>> ++#have_sys_sdt_h=no
>> + #if test -f $target_header_dir/sys/sdt.h; then
>> + #  have_sys_sdt_h=yes
>> +-#
>> +-#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
>> +-#
>> ++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
>> ++#            [Define if your target C library provides sys/sdt.h])
>> + #fi
>> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
>> +-$as_echo "$have_sys_sdt_h" >&6; }
>> ++#AC_MSG_RESULT($have_sys_sdt_h)
>> +
>> + # Check if TFmode long double should be used by default or not.
>> + # Some glibc targets used DFmode long double, but with glibc 2.4
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> index 7629fa5..72b8081 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -22,8 +22,10 @@ RUNTIMELIBITM_nios2 = ""
>>  RUNTIMELIBITM_microblaze = ""
>>  RUNTIMELIBITM_riscv32 = ""
>>  RUNTIMELIBITM_riscv64 = ""
>> +RUNTIMELIBSSP ?= ""
>> +RUNTIMELIBSSP_mingw32 ?= "libssp"
>>
>> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>> +RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic
>> ${RUNTIMELIBITM} \
>>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'],
>> 'libquadmath', '', d)} \
>>  "
>>  RUNTIMETARGET_append_x86 = " libmpx"
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

