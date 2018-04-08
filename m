Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A33C771BA1;
	Sun,  8 Apr 2018 17:00:22 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b127so13206443wmf.5;
	Sun, 08 Apr 2018 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vN9vsgxUroKJrPUjP6+igxFQ3MrtW/IFyXMSc0NLZRA=;
	b=QvqCk4YnRvxjHJZUq8kKTzAIbkjpHkm003lJ+/mUPZOVT67GA4Gv7YjB8iUuk02Cz5
	Ks5htR6bthkUdbEnOSQ1JZgAR2ppOMNbvtLSAn5yW8sY1dTa69DcNkU+ydH/jXCRetLU
	2uCuztRiy32jEDHdmf1xnNfrx4Pl1ychVeci4Ttp/T+NeebpphYuMIaRuum5wTWvncU8
	jfRpAhBjoMwr7ZhF/eRbds/lV0zbc8DkUby9spcjQuHUaH+hSnoJWb8HVMn3KwZl1zI6
	Ez43hIsDmTgp5oFaD1w41JQtds6dZcEgMNyrJOwTqUkBDBk1Rs7Uk3T0MduI2OJvW3Yq
	bFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vN9vsgxUroKJrPUjP6+igxFQ3MrtW/IFyXMSc0NLZRA=;
	b=j7X5kfpcAZ6mQyNeh3r0GZ+3C5Bq8RkZ3ysTUTnecEHo3Abr0psuLk523U68XSsRTj
	lOK8BhLyidyOpIocVHPOPoqC6BR1rdko5QbAaB+EqW+pftawt32CwEPzmURK+A8d7RTx
	uPLMzAYS+j4X4VhjbX4DLSZ89TjNUwnZgcS5EOt3O6svAMIPQQtUAViGfKBC+NQVMqSR
	RZz3fXC9pqW8ctHmKGa9GIWjaYcW5/8nfa67N/P+2rFdKQjKDE6ZhbnW8IOLg+j3woTK
	zBY+Onco5vTpgHl4XE6Wphu0YRTvNQMcUMOFhdF2gm5Rph8oLdQOoRf9k37JAq0RDrx1
	C43Q==
X-Gm-Message-State: ALQs6tCk8Ath6fNnTsoBjXz1l6faBsQAC06HkNmeg0LItqqj+VwZULD/
	9t+cC/HyvtSKqZfkuTVmc0E9JgDDC5JzWY1VBQgsCg==
X-Google-Smtp-Source: AIpwx498bWHP8ARUwKbDYx/YfUA3uehTNm62qn3ksSjjPz9Fy54yyyndR4rGvAd8N1bjYRD1XN5jCtELF6lZ84Vlmao=
X-Received: by 10.28.249.18 with SMTP id x18mr5950635wmh.122.1523206822626;
	Sun, 08 Apr 2018 10:00:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Sun, 8 Apr 2018 10:00:21 -0700 (PDT)
In-Reply-To: <20180407213510.474412329D5@git.openembedded.org>
References: <152313690992.11940.6799878390820377002@git.openembedded.org>
	<20180407213510.474412329D5@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 8 Apr 2018 19:00:21 +0200
Message-ID: <CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/02: nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
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
X-List-Received-Date: Sun, 08 Apr 2018 17:00:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Ubuntu 14.04 this fails with:

../git/gen-des-tables.c: In function =E2=80=98write_table_u8=E2=80=99:
../git/gen-des-tables.c:307:3: error: =E2=80=98for=E2=80=99 loop initial de=
clarations are
only allowed in C99 mode
   for (size_t i =3D 0; i < m; i++)
   ^

I'll try to add explicit -std=3Dgnu99 to support building on such older hos=
t
distributions with older gcc.

