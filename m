Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id B83956B069
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2014 07:44:53 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e51so5246970eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 23:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i/bAmSQs0O/+fVgcKLtIU6J5LZvWFCdtNBWqBP2K36A=;
	b=ZIMvRNLxW2u8x3819A0XuFJLxsCwzzCF9YzM2hHMIFJMBlxNzp+VcG/VF8rIY7rlTt
	/HLFeVf1OlNUNK/ekrMzVhDMQYASkzmYbjNygOKa9YX45qRi/ZBa8nQmAbmKM4kmnRRd
	SNov0Gos31+IEryoBRIQKow+oRwiMeLn6kBd16vUwDSac/BEbVoH7Ggwensx458/fw+v
	pMjcLDb3PXDUS4qIAl8fY5AR9jSPLoJJSqrKjIqJQiUpsbC5kRG/IDkLc8EixvsJUx0t
	405cq51FoHDGAzLZjS8gPlFp+S09inQGiHNi2c9sIxM7iAKWjdW5qp4GtYlf6B1jNzzv
	b2LQ==
X-Received: by 10.14.199.1 with SMTP id w1mr67207832een.29.1388648693701;
	Wed, 01 Jan 2014 23:44:53 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm133592861eef.16.2014.01.01.23.44.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 23:44:52 -0800 (PST)
