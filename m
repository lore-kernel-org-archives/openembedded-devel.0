Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6aOM-0005WW-Od
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 06:33:05 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so2026562pad.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 21:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YotBNuEuh1J162FKjRaLgbPzHr+X5CAhy3v4n9ky8RU=;
	b=TmomfEMKbIYtahifbJThbQ2TszZfF7Jo84pTCmgXXQfzeUNpi6sjnyIqcvdE6kKXXO
	qRZh53xMSXphIuNWDtA/aHyonlEUlW+ngSvn5mdPqkjwpZcqawNxaOl+z4fp/SgyUtdO
	EZ870rY8E4bk758ooPTJhFDFavEsRyUFtHWmUhZQ22HZxfj6Vmb7NaoIawwPQ906bYyU
	8okLqdA0X11kln4SYua0f5xg4/XDkiLgioYDXSR8a9Vymym5JGUcRObxCpVzOo6wENVM
	ObAcwbrsZyCq5ED0jQAUzhN44wpEyFDFWu0g6K8oXyXh5lyVp2HhariKItGhEdmJksFY
	Y0HQ==
X-Received: by 10.66.88.37 with SMTP id bd5mr18261104pab.75.1360991809283;
	Fri, 15 Feb 2013 21:16:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f9sm95886296paz.12.2013.02.15.21.16.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 21:16:48 -0800 (PST)
Date: Sat, 16 Feb 2013 06:16:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216051646.GS3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-3-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360234263-18278-3-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/8] tbb: add 4.1-20121003 version with preliminary AArch64 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 05:33:06 -0000
X-Groupsio-MsgNum: 43193
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zn93sY2JrH9m7VZ"
Content-Disposition: inline

--6zn93sY2JrH9m7VZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 11:50:57AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../recipes-support/tbb/tbb/cross-compile.patch    |  25 +++
>  meta-oe/recipes-support/tbb/tbb/tbb.pc             |  11 +
>  .../recipes-support/tbb/tbb/tbb41-aarch64.patch    | 233 +++++++++++++++=
++++++
>  meta-oe/recipes-support/tbb/tbb_4.1.bb             |  31 +++
>  4 files changed, 300 insertions(+)
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/tbb41-aarch64.patch
>  create mode 100644 meta-oe/recipes-support/tbb/tbb_4.1.bb

Fails to fetch:
ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://threadingbuildingblocks.org/sites/default/files/software_releases/so=
urce/tbb41_20121003oss_src.tgz:
2013-02-15 13:46:41 ERROR 404: Not Found.

ERROR: Function failed: Fetcher failure for URL:
'http://threadingbuildingblocks.org/sites/default/files/software_releases/s=
ource/tbb41_20121003oss_src.tgz'.
Unable to fetch URL from any source.

complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30215_060633.log/

