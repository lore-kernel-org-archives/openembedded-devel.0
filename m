Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OOnAT-0005jM-8X
	for openembedded-devel@openembedded.org; Wed, 16 Jun 2010 09:36:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 2CBF040008249
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Jun 2010 09:26:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 247604000824A
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Jun 2010 09:26:42 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12NYZ7Oar615 for <openembedded-devel@openembedded.org>;
	Wed, 16 Jun 2010 09:26:42 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id D9E8540008249
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Jun 2010 09:26:41 +0200 (CEST)
Message-ID: <4C187CF6.5010401@gmx.net>
Date: Wed, 16 Jun 2010 09:27:50 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Wed, 16 Jun 2010 07:36:14 -0000
X-Groupsio-MsgNum: 20175
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigF06F35E646A349D1C93DEF4E"

--------------enigF06F35E646A349D1C93DEF4E
Content-Type: multipart/mixed;
 boundary="------------050504030006060303090302"

--------------050504030006060303090302
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
Angstrom's default GCC is 4.3.3 for ARM. Unfortunately that version
lacks atomic intrinsics support for the very same architecture
(__sync_synchronize and friends). The support is available from 4.4.x
onwards but a patch exists in Ubuntu's GCC that adds the intrinsics to
the earlier GCC version. I would like add that patch to our GCC 4.3.x
(all of them so there is not suddenly a feature missing when one changes
from one microversion to another). This has the potential for drastic
effects on other recipes because a lot of programs (e.g. pulseaudio,
llvm) check for the availability of the intrinsics and make use of them
in that case.

I ask for comments here because I would also like to see this change
move into OE stable later on. (The use case is to get OpenJDK with the
Shark JIT compiler [llvm-based] to run on the bug20 hardware).

Regards,
Robert

--------------050504030006060303090302
Content-Type: text/plain;
 name="armel-atomic-builtins.dpatch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="armel-atomic-builtins.dpatch"

#! /bin/sh -e

# DP: Atomic builtins using kernel helpers for ARM Linux/EABI.

dir=3D
if [ $# -eq 3 -a "$2" =3D '-d' ]; then
    pdir=3D"-d $3"
    dir=3D"$3/"
elif [ $# -ne 1 ]; then
    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
    exit 1
fi
case "$1" in
    -patch)
        patch $pdir -f --no-backup-if-mismatch -p0 < $0
        ;;
    -unpatch)
        patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
        ;;
    *)
        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument=
"
        exit 1
esac
exit 0

This patch implements the atomic builtins described at:

  http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Atomic-Builtins.html

for ARM EABI Linux. This implementation uses the kernel helpers
__kernel_cmpxchg and __kernel_dmb, and so should work on any
architecture which supports those. (More-efficient versions are possible
using ldrex/strex on architectures >=3Dv6, but those are not written yet.)

Atomic operations are provided for data sizes of 1, 2 and 4 bytes (but
not 8 bytes). The implementation uses actual functions
(__sync_fetch_and_add_2, etc.) rather than expanding code inline.

Tested with cross to arm-none-linux-gnueabi, and with some additional
hand-written tests which hopefully exercised the atomicity of the
operations sufficiently.

OK for mainline?

Julian

ChangeLog

    gcc/
    * config/arm/t-linux-eabi (LIB2FUNCS_STATIC_EXTRA): Add
    config/arm/linux-atomic.c.
    * config/arm/linux-atomic.c: New.

