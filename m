Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OWfEx-0001lM-Os
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 02:45:27 +0200
Received: by iwn34 with SMTP id 34so308165iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 17:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=tuA3kSD09/Rqp6l6GvczuHMxdIm4Mg1hE3hwEjjkog8=;
	b=qWmdgG28lnH44rQfBIajO/OVvf+WIEhDscIzetDCMEh3hLZ2g3iwvICDp6cn3GEOoV
	C+AXu4KtFJlJksTUD5boDL/KVmEA6MPtwCbRy/WSTA/+6OKoU7hR/IobeCCEghqOBOri
	TUQFC/hEDVqtmrncGqer/7eVFzRUWYE948I1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=wiayOANPZ17BQfPNUKV8sIN9/5GOEpraQCXH2Lpkf/wQ28ivoBHo91Ir9ETDmeOrsW
	oIOiLnkywHzX20lvsadx8ZDFaSuIYK85/THoFgk4TeBWuV+X+nRgIQvnED0T9cEWe4Bw
	9hEh/PrtcZAvmx2P9Zfu7WfvUjxNlsoBaxn3c=
Received: by 10.231.171.3 with SMTP id f3mr2696523ibz.145.1278549633586; Wed, 
	07 Jul 2010 17:40:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 7 Jul 2010 17:40:13 -0700 (PDT)
In-Reply-To: <1278509965-32664-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1278509965-32664-1-git-send-email-heinold@inf.fu-berlin.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jul 2010 17:40:13 -0700
Message-ID: <AANLkTilK-hX_hPWqDp04sCTV3WiFTPL3ojHL3Jyc6CXX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: Re: [PATCH] gcc: add support for builtin gcc-atomics for gcc-4.3.x versions
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
X-List-Received-Date: Thu, 08 Jul 2010 00:45:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 7, 2010 at 6:39 AM,  <heinold@inf.fu-berlin.de> wrote:
> From: Henning Heinold <heinold@inf.fu-berlin.de>
>
> * bump all INC_PR's
>
> Hi,
>
> this are the promised patches for gcc-4.3.x series, which fixes
> the atomic stuff and therefore make it able to build
> llvm multithreaded.
>
> Signed-off-by: Henning Heinold <h.heinold@tarent.de>

Acked-by: Khem Raj <raj.khem@gmail.com>
are tabs and spaces consistent

