Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id ECD8360CFC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 17:37:29 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so3391911lbj.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 10:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RI2jfTrHjjPslcAM1rL+79NHqwPzddwS1zq5WSDFiQk=;
	b=cy1IKFuntNCTbu5/yFSiLKtSB+522j1pR7a8N8B+Y8dO/5OyuwZtsoWDHE1EC+fXN6
	WkB/ot4OmKq0/s1J7qQJkdDm3/gJ0i5xPTW1hCgTW+dR1XQWGrXuhhmqGPc65A3Z0dj4
	D9JngwJL39Km6HGUYT7LFhh1VvdTaXBKbmJhwYN+UHY9iJAWMtva2ibkitDQDXGsqkFT
	yV5EsObrQhM1JiIbKWiQhZTTpISqZXpRINVaxgnqJTW6DeAbgliDG50b91DAdXBPM0ZW
	L9BtyBwRd9kAllIqlIn3lwJdbvDMVkqcwSbhFmbRlMp3UIS2pAleWm8Zl9wjELO4PoMz
	t2vA==
X-Received: by 10.152.27.66 with SMTP id r2mr24636313lag.34.1408297049833;
	Sun, 17 Aug 2014 10:37:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kh9sm23167987lbc.5.2014.08.17.10.37.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Aug 2014 10:37:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 17 Aug 2014 19:37:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140817173728.GG3660@jama>
References: <1408291083-3690-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <1408291083-3690-1-git-send-email-andrei@gherzan.ro>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-multimedia][PATCH 1/1] xbmc: Update to v13.1
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
X-List-Received-Date: Sun, 17 Aug 2014 17:37:34 -0000
X-Groupsio-MsgNum: 51731
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAgJxtfIS94j9H4T"
Content-Disposition: inline

