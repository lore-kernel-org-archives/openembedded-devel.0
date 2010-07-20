Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ob7qs-000592-Qa for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 10:07:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ob7qY-0005iy-Cq for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 10:06:38 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 10:06:38 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 10:06:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 20 Jul 2010 10:06:26 +0200
Message-ID: <i23le3$eqp$1@dough.gmane.org>
References: <1279551515-19474-1-git-send-email-heinold@inf.fu-berlin.de>
	<1279551515-19474-2-git-send-email-heinold@inf.fu-berlin.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1279551515-19474-2-git-send-email-heinold@inf.fu-berlin.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: backport 4.3.x atomic-patches series from openembedded-dev
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
X-List-Received-Date: Tue, 20 Jul 2010 08:08:07 -0000
X-List-Received-Date: Tue, 20 Jul 2010 08:08:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-07-10 16:58, heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <h.heinold@tarent.de>

I haven't tried this on stable, but it works good enough on .dev:

Acked-by: Koen Kooi <koen@openembedded.org>


> 
> ---
>  recipes/gcc/gcc-4.3.1.inc                          |    4 +-
>  .../gcc-4.3.1/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
>  ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
>  recipes/gcc/gcc-4.3.2.inc                          |    4 +-
>  .../gcc-4.3.2/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
>  ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
>  recipes/gcc/gcc-4.3.3.inc                          |    2 +
>  .../gcc-4.3.3/debian/armel-atomic-builtins.dpatch  |  350 ++++++++++++++++++++
>  ...90519-arm-eabi-atomic-builtins-unbreak-v2.patch |   52 +++
>  recipes/gcc/gcc-cross-sdk_4.3.1.bb                 |    2 +-
>  recipes/gcc/gcc-cross-sdk_4.3.2.bb                 |    2 +-
>  recipes/gcc/gcc-cross-sdk_4.3.3.bb                 |    2 +-
>  recipes/gcc/gcc-cross_4.3.1.bb                     |    2 +-
>  recipes/gcc/gcc-cross_4.3.2.bb                     |    2 +-
>  recipes/gcc/gcc-cross_4.3.3.bb                     |    2 +-
>  recipes/gcc/gcc_4.3.1.bb                           |    2 +-
>  recipes/gcc/gcc_4.3.2.bb                           |    2 +-
>  recipes/gcc/gcc_4.3.3.bb                           |    2 +-
>  18 files changed, 1223 insertions(+), 11 deletions(-)
>  create mode 100644 recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch
>  create mode 100644 recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
>  create mode 100644 recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch
>  create mode 100644 recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
>  create mode 100644 recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch
>  create mode 100644 recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> 
> diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
> index 132bbe7..0c74889 100644
> --- a/recipes/gcc/gcc-4.3.1.inc
> +++ b/recipes/gcc/gcc-4.3.1.inc
> @@ -21,7 +21,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://fedora/gcc43-libgomp-speedup.patch;patch=1;pnum=0 \
>  	file://fedora/gcc43-i386-libgomp.patch;patch=1;pnum=0 \
>  	file://fedora/gcc43-rh251682.patch;patch=1;pnum=0 \
> -    file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
> +        file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
> +        file://debian/armel-atomic-builtins.dpatch;patch=1;pnum=0 \
>  	file://debian/libstdc++-pic.dpatch;patch=1;pnum=0 \
>  	file://debian/gcc-ice-hack.dpatch;patch=1;pnum=0 \ 
>  	file://debian/pr30961.dpatch;patch=1;pnum=0 \
> @@ -60,6 +61,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch;patch=1 \
>  	file://zecke-xgcc-cpp.patch;patch=1 \
>  	file://gcc-flags-for-build.patch;patch=1 \
> +        file://gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch;patch=1 \
>  "
>  
>  SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
> diff --git a/recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch b/recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch
> new file mode 100644
> index 0000000..f514375
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.1/debian/armel-atomic-builtins.dpatch
> @@ -0,0 +1,350 @@
> +#! /bin/sh -e
> +
> +# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.
> +
> +dir=
> +if [ $# -eq 3 -a "$2" = '-d' ]; then
> +    pdir="-d $3"
> +    dir="$3/"
> +elif [ $# -ne 1 ]; then
> +    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
> +    exit 1
> +fi
> +case "$1" in
> +    -patch)
> +        patch $pdir -f --no-backup-if-mismatch -p0 < $0
> +        ;;
> +    -unpatch)
> +        patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
> +        ;;
> +    *)
> +        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
> +        exit 1
> +esac
> +exit 0
> +
> +This patch implements the atomic builtins described at:
> +
> +  http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html
> +
> +for ARM EABI Linux. This implementation uses the kernel helpers
> +__kernel_cmpxchg and __kernel_dmb, and so should work on any
> +architecture which supports those. (More-efficient versions are possible
> +using ldrex/strex on architectures >=v6, but those are not written yet.)
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
> +    gcc/
> +    * config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
> +    config/arm/linux-atomic.c.
> +    * config/arm/linux-atomic.c: New.
> +
> +Index: gcc/config/arm/linux-atomic.c
> +===================================================================
> +--- gcc/config/arm/linux-atomic.c	(revision 0)
> ++++ gcc/config/arm/linux-atomic.c	(revision 0)
> +@@ -0,0 +1,280 @@
> ++/* Linux-specific atomic operations for ARM EABI.
> ++   Copyright (C) 2008 Free Software Foundation, Inc.
> ++   Contributed by CodeSourcery.
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
> ++from the use of this file.  (The General Public License restrictions
> ++do apply in other respects; for example, they cover modification of
> ++the file, and distribution when not linked into a combine
> ++executable.)
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING.  If not, write to the Free
> ++Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
> ++02110-1301, USA.  */
> ++
> ++/* Kernel helper for compare-and-exchange.  */
> ++typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
> ++#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
> ++
> ++/* Kernel helper for memory barrier.  */
> ++typedef void (__kernel_dmb_t) (void);
> ++#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
> ++
> ++/* Note: we implement byte, short and int versions of atomic operations using
> ++   the above kernel helpers, but there is no support for "long long" (64-bit)
> ++   operations as yet.  */
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
> ++#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP)				\
> ++  int HIDDEN								\
> ++  __sync_fetch_and_##OP##_4 (int *ptr, int val)				\
> ++  {									\
> ++    int failure, tmp;							\
> ++									\
> ++    do {								\
> ++      tmp = *ptr;							\
> ++      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
> ++    } while (failure != 0);						\
> ++									\
> ++    return tmp;								\
> ++  }
> ++
> ++FETCH_AND_OP_WORD (add,   , +)
> ++FETCH_AND_OP_WORD (sub,   , -)
> ++FETCH_AND_OP_WORD (or,    , |)
> ++FETCH_AND_OP_WORD (and,   , &)
> ++FETCH_AND_OP_WORD (xor,   , ^)
> ++FETCH_AND_OP_WORD (nand, ~, &)
> ++
> ++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
> ++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
> ++
> ++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
> ++   subword-sized quantities.  */
> ++
> ++#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN)	\
> ++  TYPE HIDDEN								\
> ++  NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val)			\
> ++  {									\
> ++    int *wordptr = (int *) ((unsigned int) ptr & ~3);			\
> ++    unsigned int mask, shift, oldval, newval;				\
> ++    int failure;							\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    do {								\
> ++      oldval = *wordptr;						\
> ++      newval = ((PFX_OP ((oldval & mask) >> shift)			\
> ++                 INF_OP (unsigned int) val) << shift) & mask;		\
> ++      newval |= oldval & ~mask;						\
> ++      failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
> ++    } while (failure != 0);						\
> ++									\
> ++    return (RETURN & mask) >> shift;					\
> ++  }
> ++
> ++SUBWORD_SYNC_OP (add,   , +, short, 2, oldval)
> ++SUBWORD_SYNC_OP (sub,   , -, short, 2, oldval)
> ++SUBWORD_SYNC_OP (or,    , |, short, 2, oldval)
> ++SUBWORD_SYNC_OP (and,   , &, short, 2, oldval)
> ++SUBWORD_SYNC_OP (xor,   , ^, short, 2, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, char, 1, oldval)
> ++SUBWORD_SYNC_OP (sub,   , -, char, 1, oldval)
> ++SUBWORD_SYNC_OP (or,    , |, char, 1, oldval)
> ++SUBWORD_SYNC_OP (and,   , &, char, 1, oldval)
> ++SUBWORD_SYNC_OP (xor,   , ^, char, 1, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
> ++
> ++#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP)				\
> ++  int HIDDEN								\
> ++  __sync_##OP##_and_fetch_4 (int *ptr, int val)				\
> ++  {									\
> ++    int tmp, failure;							\
> ++									\
> ++    do {								\
> ++      tmp = *ptr;							\
> ++      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
> ++    } while (failure != 0);						\
> ++									\
> ++    return PFX_OP tmp INF_OP val;					\
> ++  }
> ++
> ++OP_AND_FETCH_WORD (add,   , +)
> ++OP_AND_FETCH_WORD (sub,   , -)
> ++OP_AND_FETCH_WORD (or,    , |)
> ++OP_AND_FETCH_WORD (and,   , &)
> ++OP_AND_FETCH_WORD (xor,   , ^)
> ++OP_AND_FETCH_WORD (nand, ~, &)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, short, 2, newval)
> ++SUBWORD_SYNC_OP (sub,   , -, short, 2, newval)
> ++SUBWORD_SYNC_OP (or,    , |, short, 2, newval)
> ++SUBWORD_SYNC_OP (and,   , &, short, 2, newval)
> ++SUBWORD_SYNC_OP (xor,   , ^, short, 2, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, char, 1, newval)
> ++SUBWORD_SYNC_OP (sub,   , -, char, 1, newval)
> ++SUBWORD_SYNC_OP (or,    , |, char, 1, newval)
> ++SUBWORD_SYNC_OP (and,   , &, char, 1, newval)
> ++SUBWORD_SYNC_OP (xor,   , ^, char, 1, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
> ++
> ++int HIDDEN
> ++__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++  int actual_oldval, fail;
> ++    
> ++  while (1)
> ++    {
> ++      actual_oldval = *ptr;
> ++
> ++      if (oldval != actual_oldval)
> ++	return actual_oldval;
> ++
> ++      fail = __kernel_cmpxchg (actual_oldval, newval, ptr);
> ++  
> ++      if (!fail)
> ++        return oldval;
> ++    }
> ++}
> ++
> ++#define SUBWORD_VAL_CAS(TYPE, WIDTH)					\
> ++  TYPE HIDDEN								\
> ++  __sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
> ++				       TYPE newval)			\
> ++  {									\
> ++    int *wordptr = (int *)((unsigned int) ptr & ~3), fail;		\
> ++    unsigned int mask, shift, actual_oldval, actual_newval;		\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    while (1)								\
> ++      {									\
> ++	actual_oldval = *wordptr;					\
> ++									\
> ++	if (((actual_oldval & mask) >> shift) != (unsigned int) oldval)	\
> ++          return (actual_oldval & mask) >> shift;			\
> ++									\
> ++	actual_newval = (actual_oldval & ~mask)				\
> ++			| (((unsigned int) newval << shift) & mask);	\
> ++									\
> ++	fail = __kernel_cmpxchg (actual_oldval, actual_newval,		\
> ++				 wordptr);				\
> ++									\
> ++	if (!fail)							\
> ++          return oldval;						\
> ++      }									\
> ++  }
> ++
> ++SUBWORD_VAL_CAS (short, 2)
> ++SUBWORD_VAL_CAS (char,  1)
> ++
> ++typedef unsigned char bool;
> ++
> ++bool HIDDEN
> ++__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++  int failure = __kernel_cmpxchg (oldval, newval, ptr);
> ++  return (failure == 0);
> ++}
> ++
> ++#define SUBWORD_BOOL_CAS(TYPE, WIDTH)					\
> ++  bool HIDDEN								\
> ++  __sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
> ++					TYPE newval)			\
> ++  {									\
> ++    TYPE actual_oldval							\
> ++      = __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newval);	\
> ++    return (oldval == actual_oldval);					\
> ++  }
> ++
> ++SUBWORD_BOOL_CAS (short, 2)
> ++SUBWORD_BOOL_CAS (char,  1)
> ++
> ++void HIDDEN
> ++__sync_synchronize (void)
> ++{
> ++  __kernel_dmb ();
> ++}
> ++
> ++int HIDDEN
> ++__sync_lock_test_and_set_4 (int *ptr, int val)
> ++{
> ++  int failure, oldval;
> ++
> ++  do {
> ++    oldval = *ptr;
> ++    failure = __kernel_cmpxchg (oldval, val, ptr);
> ++  } while (failure != 0);
> ++
> ++  return oldval;
> ++}
> ++
> ++#define SUBWORD_TEST_AND_SET(TYPE, WIDTH)				\
> ++  TYPE HIDDEN								\
> ++  __sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val)		\
> ++  {									\
> ++    int failure;							\
> ++    unsigned int oldval, newval, shift, mask;				\
> ++    int *wordptr = (int *) ((unsigned int) ptr & ~3);			\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    do {								\
> ++      oldval = *wordptr;						\
> ++      newval = (oldval & ~mask)						\
> ++	       | (((unsigned int) val << shift) & mask);		\
> ++      failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
> ++    } while (failure != 0);						\
> ++									\
> ++    return (oldval & mask) >> shift;					\
> ++  }
> ++
> ++SUBWORD_TEST_AND_SET (short, 2)
> ++SUBWORD_TEST_AND_SET (char,  1)
> ++
> ++#define SYNC_LOCK_RELEASE(TYPE, WIDTH)					\
> ++  void HIDDEN								\
> ++  __sync_lock_release_##WIDTH (TYPE *ptr)				\
> ++  {									\
> ++    *ptr = 0;								\
> ++    __kernel_dmb ();							\
> ++  }
> ++
> ++SYNC_LOCK_RELEASE (int,   4)
> ++SYNC_LOCK_RELEASE (short, 2)
> ++SYNC_LOCK_RELEASE (char,  1)
> +Index: gcc/config/arm/t-linux-eabi
> +===================================================================
> +--- gcc/config/arm/t-linux-eabi	(revision 136167)
> ++++ gcc/config/arm/t-linux-eabi	(working copy)
> +@@ -12,3 +12,5 @@ LIB1ASMFUNCS := $(filter-out _dvmd_tls,$
> + # Multilib the standard Linux files.  Don't include crti.o or crtn.o,
> + # which are provided by glibc.
> + EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
> ++
> ++LIB2FUNCS_STATIC_EXTRA += $(srcdir)/config/arm/linux-atomic.c
> +
> +
> diff --git a/recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch b/recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> new file mode 100644
> index 0000000..6849d46
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.1/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> @@ -0,0 +1,52 @@
> +--- gcc-4.4-20090519/gcc/config/arm/linux-eabi.h.~1~	2007-11-08 14:44:09.000000000 +0100
> ++++ gcc-4.4-20090519/gcc/config/arm/linux-eabi.h	2009-05-22 20:38:51.000000000 +0200
> +@@ -72,6 +72,49 @@
> +    do not use -lfloat.  */
> + #undef LIBGCC_SPEC
> + 
> ++/* Some symbols are only in the static libgcc. Override REAL_LIBGCC_SPEC
> ++   to always pass -lgcc to the linker, even for --shared-libgcc, otherwise
> ++   shared libraries break. */
> ++#ifdef ENABLE_SHARED_LIBGCC
> ++
> ++#ifndef USE_LD_AS_NEEDED
> ++#define USE_LD_AS_NEEDED 0
> ++#endif
> ++
> ++#if USE_LD_AS_NEEDED
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++	%{!shared-libgcc:-lgcc --as-needed -lgcc_s --no-as-needed} \
> ++	%{shared-libgcc:-lgcc_s -lgcc}"		/* always append -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++	%{!shared: \
> ++	  %{!shared-libgcc:-lgcc -lgcc_eh} \
> ++	  %{shared-libgcc:-lgcc_s -lgcc}}"
> ++#endif
> ++
> ++#ifdef LINK_EH_SPEC
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++	%{shared: \
> ++	  %{!shared-libgcc:-lgcc} \
> ++	  %{shared-libgcc:-lgcc_s -lgcc}}"	/* always append -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++	%{shared:-lgcc_s -lgcc}"		/* always append -lgcc */
> ++#endif
> ++
> ++#define REAL_LIBGCC_SPEC " \
> ++	%{static|static-libgcc:-lgcc -lgcc_eh} \
> ++	%{!static:%{!static-libgcc: \
> ++	"REAL_LIBGCC_SPEC_1" \
> ++	"REAL_LIBGCC_SPEC_2" \
> ++	}}"
> ++
> ++#else	/* !ENABLE_SHARED_LIBGCC */
> ++
> ++#define REAL_LIBGCC_SPEC " -lgcc "
> ++
> ++#endif	/* !ENABLE_SHARED_LIBGCC */
> ++
> + /* Clear the instruction cache from `beg' to `end'.  This makes an
> +    inline system call to SYS_cacheflush.  */
> + #undef  CLEAR_INSN_CACHE
> diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
> index e053ba2..cae16e5 100644
> --- a/recipes/gcc/gcc-4.3.2.inc
> +++ b/recipes/gcc/gcc-4.3.2.inc
> @@ -21,7 +21,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://fedora/gcc43-libgomp-speedup.patch;patch=1;pnum=0 \
>  	file://fedora/gcc43-i386-libgomp.patch;patch=1;pnum=0 \
>  	file://fedora/gcc43-rh251682.patch;patch=1;pnum=0 \
> -    file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
> +	file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
> +        file://debian/armel-atomic-builtins.dpatch;patch=1;pnum=0 \
>  	file://debian/libstdc++-pic.dpatch;patch=1;pnum=0 \
>  	file://debian/gcc-ice-hack.dpatch;patch=1;pnum=0 \ 
>  	file://debian/pr30961.dpatch;patch=1;pnum=0 \
> @@ -56,6 +57,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch;patch=1 \
>  	file://zecke-xgcc-cpp.patch;patch=1 \
>  	file://gcc-flags-for-build.patch;patch=1 \
> +        file://gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch;patch=1 \
>  "
>  
>  SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
> diff --git a/recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch b/recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch
> new file mode 100644
> index 0000000..f514375
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.2/debian/armel-atomic-builtins.dpatch
> @@ -0,0 +1,350 @@
> +#! /bin/sh -e
> +
> +# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.
> +
> +dir=
> +if [ $# -eq 3 -a "$2" = '-d' ]; then
> +    pdir="-d $3"
> +    dir="$3/"
> +elif [ $# -ne 1 ]; then
> +    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
> +    exit 1
> +fi
> +case "$1" in
> +    -patch)
> +        patch $pdir -f --no-backup-if-mismatch -p0 < $0
> +        ;;
> +    -unpatch)
> +        patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
> +        ;;
> +    *)
> +        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
> +        exit 1
> +esac
> +exit 0
> +
> +This patch implements the atomic builtins described at:
> +
> +  http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html
> +
> +for ARM EABI Linux. This implementation uses the kernel helpers
> +__kernel_cmpxchg and __kernel_dmb, and so should work on any
> +architecture which supports those. (More-efficient versions are possible
> +using ldrex/strex on architectures >=v6, but those are not written yet.)
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
> +    gcc/
> +    * config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
> +    config/arm/linux-atomic.c.
> +    * config/arm/linux-atomic.c: New.
> +
> +Index: gcc/config/arm/linux-atomic.c
> +===================================================================
> +--- gcc/config/arm/linux-atomic.c	(revision 0)
> ++++ gcc/config/arm/linux-atomic.c	(revision 0)
> +@@ -0,0 +1,280 @@
> ++/* Linux-specific atomic operations for ARM EABI.
> ++   Copyright (C) 2008 Free Software Foundation, Inc.
> ++   Contributed by CodeSourcery.
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
> ++from the use of this file.  (The General Public License restrictions
> ++do apply in other respects; for example, they cover modification of
> ++the file, and distribution when not linked into a combine
> ++executable.)
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING.  If not, write to the Free
> ++Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
> ++02110-1301, USA.  */
> ++
> ++/* Kernel helper for compare-and-exchange.  */
> ++typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
> ++#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
> ++
> ++/* Kernel helper for memory barrier.  */
> ++typedef void (__kernel_dmb_t) (void);
> ++#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
> ++
> ++/* Note: we implement byte, short and int versions of atomic operations using
> ++   the above kernel helpers, but there is no support for "long long" (64-bit)
> ++   operations as yet.  */
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
> ++#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP)				\
> ++  int HIDDEN								\
> ++  __sync_fetch_and_##OP##_4 (int *ptr, int val)				\
> ++  {									\
> ++    int failure, tmp;							\
> ++									\
> ++    do {								\
> ++      tmp = *ptr;							\
> ++      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
> ++    } while (failure != 0);						\
> ++									\
> ++    return tmp;								\
> ++  }
> ++
> ++FETCH_AND_OP_WORD (add,   , +)
> ++FETCH_AND_OP_WORD (sub,   , -)
> ++FETCH_AND_OP_WORD (or,    , |)
> ++FETCH_AND_OP_WORD (and,   , &)
> ++FETCH_AND_OP_WORD (xor,   , ^)
> ++FETCH_AND_OP_WORD (nand, ~, &)
> ++
> ++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
> ++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
> ++
> ++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
> ++   subword-sized quantities.  */
> ++
> ++#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN)	\
> ++  TYPE HIDDEN								\
> ++  NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val)			\
> ++  {									\
> ++    int *wordptr = (int *) ((unsigned int) ptr & ~3);			\
> ++    unsigned int mask, shift, oldval, newval;				\
> ++    int failure;							\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    do {								\
> ++      oldval = *wordptr;						\
> ++      newval = ((PFX_OP ((oldval & mask) >> shift)			\
> ++                 INF_OP (unsigned int) val) << shift) & mask;		\
> ++      newval |= oldval & ~mask;						\
> ++      failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
> ++    } while (failure != 0);						\
> ++									\
> ++    return (RETURN & mask) >> shift;					\
> ++  }
> ++
> ++SUBWORD_SYNC_OP (add,   , +, short, 2, oldval)
> ++SUBWORD_SYNC_OP (sub,   , -, short, 2, oldval)
> ++SUBWORD_SYNC_OP (or,    , |, short, 2, oldval)
> ++SUBWORD_SYNC_OP (and,   , &, short, 2, oldval)
> ++SUBWORD_SYNC_OP (xor,   , ^, short, 2, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, char, 1, oldval)
> ++SUBWORD_SYNC_OP (sub,   , -, char, 1, oldval)
> ++SUBWORD_SYNC_OP (or,    , |, char, 1, oldval)
> ++SUBWORD_SYNC_OP (and,   , &, char, 1, oldval)
> ++SUBWORD_SYNC_OP (xor,   , ^, char, 1, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
> ++
> ++#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP)				\
> ++  int HIDDEN								\
> ++  __sync_##OP##_and_fetch_4 (int *ptr, int val)				\
> ++  {									\
> ++    int tmp, failure;							\
> ++									\
> ++    do {								\
> ++      tmp = *ptr;							\
> ++      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
> ++    } while (failure != 0);						\
> ++									\
> ++    return PFX_OP tmp INF_OP val;					\
> ++  }
> ++
> ++OP_AND_FETCH_WORD (add,   , +)
> ++OP_AND_FETCH_WORD (sub,   , -)
> ++OP_AND_FETCH_WORD (or,    , |)
> ++OP_AND_FETCH_WORD (and,   , &)
> ++OP_AND_FETCH_WORD (xor,   , ^)
> ++OP_AND_FETCH_WORD (nand, ~, &)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, short, 2, newval)
> ++SUBWORD_SYNC_OP (sub,   , -, short, 2, newval)
> ++SUBWORD_SYNC_OP (or,    , |, short, 2, newval)
> ++SUBWORD_SYNC_OP (and,   , &, short, 2, newval)
> ++SUBWORD_SYNC_OP (xor,   , ^, short, 2, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, char, 1, newval)
> ++SUBWORD_SYNC_OP (sub,   , -, char, 1, newval)
> ++SUBWORD_SYNC_OP (or,    , |, char, 1, newval)
> ++SUBWORD_SYNC_OP (and,   , &, char, 1, newval)
> ++SUBWORD_SYNC_OP (xor,   , ^, char, 1, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
> ++
> ++int HIDDEN
> ++__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++  int actual_oldval, fail;
> ++    
> ++  while (1)
> ++    {
> ++      actual_oldval = *ptr;
> ++
> ++      if (oldval != actual_oldval)
> ++	return actual_oldval;
> ++
> ++      fail = __kernel_cmpxchg (actual_oldval, newval, ptr);
> ++  
> ++      if (!fail)
> ++        return oldval;
> ++    }
> ++}
> ++
> ++#define SUBWORD_VAL_CAS(TYPE, WIDTH)					\
> ++  TYPE HIDDEN								\
> ++  __sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
> ++				       TYPE newval)			\
> ++  {									\
> ++    int *wordptr = (int *)((unsigned int) ptr & ~3), fail;		\
> ++    unsigned int mask, shift, actual_oldval, actual_newval;		\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    while (1)								\
> ++      {									\
> ++	actual_oldval = *wordptr;					\
> ++									\
> ++	if (((actual_oldval & mask) >> shift) != (unsigned int) oldval)	\
> ++          return (actual_oldval & mask) >> shift;			\
> ++									\
> ++	actual_newval = (actual_oldval & ~mask)				\
> ++			| (((unsigned int) newval << shift) & mask);	\
> ++									\
> ++	fail = __kernel_cmpxchg (actual_oldval, actual_newval,		\
> ++				 wordptr);				\
> ++									\
> ++	if (!fail)							\
> ++          return oldval;						\
> ++      }									\
> ++  }
> ++
> ++SUBWORD_VAL_CAS (short, 2)
> ++SUBWORD_VAL_CAS (char,  1)
> ++
> ++typedef unsigned char bool;
> ++
> ++bool HIDDEN
> ++__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++  int failure = __kernel_cmpxchg (oldval, newval, ptr);
> ++  return (failure == 0);
> ++}
> ++
> ++#define SUBWORD_BOOL_CAS(TYPE, WIDTH)					\
> ++  bool HIDDEN								\
> ++  __sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
> ++					TYPE newval)			\
> ++  {									\
> ++    TYPE actual_oldval							\
> ++      = __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newval);	\
> ++    return (oldval == actual_oldval);					\
> ++  }
> ++
> ++SUBWORD_BOOL_CAS (short, 2)
> ++SUBWORD_BOOL_CAS (char,  1)
> ++
> ++void HIDDEN
> ++__sync_synchronize (void)
> ++{
> ++  __kernel_dmb ();
> ++}
> ++
> ++int HIDDEN
> ++__sync_lock_test_and_set_4 (int *ptr, int val)
> ++{
> ++  int failure, oldval;
> ++
> ++  do {
> ++    oldval = *ptr;
> ++    failure = __kernel_cmpxchg (oldval, val, ptr);
> ++  } while (failure != 0);
> ++
> ++  return oldval;
> ++}
> ++
> ++#define SUBWORD_TEST_AND_SET(TYPE, WIDTH)				\
> ++  TYPE HIDDEN								\
> ++  __sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val)		\
> ++  {									\
> ++    int failure;							\
> ++    unsigned int oldval, newval, shift, mask;				\
> ++    int *wordptr = (int *) ((unsigned int) ptr & ~3);			\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    do {								\
> ++      oldval = *wordptr;						\
> ++      newval = (oldval & ~mask)						\
> ++	       | (((unsigned int) val << shift) & mask);		\
> ++      failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
> ++    } while (failure != 0);						\
> ++									\
> ++    return (oldval & mask) >> shift;					\
> ++  }
> ++
> ++SUBWORD_TEST_AND_SET (short, 2)
> ++SUBWORD_TEST_AND_SET (char,  1)
> ++
> ++#define SYNC_LOCK_RELEASE(TYPE, WIDTH)					\
> ++  void HIDDEN								\
> ++  __sync_lock_release_##WIDTH (TYPE *ptr)				\
> ++  {									\
> ++    *ptr = 0;								\
> ++    __kernel_dmb ();							\
> ++  }
> ++
> ++SYNC_LOCK_RELEASE (int,   4)
> ++SYNC_LOCK_RELEASE (short, 2)
> ++SYNC_LOCK_RELEASE (char,  1)
> +Index: gcc/config/arm/t-linux-eabi
> +===================================================================
> +--- gcc/config/arm/t-linux-eabi	(revision 136167)
> ++++ gcc/config/arm/t-linux-eabi	(working copy)
> +@@ -12,3 +12,5 @@ LIB1ASMFUNCS := $(filter-out _dvmd_tls,$
> + # Multilib the standard Linux files.  Don't include crti.o or crtn.o,
> + # which are provided by glibc.
> + EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
> ++
> ++LIB2FUNCS_STATIC_EXTRA += $(srcdir)/config/arm/linux-atomic.c
> +
> +
> diff --git a/recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch b/recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> new file mode 100644
> index 0000000..6849d46
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.2/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> @@ -0,0 +1,52 @@
> +--- gcc-4.4-20090519/gcc/config/arm/linux-eabi.h.~1~	2007-11-08 14:44:09.000000000 +0100
> ++++ gcc-4.4-20090519/gcc/config/arm/linux-eabi.h	2009-05-22 20:38:51.000000000 +0200
> +@@ -72,6 +72,49 @@
> +    do not use -lfloat.  */
> + #undef LIBGCC_SPEC
> + 
> ++/* Some symbols are only in the static libgcc. Override REAL_LIBGCC_SPEC
> ++   to always pass -lgcc to the linker, even for --shared-libgcc, otherwise
> ++   shared libraries break. */
> ++#ifdef ENABLE_SHARED_LIBGCC
> ++
> ++#ifndef USE_LD_AS_NEEDED
> ++#define USE_LD_AS_NEEDED 0
> ++#endif
> ++
> ++#if USE_LD_AS_NEEDED
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++	%{!shared-libgcc:-lgcc --as-needed -lgcc_s --no-as-needed} \
> ++	%{shared-libgcc:-lgcc_s -lgcc}"		/* always append -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++	%{!shared: \
> ++	  %{!shared-libgcc:-lgcc -lgcc_eh} \
> ++	  %{shared-libgcc:-lgcc_s -lgcc}}"
> ++#endif
> ++
> ++#ifdef LINK_EH_SPEC
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++	%{shared: \
> ++	  %{!shared-libgcc:-lgcc} \
> ++	  %{shared-libgcc:-lgcc_s -lgcc}}"	/* always append -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++	%{shared:-lgcc_s -lgcc}"		/* always append -lgcc */
> ++#endif
> ++
> ++#define REAL_LIBGCC_SPEC " \
> ++	%{static|static-libgcc:-lgcc -lgcc_eh} \
> ++	%{!static:%{!static-libgcc: \
> ++	"REAL_LIBGCC_SPEC_1" \
> ++	"REAL_LIBGCC_SPEC_2" \
> ++	}}"
> ++
> ++#else	/* !ENABLE_SHARED_LIBGCC */
> ++
> ++#define REAL_LIBGCC_SPEC " -lgcc "
> ++
> ++#endif	/* !ENABLE_SHARED_LIBGCC */
> ++
> + /* Clear the instruction cache from `beg' to `end'.  This makes an
> +    inline system call to SYS_cacheflush.  */
> + #undef  CLEAR_INSN_CACHE
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index 860c96c..cae16e5 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://fedora/gcc43-i386-libgomp.patch;patch=1;pnum=0 \
>  	file://fedora/gcc43-rh251682.patch;patch=1;pnum=0 \
>  	file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
> +        file://debian/armel-atomic-builtins.dpatch;patch=1;pnum=0 \
>  	file://debian/libstdc++-pic.dpatch;patch=1;pnum=0 \
>  	file://debian/gcc-ice-hack.dpatch;patch=1;pnum=0 \ 
>  	file://debian/pr30961.dpatch;patch=1;pnum=0 \
> @@ -56,6 +57,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch;patch=1 \
>  	file://zecke-xgcc-cpp.patch;patch=1 \
>  	file://gcc-flags-for-build.patch;patch=1 \
> +        file://gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch;patch=1 \
>  "
>  
>  SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
> diff --git a/recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch b/recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch
> new file mode 100644
> index 0000000..f514375
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.3/debian/armel-atomic-builtins.dpatch
> @@ -0,0 +1,350 @@
> +#! /bin/sh -e
> +
> +# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.
> +
> +dir=
> +if [ $# -eq 3 -a "$2" = '-d' ]; then
> +    pdir="-d $3"
> +    dir="$3/"
> +elif [ $# -ne 1 ]; then
> +    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
> +    exit 1
> +fi
> +case "$1" in
> +    -patch)
> +        patch $pdir -f --no-backup-if-mismatch -p0 < $0
> +        ;;
> +    -unpatch)
> +        patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
> +        ;;
> +    *)
> +        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
> +        exit 1
> +esac
> +exit 0
> +
> +This patch implements the atomic builtins described at:
> +
> +  http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html
> +
> +for ARM EABI Linux. This implementation uses the kernel helpers
> +__kernel_cmpxchg and __kernel_dmb, and so should work on any
> +architecture which supports those. (More-efficient versions are possible
> +using ldrex/strex on architectures >=v6, but those are not written yet.)
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
> +    gcc/
> +    * config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
> +    config/arm/linux-atomic.c.
> +    * config/arm/linux-atomic.c: New.
> +
> +Index: gcc/config/arm/linux-atomic.c
> +===================================================================
> +--- gcc/config/arm/linux-atomic.c	(revision 0)
> ++++ gcc/config/arm/linux-atomic.c	(revision 0)
> +@@ -0,0 +1,280 @@
> ++/* Linux-specific atomic operations for ARM EABI.
> ++   Copyright (C) 2008 Free Software Foundation, Inc.
> ++   Contributed by CodeSourcery.
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
> ++from the use of this file.  (The General Public License restrictions
> ++do apply in other respects; for example, they cover modification of
> ++the file, and distribution when not linked into a combine
> ++executable.)
> ++
> ++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> ++WARRANTY; without even the implied warranty of MERCHANTABILITY or
> ++FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> ++for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with GCC; see the file COPYING.  If not, write to the Free
> ++Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
> ++02110-1301, USA.  */
> ++
> ++/* Kernel helper for compare-and-exchange.  */
> ++typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
> ++#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
> ++
> ++/* Kernel helper for memory barrier.  */
> ++typedef void (__kernel_dmb_t) (void);
> ++#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
> ++
> ++/* Note: we implement byte, short and int versions of atomic operations using
> ++   the above kernel helpers, but there is no support for "long long" (64-bit)
> ++   operations as yet.  */
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
> ++#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP)				\
> ++  int HIDDEN								\
> ++  __sync_fetch_and_##OP##_4 (int *ptr, int val)				\
> ++  {									\
> ++    int failure, tmp;							\
> ++									\
> ++    do {								\
> ++      tmp = *ptr;							\
> ++      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
> ++    } while (failure != 0);						\
> ++									\
> ++    return tmp;								\
> ++  }
> ++
> ++FETCH_AND_OP_WORD (add,   , +)
> ++FETCH_AND_OP_WORD (sub,   , -)
> ++FETCH_AND_OP_WORD (or,    , |)
> ++FETCH_AND_OP_WORD (and,   , &)
> ++FETCH_AND_OP_WORD (xor,   , ^)
> ++FETCH_AND_OP_WORD (nand, ~, &)
> ++
> ++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
> ++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
> ++
> ++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
> ++   subword-sized quantities.  */
> ++
> ++#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN)	\
> ++  TYPE HIDDEN								\
> ++  NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val)			\
> ++  {									\
> ++    int *wordptr = (int *) ((unsigned int) ptr & ~3);			\
> ++    unsigned int mask, shift, oldval, newval;				\
> ++    int failure;							\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    do {								\
> ++      oldval = *wordptr;						\
> ++      newval = ((PFX_OP ((oldval & mask) >> shift)			\
> ++                 INF_OP (unsigned int) val) << shift) & mask;		\
> ++      newval |= oldval & ~mask;						\
> ++      failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
> ++    } while (failure != 0);						\
> ++									\
> ++    return (RETURN & mask) >> shift;					\
> ++  }
> ++
> ++SUBWORD_SYNC_OP (add,   , +, short, 2, oldval)
> ++SUBWORD_SYNC_OP (sub,   , -, short, 2, oldval)
> ++SUBWORD_SYNC_OP (or,    , |, short, 2, oldval)
> ++SUBWORD_SYNC_OP (and,   , &, short, 2, oldval)
> ++SUBWORD_SYNC_OP (xor,   , ^, short, 2, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, char, 1, oldval)
> ++SUBWORD_SYNC_OP (sub,   , -, char, 1, oldval)
> ++SUBWORD_SYNC_OP (or,    , |, char, 1, oldval)
> ++SUBWORD_SYNC_OP (and,   , &, char, 1, oldval)
> ++SUBWORD_SYNC_OP (xor,   , ^, char, 1, oldval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
> ++
> ++#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP)				\
> ++  int HIDDEN								\
> ++  __sync_##OP##_and_fetch_4 (int *ptr, int val)				\
> ++  {									\
> ++    int tmp, failure;							\
> ++									\
> ++    do {								\
> ++      tmp = *ptr;							\
> ++      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
> ++    } while (failure != 0);						\
> ++									\
> ++    return PFX_OP tmp INF_OP val;					\
> ++  }
> ++
> ++OP_AND_FETCH_WORD (add,   , +)
> ++OP_AND_FETCH_WORD (sub,   , -)
> ++OP_AND_FETCH_WORD (or,    , |)
> ++OP_AND_FETCH_WORD (and,   , &)
> ++OP_AND_FETCH_WORD (xor,   , ^)
> ++OP_AND_FETCH_WORD (nand, ~, &)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, short, 2, newval)
> ++SUBWORD_SYNC_OP (sub,   , -, short, 2, newval)
> ++SUBWORD_SYNC_OP (or,    , |, short, 2, newval)
> ++SUBWORD_SYNC_OP (and,   , &, short, 2, newval)
> ++SUBWORD_SYNC_OP (xor,   , ^, short, 2, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
> ++
> ++SUBWORD_SYNC_OP (add,   , +, char, 1, newval)
> ++SUBWORD_SYNC_OP (sub,   , -, char, 1, newval)
> ++SUBWORD_SYNC_OP (or,    , |, char, 1, newval)
> ++SUBWORD_SYNC_OP (and,   , &, char, 1, newval)
> ++SUBWORD_SYNC_OP (xor,   , ^, char, 1, newval)
> ++SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
> ++
> ++int HIDDEN
> ++__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++  int actual_oldval, fail;
> ++    
> ++  while (1)
> ++    {
> ++      actual_oldval = *ptr;
> ++
> ++      if (oldval != actual_oldval)
> ++	return actual_oldval;
> ++
> ++      fail = __kernel_cmpxchg (actual_oldval, newval, ptr);
> ++  
> ++      if (!fail)
> ++        return oldval;
> ++    }
> ++}
> ++
> ++#define SUBWORD_VAL_CAS(TYPE, WIDTH)					\
> ++  TYPE HIDDEN								\
> ++  __sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
> ++				       TYPE newval)			\
> ++  {									\
> ++    int *wordptr = (int *)((unsigned int) ptr & ~3), fail;		\
> ++    unsigned int mask, shift, actual_oldval, actual_newval;		\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    while (1)								\
> ++      {									\
> ++	actual_oldval = *wordptr;					\
> ++									\
> ++	if (((actual_oldval & mask) >> shift) != (unsigned int) oldval)	\
> ++          return (actual_oldval & mask) >> shift;			\
> ++									\
> ++	actual_newval = (actual_oldval & ~mask)				\
> ++			| (((unsigned int) newval << shift) & mask);	\
> ++									\
> ++	fail = __kernel_cmpxchg (actual_oldval, actual_newval,		\
> ++				 wordptr);				\
> ++									\
> ++	if (!fail)							\
> ++          return oldval;						\
> ++      }									\
> ++  }
> ++
> ++SUBWORD_VAL_CAS (short, 2)
> ++SUBWORD_VAL_CAS (char,  1)
> ++
> ++typedef unsigned char bool;
> ++
> ++bool HIDDEN
> ++__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
> ++{
> ++  int failure = __kernel_cmpxchg (oldval, newval, ptr);
> ++  return (failure == 0);
> ++}
> ++
> ++#define SUBWORD_BOOL_CAS(TYPE, WIDTH)					\
> ++  bool HIDDEN								\
> ++  __sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
> ++					TYPE newval)			\
> ++  {									\
> ++    TYPE actual_oldval							\
> ++      = __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newval);	\
> ++    return (oldval == actual_oldval);					\
> ++  }
> ++
> ++SUBWORD_BOOL_CAS (short, 2)
> ++SUBWORD_BOOL_CAS (char,  1)
> ++
> ++void HIDDEN
> ++__sync_synchronize (void)
> ++{
> ++  __kernel_dmb ();
> ++}
> ++
> ++int HIDDEN
> ++__sync_lock_test_and_set_4 (int *ptr, int val)
> ++{
> ++  int failure, oldval;
> ++
> ++  do {
> ++    oldval = *ptr;
> ++    failure = __kernel_cmpxchg (oldval, val, ptr);
> ++  } while (failure != 0);
> ++
> ++  return oldval;
> ++}
> ++
> ++#define SUBWORD_TEST_AND_SET(TYPE, WIDTH)				\
> ++  TYPE HIDDEN								\
> ++  __sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val)		\
> ++  {									\
> ++    int failure;							\
> ++    unsigned int oldval, newval, shift, mask;				\
> ++    int *wordptr = (int *) ((unsigned int) ptr & ~3);			\
> ++									\
> ++    shift = (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
> ++    mask = MASK_##WIDTH << shift;					\
> ++									\
> ++    do {								\
> ++      oldval = *wordptr;						\
> ++      newval = (oldval & ~mask)						\
> ++	       | (((unsigned int) val << shift) & mask);		\
> ++      failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
> ++    } while (failure != 0);						\
> ++									\
> ++    return (oldval & mask) >> shift;					\
> ++  }
> ++
> ++SUBWORD_TEST_AND_SET (short, 2)
> ++SUBWORD_TEST_AND_SET (char,  1)
> ++
> ++#define SYNC_LOCK_RELEASE(TYPE, WIDTH)					\
> ++  void HIDDEN								\
> ++  __sync_lock_release_##WIDTH (TYPE *ptr)				\
> ++  {									\
> ++    *ptr = 0;								\
> ++    __kernel_dmb ();							\
> ++  }
> ++
> ++SYNC_LOCK_RELEASE (int,   4)
> ++SYNC_LOCK_RELEASE (short, 2)
> ++SYNC_LOCK_RELEASE (char,  1)
> +Index: gcc/config/arm/t-linux-eabi
> +===================================================================
> +--- gcc/config/arm/t-linux-eabi	(revision 136167)
> ++++ gcc/config/arm/t-linux-eabi	(working copy)
> +@@ -12,3 +12,5 @@ LIB1ASMFUNCS := $(filter-out _dvmd_tls,$
> + # Multilib the standard Linux files.  Don't include crti.o or crtn.o,
> + # which are provided by glibc.
> + EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
> ++
> ++LIB2FUNCS_STATIC_EXTRA += $(srcdir)/config/arm/linux-atomic.c
> +
> +
> diff --git a/recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch b/recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> new file mode 100644
> index 0000000..6849d46
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.3/gcc-4.4-20090519-arm-eabi-atomic-builtins-unbreak-v2.patch
> @@ -0,0 +1,52 @@
> +--- gcc-4.4-20090519/gcc/config/arm/linux-eabi.h.~1~	2007-11-08 14:44:09.000000000 +0100
> ++++ gcc-4.4-20090519/gcc/config/arm/linux-eabi.h	2009-05-22 20:38:51.000000000 +0200
> +@@ -72,6 +72,49 @@
> +    do not use -lfloat.  */
> + #undef LIBGCC_SPEC
> + 
> ++/* Some symbols are only in the static libgcc. Override REAL_LIBGCC_SPEC
> ++   to always pass -lgcc to the linker, even for --shared-libgcc, otherwise
> ++   shared libraries break. */
> ++#ifdef ENABLE_SHARED_LIBGCC
> ++
> ++#ifndef USE_LD_AS_NEEDED
> ++#define USE_LD_AS_NEEDED 0
> ++#endif
> ++
> ++#if USE_LD_AS_NEEDED
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++	%{!shared-libgcc:-lgcc --as-needed -lgcc_s --no-as-needed} \
> ++	%{shared-libgcc:-lgcc_s -lgcc}"		/* always append -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_1 "\
> ++	%{!shared: \
> ++	  %{!shared-libgcc:-lgcc -lgcc_eh} \
> ++	  %{shared-libgcc:-lgcc_s -lgcc}}"
> ++#endif
> ++
> ++#ifdef LINK_EH_SPEC
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++	%{shared: \
> ++	  %{!shared-libgcc:-lgcc} \
> ++	  %{shared-libgcc:-lgcc_s -lgcc}}"	/* always append -lgcc */
> ++#else
> ++#define REAL_LIBGCC_SPEC_2 "\
> ++	%{shared:-lgcc_s -lgcc}"		/* always append -lgcc */
> ++#endif
> ++
> ++#define REAL_LIBGCC_SPEC " \
> ++	%{static|static-libgcc:-lgcc -lgcc_eh} \
> ++	%{!static:%{!static-libgcc: \
> ++	"REAL_LIBGCC_SPEC_1" \
> ++	"REAL_LIBGCC_SPEC_2" \
> ++	}}"
> ++
> ++#else	/* !ENABLE_SHARED_LIBGCC */
> ++
> ++#define REAL_LIBGCC_SPEC " -lgcc "
> ++
> ++#endif	/* !ENABLE_SHARED_LIBGCC */
> ++
> + /* Clear the instruction cache from `beg' to `end'.  This makes an
> +    inline system call to SYS_cacheflush.  */
> + #undef  CLEAR_INSN_CACHE
> diff --git a/recipes/gcc/gcc-cross-sdk_4.3.1.bb b/recipes/gcc/gcc-cross-sdk_4.3.1.bb
> index 876c65c..45557b6 100644
> --- a/recipes/gcc/gcc-cross-sdk_4.3.1.bb
> +++ b/recipes/gcc/gcc-cross-sdk_4.3.1.bb
> @@ -1,4 +1,4 @@
> -PR = "r14"
> +PR = "r15"
>  
>  inherit sdk
>  
> diff --git a/recipes/gcc/gcc-cross-sdk_4.3.2.bb b/recipes/gcc/gcc-cross-sdk_4.3.2.bb
> index ee4ce85..297bd8e 100644
> --- a/recipes/gcc/gcc-cross-sdk_4.3.2.bb
> +++ b/recipes/gcc/gcc-cross-sdk_4.3.2.bb
> @@ -1,4 +1,4 @@
> -PR = "r6"
> +PR = "r7"
>  
>  inherit sdk
>  
> diff --git a/recipes/gcc/gcc-cross-sdk_4.3.3.bb b/recipes/gcc/gcc-cross-sdk_4.3.3.bb
> index 7f3e146..7e3a459 100644
> --- a/recipes/gcc/gcc-cross-sdk_4.3.3.bb
> +++ b/recipes/gcc/gcc-cross-sdk_4.3.3.bb
> @@ -1,4 +1,4 @@
> -PR = "r2"
> +PR = "r3"
>  
>  inherit sdk
>  
> diff --git a/recipes/gcc/gcc-cross_4.3.1.bb b/recipes/gcc/gcc-cross_4.3.1.bb
> index a6ebecb..2764039 100644
> --- a/recipes/gcc/gcc-cross_4.3.1.bb
> +++ b/recipes/gcc/gcc-cross_4.3.1.bb
> @@ -1,4 +1,4 @@
> -PR = "r17"
> +PR = "r18"
>  
>  require gcc-${PV}.inc
>  require gcc-cross4.inc
> diff --git a/recipes/gcc/gcc-cross_4.3.2.bb b/recipes/gcc/gcc-cross_4.3.2.bb
> index 9f1ffed..598da3c 100644
> --- a/recipes/gcc/gcc-cross_4.3.2.bb
> +++ b/recipes/gcc/gcc-cross_4.3.2.bb
> @@ -1,4 +1,4 @@
> -PR = "r6"
> +PR = "r8"
>  require gcc-${PV}.inc
>  require gcc-cross4.inc
>  require gcc-configure-cross.inc
> diff --git a/recipes/gcc/gcc-cross_4.3.3.bb b/recipes/gcc/gcc-cross_4.3.3.bb
> index 2ae54d6..d6abff2 100644
> --- a/recipes/gcc/gcc-cross_4.3.3.bb
> +++ b/recipes/gcc/gcc-cross_4.3.3.bb
> @@ -1,4 +1,4 @@
> -PR = "r0"
> +PR = "r2"
>  require gcc-${PV}.inc
>  require gcc-cross4.inc
>  require gcc-configure-cross.inc
> diff --git a/recipes/gcc/gcc_4.3.1.bb b/recipes/gcc/gcc_4.3.1.bb
> index 3c29714..af35244 100644
> --- a/recipes/gcc/gcc_4.3.1.bb
> +++ b/recipes/gcc/gcc_4.3.1.bb
> @@ -1,4 +1,4 @@
> -PR = "r11"
> +PR = "r12"
>  
>  require gcc-${PV}.inc
>  require gcc-configure-target.inc
> diff --git a/recipes/gcc/gcc_4.3.2.bb b/recipes/gcc/gcc_4.3.2.bb
> index e2c6e48..fddf437 100644
> --- a/recipes/gcc/gcc_4.3.2.bb
> +++ b/recipes/gcc/gcc_4.3.2.bb
> @@ -1,4 +1,4 @@
> -PR = "r4"
> +PR = "r5"
>  require gcc-${PV}.inc
>  require gcc-configure-target.inc
>  require gcc-package-target.inc
> diff --git a/recipes/gcc/gcc_4.3.3.bb b/recipes/gcc/gcc_4.3.3.bb
> index 55725b0..83ebff7 100644
> --- a/recipes/gcc/gcc_4.3.3.bb
> +++ b/recipes/gcc/gcc_4.3.3.bb
> @@ -1,4 +1,4 @@
> -PR = "r0"
> +PR = "r1"
>  require gcc-${PV}.inc
>  require gcc-configure-target.inc
>  require gcc-package-target.inc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRVkBMkyGM64RGpERAv8xAKCw96mPY54eyn361dU6gh+svzFn2ACeJNie
ZqWgej5nNTgluUXcUmNXsg8=
=ljvW
-----END PGP SIGNATURE-----