>=20
> diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-o=
e/recipes-support/tbb/tbb/cross-compile.patch
> new file mode 100644
> index 0000000..b970a37
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
> @@ -0,0 +1,25 @@
> +Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-Status: unsuitable
> +---
> + build/linux.gcc.inc |    5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +--- tbb41_20121003oss.orig/build/linux.gcc.inc
> ++++ tbb41_20121003oss/build/linux.gcc.inc
> +@@ -40,12 +40,13 @@ DYLIB_KEY =3D -shared
> + EXPORT_KEY =3D -Wl,--version-script,
> + LIBDL =3D -ldl
> +=20
> + TBB_NOSTRICT =3D 1
> +=20
> +-CPLUS =3D g++
> +-CONLY =3D gcc
> ++CPLUS =3D $(CXX)
> ++CONLY =3D $(CC)
> ++CPLUS_FLAGS =3D $(CXXFLAGS)
> + LIB_LINK_FLAGS =3D $(DYLIB_KEY) -Wl,-soname=3D$(BUILDING_LIBRARY)
> + LIBS +=3D -lpthread -lrt
> + LINK_FLAGS =3D -Wl,-rpath-link=3D.
> + C_FLAGS =3D $(CPLUS_FLAGS)
> + # gcc 4.4 and higher support -std=3Dc++0x
> diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-sup=
port/tbb/tbb/tbb.pc
> new file mode 100644
> index 0000000..644b64f
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/tbb.pc
> @@ -0,0 +1,11 @@
> +prefix=3D/usr
> +exec_prefix=3D${prefix}
> +libdir=3D${exec_prefix}/lib
> +includedir=3D${prefix}/include
> +
> +Name: Threading Building Blocks
> +Description: Intel's parallelism library for C++
> +URL: http://www.threadingbuildingblocks.org/
> +Version: 3.0+r018
> +Libs: -L${libdir} -ltbb
> +Cflags: -I${includedir}=20
> diff --git a/meta-oe/recipes-support/tbb/tbb/tbb41-aarch64.patch b/meta-o=
e/recipes-support/tbb/tbb/tbb41-aarch64.patch
> new file mode 100644
> index 0000000..3366f87
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/tbb41-aarch64.patch
> @@ -0,0 +1,233 @@
> +Author: Leif Lindholm <leif.lindholm@linaro.org>
> +
> +Upstream-Status: not there yet
> +
> +https://bugs.launchpad.net/linaro-aarch64/+bug/1091353
> +
> +diff --git a/build/linux.inc b/build/linux.inc
> +index bdad142..7db323c 100644
> +--- a/build/linux.inc
> ++++ b/build/linux.inc
> +@@ -104,6 +104,9 @@ endif
> + ifeq ($(arch),sparc)
> +         def_prefix =3D lin64
> + endif
> ++ifeq ($(arch),aarch64)
> ++        def_prefix =3D lin64
> ++endif
> + ifeq (,$(def_prefix))
> +     ifeq (64,$(findstring 64,$(arch)))
> +             def_prefix =3D lin64
> +diff --git a/include/tbb/machine/linux_aarch64.h b/include/tbb/machine/l=
inux_aarch64.h
> +new file mode 100644
> +index 0000000..e3ebc36
> +--- /dev/null
> ++++ b/include/tbb/machine/linux_aarch64.h
> +@@ -0,0 +1,153 @@
> ++/*
> ++    Copyright 2013 Linaro  All Rights Reserved.
> ++
> ++    This file is part of Threading Building Blocks.
> ++
> ++    Threading Building Blocks is free software; you can redistribute it
> ++    and/or modify it under the terms of the GNU General Public License
> ++    version 2 as published by the Free Software Foundation.
> ++
> ++    Threading Building Blocks is distributed in the hope that it will be
> ++    useful, but WITHOUT ANY WARRANTY; without even the implied warranty
> ++    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++    GNU General Public License for more details.
> ++
> ++    You should have received a copy of the GNU General Public License
> ++    along with Threading Building Blocks; if not, write to the Free Sof=
tware
> ++    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-13=
01  USA
> ++
> ++    As a special exception, you may use this file as part of a free sof=
tware
> ++    library without restriction.  Specifically, if other files instanti=
ate
> ++    templates or use macros or inline functions from this file, or you =
compile
> ++    this file and link it with other files to produce an executable, th=
is
> ++    file does not by itself cause the resulting executable to be covere=
d by
> ++    the GNU General Public License.  This exception does not however
> ++    invalidate any other reasons why the executable file might be cover=
ed by
> ++    the GNU General Public License.
> ++*/
> ++
> ++/*
> ++    This is the TBB implementation for the ARM AArch64 architecture.
> ++*/=20
> ++
> ++#ifndef __TBB_machine_H
> ++#error Do not include this file directly; include tbb_machine.h instead
> ++#endif
> ++
> ++#if !(__aarch64__)
> ++#error Threading Building Blocks AArch64 port requires an AArch64 archi=
tecture.
> ++#endif
> ++
> ++#include <sys/param.h>
> ++#include <unistd.h>
> ++
> ++#define __TBB_WORDSIZE 8
> ++
> ++#ifndef __BYTE_ORDER__
> ++    // Hopefully endianness can be validly determined at runtime.
> ++    // This may silently fail in some embedded systems with page-specif=
ic endianness.
> ++#elif __BYTE_ORDER__=3D=3D__ORDER_BIG_ENDIAN__
> ++    #define __TBB_BIG_ENDIAN 1
> ++#elif __BYTE_ORDER__=3D=3D__ORDER_LITTLE_ENDIAN__
> ++    #define __TBB_BIG_ENDIAN 0
> ++#else
> ++    #define __TBB_BIG_ENDIAN -1 // not currently supported
> ++#endif
> ++                =20
> ++
> ++#define __TBB_compiler_fence() __asm__ __volatile__("": : :"memory")
> ++#define __TBB_control_consistency_helper() __TBB_compiler_fence()
> ++
> ++#define __TBB_aarch64_inner_shareable_barrier() __asm__ __volatile__("d=
mb ish": : :"memory")
> ++#define __TBB_acquire_consistency_helper() __TBB_aarch64_inner_shareabl=
e_barrier()
> ++#define __TBB_release_consistency_helper() __TBB_aarch64_inner_shareabl=
e_barrier()
> ++#define __TBB_full_memory_fence() __TBB_aarch64_inner_shareable_barrier=
()
> ++
> ++//--------------------------------------------------
> ++// Compare and swap
> ++//--------------------------------------------------
> ++
> ++/**
> ++ * Atomic CAS for 32 bit values, if *ptr=3D=3Dcomparand, then *ptr=3Dva=
lue,
> ++ * returns *ptr
> ++ *
> ++ * @param ptr pointer to value in memory to be swapped with value
> ++ *  if *ptr=3D=3Dcomparand
> ++ * @param value value to assign *ptr to if *ptr=3D=3Dcomparand
> ++ * @param comparand value to compare with *ptr
> ++ * @return value originally in memory at ptr, regardless of success
> ++*/
> ++static inline int32_t __TBB_machine_cmpswp4(volatile void *ptr, int32_t=
 value, int32_t comparand )