--uAgJxtfIS94j9H4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2014 at 05:58:03PM +0200, Andrei Gherzan wrote:
> * refactor dependencies
> * remove already merged patches
> * define PACKAGECONFIG for different configurations
> * have above PACKAGECONFIG values activated by default
> * various cleanups and refactoring
> * use internal ffmpeg - there are some known issues while compiling
> with external libav
> * define --with-arch to be passed to internal ffmpeg configuration
> script
> * add support for qemuarm
>=20
> Tested on Fedora 20 host using poky + meta-oe master:
> 1. build only qemux86
> 2. build only qemuarm
> 3. build and runtime test raspberrypi - (patches to come).
>=20
> This patch depends on two other patches:
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/09=
7729.html
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/09=
7730.html
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> Change-Id: I538f4907a9d1dd5df31648bfb60a18cacfed9d69
> ---
>  ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch | 118 ++++++++++-----=
------
>  ...d-ios-Add-memory-barriers-to-cas-assembly.patch |  82 +++++++-------
>  .../xbmc/xbmc/0004-Support-for-qemuarm.patch       | 104 +++++++++++++++=
+++
>  ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |  43 --------
>  .../xbmc/configure.in-Avoid-running-code.patch     |  32 ------
>  .../recipes-mediacentre/xbmc/xbmc_13.1.bb          | 114 +++++++++++++++=
+++++
>  .../recipes-mediacentre/xbmc/xbmc_git.bb           |  99 ---------------=
--
>  7 files changed, 313 insertions(+), 279 deletions(-)
>  create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Su=
pport-for-qemuarm.patch
>  delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-co=
nfigure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
>  delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/configu=
re.in-Avoid-running-code.patch
>  create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
>  delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
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
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-f=
or-qemuarm.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Suppo=
rt-for-qemuarm.patch
> new file mode 100644
> index 0000000..48f3d29
> --- /dev/null
> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemu=
arm.patch
> @@ -0,0 +1,104 @@
> +From 54ce0e5fef8d8f4a374eb9df68c22781f989b52d Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@windriver.com>
> +Date: Sun, 17 Aug 2014 14:47:36 +0200
> +Subject: [PATCH] Add support for qemuarm
> +
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +---
> + configure.in           | 17 +++++++++++++++++
> + m4/xbmc_arch.m4        |  3 +++
> + xbmc/utils/MathUtils.h |  6 ++++--
> + 3 files changed, 24 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index a195d00..6e2d432 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -231,6 +231,12 @@ AC_ARG_ENABLE([neon],
> +   [use_neon=3D$enableval],
> +   [use_neon=3Dno])
> +=20
> ++AC_ARG_ENABLE([vfp],
> ++  [AS_HELP_STRING([--enable-vfp],
> ++  [enable vfp passing to ffmpeg (default is yes)])],
> ++  [use_vfp=3D$enableval],
> ++  [use_vfp=3Dyes])
> ++
> + AC_ARG_ENABLE([optimizations],
> +   [AS_HELP_STRING([--enable-optimizations],
> +   [enable optimization (default is yes)])],
> +@@ -750,6 +756,11 @@ case $use_platform in
> +      CXXFLAGS=3D"$CXXFLAGS"
> +      ffmpeg_target_os=3Dlinux
> +      ;;
> ++  qemuarm)
> ++     use_arch=3D"arm"
> ++     use_neon=3Dno
> ++     use_vfp=3Dno
> ++     ;;
> + esac
> +=20
> + XBMC_SETUP_ARCH_DEFINES()
> +@@ -2757,6 +2768,11 @@ XB_CONFIG_MODULE([lib/ffmpeg], [
> +       else
> +         ffmpg_config=3D"$ffmpg_config --disable-neon"
> +       fi
> ++      if test "$use_vfp"  =3D "yes"; then
> ++        ffmpg_config=3D"$ffmpg_config --enable-vfp"
> ++      else
> ++        ffmpg_config=3D"$ffmpg_config --disable-vfp"
> ++      fi
> +     else
> +       ffmpg_config=3D"$ffmpg_config --disable-amd3dnow"
> +     fi
> +@@ -2815,6 +2831,7 @@ XB_CONFIG_MODULE([lib/ffmpeg], [
> +       `if test "$use_arch" !=3D "no"; then echo --arch=3D$use_arch; fi`\
> +       `if test "$use_cpu" !=3D "no"; then echo --cpu=3D$use_cpu; fi`\
> +       `if test "$use_neon" =3D "yes"; then echo --enable-neon; else ech=
o --disable-neon; fi`\
> ++      `if test "$use_vfp" =3D "yes"; then echo --enable-vfp; else echo =
--disable-vfp; fi`\
> +       --target-os=3D$ffmpeg_target_os \
> +       --disable-muxers \
> +       --enable-muxer=3Dspdif \
> +diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
> +index 5bcdd81..f349cb2 100644
> +--- a/m4/xbmc_arch.m4
> ++++ b/m4/xbmc_arch.m4
> +@@ -47,5 +47,8 @@ case $use_platform in
> +   raspberry-pi)
> +      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_=
ARMEL -DTARGET_RASPBERRY_PI")
> +      ;;
> ++  qemuarm)
> ++     AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -DT=
ARGET_QEMUARM")
> ++     ;;
> + esac
> + ])
> +diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
> +index 96af9f4..69fd058 100644
> +--- a/xbmc/utils/MathUtils.h
> ++++ b/xbmc/utils/MathUtils.h
> +@@ -36,7 +36,8 @@
> +     defined(__powerpc__) || \
> +    (defined(TARGET_DARWIN_IOS) && defined(__llvm__)) || \
> +    (defined(TARGET_ANDROID) && defined(__arm__)) || \
> +-    defined(TARGET_RASPBERRY_PI)
> ++    defined(TARGET_RASPBERRY_PI) || \
> ++    defined(TARGET_QEMUARM)
> +   #define DISABLE_MATHUTILS_ASM_ROUND_INT
> + #endif
> +=20
> +@@ -44,7 +45,8 @@
> +     defined(__powerpc__) || \
> +    (defined(TARGET_DARWIN) && defined(__llvm__)) || \
> +    (defined(TARGET_ANDROID) && defined(__arm__)) || \
> +-    defined(TARGET_RASPBERRY_PI)
> ++    defined(TARGET_RASPBERRY_PI) || \
> ++    defined(TARGET_QEMUARM)
> +   #define DISABLE_MATHUTILS_ASM_TRUNCATE_INT
> + #endif
> +=20
> +--=20
> +1.9.3
> +
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
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb b/meta=
-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> new file mode 100644
> index 0000000..9a46d50
> --- /dev/null
> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> @@ -0,0 +1,114 @@
> +SUMMARY =3D "XBMC Media Center"
> +DESCRIPTION =3D "XBMC is an award-winning free and open source (GPL) sof=
tware \
> +media player and entertainment hub that can be installed on Linux, OSX, \
> +Windows, iOS, and Android, featuring a 10-foot user interface for use wi=
th \
> +televisions and remote controls."
> +HOMEPAGE =3D "http://xbmc.org/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a80213=
ffc35ff"
> +
> +DEPENDS =3D "yajl libxmu fribidi mpeg2dec curl python libmodplug libmicr=
ohttpd \
> +           sqlite3 libcdio libpcre boost lzo taglib libtinyxml jasper li=
bass \
> +           libmad jpeg libsamplerate0 libvorbis tiff libxslt libgpg-erro=
r \
> +           libsdl virtual/egl swig-native gperf-native unzip-native zip-=
native"
> +
> +DEPENDS_append_arm =3D " cmake-native"
> +DEPENDS_append_x86 =3D " nasm-native"
> +
> +CODENAME =3D "Gotham"
> +SRCREV =3D "84725b0b1df072aecd26a55b82ef50ec828e595b"
> +SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3D${CODENAME} \
> +           file://0001-configure-don-t-run-python-distutils-to-find-STAG=
ING.patch \
> +           file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Ad=
d-S.patch \
> +           file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assem=
bly.patch \
> +           file://0004-Support-for-qemuarm.patch"
> +
> +inherit autotools-brokensep gettext python-dir
> +
> +S =3D "${WORKDIR}/git"
> +
> +# Don't activate texturepacker as it needs libsdl-image-native. Due to s=
ome issues
> +# with qemu we use the host's libsdl on which libsdl-image-native depend=
s.
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'open=
gl', 'opengles2', d)} \
> +                   sdl airplay ssh libusb libcec samba mysql avahi xrand=
r x11 joystick \
> +                   mid rtmp libmp3lame optical-drive debug"
> +
> +PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,glew"
> +PACKAGECONFIG[opengles2] =3D "--enable-gles,--enable-gl,"
> +PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl-mixer libsdl-i=
mage"
> +PACKAGECONFIG[airplay] =3D "--enable-airplay,--disable-airplay,libplist"
> +PACKAGECONFIG[ssh] =3D "--enable-ssh,--disable-ssh,libssh"
> +PACKAGECONFIG[libcec] =3D "--enable-libcec,--disable-libcec,libcec"
> +PACKAGECONFIG[libusb] =3D "--enable-libusb,--disable-libusb,libusb"
> +PACKAGECONFIG[samba] =3D "--enable-samba,--disable-samba,samba"
> +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5"
> +PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
> +PACKAGECONFIG[xrandr] =3D "--enable-xrandr,--disable-xrandr,libxrandr"
> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,"
> +PACKAGECONFIG[joystick] =3D "--enable-joystick,--disable-joystick,"
> +PACKAGECONFIG[texturepacker] =3D "--enable-texturepacker,--disable-textu=
repacker,libsdl-image-native"
> +PACKAGECONFIG[mid] =3D "--enable-mid,--disable-mid,"
> +PACKAGECONFIG[rtmp] =3D "--enable-rtmp,--disable-rtmp,rtmpdump"
> +PACKAGECONFIG[optical-drive] =3D "--enable-optical-drive,--disable-optic=
al-drive,libcdio"
> +PACKAGECONFIG[libmp3lame] =3D "--enable-libmp3lame,--disable-libmp3lame,=
lame"
> +PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug,"
> +
> +EXTRA_OECONF_append_qemuarm =3D " --with-platform=3Dqemuarm "