Index: gcc/config/arm/linux-atomic.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- gcc/config/arm/linux-atomic.c	(revision 0)
+++ gcc/config/arm/linux-atomic.c	(revision 0)
@@ -0,0 +1,280 @@
+/* Linux-specific atomic operations for ARM EABI.
+   Copyright (C) 2008 Free Software Foundation, Inc.
+   Contributed by CodeSourcery.
+
+This file is part of GCC.
+
+GCC is free software; you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free
+Software Foundation; either version 2, or (at your option) any later
+version.
+
+In addition to the permissions in the GNU General Public License, the
+Free Software Foundation gives you unlimited permission to link the
+compiled version of this file into combinations with other programs,
+and to distribute those combinations without any restriction coming
+from the use of this file.  (The General Public License restrictions
+do apply in other respects; for example, they cover modification of
+the file, and distribution when not linked into a combine
+executable.)
+
+GCC is distributed in the hope that it will be useful, but WITHOUT ANY
+WARRANTY; without even the implied warranty of MERCHANTABILITY or
+FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+for more details.
+
+You should have received a copy of the GNU General Public License
+along with GCC; see the file COPYING.  If not, write to the Free
+Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+02110-1301, USA.  */
+
+/* Kernel helper for compare-and-exchange.  */
+typedef int (__kernel_cmpxchg_t) (int oldval, int newval, int *ptr);
+#define __kernel_cmpxchg (*(__kernel_cmpxchg_t *) 0xffff0fc0)
+
+/* Kernel helper for memory barrier.  */
+typedef void (__kernel_dmb_t) (void);
+#define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
+
+/* Note: we implement byte, short and int versions of atomic operations us=
ing
+   the above kernel helpers, but there is no support for "long long" (64-b=
it)
+   operations as yet.  */
+
+#define HIDDEN __attribute__ ((visibility ("hidden")))
+
+#ifdef __ARMEL__
+#define INVERT_MASK_1 0
+#define INVERT_MASK_2 0
+#else
+#define INVERT_MASK_1 24
+#define INVERT_MASK_2 16
+#endif
+
+#define MASK_1 0xffu
+#define MASK_2 0xffffu
+
+#define FETCH_AND_OP_WORD(OP, PFX_OP, INF_OP)				\
+  int HIDDEN								\
+  __sync_fetch_and_##OP##_4 (int *ptr, int val)				\
+  {									\
+    int failure, tmp;							\
+									\
+    do {								\
+      tmp =3D *ptr;							\
+      failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
+    } while (failure !=3D 0);						\
+									\
+    return tmp;								\
+  }
+
+FETCH_AND_OP_WORD (add,   , +)
+FETCH_AND_OP_WORD (sub,   , -)
+FETCH_AND_OP_WORD (or,    , |)
+FETCH_AND_OP_WORD (and,   , &)
+FETCH_AND_OP_WORD (xor,   , ^)
+FETCH_AND_OP_WORD (nand, ~, &)
+
+#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
+#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
+
+/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
+   subword-sized quantities.  */
+
+#define SUBWORD_SYNC_OP(OP, PFX_OP, INF_OP, TYPE, WIDTH, RETURN)	\
+  TYPE HIDDEN								\
+  NAME##_##RETURN (OP, WIDTH) (TYPE *ptr, TYPE val)			\
+  {									\
+    int *wordptr =3D (int *) ((unsigned int) ptr & ~3);			\
+    unsigned int mask, shift, oldval, newval;				\
+    int failure;							\
+									\
+    shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
+    mask =3D MASK_##WIDTH << shift;					\
+									\
+    do {								\
+      oldval =3D *wordptr;						\
+      newval =3D ((PFX_OP ((oldval & mask) >> shift)			\
+                 INF_OP (unsigned int) val) << shift) & mask;		\
+      newval |=3D oldval & ~mask;						\
+      failure =3D __kernel_cmpxchg (oldval, newval, wordptr);		\
+    } while (failure !=3D 0);						\
+									\
+    return (RETURN & mask) >> shift;					\
+  }
+
+SUBWORD_SYNC_OP (add,   , +, short, 2, oldval)
+SUBWORD_SYNC_OP (sub,   , -, short, 2, oldval)
+SUBWORD_SYNC_OP (or,    , |, short, 2, oldval)
+SUBWORD_SYNC_OP (and,   , &, short, 2, oldval)
+SUBWORD_SYNC_OP (xor,   , ^, short, 2, oldval)
+SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
+
+SUBWORD_SYNC_OP (add,   , +, char, 1, oldval)
+SUBWORD_SYNC_OP (sub,   , -, char, 1, oldval)
+SUBWORD_SYNC_OP (or,    , |, char, 1, oldval)
+SUBWORD_SYNC_OP (and,   , &, char, 1, oldval)
+SUBWORD_SYNC_OP (xor,   , ^, char, 1, oldval)
+SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
+
+#define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP)				\
+  int HIDDEN								\
+  __sync_##OP##_and_fetch_4 (int *ptr, int val)				\
+  {									\
+    int tmp, failure;							\
+									\
+    do {								\
+      tmp =3D *ptr;							\
+      failure =3D __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
+    } while (failure !=3D 0);						\
+									\
+    return PFX_OP tmp INF_OP val;					\
+  }
+
+OP_AND_FETCH_WORD (add,   , +)
+OP_AND_FETCH_WORD (sub,   , -)
+OP_AND_FETCH_WORD (or,    , |)
+OP_AND_FETCH_WORD (and,   , &)
+OP_AND_FETCH_WORD (xor,   , ^)
+OP_AND_FETCH_WORD (nand, ~, &)
+
+SUBWORD_SYNC_OP (add,   , +, short, 2, newval)
+SUBWORD_SYNC_OP (sub,   , -, short, 2, newval)
+SUBWORD_SYNC_OP (or,    , |, short, 2, newval)
+SUBWORD_SYNC_OP (and,   , &, short, 2, newval)
+SUBWORD_SYNC_OP (xor,   , ^, short, 2, newval)
+SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
+
+SUBWORD_SYNC_OP (add,   , +, char, 1, newval)
+SUBWORD_SYNC_OP (sub,   , -, char, 1, newval)
+SUBWORD_SYNC_OP (or,    , |, char, 1, newval)
+SUBWORD_SYNC_OP (and,   , &, char, 1, newval)
+SUBWORD_SYNC_OP (xor,   , ^, char, 1, newval)
+SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
+
+int HIDDEN
+__sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
+{
+  int actual_oldval, fail;
+   =20
+  while (1)
+    {
+      actual_oldval =3D *ptr;
+
+      if (oldval !=3D actual_oldval)
+	return actual_oldval;
+
+      fail =3D __kernel_cmpxchg (actual_oldval, newval, ptr);
+ =20
+      if (!fail)
+        return oldval;
+    }
+}
+
+#define SUBWORD_VAL_CAS(TYPE, WIDTH)					\
+  TYPE HIDDEN								\
+  __sync_val_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
+				       TYPE newval)			\
+  {									\
+    int *wordptr =3D (int *)((unsigned int) ptr & ~3), fail;		\
+    unsigned int mask, shift, actual_oldval, actual_newval;		\
+									\
+    shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
+    mask =3D MASK_##WIDTH << shift;					\
+									\
+    while (1)								\
+      {									\
+	actual_oldval =3D *wordptr;					\
+									\
+	if (((actual_oldval & mask) >> shift) !=3D (unsigned int) oldval)	\
+          return (actual_oldval & mask) >> shift;			\
+									\
+	actual_newval =3D (actual_oldval & ~mask)				\
+			| (((unsigned int) newval << shift) & mask);	\
+									\
+	fail =3D __kernel_cmpxchg (actual_oldval, actual_newval,		\
+				 wordptr);				\
+									\
+	if (!fail)							\
+          return oldval;						\
+      }									\
+  }
+
+SUBWORD_VAL_CAS (short, 2)
+SUBWORD_VAL_CAS (char,  1)
+
+typedef unsigned char bool;
+
+bool HIDDEN
+__sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
+{
+  int failure =3D __kernel_cmpxchg (oldval, newval, ptr);
+  return (failure =3D=3D 0);
+}
+
+#define SUBWORD_BOOL_CAS(TYPE, WIDTH)					\
+  bool HIDDEN								\
+  __sync_bool_compare_and_swap_##WIDTH (TYPE *ptr, TYPE oldval,		\
+					TYPE newval)			\
+  {									\
+    TYPE actual_oldval							\
+      =3D __sync_val_compare_and_swap_##WIDTH (ptr, oldval, newval);	\
+    return (oldval =3D=3D actual_oldval);					\
+  }
+
+SUBWORD_BOOL_CAS (short, 2)
+SUBWORD_BOOL_CAS (char,  1)
+
+void HIDDEN
+__sync_synchronize (void)
+{
+  __kernel_dmb ();
+}
+
+int HIDDEN
+__sync_lock_test_and_set_4 (int *ptr, int val)
+{
+  int failure, oldval;
+
+  do {
+    oldval =3D *ptr;
+    failure =3D __kernel_cmpxchg (oldval, val, ptr);
+  } while (failure !=3D 0);
+
+  return oldval;
+}
+
+#define SUBWORD_TEST_AND_SET(TYPE, WIDTH)				\
+  TYPE HIDDEN								\
+  __sync_lock_test_and_set_##WIDTH (TYPE *ptr, TYPE val)		\
+  {									\
+    int failure;							\
+    unsigned int oldval, newval, shift, mask;				\
+    int *wordptr =3D (int *) ((unsigned int) ptr & ~3);			\
+									\
+    shift =3D (((unsigned int) ptr & 3) << 3) ^ INVERT_MASK_##WIDTH;	\
+    mask =3D MASK_##WIDTH << shift;					\
+									\
+    do {								\
+      oldval =3D *wordptr;						\
+      newval =3D (oldval & ~mask)						\
+	       | (((unsigned int) val << shift) & mask);		\
+      failure =3D __kernel_cmpxchg (oldval, newval, wordptr);		\
+    } while (failure !=3D 0);						\
+									\
+    return (oldval & mask) >> shift;					\
+  }
+
+SUBWORD_TEST_AND_SET (short, 2)
+SUBWORD_TEST_AND_SET (char,  1)
+
+#define SYNC_LOCK_RELEASE(TYPE, WIDTH)					\
+  void HIDDEN								\
+  __sync_lock_release_##WIDTH (TYPE *ptr)				\
+  {									\
+    *ptr =3D 0;								\
+    __kernel_dmb ();							\
+  }
+
+SYNC_LOCK_RELEASE (int,   4)
+SYNC_LOCK_RELEASE (short, 2)
+SYNC_LOCK_RELEASE (char,  1)
Index: gcc/config/arm/t-linux-eabi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- gcc/config/arm/t-linux-eabi	(revision 136167)
+++ gcc/config/arm/t-linux-eabi	(working copy)
@@ -12,3 +12,5 @@ LIB1ASMFUNCS :=3D $(filter-out _dvmd_tls,$
 # Multilib the standard Linux files.  Don't include crti.o or crtn.o,
 # which are provided by glibc.
 EXTRA_MULTILIB_PARTS=3Dcrtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT=
.o
+
+LIB2FUNCS_STATIC_EXTRA +=3D $(srcdir)/config/arm/linux-atomic.c



--------------050504030006060303090302--

--------------enigF06F35E646A349D1C93DEF4E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkwYfPkACgkQG9cfwmwwEtp1+QCfdpHjrmbeGfWECErv8tIWAubl
tI0AniJSfCnn/Xw+6W+hVFFSjG/YVCo+
=N1Za
-----END PGP SIGNATURE-----

--------------enigF06F35E646A349D1C93DEF4E--