> ---
> =A0recipes/gcc/gcc-4.3.1.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A06 +-
> =A0.../gcc-4.3.1/debian/armel-atomic-builtins.dpatch =A0| =A0350 ++++++++=
++++++++++++
> =A0...90519-arm-eabi-atomic-builtins-unbreak-v2.patch | =A0 52 +++
> =A0recipes/gcc/gcc-4.3.2.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A06 +-
> =A0.../gcc-4.3.2/debian/armel-atomic-builtins.dpatch =A0| =A0350 ++++++++=
++++++++++++
> =A0...90519-arm-eabi-atomic-builtins-unbreak-v2.patch | =A0 52 +++
> =A0recipes/gcc/gcc-4.3.3.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A04 +-
> =A0.../gcc-4.3.3/debian/armel-atomic-builtins.dpatch =A0| =A0350 ++++++++=
++++++++++++
> =A0...90519-arm-eabi-atomic-builtins-unbreak-v2.patch | =A0 52 +++
> =A0recipes/gcc/gcc-4.3.4.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A04 +-
> =A0.../gcc-4.3.4/debian/armel-atomic-builtins.dpatch =A0| =A0350 ++++++++=
++++++++++++
> =A0...90519-arm-eabi-atomic-builtins-unbreak-v2.patch | =A0 52 +++
> =A012 files changed, 1622 insertions(+), 6 deletions(-)
> =A0create mode 100644 recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.=
dpatch
> =A0create mode 100644 recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-ato=
mic-builtins-unbreak-v2.patch
> =A0create mode 100644 recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.=
dpatch
> =A0create mode 100644 recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-ato=
mic-builtins-unbreak-v2.patch
> =A0create mode 100644 recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.=
dpatch
> =A0create mode 100644 recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-ato=
mic-builtins-unbreak-v2.patch
> =A0create mode 100644 recipes/gcc/gcc-4.3.4/debian/armel-atomic-builtins.=
dpatch
> =A0create mode 100644 recipes/gcc/gcc-4.3.4/gcc-4.4-20090519-arm-eabi-ato=
mic-builtins-unbreak-v2.patch
>
> diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
> index c0c7dbe..0f93d37 100644
> --- a/recipes/gcc/gcc-4.3.1.inc
> +++ b/recipes/gcc/gcc-4.3.1.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =A0DEPENDS =3D "mpfr gmp"
> =A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r20"
> +INC_PR =3D "r21"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Darch=
ive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=3D=
0 \
> @@ -25,7 +25,8 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-libgomp-speedup.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://fedora/gcc43-i386-libgomp.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://fedora/gcc43-rh251682.patch;striplevel=3D0 \
> - =A0 =A0file://debian/arm-unbreak-eabi-armv4t.dpatch;apply=3Dyes \
> + =A0 =A0 =A0 file://debian/arm-unbreak-eabi-armv4t.dpatch;apply=3Dyes \
> + =A0 =A0 =A0 =A0file://debian/armel-atomic-builtins.dpatch;apply=3Dyes;s=
triplevel=3D0 \
> =A0 =A0 =A0 =A0file://debian/libstdc++-pic.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/gcc-ice-hack.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/pr30961.dpatch;apply=3Dyes;striplevel=3D0 \
> @@ -51,6 +52,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://arm-softfloat.patch \
> =A0 =A0 =A0 =A0file://arm-thumb.patch \
> =A0 =A0 =A0 =A0file://arm-thumb-cache.patch \
> + =A0 =A0 =A0 =A0file://gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak=
-v2.patch \
> =A0 =A0 =A0 =A0file://cache-amnesia.patch \
> =A0 =A0 =A0 =A0file://gfortran-4.3.x.patch \
> =A0 =A0 =A0 =A0file://gcc-4.0.2-e300c2c3.patch \
> diff --git a/recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch b/=
recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch
> new file mode 100644
> index 0000000..f514375
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch
> @@ -0,0 +1,350 @@
> +#! /bin/sh -e
> +
> +# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.
> +
> +dir=3D
> +if [ $# -eq 3 -a "$2" =3D '-d' ]; then
> + =A0 =A0pdir=3D"-d $3"
> + =A0 =A0dir=3D"$3/"
> +elif [ $# -ne 1 ]; then
> + =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch as argum=
ent"
> + =A0 =A0exit 1
> +fi
> +case "$1" in
> + =A0 =A0-patch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0-unpatch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0*)
> + =A0 =A0 =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch =
as argument"
> + =A0 =A0 =A0 =A0exit 1
> +esac
> +exit 0
> +
> +This patch implements the atomic builtins described at:
> +
> + =A0http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html
> +
> +for ARM EABI Linux. This implementation uses the kernel helpers
> +__kernel_cmpxchg and __kernel_dmb, and so should work on any
> +architecture which supports those. (More-efficient versions are possible
> +using ldrex/strex on architectures >=3Dv6, but those are not written yet=
.)
> +
> +Atomic operations are provided for data sizes of 1, 2 and 4 bytes (but
> +not 8 bytes). The implementation uses actual functions
> +(__sync_fetch_and_add_2, etc.) rather than expanding code inline.
> +
> +Tested with cross to arm-none-linux-gnueabi, and with some additional
> +hand-written tests which hopefully exercised the atomicity of the
> +operations sufficiently.
> +
> +OK for mainline?
> +
> +Julian
> +
> +ChangeLog
> +
> + =A0 =A0gcc/
> + =A0 =A0* config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
> + =A0 =A0config/arm/linux-atomic.c.
> + =A0 =A0* config/arm/linux-atomic.c: New.
> +
> +Index: gcc/config/arm/linux-atomic.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> ++++ gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> +@@ -0,0 +1,280 @@
> ++/* Linux-specific atomic operations for ARM EABI.
> ++ =A0 Copyright (C) 2008 Free Software Foundation, Inc.
> ++ =A0 Contributed by CodeSourcery.
> ++
> ++This file is part of GCC.
> ++
> ++GCC is free software; you can redistribute it and/or modify it under
> ++the terms of the GNU General Public License as published by the Free
> ++Software Foundation; either version 2, or (at your option) any later
> ++version.
> ++
> ++In addition to the permissions in the GNU General Public License, the
> ++Free Software Foundation gives you unlimited permission to link the
> ++compiled version of this file into combinations with other programs,
> ++and to distribute those combinations without any restriction coming
> ++from the use of this file. =A0(The General Public License restrictions
> ++do apply in other respects; for example, they cover modification of
> ++the file, and distribution when not linked into a combine
> ++executable.)
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING. =A0If not, write to the Free
> ++Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
> ++02110-1301, USA. =A0*/
> ++
> ++/* Kernel helper for compare-and-exchange. =A0*/
> ++typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
> ++#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
> ++
> ++/* Kernel helper for memory barrier. =A0*/
> ++typedef void (__kernel_dmb_t) (void);
> ++#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
> ++
> ++/* Note: we implement byte, short and int versions of atomic operations=
 using
> ++ =A0 the above kernel helpers, but there is no support for "long long" =
(64-bit)
> ++ =A0 operations as yet. =A0*/
> ++
> ++#define HIDDEN __attribute__ ((visibility ("hidden")))
> ++
> ++#ifdef __ARMEL__
> ++#define INVERT_MASK_1 0
> ++#define INVERT_MASK_2 0
> ++#else
> ++#define INVERT_MASK_1 24
> ++#define INVERT_MASK_2 16
> ++#endif
> ++
> ++#define MASK_1 0xffu
> ++#define MASK_2 0xffffu
> ++
> ++#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_fetch_and_##OP##_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure, tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++FETCH_AND_OP_WORD (add, =A0 , +)
> ++FETCH_AND_OP_WORD (sub, =A0 , -)
> ++FETCH_AND_OP_WORD (or, =A0 =A0, |)
> ++FETCH_AND_OP_WORD (and, =A0 , &)
> ++FETCH_AND_OP_WORD (xor, =A0 , ^)
> ++FETCH_AND_OP_WORD (nand, ~, &)
> ++
> ++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
> ++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
> ++
> ++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
> ++ =A0 subword-sized quantities. =A0*/
> ++
> ++#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN) =A0 =
=A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0unsigned int mask, shift, oldval, newval; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D ((PFX_OP ((oldval & mask) >> shift) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 INF_OP (unsigned int) val) << shift) &=
 mask; =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0newval |=3D oldval & ~mask; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (RETURN & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
> ++
> ++#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_##OP##_and_fetch_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int tmp, failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return PFX_OP tmp INF_OP val; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++OP_AND_FETCH_WORD (add, =A0 , +)
> ++OP_AND_FETCH_WORD (sub, =A0 , -)
> ++OP_AND_FETCH_WORD (or, =A0 =A0, |)
> ++OP_AND_FETCH_WORD (and, =A0 , &)
> ++OP_AND_FETCH_WORD (xor, =A0 , ^)
> ++OP_AND_FETCH_WORD (nand, ~, &)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
> ++
> ++int HIDDEN
> ++__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int actual_oldval, fail;
> ++
> ++ =A0while (1)
> ++ =A0 =A0{
> ++ =A0 =A0 =A0actual_oldval =3D *ptr;
> ++
> ++ =A0 =A0 =A0if (oldval !=3D actual_oldval)
> ++ =A0 =A0 =A0return actual_oldval;
> ++
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, newval, ptr);
> ++
> ++ =A0 =A0 =A0if (!fail)
> ++ =A0 =A0 =A0 =A0return oldval;
> ++ =A0 =A0}
> ++}
> ++
> ++#define SUBWORD_VAL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *)((unsigned int) ptr & ~3), fail; =A0 =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int mask, shift, actual_oldval, actual_newval; =A0 =A0=
 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0while (1) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0 =A0 =A0actual_oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (((actual_oldval & mask) >> shift) !=3D (unsigned int) o=
ldval) \
> ++ =A0 =A0 =A0 =A0 =A0return (actual_oldval & mask) >> shift; =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0actual_newval =3D (actual_oldval & ~mask) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| (((unsigned int) newval <=
< shift) & mask); =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, actual_newval, =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wordptr); =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (!fail) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0return oldval; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_VAL_CAS (short, 2)
> ++SUBWORD_VAL_CAS (char, =A01)
> ++
> ++typedef unsigned char bool;
> ++
> ++bool HIDDEN
> ++__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int failure =3D __kernel_cmpxchg (oldval, newval, ptr);
> ++ =A0return (failure =3D=3D 0);
> ++}
> ++
> ++#define SUBWORD_BOOL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0bool HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0TYPE actual_oldval =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0=3D __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newva=
l); =A0 =A0\
> ++ =A0 =A0return (oldval =3D=3D actual_oldval); =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_BOOL_CAS (short, 2)
> ++SUBWORD_BOOL_CAS (char, =A01)
> ++
> ++void HIDDEN
> ++__sync_synchronize (void)
> ++{
> ++ =A0__kernel_dmb ();
> ++}
> ++
> ++int HIDDEN
> ++__sync_lock_test_and_set_4 (int *ptr, int val)
> ++{
> ++ =A0int failure, oldval;
> ++
> ++ =A0do {
> ++ =A0 =A0oldval =3D *ptr;
> ++ =A0 =A0failure =3D __kernel_cmpxchg (oldval, val, ptr);
> ++ =A0} while (failure !=3D 0);
> ++
> ++ =A0return oldval;
> ++}
> ++
> ++#define SUBWORD_TEST_AND_SET(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int oldval, newval, shift, mask; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D (oldval & ~mask) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 | (((unsigned int) val << shift) & mask); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (oldval & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_TEST_AND_SET (short, 2)
> ++SUBWORD_TEST_AND_SET (char, =A01)
> ++
> ++#define SYNC_LOCK_RELEASE(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0void HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_release_##WIDTH (TYPE *ptr) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0*ptr =3D 0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0__kernel_dmb (); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SYNC_LOCK_RELEASE (int, =A0 4)
> ++SYNC_LOCK_RELEASE (short, 2)
> ++SYNC_LOCK_RELEASE (char, =A01)
> +Index: gcc/config/arm/t-linux-eabi
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(revision 136167)
> ++++ gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(working copy)
> +@@ -12,3 +12,5 @@ LIB1ASMFUNCS :=3D $(filter-out _dvmd_tls,$
> + # Multilib the standard Linux files. =A0Don't include crti.o or crtn.o,
> + # which are provided by glibc.
> + EXTRA_MULTILIB_PARTS=3Dcrtbegin.o crtend.o crtbeginS.o crtendS.o crtbeg=
inT.o
> ++
> ++LIB2FUNCS_STATIC_EXTRA +=3D $(srcdir)/config/arm/linux-atomic.c
> +
> +
> diff --git a/recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-built=
ins-unbreak-v2.patch b/recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atom=
ic-builtins-unbreak-v2.patch
> new file mode 100644
> index 0000000..6849d46
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-builtins-unb=
reak-v2.patch
> @@ -0,0 +1,52 @@
> +--- gcc-4.4-20090519/gcc/config/arm/linux-eabi.h.~1~ =A0 2007-11-08 14:4=
4:09.000000000 +0100
> ++++ gcc-4.4-20090519/gcc/config/arm/linux-eabi.h =A0 =A0 =A0 2009-05-22 =
20:38:51.000000000 +0200
> +@@ -72,6 +72,49 @@
> + =A0 =A0do not use -lfloat. =A0*/
> + #undef LIBGCC_SPEC
> +
> ++/* Some symbols are only in the static libgcc. Override REAL_LIBGCC_SPE=
C
> ++ =A0 to always pass -lgcc to the linker, even for --shared-libgcc, othe=
rwise
> ++ =A0 shared libraries break. */
> ++#ifdef ENABLE_SHARED_LIBGCC
> ++
> ++#ifndef USE_LD_AS_NEEDED
> ++#define USE_LD_AS_NEEDED 0
> ++#endif
> ++
> ++#if USE_LD_AS_NEEDED
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared-libgcc:-lgcc --as-needed -lgcc_s --no-as-needed} =
\
> ++ =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 /* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}"
> ++#endif
> ++
> ++#ifdef LINK_EH_SPEC
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}" =A0 =A0 =A0/* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* =
always append -lgcc */
> ++#endif
> ++
> ++#define REAL_LIBGCC_SPEC " \
> ++ =A0 =A0 =A0%{static|static-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0%{!static:%{!static-libgcc: \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_1" \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_2" \
> ++ =A0 =A0 =A0}}"
> ++
> ++#else /* !ENABLE_SHARED_LIBGCC */
> ++
> ++#define REAL_LIBGCC_SPEC " -lgcc "
> ++
> ++#endif =A0 =A0 =A0 =A0/* !ENABLE_SHARED_LIBGCC */
> ++
> + /* Clear the instruction cache from `beg' to `end'. =A0This makes an
> + =A0 =A0inline system call to SYS_cacheflush. =A0*/
> + #undef =A0CLEAR_INSN_CACHE
> diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
> index a587349..5eebf0b 100644
> --- a/recipes/gcc/gcc-4.3.2.inc
> +++ b/recipes/gcc/gcc-4.3.2.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =A0DEPENDS =3D "mpfr gmp"
> =A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r10"
> +INC_PR =3D "r11"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Darch=
ive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=3D=
0 \
> @@ -25,7 +25,8 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-libgomp-speedup.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://fedora/gcc43-i386-libgomp.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://fedora/gcc43-rh251682.patch;striplevel=3D0 \
> - =A0 =A0file://debian/arm-unbreak-eabi-armv4t.dpatch;apply=3Dyes \
> + =A0 =A0 =A0 file://debian/arm-unbreak-eabi-armv4t.dpatch;apply=3Dyes \
> + =A0 =A0 =A0 =A0file://debian/armel-atomic-builtins.dpatch;apply=3Dyes;s=
triplevel=3D0 \
> =A0 =A0 =A0 =A0file://debian/libstdc++-pic.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/gcc-ice-hack.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/pr30961.dpatch;apply=3Dyes;striplevel=3D0 \
> @@ -48,6 +49,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://904-flatten-switch-stmt-00.patch \
> =A0 =A0 =A0 =A0file://arm-nolibfloat.patch \
> =A0 =A0 =A0 =A0file://arm-softfloat.patch \
> + =A0 =A0 =A0 =A0file://gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak=
-v2.patch \
> =A0 =A0 =A0 =A0file://cache-amnesia.patch \
> =A0 =A0 =A0 =A0file://gfortran-4.3.x.patch \
> =A0 =A0 =A0 =A0file://gcc-4.0.2-e300c2c3.patch \
> diff --git a/recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch b/=
recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch
> new file mode 100644
> index 0000000..f514375
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch
> @@ -0,0 +1,350 @@
> +#! /bin/sh -e
> +
> +# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.
> +
> +dir=3D
> +if [ $# -eq 3 -a "$2" =3D '-d' ]; then
> + =A0 =A0pdir=3D"-d $3"
> + =A0 =A0dir=3D"$3/"
> +elif [ $# -ne 1 ]; then
> + =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch as argum=
ent"
> + =A0 =A0exit 1
> +fi
> +case "$1" in
> + =A0 =A0-patch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0-unpatch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0*)
> + =A0 =A0 =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch =
as argument"
> + =A0 =A0 =A0 =A0exit 1
> +esac
> +exit 0
> +
> +This patch implements the atomic builtins described at:
> +
> + =A0http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html
> +
> +for ARM EABI Linux. This implementation uses the kernel helpers
> +__kernel_cmpxchg and __kernel_dmb, and so should work on any
> +architecture which supports those. (More-efficient versions are possible
> +using ldrex/strex on architectures >=3Dv6, but those are not written yet=
.)
> +
> +Atomic operations are provided for data sizes of 1, 2 and 4 bytes (but
> +not 8 bytes). The implementation uses actual functions
> +(__sync_fetch_and_add_2, etc.) rather than expanding code inline.
> +
> +Tested with cross to arm-none-linux-gnueabi, and with some additional
> +hand-written tests which hopefully exercised the atomicity of the
> +operations sufficiently.
> +
> +OK for mainline?
> +
> +Julian
> +
> +ChangeLog
> +
> + =A0 =A0gcc/
> + =A0 =A0* config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
> + =A0 =A0config/arm/linux-atomic.c.
> + =A0 =A0* config/arm/linux-atomic.c: New.
> +
> +Index: gcc/config/arm/linux-atomic.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> ++++ gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> +@@ -0,0 +1,280 @@
> ++/* Linux-specific atomic operations for ARM EABI.
> ++ =A0 Copyright (C) 2008 Free Software Foundation, Inc.
> ++ =A0 Contributed by CodeSourcery.
> ++
> ++This file is part of GCC.
> ++
> ++GCC is free software; you can redistribute it and/or modify it under
> ++the terms of the GNU General Public License as published by the Free
> ++Software Foundation; either version 2, or (at your option) any later
> ++version.
> ++
> ++In addition to the permissions in the GNU General Public License, the
> ++Free Software Foundation gives you unlimited permission to link the
> ++compiled version of this file into combinations with other programs,
> ++and to distribute those combinations without any restriction coming
> ++from the use of this file. =A0(The General Public License restrictions
> ++do apply in other respects; for example, they cover modification of
> ++the file, and distribution when not linked into a combine
> ++executable.)
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING. =A0If not, write to the Free
> ++Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
> ++02110-1301, USA. =A0*/
> ++
> ++/* Kernel helper for compare-and-exchange. =A0*/
> ++typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
> ++#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
> ++
> ++/* Kernel helper for memory barrier. =A0*/
> ++typedef void (__kernel_dmb_t) (void);
> ++#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
> ++
> ++/* Note: we implement byte, short and int versions of atomic operations=
 using
> ++ =A0 the above kernel helpers, but there is no support for "long long" =
(64-bit)
> ++ =A0 operations as yet. =A0*/
> ++
> ++#define HIDDEN __attribute__ ((visibility ("hidden")))
> ++
> ++#ifdef __ARMEL__
> ++#define INVERT_MASK_1 0
> ++#define INVERT_MASK_2 0
> ++#else
> ++#define INVERT_MASK_1 24
> ++#define INVERT_MASK_2 16
> ++#endif
> ++
> ++#define MASK_1 0xffu
> ++#define MASK_2 0xffffu
> ++
> ++#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_fetch_and_##OP##_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure, tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++FETCH_AND_OP_WORD (add, =A0 , +)
> ++FETCH_AND_OP_WORD (sub, =A0 , -)
> ++FETCH_AND_OP_WORD (or, =A0 =A0, |)
> ++FETCH_AND_OP_WORD (and, =A0 , &)
> ++FETCH_AND_OP_WORD (xor, =A0 , ^)
> ++FETCH_AND_OP_WORD (nand, ~, &)
> ++
> ++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
> ++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
> ++
> ++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
> ++ =A0 subword-sized quantities. =A0*/
> ++
> ++#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN) =A0 =
=A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0unsigned int mask, shift, oldval, newval; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D ((PFX_OP ((oldval & mask) >> shift) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 INF_OP (unsigned int) val) << shift) &=
 mask; =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0newval |=3D oldval & ~mask; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (RETURN & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
> ++
> ++#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_##OP##_and_fetch_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int tmp, failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return PFX_OP tmp INF_OP val; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++OP_AND_FETCH_WORD (add, =A0 , +)
> ++OP_AND_FETCH_WORD (sub, =A0 , -)
> ++OP_AND_FETCH_WORD (or, =A0 =A0, |)
> ++OP_AND_FETCH_WORD (and, =A0 , &)
> ++OP_AND_FETCH_WORD (xor, =A0 , ^)
> ++OP_AND_FETCH_WORD (nand, ~, &)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
> ++
> ++int HIDDEN
> ++__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int actual_oldval, fail;
> ++
> ++ =A0while (1)
> ++ =A0 =A0{
> ++ =A0 =A0 =A0actual_oldval =3D *ptr;
> ++
> ++ =A0 =A0 =A0if (oldval !=3D actual_oldval)
> ++ =A0 =A0 =A0return actual_oldval;
> ++
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, newval, ptr);
> ++
> ++ =A0 =A0 =A0if (!fail)
> ++ =A0 =A0 =A0 =A0return oldval;
> ++ =A0 =A0}
> ++}
> ++
> ++#define SUBWORD_VAL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *)((unsigned int) ptr & ~3), fail; =A0 =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int mask, shift, actual_oldval, actual_newval; =A0 =A0=
 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0while (1) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0 =A0 =A0actual_oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (((actual_oldval & mask) >> shift) !=3D (unsigned int) o=
ldval) \
> ++ =A0 =A0 =A0 =A0 =A0return (actual_oldval & mask) >> shift; =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0actual_newval =3D (actual_oldval & ~mask) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| (((unsigned int) newval <=
< shift) & mask); =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, actual_newval, =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wordptr); =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (!fail) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0return oldval; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_VAL_CAS (short, 2)
> ++SUBWORD_VAL_CAS (char, =A01)
> ++
> ++typedef unsigned char bool;
> ++
> ++bool HIDDEN
> ++__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int failure =3D __kernel_cmpxchg (oldval, newval, ptr);
> ++ =A0return (failure =3D=3D 0);
> ++}
> ++
> ++#define SUBWORD_BOOL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0bool HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0TYPE actual_oldval =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0=3D __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newva=
l); =A0 =A0\
> ++ =A0 =A0return (oldval =3D=3D actual_oldval); =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_BOOL_CAS (short, 2)
> ++SUBWORD_BOOL_CAS (char, =A01)
> ++
> ++void HIDDEN
> ++__sync_synchronize (void)
> ++{
> ++ =A0__kernel_dmb ();
> ++}
> ++
> ++int HIDDEN
> ++__sync_lock_test_and_set_4 (int *ptr, int val)
> ++{
> ++ =A0int failure, oldval;
> ++
> ++ =A0do {
> ++ =A0 =A0oldval =3D *ptr;
> ++ =A0 =A0failure =3D __kernel_cmpxchg (oldval, val, ptr);
> ++ =A0} while (failure !=3D 0);
> ++
> ++ =A0return oldval;
> ++}
> ++
> ++#define SUBWORD_TEST_AND_SET(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int oldval, newval, shift, mask; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D (oldval & ~mask) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 | (((unsigned int) val << shift) & mask); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (oldval & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_TEST_AND_SET (short, 2)
> ++SUBWORD_TEST_AND_SET (char, =A01)
> ++
> ++#define SYNC_LOCK_RELEASE(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0void HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_release_##WIDTH (TYPE *ptr) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0*ptr =3D 0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0__kernel_dmb (); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SYNC_LOCK_RELEASE (int, =A0 4)
> ++SYNC_LOCK_RELEASE (short, 2)
> ++SYNC_LOCK_RELEASE (char, =A01)
> +Index: gcc/config/arm/t-linux-eabi
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(revision 136167)
> ++++ gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(working copy)
> +@@ -12,3 +12,5 @@ LIB1ASMFUNCS :=3D $(filter-out _dvmd_tls,$
> + # Multilib the standard Linux files. =A0Don't include crti.o or crtn.o,
> + # which are provided by glibc.
> + EXTRA_MULTILIB_PARTS=3Dcrtbegin.o crtend.o crtbeginS.o crtendS.o crtbeg=
inT.o
> ++
> ++LIB2FUNCS_STATIC_EXTRA +=3D $(srcdir)/config/arm/linux-atomic.c
> +
> +
> diff --git a/recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-built=
ins-unbreak-v2.patch b/recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atom=
ic-builtins-unbreak-v2.patch
> new file mode 100644
> index 0000000..6849d46
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-builtins-unb=
reak-v2.patch
> @@ -0,0 +1,52 @@
> +--- gcc-4.4-20090519/gcc/config/arm/linux-eabi.h.~1~ =A0 2007-11-08 14:4=
4:09.000000000 +0100
> ++++ gcc-4.4-20090519/gcc/config/arm/linux-eabi.h =A0 =A0 =A0 2009-05-22 =
20:38:51.000000000 +0200
> +@@ -72,6 +72,49 @@
> + =A0 =A0do not use -lfloat. =A0*/
> + #undef LIBGCC_SPEC
> +
> ++/* Some symbols are only in the static libgcc. Override REAL_LIBGCC_SPE=
C
> ++ =A0 to always pass -lgcc to the linker, even for --shared-libgcc, othe=
rwise
> ++ =A0 shared libraries break. */
> ++#ifdef ENABLE_SHARED_LIBGCC
> ++
> ++#ifndef USE_LD_AS_NEEDED
> ++#define USE_LD_AS_NEEDED 0
> ++#endif
> ++
> ++#if USE_LD_AS_NEEDED
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared-libgcc:-lgcc --as-needed -lgcc_s --no-as-needed} =
\
> ++ =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 /* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}"
> ++#endif
> ++
> ++#ifdef LINK_EH_SPEC
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}" =A0 =A0 =A0/* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* =
always append -lgcc */
> ++#endif
> ++
> ++#define REAL_LIBGCC_SPEC " \
> ++ =A0 =A0 =A0%{static|static-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0%{!static:%{!static-libgcc: \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_1" \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_2" \
> ++ =A0 =A0 =A0}}"
> ++
> ++#else /* !ENABLE_SHARED_LIBGCC */
> ++
> ++#define REAL_LIBGCC_SPEC " -lgcc "
> ++
> ++#endif =A0 =A0 =A0 =A0/* !ENABLE_SHARED_LIBGCC */
> ++
> + /* Clear the instruction cache from `beg' to `end'. =A0This makes an
> + =A0 =A0inline system call to SYS_cacheflush. =A0*/
> + #undef =A0CLEAR_INSN_CACHE
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index e39b119..aa16643 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =A0DEPENDS =3D "mpfr gmp"
> =A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r13"
> +INC_PR =3D "r14"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Darch=
ive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=3D=
0 \
> @@ -26,6 +26,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-i386-libgomp.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://fedora/gcc43-rh251682.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://debian/arm-unbreak-eabi-armv4t.dpatch;apply=3Dyes \
> + =A0 =A0 =A0 =A0file://debian/armel-atomic-builtins.dpatch;apply=3Dyes;s=
triplevel=3D0 \
> =A0 =A0 =A0 =A0file://debian/libstdc++-pic.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/gcc-ice-hack.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/pr30961.dpatch;apply=3Dyes;striplevel=3D0 \
> @@ -48,6 +49,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://904-flatten-switch-stmt-00.patch \
> =A0 =A0 =A0 =A0file://arm-nolibfloat.patch \
> =A0 =A0 =A0 =A0file://arm-softfloat.patch \
> + =A0 =A0 =A0 =A0file://gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak=
-v2.patch \
> =A0 =A0 =A0 =A0file://cache-amnesia.patch \
> =A0 =A0 =A0 =A0file://gfortran-4.3.x.patch \
> =A0 =A0 =A0 =A0file://gcc-4.0.2-e300c2c3.patch \
> diff --git a/recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch b/=
recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch
> new file mode 100644
> index 0000000..f514375
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch
> @@ -0,0 +1,350 @@
> +#! /bin/sh -e
> +
> +# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.
> +
> +dir=3D
> +if [ $# -eq 3 -a "$2" =3D '-d' ]; then
> + =A0 =A0pdir=3D"-d $3"
> + =A0 =A0dir=3D"$3/"
> +elif [ $# -ne 1 ]; then
> + =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch as argum=
ent"
> + =A0 =A0exit 1
> +fi
> +case "$1" in
> + =A0 =A0-patch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0-unpatch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0*)
> + =A0 =A0 =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch =
as argument"
> + =A0 =A0 =A0 =A0exit 1
> +esac
> +exit 0
> +
> +This patch implements the atomic builtins described at:
> +
> + =A0http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html
> +
> +for ARM EABI Linux. This implementation uses the kernel helpers
> +__kernel_cmpxchg and __kernel_dmb, and so should work on any
> +architecture which supports those. (More-efficient versions are possible
> +using ldrex/strex on architectures >=3Dv6, but those are not written yet=
.)
> +
> +Atomic operations are provided for data sizes of 1, 2 and 4 bytes (but
> +not 8 bytes). The implementation uses actual functions
> +(__sync_fetch_and_add_2, etc.) rather than expanding code inline.
> +
> +Tested with cross to arm-none-linux-gnueabi, and with some additional
> +hand-written tests which hopefully exercised the atomicity of the
> +operations sufficiently.
> +
> +OK for mainline?
> +
> +Julian
> +
> +ChangeLog
> +
> + =A0 =A0gcc/
> + =A0 =A0* config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
> + =A0 =A0config/arm/linux-atomic.c.
> + =A0 =A0* config/arm/linux-atomic.c: New.
> +
> +Index: gcc/config/arm/linux-atomic.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> ++++ gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> +@@ -0,0 +1,280 @@
> ++/* Linux-specific atomic operations for ARM EABI.
> ++ =A0 Copyright (C) 2008 Free Software Foundation, Inc.
> ++ =A0 Contributed by CodeSourcery.
> ++
> ++This file is part of GCC.
> ++
> ++GCC is free software; you can redistribute it and/or modify it under
> ++the terms of the GNU General Public License as published by the Free
> ++Software Foundation; either version 2, or (at your option) any later
> ++version.
> ++
> ++In addition to the permissions in the GNU General Public License, the
> ++Free Software Foundation gives you unlimited permission to link the
> ++compiled version of this file into combinations with other programs,
> ++and to distribute those combinations without any restriction coming
> ++from the use of this file. =A0(The General Public License restrictions
> ++do apply in other respects; for example, they cover modification of
> ++the file, and distribution when not linked into a combine
> ++executable.)
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING. =A0If not, write to the Free
> ++Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
> ++02110-1301, USA. =A0*/
> ++
> ++/* Kernel helper for compare-and-exchange. =A0*/
> ++typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
> ++#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
> ++
> ++/* Kernel helper for memory barrier. =A0*/
> ++typedef void (__kernel_dmb_t) (void);
> ++#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
> ++
> ++/* Note: we implement byte, short and int versions of atomic operations=
 using
> ++ =A0 the above kernel helpers, but there is no support for "long long" =
(64-bit)
> ++ =A0 operations as yet. =A0*/
> ++
> ++#define HIDDEN __attribute__ ((visibility ("hidden")))
> ++
> ++#ifdef __ARMEL__
> ++#define INVERT_MASK_1 0
> ++#define INVERT_MASK_2 0
> ++#else
> ++#define INVERT_MASK_1 24
> ++#define INVERT_MASK_2 16
> ++#endif
> ++
> ++#define MASK_1 0xffu
> ++#define MASK_2 0xffffu
> ++
> ++#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_fetch_and_##OP##_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure, tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++FETCH_AND_OP_WORD (add, =A0 , +)
> ++FETCH_AND_OP_WORD (sub, =A0 , -)
> ++FETCH_AND_OP_WORD (or, =A0 =A0, |)
> ++FETCH_AND_OP_WORD (and, =A0 , &)
> ++FETCH_AND_OP_WORD (xor, =A0 , ^)
> ++FETCH_AND_OP_WORD (nand, ~, &)
> ++
> ++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
> ++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
> ++
> ++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
> ++ =A0 subword-sized quantities. =A0*/
> ++
> ++#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN) =A0 =
=A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0unsigned int mask, shift, oldval, newval; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D ((PFX_OP ((oldval & mask) >> shift) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 INF_OP (unsigned int) val) << shift) &=
 mask; =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0newval |=3D oldval & ~mask; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (RETURN & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
> ++
> ++#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_##OP##_and_fetch_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int tmp, failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return PFX_OP tmp INF_OP val; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++OP_AND_FETCH_WORD (add, =A0 , +)
> ++OP_AND_FETCH_WORD (sub, =A0 , -)
> ++OP_AND_FETCH_WORD (or, =A0 =A0, |)
> ++OP_AND_FETCH_WORD (and, =A0 , &)
> ++OP_AND_FETCH_WORD (xor, =A0 , ^)
> ++OP_AND_FETCH_WORD (nand, ~, &)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
> ++
> ++int HIDDEN
> ++__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int actual_oldval, fail;
> ++
> ++ =A0while (1)
> ++ =A0 =A0{
> ++ =A0 =A0 =A0actual_oldval =3D *ptr;
> ++
> ++ =A0 =A0 =A0if (oldval !=3D actual_oldval)
> ++ =A0 =A0 =A0return actual_oldval;
> ++
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, newval, ptr);
> ++
> ++ =A0 =A0 =A0if (!fail)
> ++ =A0 =A0 =A0 =A0return oldval;
> ++ =A0 =A0}
> ++}
> ++
> ++#define SUBWORD_VAL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *)((unsigned int) ptr & ~3), fail; =A0 =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int mask, shift, actual_oldval, actual_newval; =A0 =A0=
 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0while (1) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0 =A0 =A0actual_oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (((actual_oldval & mask) >> shift) !=3D (unsigned int) o=
ldval) \
> ++ =A0 =A0 =A0 =A0 =A0return (actual_oldval & mask) >> shift; =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0actual_newval =3D (actual_oldval & ~mask) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| (((unsigned int) newval <=
< shift) & mask); =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, actual_newval, =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wordptr); =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (!fail) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0return oldval; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_VAL_CAS (short, 2)
> ++SUBWORD_VAL_CAS (char, =A01)
> ++
> ++typedef unsigned char bool;
> ++
> ++bool HIDDEN
> ++__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int failure =3D __kernel_cmpxchg (oldval, newval, ptr);
> ++ =A0return (failure =3D=3D 0);
> ++}
> ++
> ++#define SUBWORD_BOOL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0bool HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0TYPE actual_oldval =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0=3D __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newva=
l); =A0 =A0\
> ++ =A0 =A0return (oldval =3D=3D actual_oldval); =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_BOOL_CAS (short, 2)
> ++SUBWORD_BOOL_CAS (char, =A01)
> ++
> ++void HIDDEN
> ++__sync_synchronize (void)
> ++{
> ++ =A0__kernel_dmb ();
> ++}
> ++
> ++int HIDDEN
> ++__sync_lock_test_and_set_4 (int *ptr, int val)
> ++{
> ++ =A0int failure, oldval;
> ++
> ++ =A0do {
> ++ =A0 =A0oldval =3D *ptr;
> ++ =A0 =A0failure =3D __kernel_cmpxchg (oldval, val, ptr);
> ++ =A0} while (failure !=3D 0);
> ++
> ++ =A0return oldval;
> ++}
> ++
> ++#define SUBWORD_TEST_AND_SET(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int oldval, newval, shift, mask; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D (oldval & ~mask) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 | (((unsigned int) val << shift) & mask); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (oldval & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_TEST_AND_SET (short, 2)
> ++SUBWORD_TEST_AND_SET (char, =A01)
> ++
> ++#define SYNC_LOCK_RELEASE(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0void HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_release_##WIDTH (TYPE *ptr) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0*ptr =3D 0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0__kernel_dmb (); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SYNC_LOCK_RELEASE (int, =A0 4)
> ++SYNC_LOCK_RELEASE (short, 2)
> ++SYNC_LOCK_RELEASE (char, =A01)
> +Index: gcc/config/arm/t-linux-eabi
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(revision 136167)
> ++++ gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(working copy)
> +@@ -12,3 +12,5 @@ LIB1ASMFUNCS :=3D $(filter-out _dvmd_tls,$
> + # Multilib the standard Linux files. =A0Don't include crti.o or crtn.o,
> + # which are provided by glibc.
> + EXTRA_MULTILIB_PARTS=3Dcrtbegin.o crtend.o crtbeginS.o crtendS.o crtbeg=
inT.o
> ++
> ++LIB2FUNCS_STATIC_EXTRA +=3D $(srcdir)/config/arm/linux-atomic.c
> +
> +
> diff --git a/recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-built=
ins-unbreak-v2.patch b/recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atom=
ic-builtins-unbreak-v2.patch
> new file mode 100644
> index 0000000..6849d46
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-builtins-unb=
reak-v2.patch
> @@ -0,0 +1,52 @@
> +--- gcc-4.4-20090519/gcc/config/arm/linux-eabi.h.~1~ =A0 2007-11-08 14:4=
4:09.000000000 +0100
> ++++ gcc-4.4-20090519/gcc/config/arm/linux-eabi.h =A0 =A0 =A0 2009-05-22 =
20:38:51.000000000 +0200
> +@@ -72,6 +72,49 @@
> + =A0 =A0do not use -lfloat. =A0*/
> + #undef LIBGCC_SPEC
> +
> ++/* Some symbols are only in the static libgcc. Override REAL_LIBGCC_SPE=
C
> ++ =A0 to always pass -lgcc to the linker, even for --shared-libgcc, othe=
rwise
> ++ =A0 shared libraries break. */
> ++#ifdef ENABLE_SHARED_LIBGCC
> ++
> ++#ifndef USE_LD_AS_NEEDED
> ++#define USE_LD_AS_NEEDED 0
> ++#endif
> ++
> ++#if USE_LD_AS_NEEDED
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared-libgcc:-lgcc --as-needed -lgcc_s --no-as-needed} =
\
> ++ =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 /* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}"
> ++#endif
> ++
> ++#ifdef LINK_EH_SPEC
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}" =A0 =A0 =A0/* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* =
always append -lgcc */
> ++#endif
> ++
> ++#define REAL_LIBGCC_SPEC " \
> ++ =A0 =A0 =A0%{static|static-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0%{!static:%{!static-libgcc: \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_1" \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_2" \
> ++ =A0 =A0 =A0}}"
> ++
> ++#else /* !ENABLE_SHARED_LIBGCC */
> ++
> ++#define REAL_LIBGCC_SPEC " -lgcc "
> ++
> ++#endif =A0 =A0 =A0 =A0/* !ENABLE_SHARED_LIBGCC */
> ++
> + /* Clear the instruction cache from `beg' to `end'. =A0This makes an
> + =A0 =A0inline system call to SYS_cacheflush. =A0*/
> + #undef =A0CLEAR_INSN_CACHE
> diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
> index 8947a8d..8fd607a 100644
> --- a/recipes/gcc/gcc-4.3.4.inc
> +++ b/recipes/gcc/gcc-4.3.4.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =A0DEPENDS =3D "mpfr gmp"
> =A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r8"
> +INC_PR =3D "r9"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Darch=
ive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=3D=
0 \
> @@ -26,6 +26,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://fedora/gcc43-i386-libgomp.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://fedora/gcc43-rh251682.patch;striplevel=3D0 \
> =A0 =A0 =A0 =A0file://debian/arm-unbreak-eabi-armv4t.dpatch;apply=3Dyes \
> + =A0 =A0 =A0 =A0file://debian/armel-atomic-builtins.dpatch;apply=3Dyes;s=
triplevel=3D0 \
> =A0 =A0 =A0 =A0file://debian/libstdc++-pic.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/gcc-ice-hack.dpatch;apply=3Dyes;striplevel=
=3D0 \
> =A0 =A0 =A0 =A0file://debian/pr30961.dpatch;apply=3Dyes;striplevel=3D0 \
> @@ -48,6 +49,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://904-flatten-switch-stmt-00.patch \
> =A0 =A0 =A0 =A0file://arm-nolibfloat.patch \
> =A0 =A0 =A0 =A0file://arm-softfloat.patch \
> + =A0 =A0 =A0 =A0file://gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak=
-v2.patch \
> =A0 =A0 =A0 =A0file://cache-amnesia.patch \
> =A0 =A0 =A0 =A0file://gfortran-4.3.x.patch \
> =A0 =A0 =A0 =A0file://gcc-4.0.2-e300c2c3.patch \
> diff --git a/recipes/gcc/gcc-4.3.4/debian/armel-atomic-builtins.dpatch b/=
recipes/gcc/gcc-4.3.4/debian/armel-atomic-builtins.dpatch
> new file mode 100644
> index 0000000..f514375
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.4/debian/armel-atomic-builtins.dpatch
> @@ -0,0 +1,350 @@
> +#! /bin/sh -e
> +
> +# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.
> +
> +dir=3D
> +if [ $# -eq 3 -a "$2" =3D '-d' ]; then
> + =A0 =A0pdir=3D"-d $3"
> + =A0 =A0dir=3D"$3/"
> +elif [ $# -ne 1 ]; then
> + =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch as argum=
ent"
> + =A0 =A0exit 1
> +fi
> +case "$1" in
> + =A0 =A0-patch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0-unpatch)
> + =A0 =A0 =A0 =A0patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0*)
> + =A0 =A0 =A0 =A0echo >&2 "`basename $0`: script expects -patch|-unpatch =
as argument"
> + =A0 =A0 =A0 =A0exit 1
> +esac
> +exit 0
> +
> +This patch implements the atomic builtins described at:
> +
> + =A0http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html
> +
> +for ARM EABI Linux. This implementation uses the kernel helpers
> +__kernel_cmpxchg and __kernel_dmb, and so should work on any
> +architecture which supports those. (More-efficient versions are possible
> +using ldrex/strex on architectures >=3Dv6, but those are not written yet=
.)
> +
> +Atomic operations are provided for data sizes of 1, 2 and 4 bytes (but
> +not 8 bytes). The implementation uses actual functions
> +(__sync_fetch_and_add_2, etc.) rather than expanding code inline.
> +
> +Tested with cross to arm-none-linux-gnueabi, and with some additional
> +hand-written tests which hopefully exercised the atomicity of the
> +operations sufficiently.
> +
> +OK for mainline?
> +
> +Julian
> +
> +ChangeLog
> +
> + =A0 =A0gcc/
> + =A0 =A0* config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
> + =A0 =A0config/arm/linux-atomic.c.
> + =A0 =A0* config/arm/linux-atomic.c: New.
> +
> +Index: gcc/config/arm/linux-atomic.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> ++++ gcc/config/arm/linux-atomic.c =A0 =A0 =A0(revision 0)
> +@@ -0,0 +1,280 @@
> ++/* Linux-specific atomic operations for ARM EABI.
> ++ =A0 Copyright (C) 2008 Free Software Foundation, Inc.
> ++ =A0 Contributed by CodeSourcery.
> ++
> ++This file is part of GCC.
> ++
> ++GCC is free software; you can redistribute it and/or modify it under
> ++the terms of the GNU General Public License as published by the Free
> ++Software Foundation; either version 2, or (at your option) any later
> ++version.
> ++
> ++In addition to the permissions in the GNU General Public License, the
> ++Free Software Foundation gives you unlimited permission to link the
> ++compiled version of this file into combinations with other programs,
> ++and to distribute those combinations without any restriction coming
> ++from the use of this file. =A0(The General Public License restrictions
> ++do apply in other respects; for example, they cover modification of
> ++the file, and distribution when not linked into a combine
> ++executable.)
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING. =A0If not, write to the Free
> ++Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
> ++02110-1301, USA. =A0*/
> ++
> ++/* Kernel helper for compare-and-exchange. =A0*/
> ++typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
> ++#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
> ++
> ++/* Kernel helper for memory barrier. =A0*/
> ++typedef void (__kernel_dmb_t) (void);
> ++#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
> ++
> ++/* Note: we implement byte, short and int versions of atomic operations=
 using
> ++ =A0 the above kernel helpers, but there is no support for "long long" =
(64-bit)
> ++ =A0 operations as yet. =A0*/
> ++
> ++#define HIDDEN __attribute__ ((visibility ("hidden")))
> ++
> ++#ifdef __ARMEL__
> ++#define INVERT_MASK_1 0
> ++#define INVERT_MASK_2 0
> ++#else
> ++#define INVERT_MASK_1 24
> ++#define INVERT_MASK_2 16
> ++#endif
> ++
> ++#define MASK_1 0xffu
> ++#define MASK_2 0xffffu
> ++
> ++#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_fetch_and_##OP##_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure, tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return tmp; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++FETCH_AND_OP_WORD (add, =A0 , +)
> ++FETCH_AND_OP_WORD (sub, =A0 , -)
> ++FETCH_AND_OP_WORD (or, =A0 =A0, |)
> ++FETCH_AND_OP_WORD (and, =A0 , &)
> ++FETCH_AND_OP_WORD (xor, =A0 , ^)
> ++FETCH_AND_OP_WORD (nand, ~, &)
> ++
> ++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
> ++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
> ++
> ++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
> ++ =A0 subword-sized quantities. =A0*/
> ++
> ++#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN) =A0 =
=A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0unsigned int mask, shift, oldval, newval; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D ((PFX_OP ((oldval & mask) >> shift) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 INF_OP (unsigned int) val) << shift) &=
 mask; =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0newval |=3D oldval & ~mask; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (RETURN & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, oldval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, oldval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, oldval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, oldval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
> ++
> ++#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0int HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0__sync_##OP##_and_fetch_4 (int *ptr, int val) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int tmp, failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0tmp =3D *ptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, p=
tr); =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return PFX_OP tmp INF_OP val; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++OP_AND_FETCH_WORD (add, =A0 , +)
> ++OP_AND_FETCH_WORD (sub, =A0 , -)
> ++OP_AND_FETCH_WORD (or, =A0 =A0, |)
> ++OP_AND_FETCH_WORD (and, =A0 , &)
> ++OP_AND_FETCH_WORD (xor, =A0 , ^)
> ++OP_AND_FETCH_WORD (nand, ~, &)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, short, 2, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, short, 2, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, short, 2, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, short, 2, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, short, 2, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
> ++
> ++SUBWORD_SYNC_OP (add, =A0 , +, char, 1, newval)
> ++SUBWORD_SYNC_OP (sub, =A0 , -, char, 1, newval)
> ++SUBWORD_SYNC_OP (or, =A0 =A0, |, char, 1, newval)
> ++SUBWORD_SYNC_OP (and, =A0 , &, char, 1, newval)
> ++SUBWORD_SYNC_OP (xor, =A0 , ^, char, 1, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
> ++
> ++int HIDDEN
> ++__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int actual_oldval, fail;
> ++
> ++ =A0while (1)
> ++ =A0 =A0{
> ++ =A0 =A0 =A0actual_oldval =3D *ptr;
> ++
> ++ =A0 =A0 =A0if (oldval !=3D actual_oldval)
> ++ =A0 =A0 =A0return actual_oldval;
> ++
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, newval, ptr);
> ++
> ++ =A0 =A0 =A0if (!fail)
> ++ =A0 =A0 =A0 =A0return oldval;
> ++ =A0 =A0}
> ++}
> ++
> ++#define SUBWORD_VAL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *)((unsigned int) ptr & ~3), fail; =A0 =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int mask, shift, actual_oldval, actual_newval; =A0 =A0=
 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0while (1) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0 =A0 =A0actual_oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (((actual_oldval & mask) >> shift) !=3D (unsigned int) o=
ldval) \
> ++ =A0 =A0 =A0 =A0 =A0return (actual_oldval & mask) >> shift; =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0actual_newval =3D (actual_oldval & ~mask) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| (((unsigned int) newval <=
< shift) & mask); =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0fail =3D __kernel_cmpxchg (actual_oldval, actual_newval, =
=A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wordptr); =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0if (!fail) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0 =A0 =A0return oldval; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_VAL_CAS (short, 2)
> ++SUBWORD_VAL_CAS (char, =A01)
> ++
> ++typedef unsigned char bool;
> ++
> ++bool HIDDEN
> ++__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++ =A0int failure =3D __kernel_cmpxchg (oldval, newval, ptr);
> ++ =A0return (failure =3D=3D 0);
> ++}
> ++
> ++#define SUBWORD_BOOL_CAS(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0bool HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0TYPE newval) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0TYPE actual_oldval =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0=3D __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newva=
l); =A0 =A0\
> ++ =A0 =A0return (oldval =3D=3D actual_oldval); =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0}
> ++
> ++SUBWORD_BOOL_CAS (short, 2)
> ++SUBWORD_BOOL_CAS (char, =A01)
> ++
> ++void HIDDEN
> ++__sync_synchronize (void)
> ++{
> ++ =A0__kernel_dmb ();
> ++}
> ++
> ++int HIDDEN
> ++__sync_lock_test_and_set_4 (int *ptr, int val)
> ++{
> ++ =A0int failure, oldval;
> ++
> ++ =A0do {
> ++ =A0 =A0oldval =3D *ptr;
> ++ =A0 =A0failure =3D __kernel_cmpxchg (oldval, val, ptr);
> ++ =A0} while (failure !=3D 0);
> ++
> ++ =A0return oldval;
> ++}
> ++
> ++#define SUBWORD_TEST_AND_SET(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0TYPE HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0\
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int failure; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0unsigned int oldval, newval, shift, mask; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0int *wordptr =3D (int *) ((unsigned int) ptr & ~3); =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH=
; =A0 =A0\
> ++ =A0 =A0mask =3D MASK_##WIDTH << shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0oldval =3D *wordptr; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0newval =3D (oldval & ~mask) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 | (((unsigned int) val << shift) & mask); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0 =A0failure =3D __kernel_cmpxchg (oldval, newval, wordptr); =A0=
 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0} while (failure !=3D 0); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0 =A0return (oldval & mask) >> shift; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SUBWORD_TEST_AND_SET (short, 2)