It isn't MACHINE_ARCH, why not disable vfp for all MACHINEs
(TUNE_PKGARGs) without vfp in TUNE_FEATURES?

> +EXTRA_OECONF_append =3D " \
> +    --enable-external-libraries \
> +    --with-arch=3D${TARGET_ARCH} \
> +    "
> +
> +FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-poi=
nter -O4 -ffast-math"
> +BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> +
> +EXTRA_OECONF_append_armv7a =3D "--with-cpu=3Dcortex-a8"
> +
> +CACHED_CONFIGUREVARS +=3D " \
> +    ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" \
> +"
> +
> +# for python modules
> +export HOST_SYS
> +export BUILD_SYS
> +export STAGING_LIBDIR
> +export STAGING_INCDIR
> +export PYTHON_DIR
> +
> +do_configure() {
> +    sh bootstrap
> +    oe_runconf
> +}
> +
> +# On ARM don't run GL/X11 tests in xbmc shell wrapper as xbmc uses GLES
> +do_configure_prepend_arm() {
> +    sed -i '/FEH.py/ s/$/ --no-test/' ${S}/tools/Linux/xbmc.sh.in
> +}
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/xsessions \
> +    ${datadir}/icons"
> +FILES_${PN}-dbg +=3D " \
> +    ${libdir}/xbmc/.debug \
> +    ${libdir}/xbmc/*/.debug \
> +    ${libdir}/xbmc/*/*/.debug \
> +    ${libdir}/xbmc/*/*/*/.debug \
> +    "
> +
> +# XBMC uses some kind of dlopen() method for libcec so we need to add it=
 manually.