On Sat, Apr 7, 2018 at 11:35 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit c1573cb7faeb296fe7077a60d02443d5ed5bded0
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Fri Apr 6 14:53:53 2018 +0200
>
>     nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
>
>     Fedora28[1] has decided to go ahead and use libxcrypt to replace
> libcrypt from glibc
>     despite the change not having merged into glibc upstream yet. This
> breaks the use of
>     uninative in OE on fedora28 since binaries there are now using new
> symbols only found
>     in libxcrypt. libxcrypt is meant to be backwards compatible with
> libcrypt but not the
>     reverse.
>
>     Since this will impact OE in the next release cycle, this changes
> nativesdk only
>     to use this new model and adds libxcrypt to work in that case. This
> allows us to
>     build a uninative which is compatible with fedora28 and previous othe=
r
> OSes.
>
>     In order to work, recipes will now need to depend on virtual/crypt
> where they use
>     libcrypt since its now a separate library and we can't depend on it
> from glibc to
>     preseve backwards compatibility since glibc needs to build first. For
> now, only the
>     problematic nativesdk recipes have been fixed up. For target use, the
> default
>     provider remains glibc for now. Assuming this change is merged into
> upstream glibc,
>     we will need to roll this change out for the target but we will do
> this in the next
>     release cycle when we can better deal with the resulting bugs.
>
>     [1] https://fedoraproject.org/wiki/Changes/Replace_glibc_
> libcrypt_with_libxcrypt
>
>     Original patch from Charles-Antoine Couret <charles-antoine.couret@
> essensium.com>,
>     tweaked by RP to add virtual provides, SkipRecipe for libxcrypt and
> other minor
>     tweaks.
>
>     Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@
> essensium.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf                             |   1 +
>  meta/recipes-core/glibc/glibc.inc                  |   5 +-
>  .../glibc/0031-nativesdk-deprecate-libcrypt.patch  | 419
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.27.bb              |   1 +
>  meta/recipes-core/glibc/site_config/headers        |   1 -
>  meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb     |  31 ++
>  meta/recipes-core/meta/uninative-tarball.bb        |   1 +
>  meta/recipes-core/musl/musl_git.bb                 |   2 +-
>  meta/recipes-core/util-linux/util-linux.inc        |   2 +-
>  meta/recipes-devtools/perl/perl_5.24.1.bb          |   2 +-
>  meta/recipes-extended/shadow/shadow.inc            |   3 +-
>  11 files changed, 461 insertions(+), 7 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 93f57f3..60590e2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -187,6 +187,7 @@ ASSUME_PROVIDED =3D "\
>      tar-native \
>      virtual/libintl-native \
>      virtual/libiconv-native \
> +    virtual/crypt-native \
>      texinfo-native \
>      bash-native \
>      sed-native \
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/
> glibc.inc
> index 361a6fd..9e02ffd 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -35,7 +35,10 @@ siteconfig_do_siteconfig_gencache_prepend =3D " \
>  DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial
> linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
>  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect th=
is
>  #RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> -PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> +
> +CRYPTPROVIDES =3D "virtual/crypt"
> +CRYPTPROVIDES_class-nativesdk =3D ""
> +PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> ${CRYPTPROVIDES}"
>  PROVIDES +=3D "virtual/libintl virtual/libiconv"
>  inherit autotools texinfo distro_features_check systemd
>
> diff --git a/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcr=
ypt.patch
> b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
> new file mode 100644
> index 0000000..a9132ed
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0031-nativesdk-
> deprecate-libcrypt.patch
> @@ -0,0 +1,419 @@
> +Background information:
> +
> +https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html
> +https://fedoraproject.org/wiki/Changes/Replace_glibc_
> libcrypt_with_libxcrypt
> +
> +Upstream-Status: Submitted [libc-alpha@sourceware.org]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +From: Zack Weinberg <zackw@panix.com>
> +Subject: [PATCH] Deprecate libcrypt and don't build it by default
> +
> +Back in June, Bj=C3=B6rn Esser proposed to add OpenBSD-compatible bcrypt
> +support to our implementation of crypt(3), and Zack Weinberg replied
> +that it might actually make more sense to _remove_ libcrypt from
> +glibc, freeing up libcrypt.so.1 and crypt.h to be provided by a
> +separate project that could move faster.  (For instance, libxcrypt:
> +https://github.com/besser82/libxcrypt)
> +
> +This patch disables build and installation of libcrypt by default.  It
> +can be re-enabled with --enable-obsolete-crypt to configure.  Unlike
> +libnsl, we do *not* install a runtime shared library; that's left to
> +the replacement.  (Unlike the SunRPC situation, I think we can
> +probably drop this code altogether in a release or two.)
> +
> +The function prototypes for crypt and encrypt are removed from
> +unistd.h, and the function prototype for setkey is removed from
> +stdlib.h; they do *not* come back with --enable-obsolete-crypt.  This
> +means glibc no longer provides the POSIX CRYPT option, and the macro
> +_XOPEN_CRYPT is also removed from unistd.h to indicate that.
> +(_SC_XOPEN_CRYPT is still defined, but sysconf(_SC_XOPEN_CRYPT) will
> +return -1 at runtime.)  These functions are also unconditionally
> +removed from conform/data/{stdlib,unistd}.h-data.
> +
> +       * posix/unistd.h (_XOPEN_CRYPT, crypt, encrypt): Don't declare.
> +       * stdlib/stdlib.h (setkey): Don't declare.
> +
> +       * configure.ac (--enable-obsolete-crypt): New configure option.
> +       * configure: Regenerate.
> +       * config.make.in (build-obsolete-crypt): New makefile variable.
> +       * crypt/Banner: Delete file.
> +       * crypt/Makefile: Don't build anything unless
> +       $(build-obsolete-crypt) is 'yes'.
> +       * sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile: Only add
> things
> +       to libcrypt-sysdep_routines when $(build-obsolete-crypt) is 'yes'=
.
> +       * sysdeps/sparc/sparc64/multiarch/Makefile: Likewise.
> +       * sysdeps/unix/sysv/linux/arm/Makefile: Likewise.
> +
> +       * conform/Makefile: Only include libcrypt.a in linknamespace test=
s
> +       when $(build-obsolete-crypt) is 'yes'.
> +       * conform/data/stdlib.h-data (setkey): Don't expect.
> +       * conform/data/unistd.h-data (crypt, encrypt): Don't expect.
> +       * elf/Makefile: Only perform various tests of
> libcrypt.so/libcrypt.a
> +       when $(build-obsolete-crypt) is 'yes'.
> +       * elf/tst-linkall-static.c: Don't include crypt.h when USE_CRYPT
> +       is false.
> +---
> + NEWS                                             | 18 +++++++++++++++++=
+
> + config.make.in                                   |  1 +
> + configure                                        | 13 +++++++++++++
> + configure.ac                                     |  8 ++++++++
> + conform/Makefile                                 | 14 ++++++++++----
> + conform/data/stdlib.h-data                       |  3 ---
> + conform/data/unistd.h-data                       |  6 ------
> + crypt/Makefile                                   |  5 +++++
> + elf/Makefile                                     | 16 ++++++++++++----
> + elf/tst-linkall-static.c                         |  2 ++
> + posix/unistd.h                                   | 16 ----------------
> + stdlib/stdlib.h                                  |  6 ------
> + sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile |  2 ++
> + sysdeps/sparc/sparc64/multiarch/Makefile         |  2 ++
> + sysdeps/unix/sysv/linux/arm/Makefile             |  2 ++
> + 15 files changed, 75 insertions(+), 39 deletions(-)
> +
> +diff --git a/config.make.in b/config.make.in
> +index 9e5e24b2c6..8fe610d04d 100644
> +--- a/config.make.in
> ++++ b/config.make.in
> +@@ -82,6 +82,7 @@ mach-interface-list =3D @mach_interface_list@
> +
> + experimental-malloc =3D @experimental_malloc@
> +
> ++build-obsolete-crypt =3D @build_obsolete_crypt@
> + nss-crypt =3D @libc_cv_nss_crypt@
> + static-nss-crypt =3D @libc_cv_static_nss_crypt@
> +
> +diff --git a/configure b/configure
> +index 7a8bd3f817..46f6bd7f86 100755
> +--- a/configure
> ++++ b/configure
> +@@ -672,6 +672,7 @@ base_machine
> + have_tunables
> + build_pt_chown
> + build_nscd
> ++build_obsolete_crypt
> + build_obsolete_nsl
> + link_obsolete_rpc
> + libc_cv_static_nss_crypt
> +@@ -782,6 +783,7 @@ enable_experimental_malloc
> + enable_nss_crypt
> + enable_obsolete_rpc
> + enable_obsolete_nsl
> ++enable_obsolete_crypt
> + enable_systemtap
> + enable_build_nscd
> + enable_nscd
> +@@ -1453,6 +1455,7 @@ Optional Features:
> +                           link-time usage
> +   --enable-obsolete-nsl   build and install the obsolete libnsl library
> and
> +                           depending NSS modules
> ++  --enable-obsolete-crypt build and install the obsolete libcrypt libra=
ry
> +   --enable-systemtap      enable systemtap static probe points
> [default=3Dno]
> +   --disable-build-nscd    disable building and installing the nscd daem=
on
> +   --disable-nscd          library functions will not contact the nscd
> daemon
> +@@ -3632,6 +3635,16 @@ if test "$build_obsolete_nsl" =3D yes; then
> +
> + fi
> +
> ++# Check whether --enable-obsolete-crypt was given.
> ++if test "${enable_obsolete_crypt+set}" =3D set; then :
> ++  enableval=3D$enable_obsolete_crypt; build_obsolete_crypt=3D$enableval
> ++else
> ++  build_obsolete_crypt=3Dno
> ++fi
> ++
> ++
> ++
> ++
> + # Check whether --enable-systemtap was given.
> + if test "${enable_systemtap+set}" =3D set; then :
> +   enableval=3D$enable_systemtap; systemtap=3D$enableval
> +diff --git a/configure.ac b/configure.ac
> +index ca1282a6b3..0142353740 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -378,6 +378,14 @@ if test "$build_obsolete_nsl" =3D yes; then
> +   AC_DEFINE(LINK_OBSOLETE_NSL)
> + fi
> +
> ++AC_ARG_ENABLE([obsolete-crypt],
> ++              AC_HELP_STRING([--enable-obsolete-crypt],
> ++                             [build and install the obsolete libcrypt
> library]),
> ++              [build_obsolete_crypt=3D$enableval],
> ++              [build_obsolete_crypt=3Dno])
> ++AC_SUBST(build_obsolete_crypt)
> ++
> ++
> + AC_ARG_ENABLE([systemtap],
> +               [AS_HELP_STRING([--enable-systemtap],
> +              [enable systemtap static probe points @<:@default=3Dno@
> :>@])],
> +diff --git a/conform/Makefile b/conform/Makefile
> +index 864fdeca21..5ef474fb24 100644
> +--- a/conform/Makefile
> ++++ b/conform/Makefile
> +@@ -193,22 +193,28 @@ linknamespace-libs-thr =3D $(linknamespace-libs-is=
oc)
> \
> +                        $(common-objpfx)rt/librt.a
> $(static-thread-library)
> + linknamespace-libs-posix =3D $(linknamespace-libs-thr) \
> +                          $(common-objpfx)dlfcn/libdl.a
> +-linknamespace-libs-xsi =3D $(linknamespace-libs-posix) \
> +-                       $(common-objpfx)crypt/libcrypt.a
> ++linknamespace-libs-xsi =3D $(linknamespace-libs-posix)
> + linknamespace-libs-ISO =3D $(linknamespace-libs-isoc)
> + linknamespace-libs-ISO99 =3D $(linknamespace-libs-isoc)
> + linknamespace-libs-ISO11 =3D $(linknamespace-libs-isoc)
> +-linknamespace-libs-XPG4 =3D $(linknamespace-libs-isoc) \
> +-                        $(common-objpfx)crypt/libcrypt.a
> ++linknamespace-libs-XPG4 =3D $(linknamespace-libs-isoc)
> + linknamespace-libs-XPG42 =3D $(linknamespace-libs-XPG4)
> + linknamespace-libs-POSIX =3D $(linknamespace-libs-thr)
> + linknamespace-libs-UNIX98 =3D $(linknamespace-libs-xsi)
> + linknamespace-libs-XOPEN2K =3D $(linknamespace-libs-xsi)
> + linknamespace-libs-POSIX2008 =3D $(linknamespace-libs-posix)
> + linknamespace-libs-XOPEN2K8 =3D $(linknamespace-libs-xsi)
> ++
> ++ifeq ($(build-obsolete-crypt),yes)
> ++linknamespace-libs-xsi +=3D $(common-objpfx)crypt/libcrypt.a
> ++linknamespace-libs-XPG4 +=3D $(common-objpfx)crypt/libcrypt.a
> ++endif
> ++
> + linknamespace-libs =3D $(foreach std,$(conformtest-standards),\
> +                                  $(linknamespace-libs-$(std)))
> +
> ++
> ++
> + $(linknamespace-symlist-stdlibs-tests): $(objpfx)symlist-stdlibs-%: \
> +                                       $(linknamespace-libs)
> +       LC_ALL=3DC $(READELF) -W -s $(linknamespace-libs-$*) > $@; \
> +diff --git a/conform/data/stdlib.h-data b/conform/data/stdlib.h-data
> +index d8fcccc2fb..6913828196 100644
> +--- a/conform/data/stdlib.h-data
> ++++ b/conform/data/stdlib.h-data
> +@@ -149,9 +149,6 @@ function {unsigned short int*} seed48 (unsigned shor=
t
> int[3])
> + #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX
> && !defined XPG4 && !defined XPG42 && !defined UNIX98
> + function int setenv (const char*, const char*, int)
> + #endif
> +-#if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX
> && !defined POSIX2008
> +-function void setkey (const char*)
> +-#endif
> + #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined XPG4 &=
&
> !defined POSIX && !defined POSIX2008
> + function {char*} setstate (char*)
> + #endif
> +diff --git a/conform/data/unistd.h-data b/conform/data/unistd.h-data
> +index ddf4f25132..aa070528e8 100644
> +--- a/conform/data/unistd.h-data
> ++++ b/conform/data/unistd.h-data
> +@@ -437,9 +437,6 @@ function int chroot (const char*)
> + function int chown (const char*, uid_t, gid_t)
> + function int close (int)
> + function size_t confstr (int, char*, size_t)
> +-#if !defined POSIX && !defined POSIX2008
> +-function {char*} crypt (const char*, const char*)
> +-#endif
> + #if defined XPG4 || defined XPG42 || defined UNIX98
> + function {char*} ctermid (char*)
> + function {char*} cuserid (char*)
> +@@ -449,9 +446,6 @@ allow cuserid
> + #endif
> + function int dup (int)
> + function int dup2 (int, int)
> +-#if !defined POSIX && !defined POSIX2008
> +-function void encrypt (char[64], int)
> +-#endif
> + function int execl (const char*, const char*, ...)
> + function int execle (const char*, const char*, ...)
> + function int execlp (const char*, const char*, ...)
> +diff --git a/crypt/Makefile b/crypt/Makefile
> +index 303800df73..024ec2c6ab 100644
> +--- a/crypt/Makefile
> ++++ b/crypt/Makefile
> +@@ -22,6 +22,8 @@ subdir       :=3D crypt
> +
> + include ../Makeconfig
> +
> ++ifeq ($(build-obsolete-crypt),yes)
> ++
> + headers :=3D crypt.h
> +
> + extra-libs :=3D libcrypt
> +@@ -52,9 +54,11 @@ tests +=3D md5test sha256test sha512test
> + # machine over a minute.
> + xtests =3D md5test-giant
> + endif
> ++endif
> +
> + include ../Rules
> +
> ++ifeq ($(build-obsolete-crypt),yes)
> + ifneq ($(nss-crypt),yes)
> + md5-routines :=3D md5 $(filter md5%,$(libcrypt-sysdep_routines))
> + sha256-routines :=3D sha256 $(filter sha256%,$(libcrypt-sysdep_routines=
))
> +@@ -71,3 +75,4 @@ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.so
> + else
> + $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.a
> + endif
> ++endif
> +diff --git a/elf/Makefile b/elf/Makefile
> +index 2a432d8bee..366f7b80ec 100644
> +--- a/elf/Makefile
> ++++ b/elf/Makefile
> +@@ -385,15 +385,19 @@ $(objpfx)tst-_dl_addr_inside_object:
> $(objpfx)dl-addr-obj.os
> + CFLAGS-tst-_dl_addr_inside_object.c +=3D $(PIE-ccflag)
> + endif
> +
> +-# By default tst-linkall-static should try to use crypt routines to tes=
t
> +-# static libcrypt use.
> +-CFLAGS-tst-linkall-static.c +=3D -DUSE_CRYPT=3D1
> ++ifeq ($(build-obsolete-crypt),yes)
> ++# If the libcrypt library is being built, tst-linkall-static should
> ++# try to use crypt routines to test static libcrypt use.
> ++CFLAGS-tst-linkall-static.c =3D -DUSE_CRYPT=3D1
> + # However, if we are using NSS crypto and we don't have a static
> + # library, then we exclude the use of crypt functions in the test.
> + # We similarly exclude libcrypt.a from the static link (see below).
> + ifeq (yesno,$(nss-crypt)$(static-nss-crypt))
> + CFLAGS-tst-linkall-static.c +=3D -UUSE_CRYPT -DUSE_CRYPT=3D0
> + endif
> ++else
> ++CFLAGS-tst-linkall-static.c =3D -DUSE_CRYPT=3D0
> ++endif
> +
> + include ../Rules
> +
> +@@ -1113,8 +1117,10 @@ localplt-built-dso :=3D $(addprefix
> $(common-objpfx),\
> +                                 rt/librt.so \
> +                                 dlfcn/libdl.so \
> +                                 resolv/libresolv.so \
> +-                                crypt/libcrypt.so \
> +                      )
> ++ifeq ($(build-obsolete-crypt),yes)
> ++localplt-built-dso +=3D $(addprefix $(common-objpfx), crypt/libcrypt.so=
)
> ++endif
> + ifeq ($(build-mathvec),yes)
> + localplt-built-dso +=3D $(addprefix $(common-objpfx), mathvec/libmvec.s=
o)
> + endif
> +@@ -1395,6 +1401,7 @@ $(objpfx)tst-linkall-static: \
> +   $(common-objpfx)resolv/libanl.a \
> +   $(static-thread-library)
> +
> ++ifeq ($(build-obsolete-crypt),yes)
> + # If we are using NSS crypto and we have the ability to link statically
> + # then we include libcrypt.a, otherwise we leave out libcrypt.a and
> + # link as much as we can into the tst-linkall-static test.  This assume=
s
> +@@ -1410,6 +1417,7 @@ ifeq (no,$(nss-crypt))
> + $(objpfx)tst-linkall-static: \
> +   $(common-objpfx)crypt/libcrypt.a
> + endif
> ++endif
> +
> + # The application depends on the DSO, and the DSO loads the plugin.
> + # The plugin also depends on the DSO. This creates the circular
> +diff --git a/elf/tst-linkall-static.c b/elf/tst-linkall-static.c
> +index e8df38f74e..0ffae7c723 100644
> +--- a/elf/tst-linkall-static.c
> ++++ b/elf/tst-linkall-static.c
> +@@ -18,7 +18,9 @@
> +
> + #include <math.h>
> + #include <pthread.h>
> ++#if USE_CRYPT
> + #include <crypt.h>
> ++#endif
> + #include <resolv.h>
> + #include <dlfcn.h>
> + #include <utmp.h>
> +diff --git a/posix/unistd.h b/posix/unistd.h
> +index 4d149f9945..e75ce4d4ec 100644
> +--- a/posix/unistd.h
> ++++ b/posix/unistd.h
> +@@ -107,9 +107,6 @@ __BEGIN_DECLS
> + /* The X/Open Unix extensions are available.  */
> + #define _XOPEN_UNIX   1
> +
> +-/* Encryption is present.  */
> +-#define       _XOPEN_CRYPT    1
> +-
> + /* The enhanced internationalization capabilities according to XPG4.2
> +    are present.  */
> + #define       _XOPEN_ENH_I18N 1
> +@@ -1118,20 +1115,7 @@ ssize_t copy_file_range (int __infd, __off64_t
> *__pinoff,
> + extern int fdatasync (int __fildes);
> + #endif /* Use POSIX199309 */
> +
> +-
> +-/* XPG4.2 specifies that prototypes for the encryption functions must
> +-   be defined here.  */
> + #ifdef        __USE_XOPEN
> +-/* Encrypt at most 8 characters from KEY using salt to perturb DES.  */
> +-extern char *crypt (const char *__key, const char *__salt)
> +-     __THROW __nonnull ((1, 2));
> +-
> +-/* Encrypt data in BLOCK in place if EDFLAG is zero; otherwise decrypt
> +-   block in place.  */
> +-extern void encrypt (char *__glibc_block, int __edflag)
> +-     __THROW __nonnull ((1));
> +-
> +-
> + /* Swab pairs bytes in the first N bytes of the area pointed to by
> +    FROM and copy the result to TO.  The value of TO must not be in the
> +    range [FROM - N + 1, FROM - 1].  If N is odd the first byte in FROM
> +diff --git a/stdlib/stdlib.h b/stdlib/stdlib.h
> +index 6b1ead31e0..8e23e93557 100644
> +--- a/stdlib/stdlib.h
> ++++ b/stdlib/stdlib.h
> +@@ -958,12 +958,6 @@ extern int getsubopt (char **__restrict __optionp,
> + #endif
> +
> +
> +-#ifdef __USE_XOPEN
> +-/* Setup DES tables according KEY.  */
> +-extern void setkey (const char *__key) __THROW __nonnull ((1));
> +-#endif
> +-
> +-
> + /* X/Open pseudo terminal handling.  */
> +
> + #ifdef __USE_XOPEN2KXSI
> +diff --git a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> +index a6d08f3a00..d8b8297fb0 100644
> +--- a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> ++++ b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> +@@ -1,6 +1,8 @@
> + ifeq ($(subdir),crypt)
> ++ifeq ($(build-obsolete-crypt),yes)
> + libcrypt-sysdep_routines +=3D md5-crop sha256-crop sha512-crop
> + endif
> ++endif
> +
> + ifeq ($(subdir),locale)
> + localedef-aux +=3D md5-crop
> +diff --git a/sysdeps/sparc/sparc64/multiarch/Makefile
> b/sysdeps/sparc/sparc64/multiarch/Makefile
> +index eaf758e7aa..0198f9886f 100644
> +--- a/sysdeps/sparc/sparc64/multiarch/Makefile
> ++++ b/sysdeps/sparc/sparc64/multiarch/Makefile
> +@@ -1,6 +1,8 @@
> + ifeq ($(subdir),crypt)
> ++ifeq ($(build-obsolete-crypt),yes)
> + libcrypt-sysdep_routines +=3D md5-crop sha256-crop sha512-crop
> + endif
> ++endif
> +
> + ifeq ($(subdir),locale)
> + localedef-aux +=3D md5-crop
> +diff --git a/sysdeps/unix/sysv/linux/arm/Makefile
> b/sysdeps/unix/sysv/linux/arm/Makefile
> +index 4adc35de04..6cab4f3a31 100644
> +--- a/sysdeps/unix/sysv/linux/arm/Makefile
> ++++ b/sysdeps/unix/sysv/linux/arm/Makefile
> +@@ -19,8 +19,10 @@ endif
> + # Add a syscall function to each library that needs one.
> +
> + ifeq ($(subdir),crypt)
> ++ifeq ($(build-obsolete-crypt),yes)
> + libcrypt-sysdep_routines +=3D libc-do-syscall
> + endif
> ++endif
> +
> + ifeq ($(subdir),rt)
> + librt-sysdep_routines +=3D libc-do-syscall
> +--
> +2.16.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb
> b/meta/recipes-core/glibc/glibc_2.27.bb
> index 772351a..c814798 100644
> --- a/meta/recipes-core/glibc/glibc_2.27.bb
> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
> @@ -54,6 +54,7 @@ NATIVESDKFIXES_class-nativesdk =3D "\
>             file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containi=
ng-.patch
> \
>             file://0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patc=
h
> \
>             file://relocate-locales.patch \
> +           file://0031-nativesdk-deprecate-libcrypt.patch \
>  "
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-core/glibc/site_config/headers
> b/meta/recipes-core/glibc/site_config/headers
> index 609ab53..69fedea 100644
> --- a/meta/recipes-core/glibc/site_config/headers
> +++ b/meta/recipes-core/glibc/site_config/headers
> @@ -9,7 +9,6 @@ asm/page.h
>  asm/types.h
>  assert.h
>  byteswap.h
> -crypt.h
>  ctype.h
>  dirent.h
>  dlfcn.h
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> new file mode 100644
> index 0000000..b1982c1
> --- /dev/null
> +++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "Extended cryptographic library (from glibc)"
> +DESCRIPTION =3D "Forked code from glibc libary to extract only crypto pa=
rt."
> +HOMEPAGE =3D "https://github.com/besser82/libxcrypt"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM ?=3D "file://LICENSING;md5=3Dd1cc18f512ded3bd6000f3729f=
31be08
> \
> +      file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> +"
> +
> +inherit autotools
> +
> +SRCREV ?=3D "215b32aa4e0b255c3356a96bd6d257661bad73ca"
> +SRCBRANCH ?=3D "master"
> +
> +SRC_URI =3D "git://github.com/besser82/libxcrypt.git;branch=3D${SRCBRANC=
H}"
> +
> +PROVIDES =3D "virtual/crypt"
> +
> +FILES_${PN} =3D "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so
> ${libdir}/libowcrypt*.so.* ${libdir}/libowcrypt-*.so"
> +
> +S =3D "${WORKDIR}/git"
> +
> +BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
> +TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${includedir}"
> +
> +python () {
> +    if not bb.data.inherits_class('nativesdk', d):
> +        raise bb.parse.SkipRecipe("Recipe only applies in nativesdk case
> for now")
> +}
> +
> +BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb
> b/meta/recipes-core/meta/uninative-tarball.bb
> index 5fabf7f..38c3a31 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -13,6 +13,7 @@ TOOLCHAIN_HOST_TASK =3D "\
>      nativesdk-glibc-gconv-utf-16 \
>      nativesdk-glibc-gconv-cp1252 \
>      nativesdk-patchelf \
> +    nativesdk-libxcrypt \
>      "
>
>  INHIBIT_DEFAULT_DEPS =3D "1"
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/
> musl_git.bb
> index 8906ac6..9f8c512 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://git.musl-libc.org/musl \
>
>  S =3D "${WORKDIR}/git"
>
> -PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> virtual/libiconv virtual/libintl"
> +PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> virtual/libiconv virtual/libintl virtual/crypt"
>
>  DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
>             virtual/${TARGET_PREFIX}gcc-initial \
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 5e40b20..157416d 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D
> 1715f5ee3e01203ca1e1e0b9ee65918c
>
>  #gtk-doc is not enabled as it requires xmlto which requires util-linux
>  inherit autotools gettext pkgconfig systemd update-alternatives
> python3-dir bash-completion ptest
> -DEPENDS =3D "zlib ncurses"
> +DEPENDS =3D "zlib ncurses virtual/crypt"
>  DEPENDS_append_class-native =3D " lzo-native"
>  DEPENDS_append_class-nativesdk =3D " lzo-native"
>
> diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
> b/meta/recipes-devtools/perl/perl_5.24.1.bb
> index 66ccd7f..222dd88 100644
> --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
> @@ -1,7 +1,7 @@
>  require perl.inc
>
>  # We need gnugrep (for -I)
> -DEPENDS =3D "db grep-native gdbm zlib"
> +DEPENDS =3D "db grep-native gdbm zlib virtual/crypt"
>
>  # Pick up patches from debian
>  # http://ftp.de.debian.org/debian/pool/main/p/perl/perl_
> 5.22.0-1.debian.tar.xz
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index 48a3be8..673207f 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -6,8 +6,7 @@ LICENSE =3D "BSD | Artistic-1.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ded80ff1c2b40843cf5768e5229cf1=
6e5 \
>                      file://src/passwd.c;beginline=3D8;endline=3D30;md5=
=3D
> d83888ea14ae61951982d77125947661"
>
> -DEPENDS_class-native =3D ""
> -DEPENDS_class-nativesdk =3D ""
> +DEPENDS =3D "virtual/crypt"
>
>  SRC_URI =3D "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${
> PV}.tar.xz \
>             file://shadow-4.1.3-dots-in-usernames.patch \
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