> ++{
> ++    int32_t oldval, res;
> ++
> ++    do {
> ++    __asm__ __volatile__(
> ++	    "       ldxr    %w1, [%2]\n"
> ++	    "       mov     %w0, #0\n"
> ++	    "       cmp     %w1, %w3\n"
> ++	    "       b.ne    1f\n"
> ++	    "       stxr    %w0, %w4, [%2]\n"
> ++	    "1:\n"
> ++	    : "=3D&r" (res), "=3D&r" (oldval)
> ++	    : "r" (ptr), "Ir" (value), "r" (comparand)
> ++	    : "cc");
> ++    } while (res);
> ++
> ++    return oldval;
> ++}
> ++
> ++/**
> ++ * Atomic CAS for 64 bit values, if *ptr=3D=3Dcomparand, then *ptr=3Dva=
lue,
> ++ * returns *ptr
> ++ *
> ++ * @param ptr pointer to value in memory to be swapped with value
> ++ *  if *ptr=3D=3Dcomparand
> ++ * @param value value to assign *ptr to if *ptr=3D=3Dcomparand
> ++ * @param comparand value to compare with *ptr
> ++ * @return value originally in memory at ptr, regardless of success
> ++ */
> ++static inline int64_t __TBB_machine_cmpswp8(volatile void *ptr, int64_t=
 value, int64_t comparand )