> ++SUBWORD_TEST_AND_SET (char, =A01)
> ++
> ++#define SYNC_LOCK_RELEASE(TYPE, WIDTH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0void HIDDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0__sync_lock_release_##WIDTH (TYPE *ptr) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0*ptr =3D 0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> ++ =A0 =A0__kernel_dmb (); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> ++ =A0}
> ++
> ++SYNC_LOCK_RELEASE (int, =A0 4)
> ++SYNC_LOCK_RELEASE (short, 2)
> ++SYNC_LOCK_RELEASE (char, =A01)
> +Index: gcc/config/arm/t-linux-eabi
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(revision 136167)
> ++++ gcc/config/arm/t-linux-eabi =A0 =A0 =A0 =A0(working copy)
> +@@ -12,3 +12,5 @@ LIB1ASMFUNCS :=3D $(filter-out _dvmd_tls,$
> + # Multilib the standard Linux files. =A0Don't include crti.o or crtn.o,
> + # which are provided by glibc.
> + EXTRA_MULTILIB_PARTS=3Dcrtbegin.o crtend.o crtbeginS.o crtendS.o crtbeg=
inT.o
> ++
> ++LIB2FUNCS_STATIC_EXTRA +=3D $(srcdir)/config/arm/linux-atomic.c
> +
> +
> diff --git a/recipes/gcc/gcc-4.3.4/gcc-4.4-20090519-arm-eabi-atomic-built=
ins-unbreak-v2.patch b/recipes/gcc/gcc-4.3.4/gcc-4.4-20090519-arm-eabi-atom=
ic-builtins-unbreak-v2.patch
> new file mode 100644
> index 0000000..6849d46
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.4/gcc-4.4-20090519-arm-eabi-atomic-builtins-unb=
reak-v2.patch
> @@ -0,0 +1,52 @@
> +--- gcc-4.4-20090519/gcc/config/arm/linux-eabi.h.~1~ =A0 2007-11-08 14:4=
4:09.000000000 +0100
> ++++ gcc-4.4-20090519/gcc/config/arm/linux-eabi.h =A0 =A0 =A0 2009-05-22 =
20:38:51.000000000 +0200
> +@@ -72,6 +72,49 @@
> + =A0 =A0do not use -lfloat. =A0*/
> + #undef LIBGCC_SPEC
> +
> ++/* Some symbols are only in the static libgcc. Override REAL_LIBGCC_SPE=
C
> ++ =A0 to always pass -lgcc to the linker, even for --shared-libgcc, othe=
rwise
> ++ =A0 shared libraries break. */
> ++#ifdef ENABLE_SHARED_LIBGCC
> ++
> ++#ifndef USE_LD_AS_NEEDED
> ++#define USE_LD_AS_NEEDED 0
> ++#endif
> ++
> ++#if USE_LD_AS_NEEDED
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared-libgcc:-lgcc --as-needed -lgcc_s --no-as-needed} =
\
> ++ =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 /* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++ =A0 =A0 =A0%{!shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}"
> ++#endif
> ++
> ++#ifdef LINK_EH_SPEC
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared: \
> ++ =A0 =A0 =A0 =A0%{!shared-libgcc:-lgcc} \
> ++ =A0 =A0 =A0 =A0%{shared-libgcc:-lgcc_s -lgcc}}" =A0 =A0 =A0/* always a=
ppend -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++ =A0 =A0 =A0%{shared:-lgcc_s -lgcc}" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* =
always append -lgcc */
> ++#endif
> ++
> ++#define REAL_LIBGCC_SPEC " \
> ++ =A0 =A0 =A0%{static|static-libgcc:-lgcc -lgcc_eh} \
> ++ =A0 =A0 =A0%{!static:%{!static-libgcc: \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_1" \
> ++ =A0 =A0 =A0"REAL_LIBGCC_SPEC_2" \
> ++ =A0 =A0 =A0}}"
> ++
> ++#else /* !ENABLE_SHARED_LIBGCC */
> ++
> ++#define REAL_LIBGCC_SPEC " -lgcc "
> ++
> ++#endif =A0 =A0 =A0 =A0/* !ENABLE_SHARED_LIBGCC */
> ++
> + /* Clear the instruction cache from `beg' to `end'. =A0This makes an
> + =A0 =A0inline system call to SYS_cacheflush. =A0*/
> + #undef =A0CLEAR_INSN_CACHE
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