> +# XBMC wrapper calls xdpyinfo.
> +# OpenGL builds need glxinfo, that's in mesa-demos.
> +# service.py and other python tools need a couple of additional modules.
> +RRECOMMENDS_${PN}_append =3D " \
> +    libcec \
> +    libcurl \
> +    ${@base_contains('DISTRO_FEATURES', 'x11', 'xdpyinfo', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-demos', '', d)} \
> +    python python-stringold python-codecs python-re python-lang python-n=
etclient\
> +    "
> +
> +RRECOMMENDS_${PN}_append_libc-glibc =3D " \
> +    glibc-charmap-ibm850 glibc-charmap-utf-8 \
> +    glibc-gconv-ibm85 glibc-gconv-utf-32 \
> +    "
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-=
multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> deleted file mode 100644
> index 4b65152..0000000
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -SUMMARY =3D "XBMC Media Center"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a80213=
ffc35ff"
> -
> -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu frib=
idi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicro=
httpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mys=
ql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate=
0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib=
 libtinyxml libmad"
> -#require recipes/egl/egl.inc
> -
> -
> -SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
> -
> -# multiple issues
> -PNBLACKLIST[xbmc] =3D "/usr/include/c++/ctime:70:11: error: '::gmtime' h=
as not been declared"
> -
> -PV =3D "11.0+gitr${SRCPV}"
> -PR =3D "r14"
> -SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3DEden \
> -           file://0001-configure-don-t-run-python-distutils-to-find-STAG=
ING.patch \
> -           file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Ad=
d-S.patch \
> -           file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assem=
bly.patch \
> -           file://0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.pat=
ch \
> -           file://configure.in-Avoid-running-code.patch \
> -"
> -
> -inherit autotools gettext python-dir
> -
> -S =3D "${WORKDIR}/git"
> -
> -# breaks compilation
> -CCACHE =3D ""
> -
> -CACHED_CONFIGUREVARS +=3D " \
> -    ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" \
> -"
> -
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'open=
gl', 'openglesv2', d)}"
> -PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,glew"
> -PACKAGECONFIG[openglesv2] =3D "--enable-gles,--enable-gl,"
> -
> -EXTRA_OECONF =3D " \
> -    --disable-rpath \
> -    --enable-libusb \
> -    --enable-airplay \
> -    --disable-optical-drive \
> -    --enable-external-libraries \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enab=
le-gles', d)} \
> -"
> -
> -FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-poi=
nter -O4 -ffast-math"
> -BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> -
> -EXTRA_OECONF_append_armv7a =3D "--cpu=3Dcortex-a8"
> -
> -# for python modules
> -export HOST_SYS
> -export BUILD_SYS
> -export STAGING_LIBDIR
> -export STAGING_INCDIR
> -export PYTHON_DIR
> -
> -do_configure() {
> -    sh bootstrap
> -    oe_runconf
> -}
> -
> -PARALLEL_MAKE =3D ""
> -
> -do_compile_prepend() {
> -    for i in $(find . -name "Makefile") ; do
> -        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
> -    done
> -
> -    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
> -        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$=
(libdir):-rpath ${libdir}:g' $i
> -    done
> -}
> -
> -INSANE_SKIP_${PN} =3D "rpaths"
> -
> -# on ARM architectures xbmc will use GLES which will make the regular wr=
apper fail, so start it directly
> -do_install_append_arm() {
> -    sed -i -e 's:Exec=3Dxbmc:Exec=3D${libdir}/xbmc/xbmc.bin:g' ${D}${dat=
adir}/applications/xbmc.desktop
> -}
> -
> -FILES_${PN} +=3D "${datadir}/xsessions ${datadir}/icons"
> -FILES_${PN}-dbg +=3D "${libdir}/xbmc/.debug ${libdir}/xbmc/*/.debug ${li=
bdir}/xbmc/*/*/.debug ${libdir}/xbmc/*/*/*/.debug"
> -
> -# xbmc uses some kind of dlopen() method for libcec so we need to add it=
 manually
> -# OpenGL builds need glxinfo, that's in mesa-demos
> -RRECOMMENDS_${PN}_append =3D " libcec \
> -                             python \
> -                             python-lang \
> -                             python-re \
> -                             python-netclient \
> -                             libcurl \
> -                             xdpyinfo \
> -                             ${@base_contains('DISTRO_FEATURES', 'opengl=
', 'mesa-demos', '', d)} \
> -"
> -RRECOMMENDS_${PN}_append_libc-glibc =3D " glibc-charmap-ibm850 glibc-gco=
nv-ibm850"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uAgJxtfIS94j9H4T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPw6FgACgkQN1Ujt2V2gBzzAACfbxx1AhJzzacYsC6MYGolEtrf
E2cAnjBZ9sVnu8kdeHLU+J+DSXEZY2Uf
=CQWc
-----END PGP SIGNATURE-----

--uAgJxtfIS94j9H4T--