> ++{
> ++    int64_t oldval;
> ++    int64_t res;
> ++
> ++    do {
> ++        __asm__ __volatile__(
> ++		"       ldxr    %1, [%2]\n"
> ++		"       mov     %w0, #0\n"
> ++		"       cmp     %1, %3\n"
> ++		"       b.ne    1f\n"
> ++		"       stxr    %w0, %4, [%2]\n"
> ++		"1:\n"
> ++		: "=3D&r" (res), "=3D&r" (oldval)
> ++		: "r" (ptr), "Ir" (value), "r" (comparand)
> ++		: "cc");
> ++    } while (res);
> ++
> ++    return oldval;
> ++}
> ++
> ++inline void __TBB_machine_pause (int32_t delay )
> ++{
> ++    while(delay>0)
> ++    {
> ++	__TBB_compiler_fence();
> ++        delay--;
> ++    }
> ++}
> ++
> ++// Machine specific atomic operations
> ++
> ++#define __TBB_CompareAndSwap4(P,V,C) __TBB_machine_cmpswp4(P,V,C)
> ++#define __TBB_CompareAndSwap8(P,V,C) __TBB_machine_cmpswp8(P,V,C)
> ++//#define __TBB_CompareAndSwapW(P,V,C) __TBB_machine_cmpswp4(P,V,C)
> ++#define __TBB_Pause(V) __TBB_machine_pause(V)
> ++
> ++// Use generics for some things
> ++#define __TBB_USE_GENERIC_PART_WORD_CAS				1
> ++#define __TBB_USE_GENERIC_FETCH_ADD				1
> ++#define __TBB_USE_GENERIC_FETCH_STORE				1
> ++#define __TBB_USE_GENERIC_HALF_FENCED_LOAD_STORE		1
> ++#define __TBB_USE_GENERIC_RELAXED_LOAD_STORE                    1
> ++#define __TBB_USE_GENERIC_SEQUENTIAL_CONSISTENCY_LOAD_STORE	1
> +diff --git a/include/tbb/tbb_machine.h b/include/tbb/tbb_machine.h
> +index 752062e..5342877 100644
> +--- a/include/tbb/tbb_machine.h
> ++++ b/include/tbb/tbb_machine.h
> +@@ -223,6 +223,8 @@ template<> struct atomic_selector<8> {
> +         #include "machine/linux_ia64.h"
> +     #elif __powerpc__
> +         #include "machine/mac_ppc.h"
> ++    #elif __aarch64__
> ++        #include "machine/linux_aarch64.h"
> +     #elif __TBB_GCC_BUILTIN_ATOMICS_PRESENT
> +         #include "machine/gcc_generic.h"
> +     #endif
> +@@ -391,10 +393,12 @@ void spin_wait_until_eq( const volatile T& locatio=
n, const U value ) {
> + //  - The operation assumes that the architecture consistently uses eit=
her little-endian or big-endian:
> + //      it does not support mixed-endian or page-specific bi-endian arc=
hitectures.
> + // This function is the only use of __TBB_BIG_ENDIAN.
> +-#if (__TBB_BIG_ENDIAN!=3D-1)
> ++#if (__TBB_BIG_ENDIAN=3D=3D-1)
> +     #if ( __TBB_USE_GENERIC_PART_WORD_CAS)
> +         #error generic implementation of part-word CAS was explicitly d=
isabled for this configuration
> +     #endif
> ++#endif
> ++
> + template<typename T>
> + inline T __TBB_MaskedCompareAndSwap (volatile T * const ptr, const T va=
lue, const T comparand ) {
> +     struct endianness{ static bool is_big_endian(){
> +@@ -432,7 +436,6 @@ inline T __TBB_MaskedCompareAndSwap (volatile T * co=
nst ptr, const T value, cons
> +         else continue;                                     // CAS faile=
d but the bits of interest left unchanged
> +     }
> + }
> +-#endif
> + template<size_t S, typename T>
> + inline T __TBB_CompareAndSwapGeneric (volatile void *ptr, T value, T co=
mparand );
> +=20
> +diff --git a/src/tbbmalloc/frontend.cpp b/src/tbbmalloc/frontend.cpp
> +index 4e81870..ddac9e0 100644
> +--- a/src/tbbmalloc/frontend.cpp
> ++++ b/src/tbbmalloc/frontend.cpp
> +@@ -653,6 +653,14 @@ static inline unsigned int highestBitPos(unsigned i=
nt n)
> + #   error highestBitPos() not implemented for this platform
> + # endif
> +=20
> ++#elif __aarch64__
> ++    __asm__ __volatile__
> ++    (
> ++       "clz %0, %1\n"
> ++       "mov %1, %2\n"
> ++       "sub %0, %1, %0\n"
> ++       :"=3D&r" (pos), "=3D&r" (n) :"I" (31)
> ++    );
> + #else
> +     static unsigned int bsr[16] =3D {0/*N/A*/,6,7,7,8,8,8,8,9,9,9,9,9,9=
,9,9};
> +     pos =3D bsr[ n>>6 ];
> diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-sup=
port/tbb/tbb_4.1.bb
> new file mode 100644
> index 0000000..e67e755
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "Parallelism library for C++ - runtime files \
> + TBB is a library that helps you leverage multi-core processor \
> + performance without having to be a threading expert. It represents a \
> + higher-level, task-based parallelism that abstracts platform details \
> + and threading mechanism for performance and scalability."
> +HOMEPAGE =3D "http://threadingbuildingblocks.org/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2c7f2caf277a3933e3acdf7f89d54=
cc1"
> +PRDATE =3D "20121003"
> +
> +SRC_URI =3D "http://threadingbuildingblocks.org/sites/default/files/soft=
ware_releases/source/tbb41_${PRDATE}oss_src.tgz \
> +           file://tbb41-aarch64.patch \
> +           file://cross-compile.patch \
> +           file://tbb.pc"
> +
> +S =3D "${WORKDIR}/tbb41_${PRDATE}oss/"
> +
> +SRC_URI[md5sum] =3D "2a684fefb855d2d0318d1ef09afa75ff"
> +SRC_URI[sha256sum] =3D "5383727b9582a54cf4c4adbf22186b70e8eba276fcd3be81=
d746a937c5b47afc"
> +
> +do_compile() {
> +    oe_runmake compiler=3Dgcc arch=3Daarch64 runtime=3Dcc4.7_libc2.17_ke=
rnel3.8 tbb tbbmalloc
> +}
> +
> +do_install() {
> +    install -d ${D}${includedir} ${D}${libdir}/pkgconfig
> +    rm ${S}/include/tbb/index.html -f
> +    cp -a ${S}/include/tbb ${D}${includedir}
> +    install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
> +    install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
> +}
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6zn93sY2JrH9m7VZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEfFj4ACgkQN1Ujt2V2gByGSACgmRg9GI8ffXC4ev1Du9YdO6ac
slEAoJh6O6hf87kMq0IpEr5RAwFXoa1r
=GfAX
-----END PGP SIGNATURE-----

--6zn93sY2JrH9m7VZ--
