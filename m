Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oz4lJ-0004HH-1R for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 11:40:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oz4lA-0008I3-EH for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 11:40:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:40:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:40:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Sep 2010 11:30:02 +0200
Message-ID: <i7hr2q$kte$2@dough.gmane.org>
References: <4C9C4B81.8010700@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <4C9C4B81.8010700@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] firefox_3.6.8.bb: Add mipsel support.
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
X-List-Received-Date: Fri, 24 Sep 2010 09:40:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-09-10 08:56, Graham Gower wrote:
> Patches taken from Gentoo and Debian.
> 
> Runs almost acceptably on my 350mhz/128mb mipsel, after a lengthy
> startup delay. Should work for big endian mips without much more
> work, but I can't test.
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Thanks for the patch! It doesn't apply, could you rework and resend it
please?

regards,

Koen


> ---
>  ...nvoke-and-xptstubs-on-mips-o32-big-endian.patch |   81 ++++++++
>  ...ncrease-stability-and-performance-on-mips.patch |   50 +++++
>  recipes/mozilla/files/mips-disable-TLS.patch       |   12 ++
>  recipes/mozilla/files/mipsel/jsautocfg.h           |   54 +++++
>  .../files/xulrunner-1.9.2.8-mips-bus-error.patch   |   26 +++
>  .../mozilla/files/xulrunner-chromium-mips.patch    |  208 ++++++++++++++++++++
>  recipes/mozilla/firefox_3.6.8.bb                   |    9 +-
>  7 files changed, 438 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/mozilla/files/Fix-xptinvoke-and-xptstubs-on-mips-o32-big-endian.patch
>  create mode 100644 recipes/mozilla/files/Increase-stability-and-performance-on-mips.patch
>  create mode 100644 recipes/mozilla/files/mips-disable-TLS.patch
>  create mode 100644 recipes/mozilla/files/mipsel/jsautocfg.h
>  create mode 100644 recipes/mozilla/files/xulrunner-1.9.2.8-mips-bus-error.patch
>  create mode 100644 recipes/mozilla/files/xulrunner-chromium-mips.patch
> 
> diff --git a/recipes/mozilla/files/Fix-xptinvoke-and-xptstubs-on-mips-o32-big-endian.patch b/recipes/mozilla/files/Fix-xptinvoke-and-xptstubs-on-mips-o32-big-endian.patch
> new file mode 100644
> index 0000000..d373bdd
> --- /dev/null
> +++ b/recipes/mozilla/files/Fix-xptinvoke-and-xptstubs-on-mips-o32-big-endian.patch
> @@ -0,0 +1,81 @@
> +From: Mike Hommey <mh@glandium.org>
> +Date: Sun, 14 Feb 2010 14:42:19 +0100
> +Subject: Fix xptinvoke and xptstubs on mips o32 big endian
> +
> +---
> + .../xptcall/src/md/unix/xptcinvoke_mips.cpp        |   10 +++++++++
> + .../reflect/xptcall/src/md/unix/xptcstubs_mips.cpp |   21 ++++++++++++++++++-
> + 2 files changed, 29 insertions(+), 2 deletions(-)
> +
> +diff --git a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_mips.cpp b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_mips.cpp
> +index 2c27a26..b2f0da7 100644
> +--- a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_mips.cpp
> ++++ b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_mips.cpp
> +@@ -92,18 +92,28 @@ invoke_copy_to_stack(PRUint32* d, PRUint32 paramCount,
> + 
> +         switch(s->type)
> +         {
> ++        case nsXPTType::T_I8     : *d = (PRUint32) s->val.i8;   break;
> ++        case nsXPTType::T_I16    : *d = (PRUint32) s->val.i16;  break;
> ++        case nsXPTType::T_I32    : *d = (PRUint32) s->val.i32;  break;
> +         case nsXPTType::T_I64    :
> +             if ((PRWord)d & 4) d++;
> +             *((PRInt64*) d)  = s->val.i64;    d++;
> +             break;
> ++        case nsXPTType::T_U8     : *d = (PRUint32) s->val.u8;   break;
> ++        case nsXPTType::T_U16    : *d = (PRUint32) s->val.u16;  break;
> ++        case nsXPTType::T_U32    : *d = (PRUint32) s->val.u32;  break;
> +         case nsXPTType::T_U64    :
> +             if ((PRWord)d & 4) d++;
> +             *((PRUint64*) d) = s->val.u64;    d++;
> +             break;
> ++        case nsXPTType::T_FLOAT  : *((float*)   d) = s->val.f;  break;
> +         case nsXPTType::T_DOUBLE :
> +             if ((PRWord)d & 4) d++;
> +             *((double*)   d) = s->val.d;      d++;
> +             break;
> ++        case nsXPTType::T_BOOL   : *d = (PRBool)  s->val.b;     break;
> ++        case nsXPTType::T_CHAR   : *d = (char)    s->val.c;     break;
> ++        case nsXPTType::T_WCHAR  : *d = (wchar_t) s->val.wc;    break;
> +         default:
> +             *((void**)d) = s->val.p;
> +             break;
> +diff --git a/xpcom/reflect/xptcall/src/md/unix/xptcstubs_mips.cpp b/xpcom/reflect/xptcall/src/md/unix/xptcstubs_mips.cpp
> +index bdce59c..730ab5d 100644
> +--- a/xpcom/reflect/xptcall/src/md/unix/xptcstubs_mips.cpp
> ++++ b/xpcom/reflect/xptcall/src/md/unix/xptcstubs_mips.cpp
> +@@ -87,8 +87,6 @@ PrepareAndDispatch(nsXPTCStubBase* self, PRUint32 methodIndex, PRUint32* args)
> +             continue;
> +         }
> + 
> +-        dp->val.p = (void*) *ap;
> +-
> +         switch(type)
> +         {
> +         case nsXPTType::T_I64   :
> +@@ -103,6 +101,25 @@ PrepareAndDispatch(nsXPTCStubBase* self, PRUint32 methodIndex, PRUint32* args)
> +             if ((PRWord)ap & 4) ap++;
> +             dp->val.d   = *((double*) ap);  ap++;
> +             break;
> ++#ifdef IS_LITTLE_ENDIAN
> ++        default:
> ++            dp->val.p = (void*) *ap;
> ++            break;
> ++#else
> ++        case nsXPTType::T_I8    : dp->val.i8  = (PRInt8)   *ap; break;
> ++        case nsXPTType::T_I16   : dp->val.i16 = (PRInt16)  *ap; break;
> ++        case nsXPTType::T_I32   : dp->val.i32 = (PRInt32)  *ap; break;
> ++        case nsXPTType::T_U8    : dp->val.u8  = (PRUint8)  *ap; break;
> ++        case nsXPTType::T_U16   : dp->val.u16 = (PRUint16) *ap; break;
> ++        case nsXPTType::T_U32   : dp->val.u32 = (PRUint32) *ap; break;
> ++        case nsXPTType::T_BOOL  : dp->val.b   = (PRBool)   *ap; break;
> ++        case nsXPTType::T_CHAR  : dp->val.c   = (char)     *ap; break;
> ++        case nsXPTType::T_WCHAR : dp->val.wc  = (wchar_t)  *ap; break;
> ++        case nsXPTType::T_FLOAT : dp->val.f   = *(float *)  ap; break;
> ++        default:
> ++            NS_ASSERTION(0, "bad type");
> ++            break;
> ++#endif
> +         }
> +     }
> + 
> diff --git a/recipes/mozilla/files/Increase-stability-and-performance-on-mips.patch b/recipes/mozilla/files/Increase-stability-and-performance-on-mips.patch
> new file mode 100644
> index 0000000..34bcbd9
> --- /dev/null
> +++ b/recipes/mozilla/files/Increase-stability-and-performance-on-mips.patch
> @@ -0,0 +1,50 @@
> +From: Mike Hommey <glandium@debian.org>
> +Date: Sat, 8 Dec 2007 17:34:10 +0100
> +Subject: Increase stability and performance on mips
> +
> +http://bugs.debian.org/374389
> +---
> + config/rules.mk        |    9 ---------
> + js/src/config/rules.mk |    9 ---------
> + 2 files changed, 0 insertions(+), 18 deletions(-)
> +
> +diff --git a/config/rules.mk b/config/rules.mk
> +index 6b8eda3..d5789dd 100644
> +--- a/config/rules.mk
> ++++ b/config/rules.mk
> +@@ -606,15 +606,6 @@ endif
> + endif
> + endif
> + 
> +-ifeq ($(OS_ARCH),Linux)
> +-ifneq (,$(filter mips mipsel,$(OS_TEST)))
> +-ifeq ($(MODULE),layout)
> +-OS_CFLAGS += -Wa,-xgot
> +-OS_CXXFLAGS += -Wa,-xgot
> +-endif
> +-endif
> +-endif
> +-
> + #
> + # HP-UXBeOS specific section: for COMPONENTS only, add -Bsymbolic flag
> + # which uses internal symbols first
> +diff --git a/js/src/config/rules.mk b/js/src/config/rules.mk
> +index 6b8eda3..d5789dd 100644
> +--- a/js/src/config/rules.mk
> ++++ b/js/src/config/rules.mk
> +@@ -606,15 +606,6 @@ endif
> + endif
> + endif
> + 
> +-ifeq ($(OS_ARCH),Linux)
> +-ifneq (,$(filter mips mipsel,$(OS_TEST)))
> +-ifeq ($(MODULE),layout)
> +-OS_CFLAGS += -Wa,-xgot
> +-OS_CXXFLAGS += -Wa,-xgot
> +-endif
> +-endif
> +-endif
> +-
> + #
> + # HP-UXBeOS specific section: for COMPONENTS only, add -Bsymbolic flag
> + # which uses internal symbols first
> diff --git a/recipes/mozilla/files/mips-disable-TLS.patch b/recipes/mozilla/files/mips-disable-TLS.patch
> new file mode 100644
> index 0000000..9ed50b2
> --- /dev/null
> +++ b/recipes/mozilla/files/mips-disable-TLS.patch
> @@ -0,0 +1,12 @@
> +# See https://bugzilla.mozilla.org/show_bug.cgi?id=528687
> +# The bug report's configure.in patch not usable as we dont autoconf.
> +--- mozilla-1.9.2/configure.orig	2010-09-24 10:18:43.000000000 +0930
> ++++ mozilla-1.9.2/configure	2010-09-24 10:19:47.000000000 +0930
> +@@ -12659,6 +12659,7 @@
> + rm -f conftest*
> + fi
> + 
> ++ac_cv_thread_keyword=no
> + echo "$ac_t""$ac_cv_thread_keyword" 1>&6
> + LDFLAGS=$_SAVE_LDFLAGS
> + if test "$ac_cv_thread_keyword" = yes; then
> diff --git a/recipes/mozilla/files/mipsel/jsautocfg.h b/recipes/mozilla/files/mipsel/jsautocfg.h
> new file mode 100644
> index 0000000..e9d37de
> --- /dev/null
> +++ b/recipes/mozilla/files/mipsel/jsautocfg.h
> @@ -0,0 +1,54 @@
> +#ifndef js_cpucfg___
> +#define js_cpucfg___
> +
> +/* AUTOMATICALLY GENERATED - DO NOT EDIT, unless you are an OE dev :) */
> +
> +#define IS_LITTLE_ENDIAN 1
> +#undef  IS_BIG_ENDIAN
> +
> +#define JS_BYTES_PER_BYTE   1L
> +#define JS_BYTES_PER_SHORT  2L
> +#define JS_BYTES_PER_INT    4L
> +#define JS_BYTES_PER_INT64  8L
> +#define JS_BYTES_PER_LONG   4L
> +#define JS_BYTES_PER_FLOAT  4L
> +#define JS_BYTES_PER_DOUBLE 8L
> +#define JS_BYTES_PER_WORD   4L
> +#define JS_BYTES_PER_DWORD  8L
> +
> +#define JS_BITS_PER_BYTE    8L
> +#define JS_BITS_PER_SHORT   16L
> +#define JS_BITS_PER_INT     32L
> +#define JS_BITS_PER_INT64   64L
> +#define JS_BITS_PER_LONG    32L
> +#define JS_BITS_PER_FLOAT   32L
> +#define JS_BITS_PER_DOUBLE  64L
> +#define JS_BITS_PER_WORD    32L
> +
> +#define JS_BITS_PER_BYTE_LOG2   3L
> +#define JS_BITS_PER_SHORT_LOG2  4L
> +#define JS_BITS_PER_INT_LOG2    5L
> +#define JS_BITS_PER_INT64_LOG2  6L
> +#define JS_BITS_PER_LONG_LOG2   5L
> +#define JS_BITS_PER_FLOAT_LOG2  5L
> +#define JS_BITS_PER_DOUBLE_LOG2 6L
> +#define JS_BITS_PER_WORD_LOG2   5L
> +
> +#define JS_ALIGN_OF_SHORT   2L
> +#define JS_ALIGN_OF_INT     4L
> +#define JS_ALIGN_OF_LONG    4L
> +#define JS_ALIGN_OF_INT64   8L
> +#define JS_ALIGN_OF_FLOAT   4L
> +#define JS_ALIGN_OF_DOUBLE  8L
> +#define JS_ALIGN_OF_POINTER 4L
> +#define JS_ALIGN_OF_WORD    4L
> +
> +#define JS_BYTES_PER_WORD_LOG2   2L
> +#define JS_BYTES_PER_DWORD_LOG2  3L
> +#define JS_WORDS_PER_DWORD_LOG2  1L
> +
> +#define JS_STACK_GROWTH_DIRECTION (-1)
> +
> +#define JS_HAVE_LONG_LONG
> +
> +#endif /* js_cpucfg___ */
> diff --git a/recipes/mozilla/files/xulrunner-1.9.2.8-mips-bus-error.patch b/recipes/mozilla/files/xulrunner-1.9.2.8-mips-bus-error.patch
> new file mode 100644
> index 0000000..05dcd5d
> --- /dev/null
> +++ b/recipes/mozilla/files/xulrunner-1.9.2.8-mips-bus-error.patch
> @@ -0,0 +1,26 @@
> +From:
> +http://gentoo-overlays.zugaina.org/loongson/portage/net-libs/xulrunner/files/xulrunner-1.9.2.8-mips-bus-error.patch
> +--- ./xpcom/glue/nsTArray.h.orig	2009-04-26 01:21:58.000000000 +0800
> ++++ ./xpcom/glue/nsTArray.h	2009-04-26 01:21:33.000000000 +0800
> +@@ -168,6 +168,7 @@
> + 
> +     // The array's elements (prefixed with a Header).  This pointer is never
> +     // null.  If the array is empty, then this will point to sEmptyHdr.
> ++    void   *padding;
> +     Header *mHdr;
> + };
> +
> +diff --git a/layout/svg/base/src/nsSVGGlyphFrame.cpp b/layout/svg/base/src/nsSVGGlyphFrame.cpp
> +index 6d452d0..3ce4193 100644
> +--- a/layout/svg/base/src/nsSVGGlyphFrame.cpp
> ++++ b/layout/svg/base/src/nsSVGGlyphFrame.cpp
> +@@ -169,8 +169,8 @@ private:
> +   PRBool SetupForDirectTextRun(gfxContext *aContext, float aScale);
> +   void SetupFor(gfxContext *aContext, float aScale);
> + 
> +-  nsSVGGlyphFrame *mSource;
> +   nsAutoTArray<CharacterPosition,80> mPositions;
> ++  nsSVGGlyphFrame *mSource;
> +   gfxMatrix mInitialMatrix;
> +   // Textrun advance width from start to mCurrentChar, in appunits
> +   gfxFloat mCurrentAdvance;
> diff --git a/recipes/mozilla/files/xulrunner-chromium-mips.patch b/recipes/mozilla/files/xulrunner-chromium-mips.patch
> new file mode 100644
> index 0000000..2db0801
> --- /dev/null
> +++ b/recipes/mozilla/files/xulrunner-chromium-mips.patch
> @@ -0,0 +1,208 @@
> +Slightly tweaked version of a patch from:
> +http://gentoo-overlays.zugaina.org/loongson/portage/net-libs/xulrunner/files/xulrunner-chromium-mips.patch
> +
> +diff --git a/ipc/chromium/src/base/atomicops.h b/ipc/chromium/src/base/atomicops.h
> +index 87df918..363bf63 100644
> +--- a/ipc/chromium/src/base/atomicops.h
> ++++ b/ipc/chromium/src/base/atomicops.h
> +@@ -132,6 +132,8 @@ Atomic64 Release_Load(volatile const Atomic64* ptr);
> + #include "base/atomicops_internals_x86_gcc.h"
> + #elif defined(COMPILER_GCC) && defined(ARCH_CPU_ARM_FAMILY)
> + #include "base/atomicops_internals_arm_gcc.h"
> ++#elif defined(COMPILER_GCC) && defined(ARCH_CPU_MIPS_FAMILY)
> ++#include "base/atomicops_internals_mips_gcc.h"
> + #else
> + #error "Atomic operations are not supported on your platform"
> + #endif
> +diff --git a/ipc/chromium/src/base/atomicops_internals_mips_gcc.h b/ipc/chromium/src/base/atomicops_internals_mips_gcc.h
> +new file mode 100644
> +index 0000000..d1b87ee
> +--- /dev/null
> ++++ b/ipc/chromium/src/base/atomicops_internals_mips_gcc.h
> +@@ -0,0 +1,160 @@
> ++// Copyright (c) 2010 Zhang, Le <r0bertz@gentoo.org>
> ++// Use of this source code is governed by GPLv2.
> ++
> ++// This file is an internal atomic implementation, use base/atomicops.h instead.
> ++
> ++#ifndef BASE_ATOMICOPS_INTERNALS_MIPS_GCC_H_
> ++#define BASE_ATOMICOPS_INTERNALS_MIPS_GCC_H_
> ++
> ++#define ATOMICOPS_COMPILER_BARRIER() __asm__ __volatile__("" : : : "memory")
> ++
> ++namespace base {
> ++namespace subtle {
> ++
> ++// 32-bit low-level operations on any platform.
> ++
> ++inline Atomic32 NoBarrier_CompareAndSwap(volatile Atomic32* ptr,
> ++                                         Atomic32 old_value,
> ++                                         Atomic32 new_value) {
> ++  Atomic32 prev;
> ++   __asm__ __volatile__(
> ++                       " .set  push        \n"
> ++                       " .set  noat        \n"
> ++                       " .set  mips3       \n"
> ++                       "1: ll  %0, %2      \n"
> ++                       " bne %0, %z3, 2f   \n"
> ++                       " .set  mips0       \n"
> ++                       " move  $1, %z4     \n"
> ++                       " .set  mips3       \n"
> ++                       " sc  $1, %1        \n"
> ++                       " beqz  $1, 3f      \n"
> ++                       "2:                 \n"
> ++                       " .subsection 2     \n"
> ++                       "3: b 1b            \n"
> ++                       " .previous         \n"
> ++                       " .set  pop         \n"
> ++                       : "=&r" (prev), "=R" (*ptr)       
> ++                       : "R" (*ptr), "Jr" (old_value), "Jr" (new_value)     
> ++                       : "memory");
> ++  return prev;
> ++}
> ++
> ++inline Atomic32 NoBarrier_AtomicExchange(volatile Atomic32* ptr,
> ++                                         Atomic32 new_value) {
> ++  unsigned int ret_value;
> ++  unsigned long dummy;
> ++
> ++  __asm__ __volatile__("       .set    mips3                                   \n"
> ++                       "1:     ll      %0, %3                  # xchg_u32      \n"
> ++                       "       .set    mips0                                   \n"
> ++                       "       move    %2, %z4                                 \n"
> ++                       "       .set    mips3                                   \n"
> ++                       "       sc      %2, %1                                  \n"
> ++                       "       beqz    %2, 2f                                  \n"
> ++                       "       .subsection 2                                   \n"
> ++                       "2:     b       1b                                      \n"
> ++                       "       .previous                                       \n"
> ++                       "       .set    mips0                                   \n"
> ++                       : "=&r" (ret_value), "=m" (*ptr), "=&r" (dummy)
> ++                       : "R" (*ptr), "Jr" (new_value)
> ++                       : "memory");
> ++
> ++  return ret_value;  // Now it's the previous value.
> ++}
> ++
> ++inline Atomic32 NoBarrier_AtomicIncrement(volatile Atomic32* ptr,
> ++                                          Atomic32 increment) {
> ++  Atomic32 temp, result;
> ++    __asm__ __volatile__(
> ++    " .set  mips3         \n"
> ++    "1: ll  %1, %2    # atomic_add_return \n"
> ++    " addu  %0, %1, %3        \n"
> ++    " sc  %0, %2          \n"
> ++    " beqz  %0, 2f          \n"
> ++    " addu  %0, %1, %3        \n"
> ++    " .subsection 2         \n"
> ++    "2: b 1b          \n"
> ++    " .previous         \n"
> ++    " .set  mips0         \n"
> ++    : "=&r" (result), "=&r" (temp), "=m" (*ptr)
> ++    : "Ir" (increment), "m" (*ptr)
> ++    : "memory");
> ++  return result;
> ++}
> ++
> ++inline Atomic32 Barrier_AtomicIncrement(volatile Atomic32* ptr,
> ++                                        Atomic32 increment) {
> ++  Atomic32 temp, result;
> ++    __asm__ __volatile__(
> ++    " .set  mips3         \n"
> ++    "1: ll  %1, %2    # atomic_add_return \n"
> ++    " addu  %0, %1, %3        \n"
> ++    " sc  %0, %2          \n"
> ++    " beqz  %0, 2f          \n"
> ++    " addu  %0, %1, %3        \n"
> ++    " .subsection 2         \n"
> ++    "2: b 1b          \n"
> ++    " .previous         \n"
> ++    " .set  mips0         \n"
> ++    : "=&r" (result), "=&r" (temp), "=m" (*ptr)
> ++    : "Ir" (increment), "m" (*ptr)
> ++    : "memory");
> ++  __asm__ __volatile__("sync" : : : "memory");
> ++  return result;
> ++}
> ++
> ++inline Atomic32 Acquire_CompareAndSwap(volatile Atomic32* ptr,
> ++                                       Atomic32 old_value,
> ++                                       Atomic32 new_value) {
> ++  Atomic32 x = NoBarrier_CompareAndSwap(ptr, old_value, new_value);
> ++  __asm__ __volatile__("sync" : : : "memory");
> ++  return x;
> ++}
> ++
> ++inline Atomic32 Release_CompareAndSwap(volatile Atomic32* ptr,
> ++                                       Atomic32 old_value,
> ++                                       Atomic32 new_value) {
> ++  return NoBarrier_CompareAndSwap(ptr, old_value, new_value);
> ++}
> ++
> ++inline void NoBarrier_Store(volatile Atomic32* ptr, Atomic32 value) {
> ++  *ptr = value;
> ++}
> ++
> ++inline void MemoryBarrier() {
> ++  __asm__ __volatile__("sync" : : : "memory");
> ++}
> ++
> ++inline void Acquire_Store(volatile Atomic32* ptr, Atomic32 value) {
> ++  *ptr = value;
> ++  __asm__ __volatile__("sync" : : : "memory");
> ++}
> ++
> ++inline void Release_Store(volatile Atomic32* ptr, Atomic32 value) {
> ++  ATOMICOPS_COMPILER_BARRIER();
> ++  *ptr = value; // An x86 store acts as a release barrier.
> ++  // See comments in Atomic64 version of Release_Store(), below.
> ++}
> ++
> ++inline Atomic32 NoBarrier_Load(volatile const Atomic32* ptr) {
> ++  return *ptr;
> ++}
> ++
> ++inline Atomic32 Acquire_Load(volatile const Atomic32* ptr) {
> ++  Atomic32 value = *ptr; // An x86 load acts as a acquire barrier.
> ++  // See comments in Atomic64 version of Release_Store(), below.
> ++  ATOMICOPS_COMPILER_BARRIER();
> ++  return value;
> ++}
> ++
> ++inline Atomic32 Release_Load(volatile const Atomic32* ptr) {
> ++  MemoryBarrier();
> ++  return *ptr;
> ++}
> ++
> ++} // namespace base::subtle
> ++} // namespace base
> ++
> ++#undef ATOMICOPS_COMPILER_BARRIER
> ++
> ++#endif  // BASE_ATOMICOPS_INTERNALS_MIPS_GCC_H_
> +diff --git a/ipc/chromium/src/base/debug_util_posix.cc b/ipc/chromium/src/base/debug_util_posix.cc
> +index f7c58b4..50fb41d 100644
> +--- a/ipc/chromium/src/base/debug_util_posix.cc
> ++++ b/ipc/chromium/src/base/debug_util_posix.cc
> +@@ -108,7 +108,7 @@ bool DebugUtil::BeingDebugged() {
> + 
> + // static
> + void DebugUtil::BreakDebugger() {
> +-#if !defined(ARCH_CPU_ARM_FAMILY)
> ++#if defined(ARCH_CPU_X86_FAMILY)
> +   asm ("int3");
> + #endif
> + }
> +diff --git a/ipc/chromium/src/build/build_config.h b/ipc/chromium/src/build/build_config.h
> +index 36f83e7..128bbc7 100644
> +--- a/ipc/chromium/src/build/build_config.h
> ++++ b/ipc/chromium/src/build/build_config.h
> +@@ -57,6 +57,8 @@
> + #define ARCH_CPU_ARMEL 1
> + #define ARCH_CPU_32_BITS 1
> + #define WCHAR_T_IS_UNSIGNED 1
> ++#elif defined(__mips__)
> ++#define ARCH_CPU_MIPS_FAMILY 1
> + #else
> + #error Please add support for your architecture in build/build_config.h
> + #endif
> diff --git a/recipes/mozilla/firefox_3.6.8.bb b/recipes/mozilla/firefox_3.6.8.bb
> index 825e692..18a7798 100644
> --- a/recipes/mozilla/firefox_3.6.8.bb
> +++ b/recipes/mozilla/firefox_3.6.8.bb
> @@ -1,5 +1,5 @@
>  DEPENDS += "cairo sqlite3 libnotify"
> -PR = "r1"
> +PR = "r2"
>  
>  # The .pc files below have "3.6" hardcoded, fix that before using them in a newer FF version!
>  SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
> @@ -15,8 +15,14 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/f
>  	file://firefox-plugin.pc \
>  	file://firefox-xpcom.pc \
>  	file://nspr.pc \
> +	file://xulrunner-chromium-mips.patch \
> +	file://xulrunner-1.9.2.8-mips-bus-error.patch \
> +	file://Fix-xptinvoke-and-xptstubs-on-mips-o32-big-endian.patch \
> +	file://Increase-stability-and-performance-on-mips.patch \
>  "
>  
> +SRC_URI_append_mipsel = " file://mips-disable-TLS.patch "
> +
>  SRC_URI[archive.md5sum] = "0ee5f14fd8be07513d16131027ebcb61"
>  SRC_URI[archive.sha256sum] = "fc609cc6a0ddaa2a9ebd8511ec39ae4a404e1107a12e07b233e2afca51d9a10e"
>  
> @@ -27,7 +33,6 @@ require firefox.inc
>  
>  EXTRA_OECONF += " --enable-official-branding --disable-crashreporter"
>  
> -
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
>  
>  do_compile_prepend() {

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMnG+ZMkyGM64RGpERAlGPAJ9LJDt3FaorSyz2dxXKRQvkfL3wswCfSZti
Yuat0TEmpZDAFB1B8cFFJgk=
=TqoI
-----END PGP SIGNATURE-----