Date: Thu, 2 Jan 2014 08:44:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140102074455.GB3717@jama>
References: <1387298449-20000-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <1387298449-20000-1-git-send-email-andrei@gherzan.ro>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Alexandru Niculita <alexnick87@gmail.com>
Subject: Re: [meta-multimedia][PATCH 1/1] xbmc: Update to v12.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jan 2014 07:44:55 -0000
X-Groupsio-MsgNum: 47562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2013 at 06:40:49PM +0200, Andrei Gherzan wrote:
> * exported TEXTUREPACKER_NATIVE_ROOT variable to compile
> TexturePacker using native sysroot
> * added libsdl-image-native needed by TexturePacker
> * added missing dependency on taglib
> * remove already merged patches
> * define PACKAGECONFIG for sdl, airplay and ssh configuration
> * have above PACKAGECONFIG values activated by default
> * use internal ffmpeg - there are some known issues while compiling
> with external libav
> * define use_arch to be passed to internal ffmpeg configuration
> script
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> Change-Id: I538f4907a9d1dd5df31648bfb60a18cacfed9d69
> ---
>  ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch | 118 ++++++++++-----=
------
>  ...d-ios-Add-memory-barriers-to-cas-assembly.patch |  82 +++++++-------
>  ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |  43 --------
>  .../xbmc/configure.in-Avoid-running-code.patch     |  32 ------
>  .../xbmc/{xbmc_git.bb =3D> xbmc_12.2.bb}             |  27 +++--
>  5 files changed, 108 insertions(+), 194 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-co=
nfigure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
>  delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/configu=
re.in-Avoid-running-code.patch
>  rename meta-multimedia/recipes-mediacentre/xbmc/{xbmc_git.bb =3D> xbmc_1=
2.2.bb} (74%)
>=20
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fi=
xed-ios-Add-memory-barriers-to-atomic-Add-S.patch b/meta-multimedia/recipes=
-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-=
Add-S.patch
> index e0a4037..d3ae75e 100644
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios=
-Add-memory-barriers-to-atomic-Add-S.patch
> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios=
-Add-memory-barriers-to-atomic-Add-S.patch
> @@ -24,74 +24,68 @@ The build (OpenEmbedded `angstrom-2010.x` for `MACHIN=
E =3D "beagleboard") fails wi
>          make[1]: *** [Atomics.o] Error 1
>          make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev=
/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e=
39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
>          make: *** [xbmc/threads/threads.a] Error 2
> ----
> - xbmc/threads/Atomics.cpp |    8 --------
> - 1 files changed, 0 insertions(+), 8 deletions(-)
> =20
> -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
> -index 5b09f18..0a98a7e 100644
> ---- a/xbmc/threads/Atomics.cpp
> -+++ b/xbmc/threads/Atomics.cpp
> -@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
> - {
> +Index: git/xbmc/threads/Atomics.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/xbmc/threads/Atomics.cpp
> ++++ git/xbmc/threads/Atomics.cpp
> +@@ -168,14 +166,12 @@ long AtomicIncrement(volatile long* pAdd
> + #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
>     register long val;
>     asm volatile (
> --                "dmb      ish            \n" // Memory barrier. Make su=
re all memory accesses appearing before this complete before any that appea=
r after
> -                 "1:                     \n"=20
> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> -                 "add     %0,  #1        \n" // (val +=3D 1)
> -                 "strex   r1,  %0, [%1]	\n"
> -                 "cmp     r1,   #0       \n"
> -                 "bne     1b             \n"
> --                "dmb     ish            \n" // Memory barrier.
> -                 : "=3D&r" (val)
> -                 : "r"(pAddr)
> -                 : "r1"
> -@@ -273,14 +271,12 @@ long AtomicAdd(volatile long* pAddr, long amount)
> - {
> +-    "dmb      ish            \n" // Memory barrier. Make sure all memor=
y accesses appearing before this complete before any that appear after
> +     "1:                     \n"=20
> +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> +     "add     %0,  #1        \n" // (val +=3D 1)
> +     "strex   r1,  %0, [%1]	\n"
> +     "cmp     r1,   #0       \n"
> +     "bne     1b             \n"
> +-    "dmb     ish            \n" // Memory barrier.
> +     : "=3D&r" (val)
> +     : "r"(pAddr)
> +     : "r1"
> +@@ -246,14 +242,12 @@ long AtomicAdd(volatile long* pAddr, lon
> + #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
>     register long val;
>     asm volatile (
> --                "dmb      ish            \n" // Memory barrier. Make su=
re all memory accesses appearing before this complete before any that appea=
r after
> -                 "1:                     \n"=20
> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> -                 "add     %0,  %2        \n" // (val +=3D amount)
> -                 "strex   r1,  %0, [%1]	\n"
> -                 "cmp     r1,   #0       \n"
> -                 "bne     1b             \n"
> --                "dmb     ish            \n" // Memory barrier.
> -                 : "=3D&r" (val)
> -                 : "r"(pAddr), "r"(amount)
> -                 : "r1"
> -@@ -351,14 +347,12 @@ long AtomicDecrement(volatile long* pAddr)
> - {
> +-    "dmb      ish           \n" // Memory barrier. Make sure all memory=
 accesses appearing before this complete before any that appear after
> +   "1:                       \n"=20
> +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> +     "add     %0,  %2        \n" // (val +=3D amount)
> +     "strex   r1,  %0, [%1]	\n"
> +     "cmp     r1,   #0       \n"
> +     "bne     1b             \n"
> +-    "dmb     ish            \n" // Memory barrier.
> +     : "=3D&r" (val)
> +     : "r"(pAddr), "r"(amount)
> +     : "r1"
> +@@ -324,14 +318,12 @@ long AtomicDecrement(volatile long* pAdd
> + #elif defined(__arm__)
>     register long val;
>     asm volatile (
> --                "dmb      ish            \n" // Memory barrier. Make su=
re all memory accesses appearing before this complete before any that appea=
r after
> -                 "1:                     \n"=20
> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> -                 "sub     %0,  #1        \n" // (val -=3D 1)
> -                 "strex   r1,  %0, [%1]	\n"
> -                 "cmp     r1,   #0       \n"
> -                 "bne     1b             \n"
> --                "dmb     ish            \n" // Memory barrier.
> -                 : "=3D&r" (val)
> -                 : "r"(pAddr)
> -                 : "r1"
> -@@ -431,14 +425,12 @@ long AtomicSubtract(volatile long* pAddr, long amo=
unt)
> - {
> +-    "dmb      ish           \n" // Memory barrier. Make sure all memory=
 accesses appearing before this complete before any that appear after
> +     "1:                     \n"=20
> +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> +     "sub     %0,  #1        \n" // (val -=3D 1)
> +     "strex   r1,  %0, [%1]	\n"
> +     "cmp     r1,   #0       \n"
> +     "bne     1b             \n"
> +-    "dmb     ish            \n" // Memory barrier.
> +     : "=3D&r" (val)
> +     : "r"(pAddr)
> +     : "r1"
> +@@ -403,14 +395,12 @@ long AtomicSubtract(volatile long* pAddr
> + #elif defined(__arm__)
>     register long val;
>     asm volatile (
> --                "dmb     ish            \n" // Memory barrier. Make sur=
e all memory accesses appearing before this complete before any that appear=
 after
> -                 "1:                     \n"=20
> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> -                 "sub     %0,  %2        \n" // (val -=3D amount)
> -                 "strex   r1,  %0, [%1]	\n"
> -                 "cmp     r1,   #0       \n"
> -                 "bne     1b             \n"
> --                "dmb     ish            \n" // Memory barrier.
> -                 : "=3D&r" (val)
> -                 : "r"(pAddr), "r"(amount)
> -                 : "r1"
> ---=20
> -1.7.2.5
> -
> +-    "dmb     ish            \n" // Memory barrier. Make sure all memory=
 accesses appearing before this complete before any that appear after
> +     "1:                     \n"=20
> +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> +     "sub     %0,  %2        \n" // (val -=3D amount)
> +     "strex   r1,  %0, [%1]	\n"
> +     "cmp     r1,   #0       \n"
> +     "bne     1b             \n"
> +-    "dmb     ish            \n" // Memory barrier.
> +     : "=3D&r" (val)
> +     : "r"(pAddr), "r"(amount)
> +     : "r1"
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fi=
xed-ios-Add-memory-barriers-to-cas-assembly.patch b/meta-multimedia/recipes=
-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-ass=
embly.patch
> index 629017b..f93fa9e 100644
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios=
-Add-memory-barriers-to-cas-assembly.patch
> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios=
-Add-memory-barriers-to-cas-assembly.patch
> @@ -16,54 +16,50 @@ The build (OpenEmbedded `angstrom-2010.x` for `MACHIN=
E =3D "beagleboard") fails wi
>          make[1]: *** [Atomics.o] Error 1
>          make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev=
/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d1728=
79995b50985645b77fecd2/git/xbmc/threads'
>          make: *** [xbmc/threads/threads.a] Error 2
> ----
> - xbmc/threads/Atomics.cpp |   33 ++++++++++++++++-----------------
> - 1 files changed, 16 insertions(+), 17 deletions(-)
> -
> -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
> -index 0a98a7e..0967eb2 100644
> ---- a/xbmc/threads/Atomics.cpp
> -+++ b/xbmc/threads/Atomics.cpp
> -@@ -49,23 +49,22 @@ long cas(volatile long *pAddr, long expectedVal, lon=
g swapVal)
> - #elif defined(__arm__)
> - long cas(volatile long* pAddr, long expectedVal, long swapVal)
> - {
> +Index: git/xbmc/threads/Atomics.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/xbmc/threads/Atomics.cpp
> ++++ git/xbmc/threads/Atomics.cpp
> +@@ -43,24 +43,24 @@ long cas(volatile long *pAddr, long expe
> +     : "cc", "memory");                              /* Clobbers */
> +   return prev;
> +=20
> +-#elif defined(__arm__)
>  -  register long prev;
>  -  asm volatile (
> --                "dmb      ish            \n" // Memory barrier. Make su=
re all memory accesses appearing before this complete before any that appea=
r after
> --                "1:                      \n"
> --                "ldrex    %0, [%1]       \n" // Load the current value =
of *pAddr(%1) into prev (%0) and lock pAddr,
> --                "cmp      %0,  %2        \n" // Verify that the current=
 value (%0) =3D=3D old value (%2)
> --                "bne      2f             \n" // Bail if the two values =
are not equal [not as expected]
> --                "strex    r1,  %3, [%1]  \n"
> --                "cmp      r1,  #0        \n"
> --                "bne      1b             \n"
> --                "dmb      ish            \n" // Memory barrier.
> --                "2:                      \n"
> --                : "=3D&r" (prev)
> --                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> --                : "r1"
> --                );
> +-    "dmb      ish            \n" // Memory barrier. Make sure all memor=
y accesses appearing before this complete before any that appear after
> +-    "1:                      \n"
> +-    "ldrex    %0, [%1]       \n" // Load the current value of *pAddr(%1=
) into prev (%0) and lock pAddr,
> +-    "cmp      %0,  %2        \n" // Verify that the current value (%0) =
=3D=3D old value (%2)
> +-    "bne      2f             \n" // Bail if the two values are not equa=
l [not as expected]
> +-    "strex    r1,  %3, [%1]  \n"
> +-    "cmp      r1,  #0        \n"
> +-    "bne      1b             \n"
> +-    "dmb      ish            \n" // Memory barrier.
> +-    "2:                      \n"
> +-    : "=3D&r" (prev)
> +-    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> +-    : "r1"
> +-    );
>  -  return prev;
> -+  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVal));
> ++//#elif defined(__arm__)
>  +//  register long prev;
>  +//  asm volatile (
> -+//                "1:                      \n"
> -+//                "ldrex    %0, [%1]       \n" /* Load the current valu=
e of *pAddr(%1) into prev (%0) and lock pAddr,  */
> -+//                "cmp      %0,  %2        \n" /* Verify that the curre=
nt value (%0) =3D=3D old value (%2) */
> -+//                "bne      2f             \n" /* Bail if the two value=
s are not equal [not as expected] */
> -+//                "strex    r1,  %3, [%1]  \n"
> -+//                "cmp      r1,  #0        \n"               =20
> -+//                "bne      1b             \n"
> -+//                "2:                        "
> -+//                : "=3D&r" (prev)
> -+//                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> -+//                : "r1"
> -+//                );
> ++//    "dmb      ish            \n" // Memory barrier. Make sure all mem=
ory accesses appearing before this complete before any that appear after
> ++//    "1:                      \n"
> ++//    "ldrex    %0, [%1]       \n" // Load the current value of *pAddr(=
%1) into prev (%0) and lock pAddr,
> ++//    "cmp      %0,  %2        \n" // Verify that the current value (%0=
) =3D=3D old value (%2)
> ++//    "bne      2f             \n" // Bail if the two values are not eq=
ual [not as expected]
> ++//    "strex    r1,  %3, [%1]  \n"
> ++//    "cmp      r1,  #0        \n"
> ++//    "bne      1b             \n"
> ++//    "dmb      ish            \n" // Memory barrier.
> ++//    "2:                      \n"
> ++//    : "=3D&r" (prev)
> ++//    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> ++//    : "r1"
> ++//    );
>  +//  return prev;
> - }
>  =20
>   #elif defined(__mips__)
> ---=20
> -1.7.2.5
> -
> + // TODO:
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure=
-cope-with-ld-is-gold-DISTRO_FEATURE.patch b/meta-multimedia/recipes-mediac=
entre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
> deleted file mode 100644
> index 345e20e..0000000
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-w=
ith-ld-is-gold-DISTRO_FEATURE.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From fd8f73826240aae543a41a2bfeea0056e2fe594d Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Mon, 11 Mar 2013 11:04:29 +0100
> -Subject: [PATCH] configure: cope with ld-is-gold DISTRO_FEATURE
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> -
> -Upstream-Stature: backport
> -
> - configure.in |   12 +++++++-----
> - 1 files changed, 7 insertions(+), 5 deletions(-)
> -
> -diff --git a/configure.in b/configure.in
> -index ef94683..c8b459b 100755
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -18,9 +18,14 @@ tolower(){
> - # check for library basenames
> - AC_DEFUN([XB_FIND_SONAME],
> - [
> -+  #set -x
> -   if [[ "$host_vendor" !=3D "apple" ]]; then
> -     AC_MSG_CHECKING([for lib$2 soname])
> -     $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-M 2>/=
dev/null | grep "^LOAD.*$2" | awk '{V=3D2; print $V}')
> -+    if [[ -z $$1_FILENAME ]]; then
> -+      #try gold linker syntax
> -+      $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-t 3=
>&1 1>&2 2>&3 | grep "$2")
> -+    fi
> -     if [[ ! -z $$1_FILENAME ]]; then
> -       $1_SONAME=3D$(objdump -p $$1_FILENAME | grep "SONAME.*$2" | awk '=
{V=3D2; print $V}')
> -     fi
> -@@ -55,6 +60,7 @@ AC_DEFUN([XB_FIND_SONAME],
> -     AC_MSG_RESULT([$$1_SONAME])
> -     AC_SUBST($1_SONAME)
> -   fi
> -+  #set +x
> - ])
> -=20
> - # Function to push and pop libs and includes for a command
> ---=20
> -1.7.7.6
> -
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-A=
void-running-code.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/con=
figure.in-Avoid-running-code.patch
> deleted file mode 100644
> index 5c14059..0000000
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-ru=
nning-code.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From cfd851660a594801a591e80dc820c65cb7bd7836 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Sat, 6 Oct 2012 06:40:03 -0300
> -Subject: [PATCH] configure.in: Avoid running code or we break cross-comp=
ile
> -
> -Upstream-Status: Backport [similar change done for 12.0]
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - configure.in |    6 +-----
> - 1 files changed, 1 insertions(+), 5 deletions(-)
> -
> -diff --git a/configure.in b/configure.in
> -index ef94683..d7efcb0 100755
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1246,11 +1246,7 @@ if test "$use_external_ffmpeg" =3D "yes"; then
> -   AC_DEFINE([USE_EXTERNAL_FFMPEG], [1], [Whether to use external FFmpeg=
 libraries.])
> -=20
> -   # Disable vdpau support if external libavcodec doesn't have it
> --  AC_RUN_IFELSE(
> --    AC_LANG_PROGRAM([[#include <libavcodec/avcodec.h>]],
> --      [[avcodec_register_all();
> --        AVCodec *codec =3D avcodec_find_decoder_by_name("vc1_vdpau");
> --        return (codec) ? 0 : 1;]]),,
> -+  AC_CHECK_LIB([avcodec], [ff_vdpau_vc1_decode_picture],,
> -     [if test "x$use_vdpau" =3D "xyes"; then
> -       AC_MSG_ERROR($ffmpeg_vdpau_not_supported)
> -     else
> ---=20
> -1.7.2.5
> -
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-=
multimedia/recipes-mediacentre/xbmc/xbmc_12.2.bb
> similarity index 74%
> rename from meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> rename to meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.bb
> index 2316fb7..a3adeac 100644
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.bb
> @@ -3,20 +3,14 @@ DESCRIPTION =3D "XBMC Media Center"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a80213=
ffc35ff"
> =20
> -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu frib=
idi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicro=
httpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mys=
ql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate=
0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib=
 libtinyxml libmad"
> +DEPENDS =3D "libusb1 libcec expat yajl gperf-native libxmu fribidi mpeg2=
dec samba fontconfig curl python libass libmodplug libmicrohttpd wavpack li=
bmms cmake-native virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre b=
oost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 jasp=
er zip-native zlib libtinyxml libmad taglib libsdl-image-native"
>  #require recipes/egl/egl.inc
> =20
> -
> -SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
> -
> -PV =3D "11.0+gitr${SRCPV}"
> -PR =3D "r14"
> -SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Deden \
> +SRCREV =3D "32b1a5ef9e7f257a2559a3b766e85a55b22aec5f"
> +SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Dfrodo \

WARNING: Failed to fetch URL
git://github.com/xbmc/xbmc.git;branch=3Dfrodo, attempting MIRRORS if
available
ERROR: Fetcher failure: Unable to find revision
32b1a5ef9e7f257a2559a3b766e85a55b22aec5f in branch frodo even from
upstream
ERROR: Function failed: Fetcher failure for URL:
'git://github.com/xbmc/xbmc.git;branch=3Dfrodo'. Unable to fetch URL from
any source.


>             file://0001-configure-don-t-run-python-distutils-to-find-STAG=
ING.patch \
>             file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Ad=
d-S.patch \
>             file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assem=
bly.patch \
> -           file://0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.pat=
ch \
> -           file://configure.in-Avoid-running-code.patch \
>  "
> =20
>  inherit autotools gettext python-dir
> @@ -30,18 +24,20 @@ CACHED_CONFIGUREVARS +=3D " \
>      ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" \
>  "
> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'open=
gl', 'openglesv2', d)}"
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'open=
gl', 'openglesv2', d)} sdl airplay ssh"
>  PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,glew"
>  PACKAGECONFIG[openglesv2] =3D "--enable-gles,--enable-gl,"
> +PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl-mixer libsdl-i=
mage"
> +PACKAGECONFIG[airplay] =3D "--enable-airplay,--disable-airplay,libplist"
> +PACKAGECONFIG[ssh] =3D "--enable-ssh,--disable-ssh,libssh"
> =20
>  EXTRA_OECONF =3D " \
> -    --disable-rpath \
>      --enable-libusb \
> -    --enable-airplay \
>      --disable-optical-drive \
>      --enable-external-libraries \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enab=
le-gles', d)} \
> -"
> +    --disable-external-ffmpeg \
> +    --with-arch=3D${TARGET_ARCH} \
> +    "
> =20
>  FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-poi=
nter -O4 -ffast-math"
>  BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> @@ -55,6 +51,9 @@ export STAGING_LIBDIR
>  export STAGING_INCDIR
>  export PYTHON_DIR
> =20
> +#Needed by TexturePacker to compile it using native sysroot
> +export TEXTUREPACKER_NATIVE_ROOT =3D "${STAGING_DIR_NATIVE}/usr"
> +
>  do_configure() {
>      sh bootstrap
>      oe_runconf
> --=20
> 1.8.1.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLFGPcACgkQN1Ujt2V2gBxiOgCbBAm1WqA0vaW+Xbn+CzfNOwRZ
kNYAnAgh0gHvBy3fSzZwVVNw4xOnSR3d
=bU8e
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
