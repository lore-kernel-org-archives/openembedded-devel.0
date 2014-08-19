Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 74B2465DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 22:21:07 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so6983713wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 15:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tcOYqXRi4t7qExvqLMz8bs8+xS7UkM7V0S91ylqId0A=;
	b=M1K5JX9NQS5U3qC96srHRCDdOX1ArdadY8WD2Wzgsa7wIsg/Zb0wivDjr8McB8A6bk
	JRv3yWP6l532maTvE24exPc79iAZ2AUXse+R4TVHI/5RrYbx/M3Bon7myd1B6ow3RPoY
	g/eOF6s2RP1nwN7rp6lZEp/wX2o2XqI7FPtpy3/37YmjG2TCbAT3nyr/wQX6lvcfOWPJ
	m5I7uRsiMfY/aXkq2o7ciOAr3NoaIVHZz3ttP2DU/Qn0E0bJfhTRM8wWg/J54YRRKKT4
	WfXkzTi6V/RspNJro8lhQspMzbSfBEU46ZwaBqKbmgIgXVGUmx0hP7JO9nRXGVyRJes7
	69Qg==
X-Received: by 10.180.95.68 with SMTP id di4mr10219541wib.60.1408486868467;
	Tue, 19 Aug 2014 15:21:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eb4sm2513433wic.16.2014.08.19.15.21.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 15:21:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Aug 2014 00:21:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819222109.GW3660@jama>
References: <1408291083-3690-1-git-send-email-andrei@gherzan.ro>
	<20140817173728.GG3660@jama>
	<CAK18fxFoGifFVbMUAemLWJRw+jyzXrX_=Oe_jXdb5f7GssckMg@mail.gmail.com>
	<20140817192019.GI3660@jama>
	<CAK18fxGVNg+LzixR4Ejp5mqqKyyE1z3t0bgfdn+zKKxrgDiJyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxGVNg+LzixR4Ejp5mqqKyyE1z3t0bgfdn+zKKxrgDiJyQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Aug 2014 22:21:16 -0000
X-Groupsio-MsgNum: 51783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+mSjbC2tVdWE/Wop"
Content-Disposition: inline

--+mSjbC2tVdWE/Wop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2014 at 09:32:00PM +0200, Andrei Gherzan wrote:
> On Sun, Aug 17, 2014 at 9:20 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Sun, Aug 17, 2014 at 08:57:40PM +0200, Andrei Gherzan wrote:
> > > On Sun, Aug 17, 2014 at 7:37 PM, Martin Jansa <martin.jansa@gmail.com>
> > > wrote:
> > >
> > > > On Sun, Aug 17, 2014 at 05:58:03PM +0200, Andrei Gherzan wrote:
> > > > > * refactor dependencies
> > > > > * remove already merged patches
> > > > > * define PACKAGECONFIG for different configurations
> > > > > * have above PACKAGECONFIG values activated by default
> > > > > * various cleanups and refactoring
> > > > > * use internal ffmpeg - there are some known issues while compili=
ng
> > > > > with external libav
> > > > > * define --with-arch to be passed to internal ffmpeg configuration
> > > > > script
> > > > > * add support for qemuarm
> > > > >
> > > > > Tested on Fedora 20 host using poky + meta-oe master:
> > > > > 1. build only qemux86
> > > > > 2. build only qemuarm
> > > > > 3. build and runtime test raspberrypi - (patches to come).
> > > > >
> > > > > This patch depends on two other patches:
> > > > >
> > > >
> > http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/=
097729.html
> > > > >
> > > >
> > http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/=
097730.html
> > > > >
> > > > > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > > > > Change-Id: I538f4907a9d1dd5df31648bfb60a18cacfed9d69
> > > > > ---
> > > > >  ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch | 118
> > > > ++++++++++-----------
> > > > >  ...d-ios-Add-memory-barriers-to-cas-assembly.patch |  82
> > +++++++-------
> > > > >  .../xbmc/xbmc/0004-Support-for-qemuarm.patch       | 104
> > > > ++++++++++++++++++
> > > > >  ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |  43 --------
> > > > >  .../xbmc/configure.in-Avoid-running-code.patch     |  32 ------
> > > > >  .../recipes-mediacentre/xbmc/xbmc_13.1.bb          | 114
> > > > ++++++++++++++++++++
> > > > >  .../recipes-mediacentre/xbmc/xbmc_git.bb           |  99
> > > > -----------------
> > > > >  7 files changed, 313 insertions(+), 279 deletions(-)
> > > > >  create mode 100644
> > > >
> > meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuarm.=
patch
> > > > >  delete mode 100644
> > > >
> > meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-=
ld-is-gold-DISTRO_FEATURE.patch
> > > > >  delete mode 100644
> > > >
> > meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-runnin=
g-code.patch
> > > > >  create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/
> > > > xbmc_13.1.bb
> > > > >  delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/
> > xbmc_git.bb
> > > > >
> > > > > diff --git
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-A=
dd-memory-barriers-to-atomic-Add-S.patch
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-A=
dd-memory-barriers-to-atomic-Add-S.patch
> > > > > index e0a4037..d3ae75e 100644
> > > > > ---
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-A=
dd-memory-barriers-to-atomic-Add-S.patch
> > > > > +++
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-A=
dd-memory-barriers-to-atomic-Add-S.patch
> > > > > @@ -24,74 +24,68 @@ The build (OpenEmbedded `angstrom-2010.x` for
> > > > `MACHINE =3D "beagleboard") fails wi
> > > > >          make[1]: *** [Atomics.o] Error 1
> > > > >          make[1]: Leaving directory
> > > >
> > `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueab=
i/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/th=
reads'
> > > > >          make: *** [xbmc/threads/threads.a] Error 2
> > > > > ----
> > > > > - xbmc/threads/Atomics.cpp |    8 --------
> > > > > - 1 files changed, 0 insertions(+), 8 deletions(-)
> > > > >
> > > > > -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
> > > > > -index 5b09f18..0a98a7e 100644
> > > > > ---- a/xbmc/threads/Atomics.cpp
> > > > > -+++ b/xbmc/threads/Atomics.cpp
> > > > > -@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
> > > > > - {
> > > > > +Index: git/xbmc/threads/Atomics.cpp
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +--- git.orig/xbmc/threads/Atomics.cpp
> > > > > ++++ git/xbmc/threads/Atomics.cpp
> > > > > +@@ -168,14 +166,12 @@ long AtomicIncrement(volatile long* pAdd
> > > > > + #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
> > > > >     register long val;
> > > > >     asm volatile (
> > > > > --                "dmb      ish            \n" // Memory barrier.
> > Make
> > > > sure all memory accesses appearing before this complete before any =
that
> > > > appear after
> > > > > -                 "1:                     \n"
> > > > > -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > -                 "add     %0,  #1        \n" // (val +=3D 1)
> > > > > -                 "strex   r1,  %0, [%1]      \n"
> > > > > -                 "cmp     r1,   #0       \n"
> > > > > -                 "bne     1b             \n"
> > > > > --                "dmb     ish            \n" // Memory barrier.
> > > > > -                 : "=3D&r" (val)
> > > > > -                 : "r"(pAddr)
> > > > > -                 : "r1"
> > > > > -@@ -273,14 +271,12 @@ long AtomicAdd(volatile long* pAddr, long
> > amount)
> > > > > - {
> > > > > +-    "dmb      ish            \n" // Memory barrier. Make sure a=
ll
> > > > memory accesses appearing before this complete before any that appe=
ar
> > after
> > > > > +     "1:                     \n"
> > > > > +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > +     "add     %0,  #1        \n" // (val +=3D 1)
> > > > > +     "strex   r1,  %0, [%1]  \n"
> > > > > +     "cmp     r1,   #0       \n"
> > > > > +     "bne     1b             \n"
> > > > > +-    "dmb     ish            \n" // Memory barrier.
> > > > > +     : "=3D&r" (val)
> > > > > +     : "r"(pAddr)
> > > > > +     : "r1"
> > > > > +@@ -246,14 +242,12 @@ long AtomicAdd(volatile long* pAddr, lon
> > > > > + #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
> > > > >     register long val;
> > > > >     asm volatile (
> > > > > --                "dmb      ish            \n" // Memory barrier.
> > Make
> > > > sure all memory accesses appearing before this complete before any =
that
> > > > appear after
> > > > > -                 "1:                     \n"
> > > > > -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > -                 "add     %0,  %2        \n" // (val +=3D amount)
> > > > > -                 "strex   r1,  %0, [%1]      \n"
> > > > > -                 "cmp     r1,   #0       \n"
> > > > > -                 "bne     1b             \n"
> > > > > --                "dmb     ish            \n" // Memory barrier.
> > > > > -                 : "=3D&r" (val)
> > > > > -                 : "r"(pAddr), "r"(amount)
> > > > > -                 : "r1"
> > > > > -@@ -351,14 +347,12 @@ long AtomicDecrement(volatile long* pAddr)
> > > > > - {
> > > > > +-    "dmb      ish           \n" // Memory barrier. Make sure all
> > > > memory accesses appearing before this complete before any that appe=
ar
> > after
> > > > > +   "1:                       \n"
> > > > > +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > +     "add     %0,  %2        \n" // (val +=3D amount)
> > > > > +     "strex   r1,  %0, [%1]  \n"
> > > > > +     "cmp     r1,   #0       \n"
> > > > > +     "bne     1b             \n"
> > > > > +-    "dmb     ish            \n" // Memory barrier.
> > > > > +     : "=3D&r" (val)
> > > > > +     : "r"(pAddr), "r"(amount)
> > > > > +     : "r1"
> > > > > +@@ -324,14 +318,12 @@ long AtomicDecrement(volatile long* pAdd
> > > > > + #elif defined(__arm__)
> > > > >     register long val;
> > > > >     asm volatile (
> > > > > --                "dmb      ish            \n" // Memory barrier.
> > Make
> > > > sure all memory accesses appearing before this complete before any =
that
> > > > appear after
> > > > > -                 "1:                     \n"
> > > > > -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > -                 "sub     %0,  #1        \n" // (val -=3D 1)
> > > > > -                 "strex   r1,  %0, [%1]      \n"
> > > > > -                 "cmp     r1,   #0       \n"
> > > > > -                 "bne     1b             \n"
> > > > > --                "dmb     ish            \n" // Memory barrier.
> > > > > -                 : "=3D&r" (val)
> > > > > -                 : "r"(pAddr)
> > > > > -                 : "r1"
> > > > > -@@ -431,14 +425,12 @@ long AtomicSubtract(volatile long* pAddr, =
long
> > > > amount)
> > > > > - {
> > > > > +-    "dmb      ish           \n" // Memory barrier. Make sure all
> > > > memory accesses appearing before this complete before any that appe=
ar
> > after
> > > > > +     "1:                     \n"
> > > > > +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > +     "sub     %0,  #1        \n" // (val -=3D 1)
> > > > > +     "strex   r1,  %0, [%1]  \n"
> > > > > +     "cmp     r1,   #0       \n"
> > > > > +     "bne     1b             \n"
> > > > > +-    "dmb     ish            \n" // Memory barrier.
> > > > > +     : "=3D&r" (val)
> > > > > +     : "r"(pAddr)
> > > > > +     : "r1"
> > > > > +@@ -403,14 +395,12 @@ long AtomicSubtract(volatile long* pAddr
> > > > > + #elif defined(__arm__)
> > > > >     register long val;
> > > > >     asm volatile (
> > > > > --                "dmb     ish            \n" // Memory barrier. =
Make
> > > > sure all memory accesses appearing before this complete before any =
that
> > > > appear after
> > > > > -                 "1:                     \n"
> > > > > -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > -                 "sub     %0,  %2        \n" // (val -=3D amount)
> > > > > -                 "strex   r1,  %0, [%1]      \n"
> > > > > -                 "cmp     r1,   #0       \n"
> > > > > -                 "bne     1b             \n"
> > > > > --                "dmb     ish            \n" // Memory barrier.
> > > > > -                 : "=3D&r" (val)
> > > > > -                 : "r"(pAddr), "r"(amount)
> > > > > -                 : "r1"
> > > > > ---
> > > > > -1.7.2.5
> > > > > -
> > > > > +-    "dmb     ish            \n" // Memory barrier. Make sure all
> > > > memory accesses appearing before this complete before any that appe=
ar
> > after
> > > > > +     "1:                     \n"
> > > > > +     "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
> > > > > +     "sub     %0,  %2        \n" // (val -=3D amount)
> > > > > +     "strex   r1,  %0, [%1]  \n"
> > > > > +     "cmp     r1,   #0       \n"
> > > > > +     "bne     1b             \n"
> > > > > +-    "dmb     ish            \n" // Memory barrier.
> > > > > +     : "=3D&r" (val)
> > > > > +     : "r"(pAddr), "r"(amount)
> > > > > +     : "r1"
> > > > > diff --git
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-A=
dd-memory-barriers-to-cas-assembly.patch
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-A=
dd-memory-barriers-to-cas-assembly.patch
> > > > > index 629017b..f93fa9e 100644
> > > > > ---
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-A=
dd-memory-barriers-to-cas-assembly.patch
> > > > > +++
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-A=
dd-memory-barriers-to-cas-assembly.patch
> > > > > @@ -16,54 +16,50 @@ The build (OpenEmbedded `angstrom-2010.x` for
> > > > `MACHINE =3D "beagleboard") fails wi
> > > > >          make[1]: *** [Atomics.o] Error 1
> > > > >          make[1]: Leaving directory
> > > >
> > `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueab=
i/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/th=
reads'
> > > > >          make: *** [xbmc/threads/threads.a] Error 2
> > > > > ----
> > > > > - xbmc/threads/Atomics.cpp |   33 ++++++++++++++++---------------=
--
> > > > > - 1 files changed, 16 insertions(+), 17 deletions(-)
> > > > > -
> > > > > -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
> > > > > -index 0a98a7e..0967eb2 100644
> > > > > ---- a/xbmc/threads/Atomics.cpp
> > > > > -+++ b/xbmc/threads/Atomics.cpp
> > > > > -@@ -49,23 +49,22 @@ long cas(volatile long *pAddr, long expected=
Val,
> > > > long swapVal)
> > > > > - #elif defined(__arm__)
> > > > > - long cas(volatile long* pAddr, long expectedVal, long swapVal)
> > > > > - {
> > > > > +Index: git/xbmc/threads/Atomics.cpp
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +--- git.orig/xbmc/threads/Atomics.cpp
> > > > > ++++ git/xbmc/threads/Atomics.cpp
> > > > > +@@ -43,24 +43,24 @@ long cas(volatile long *pAddr, long expe
> > > > > +     : "cc", "memory");                              /* Clobbers=
 */
> > > > > +   return prev;
> > > > > +
> > > > > +-#elif defined(__arm__)
> > > > >  -  register long prev;
> > > > >  -  asm volatile (
> > > > > --                "dmb      ish            \n" // Memory barrier.
> > Make
> > > > sure all memory accesses appearing before this complete before any =
that
> > > > appear after
> > > > > --                "1:                      \n"
> > > > > --                "ldrex    %0, [%1]       \n" // Load the current
> > value
> > > > of *pAddr(%1) into prev (%0) and lock pAddr,
> > > > > --                "cmp      %0,  %2        \n" // Verify that the
> > > > current value (%0) =3D=3D old value (%2)
> > > > > --                "bne      2f             \n" // Bail if the two
> > values
> > > > are not equal [not as expected]
> > > > > --                "strex    r1,  %3, [%1]  \n"
> > > > > --                "cmp      r1,  #0        \n"
> > > > > --                "bne      1b             \n"
> > > > > --                "dmb      ish            \n" // Memory barrier.
> > > > > --                "2:                      \n"
> > > > > --                : "=3D&r" (prev)
> > > > > --                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > > > > --                : "r1"
> > > > > --                );
> > > > > +-    "dmb      ish            \n" // Memory barrier. Make sure a=
ll
> > > > memory accesses appearing before this complete before any that appe=
ar
> > after
> > > > > +-    "1:                      \n"
> > > > > +-    "ldrex    %0, [%1]       \n" // Load the current value of
> > > > *pAddr(%1) into prev (%0) and lock pAddr,
> > > > > +-    "cmp      %0,  %2        \n" // Verify that the current val=
ue
> > (%0)
> > > > =3D=3D old value (%2)
> > > > > +-    "bne      2f             \n" // Bail if the two values are =
not
> > > > equal [not as expected]
> > > > > +-    "strex    r1,  %3, [%1]  \n"
> > > > > +-    "cmp      r1,  #0        \n"
> > > > > +-    "bne      1b             \n"
> > > > > +-    "dmb      ish            \n" // Memory barrier.
> > > > > +-    "2:                      \n"
> > > > > +-    : "=3D&r" (prev)
> > > > > +-    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > > > > +-    : "r1"
> > > > > +-    );
> > > > >  -  return prev;
> > > > > -+  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVa=
l));
> > > > > ++//#elif defined(__arm__)
> > > > >  +//  register long prev;
> > > > >  +//  asm volatile (
> > > > > -+//                "1:                      \n"
> > > > > -+//                "ldrex    %0, [%1]       \n" /* Load the curr=
ent
> > > > value of *pAddr(%1) into prev (%0) and lock pAddr,  */
> > > > > -+//                "cmp      %0,  %2        \n" /* Verify that t=
he
> > > > current value (%0) =3D=3D old value (%2) */
> > > > > -+//                "bne      2f             \n" /* Bail if the t=
wo
> > > > values are not equal [not as expected] */
> > > > > -+//                "strex    r1,  %3, [%1]  \n"
> > > > > -+//                "cmp      r1,  #0        \n"
> > > > > -+//                "bne      1b             \n"
> > > > > -+//                "2:                        "
> > > > > -+//                : "=3D&r" (prev)
> > > > > -+//                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > > > > -+//                : "r1"
> > > > > -+//                );
> > > > > ++//    "dmb      ish            \n" // Memory barrier. Make sure=
 all
> > > > memory accesses appearing before this complete before any that appe=
ar
> > after
> > > > > ++//    "1:                      \n"
> > > > > ++//    "ldrex    %0, [%1]       \n" // Load the current value of
> > > > *pAddr(%1) into prev (%0) and lock pAddr,
> > > > > ++//    "cmp      %0,  %2        \n" // Verify that the current v=
alue
> > > > (%0) =3D=3D old value (%2)
> > > > > ++//    "bne      2f             \n" // Bail if the two values are
> > not
> > > > equal [not as expected]
> > > > > ++//    "strex    r1,  %3, [%1]  \n"
> > > > > ++//    "cmp      r1,  #0        \n"
> > > > > ++//    "bne      1b             \n"
> > > > > ++//    "dmb      ish            \n" // Memory barrier.
> > > > > ++//    "2:                      \n"
> > > > > ++//    : "=3D&r" (prev)
> > > > > ++//    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > > > > ++//    : "r1"
> > > > > ++//    );
> > > > >  +//  return prev;
> > > > > - }
> > > > >
> > > > >   #elif defined(__mips__)
> > > > > ---
> > > > > -1.7.2.5
> > > > > -
> > > > > + // TODO:
> > > > > diff --git
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuar=
m.patch
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuar=
m.patch
> > > > > new file mode 100644
> > > > > index 0000000..48f3d29
> > > > > --- /dev/null
> > > > > +++
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuar=
m.patch
> > > > > @@ -0,0 +1,104 @@
> > > > > +From 54ce0e5fef8d8f4a374eb9df68c22781f989b52d Mon Sep 17 00:00:00
> > 2001
> > > > > +From: Andrei Gherzan <andrei.gherzan@windriver.com>
> > > > > +Date: Sun, 17 Aug 2014 14:47:36 +0200
> > > > > +Subject: [PATCH] Add support for qemuarm
> > > > > +
> > > > > +Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> > > > > +
> > > > > +Upstream-Status: Inappropriate [OE specific]
> > > > > +
> > > > > +---
> > > > > + configure.in           | 17 +++++++++++++++++
> > > > > + m4/xbmc_arch.m4        |  3 +++
> > > > > + xbmc/utils/MathUtils.h |  6 ++++--
> > > > > + 3 files changed, 24 insertions(+), 2 deletions(-)
> > > > > +
> > > > > +diff --git a/configure.in b/configure.in
> > > > > +index a195d00..6e2d432 100644
> > > > > +--- a/configure.in
> > > > > ++++ b/configure.in
> > > > > +@@ -231,6 +231,12 @@ AC_ARG_ENABLE([neon],
> > > > > +   [use_neon=3D$enableval],
> > > > > +   [use_neon=3Dno])
> > > > > +
> > > > > ++AC_ARG_ENABLE([vfp],
> > > > > ++  [AS_HELP_STRING([--enable-vfp],
> > > > > ++  [enable vfp passing to ffmpeg (default is yes)])],
> > > > > ++  [use_vfp=3D$enableval],
> > > > > ++  [use_vfp=3Dyes])
> > > > > ++
> > > > > + AC_ARG_ENABLE([optimizations],
> > > > > +   [AS_HELP_STRING([--enable-optimizations],
> > > > > +   [enable optimization (default is yes)])],
> > > > > +@@ -750,6 +756,11 @@ case $use_platform in
> > > > > +      CXXFLAGS=3D"$CXXFLAGS"
> > > > > +      ffmpeg_target_os=3Dlinux
> > > > > +      ;;
> > > > > ++  qemuarm)
> > > > > ++     use_arch=3D"arm"
> > > > > ++     use_neon=3Dno
> > > > > ++     use_vfp=3Dno
> > > > > ++     ;;
> > > > > + esac
> > > > > +
> > > > > + XBMC_SETUP_ARCH_DEFINES()
> > > > > +@@ -2757,6 +2768,11 @@ XB_CONFIG_MODULE([lib/ffmpeg], [
> > > > > +       else
> > > > > +         ffmpg_config=3D"$ffmpg_config --disable-neon"
> > > > > +       fi
> > > > > ++      if test "$use_vfp"  =3D "yes"; then
> > > > > ++        ffmpg_config=3D"$ffmpg_config --enable-vfp"
> > > > > ++      else
> > > > > ++        ffmpg_config=3D"$ffmpg_config --disable-vfp"
> > > > > ++      fi
> > > > > +     else
> > > > > +       ffmpg_config=3D"$ffmpg_config --disable-amd3dnow"
> > > > > +     fi
> > > > > +@@ -2815,6 +2831,7 @@ XB_CONFIG_MODULE([lib/ffmpeg], [
> > > > > +       `if test "$use_arch" !=3D "no"; then echo --arch=3D$use_a=
rch;
> > fi`\
> > > > > +       `if test "$use_cpu" !=3D "no"; then echo --cpu=3D$use_cpu=
; fi`\
> > > > > +       `if test "$use_neon" =3D "yes"; then echo --enable-neon; =
else
> > echo
> > > > --disable-neon; fi`\
> > > > > ++      `if test "$use_vfp" =3D "yes"; then echo --enable-vfp; el=
se
> > echo
> > > > --disable-vfp; fi`\
> > > > > +       --target-os=3D$ffmpeg_target_os \
> > > > > +       --disable-muxers \
> > > > > +       --enable-muxer=3Dspdif \
> > > > > +diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
> > > > > +index 5bcdd81..f349cb2 100644
> > > > > +--- a/m4/xbmc_arch.m4
> > > > > ++++ b/m4/xbmc_arch.m4
> > > > > +@@ -47,5 +47,8 @@ case $use_platform in
> > > > > +   raspberry-pi)
> > > > > +      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_L=
INUX
> > > > -D_ARMEL -DTARGET_RASPBERRY_PI")
> > > > > +      ;;
> > > > > ++  qemuarm)
> > > > > ++     AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_L=
INUX
> > > > -DTARGET_QEMUARM")
> > > > > ++     ;;
> > > > > + esac
> > > > > + ])
> > > > > +diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
> > > > > +index 96af9f4..69fd058 100644
> > > > > +--- a/xbmc/utils/MathUtils.h
> > > > > ++++ b/xbmc/utils/MathUtils.h
> > > > > +@@ -36,7 +36,8 @@
> > > > > +     defined(__powerpc__) || \
> > > > > +    (defined(TARGET_DARWIN_IOS) && defined(__llvm__)) || \
> > > > > +    (defined(TARGET_ANDROID) && defined(__arm__)) || \
> > > > > +-    defined(TARGET_RASPBERRY_PI)
> > > > > ++    defined(TARGET_RASPBERRY_PI) || \
> > > > > ++    defined(TARGET_QEMUARM)
> > > > > +   #define DISABLE_MATHUTILS_ASM_ROUND_INT
> > > > > + #endif
> > > > > +
> > > > > +@@ -44,7 +45,8 @@
> > > > > +     defined(__powerpc__) || \
> > > > > +    (defined(TARGET_DARWIN) && defined(__llvm__)) || \
> > > > > +    (defined(TARGET_ANDROID) && defined(__arm__)) || \
> > > > > +-    defined(TARGET_RASPBERRY_PI)
> > > > > ++    defined(TARGET_RASPBERRY_PI) || \
> > > > > ++    defined(TARGET_QEMUARM)
> > > > > +   #define DISABLE_MATHUTILS_ASM_TRUNCATE_INT
> > > > > + #endif
> > > > > +
> > > > > +--
> > > > > +1.9.3
> > > > > +
> > > > > diff --git
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-wit=
h-ld-is-gold-DISTRO_FEATURE.patch
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-wit=
h-ld-is-gold-DISTRO_FEATURE.patch
> > > > > deleted file mode 100644
> > > > > index 345e20e..0000000
> > > > > ---
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-wit=
h-ld-is-gold-DISTRO_FEATURE.patch
> > > > > +++ /dev/null
> > > > > @@ -1,43 +0,0 @@
> > > > > -From fd8f73826240aae543a41a2bfeea0056e2fe594d Mon Sep 17 00:00:00
> > 2001
> > > > > -From: Koen Kooi <koen@dominion.thruhere.net>
> > > > > -Date: Mon, 11 Mar 2013 11:04:29 +0100
> > > > > -Subject: [PATCH] configure: cope with ld-is-gold DISTRO_FEATURE
> > > > > -
> > > > > -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > > > > ----
> > > > > -
> > > > > -Upstream-Stature: backport
> > > > > -
> > > > > - configure.in |   12 +++++++-----
> > > > > - 1 files changed, 7 insertions(+), 5 deletions(-)
> > > > > -
> > > > > -diff --git a/configure.in b/configure.in
> > > > > -index ef94683..c8b459b 100755
> > > > > ---- a/configure.in
> > > > > -+++ b/configure.in
> > > > > -@@ -18,9 +18,14 @@ tolower(){
> > > > > - # check for library basenames
> > > > > - AC_DEFUN([XB_FIND_SONAME],
> > > > > - [
> > > > > -+  #set -x
> > > > > -   if [[ "$host_vendor" !=3D "apple" ]]; then
> > > > > -     AC_MSG_CHECKING([for lib$2 soname])
> > > > > -     $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -W=
l,-M
> > > > 2>/dev/null | grep "^LOAD.*$2" | awk '{V=3D2; print $V}')
> > > > > -+    if [[ -z $$1_FILENAME ]]; then
> > > > > -+      #try gold linker syntax
> > > > > -+      $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 =
-Wl,-t
> > > > 3>&1 1>&2 2>&3 | grep "$2")
> > > > > -+    fi
> > > > > -     if [[ ! -z $$1_FILENAME ]]; then
> > > > > -       $1_SONAME=3D$(objdump -p $$1_FILENAME | grep "SONAME.*$2"=
 | awk
> > > > '{V=3D2; print $V}')
> > > > > -     fi
> > > > > -@@ -55,6 +60,7 @@ AC_DEFUN([XB_FIND_SONAME],
> > > > > -     AC_MSG_RESULT([$$1_SONAME])
> > > > > -     AC_SUBST($1_SONAME)
> > > > > -   fi
> > > > > -+  #set +x
> > > > > - ])
> > > > > -
> > > > > - # Function to push and pop libs and includes for a command
> > > > > ---
> > > > > -1.7.7.6
> > > > > -
> > > > > diff --git
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-runn=
ing-code.patch
> > > >
> > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-runn=
ing-code.patch
> > > > > deleted file mode 100644
> > > > > index 5c14059..0000000
> > > > > ---
> > > >
> > a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-runn=
ing-code.patch
> > > > > +++ /dev/null
> > > > > @@ -1,32 +0,0 @@
> > > > > -From cfd851660a594801a591e80dc820c65cb7bd7836 Mon Sep 17 00:00:00
> > 2001
> > > > > -From: Otavio Salvador <otavio@ossystems.com.br>
> > > > > -Date: Sat, 6 Oct 2012 06:40:03 -0300
> > > > > -Subject: [PATCH] configure.in: Avoid running code or we break
> > > > cross-compile
> > > > > -
> > > > > -Upstream-Status: Backport [similar change done for 12.0]
> > > > > -
> > > > > -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > > > ----
> > > > > - configure.in |    6 +-----
> > > > > - 1 files changed, 1 insertions(+), 5 deletions(-)
> > > > > -
> > > > > -diff --git a/configure.in b/configure.in
> > > > > -index ef94683..d7efcb0 100755
> > > > > ---- a/configure.in
> > > > > -+++ b/configure.in
> > > > > -@@ -1246,11 +1246,7 @@ if test "$use_external_ffmpeg" =3D "yes";=
 then
> > > > > -   AC_DEFINE([USE_EXTERNAL_FFMPEG], [1], [Whether to use external
> > > > FFmpeg libraries.])
> > > > > -
> > > > > -   # Disable vdpau support if external libavcodec doesn't have it
> > > > > --  AC_RUN_IFELSE(
> > > > > --    AC_LANG_PROGRAM([[#include <libavcodec/avcodec.h>]],
> > > > > --      [[avcodec_register_all();
> > > > > --        AVCodec *codec =3D avcodec_find_decoder_by_name("vc1_vd=
pau");
> > > > > --        return (codec) ? 0 : 1;]]),,
> > > > > -+  AC_CHECK_LIB([avcodec], [ff_vdpau_vc1_decode_picture],,
> > > > > -     [if test "x$use_vdpau" =3D "xyes"; then
> > > > > -       AC_MSG_ERROR($ffmpeg_vdpau_not_supported)
> > > > > -     else
> > > > > ---
> > > > > -1.7.2.5
> > > > > -
> > > > > diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> > > > b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> > > > > new file mode 100644
> > > > > index 0000000..9a46d50
> > > > > --- /dev/null
> > > > > +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> > > > > @@ -0,0 +1,114 @@
> > > > > +SUMMARY =3D "XBMC Media Center"
> > > > > +DESCRIPTION =3D "XBMC is an award-winning free and open source (=
GPL)
> > > > software \
> > > > > +media player and entertainment hub that can be installed on Linu=
x,
> > OSX,
> > > > \
> > > > > +Windows, iOS, and Android, featuring a 10-foot user interface for
> > use
> > > > with \
> > > > > +televisions and remote controls."
> > > > > +HOMEPAGE =3D "http://xbmc.org/"
> > > > > +LICENSE =3D "GPLv2"
> > > > > +LIC_FILES_CHKSUM =3D
> > > > "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a80213ffc35ff"
> > > > > +
> > > > > +DEPENDS =3D "yajl libxmu fribidi mpeg2dec curl python libmodplug
> > > > libmicrohttpd \
> > > > > +           sqlite3 libcdio libpcre boost lzo taglib libtinyxml
> > jasper
> > > > libass \
> > > > > +           libmad jpeg libsamplerate0 libvorbis tiff libxslt
> > > > libgpg-error \
> > > > > +           libsdl virtual/egl swig-native gperf-native unzip-nat=
ive
> > > > zip-native"
> > > > > +
> > > > > +DEPENDS_append_arm =3D " cmake-native"
> > > > > +DEPENDS_append_x86 =3D " nasm-native"
> > > > > +
> > > > > +CODENAME =3D "Gotham"
> > > > > +SRCREV =3D "84725b0b1df072aecd26a55b82ef50ec828e595b"
> > > > > +SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3D${CODENAME}=
 \
> > > > > +
> > > >
> > file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
> > > > > +
> > > >
> > file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
> > > > > +
> > > >
> > file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
> > > > > +           file://0004-Support-for-qemuarm.patch"
> > > > > +
> > > > > +inherit autotools-brokensep gettext python-dir
> > > > > +
> > > > > +S =3D "${WORKDIR}/git"
> > > > > +
> > > > > +# Don't activate texturepacker as it needs libsdl-image-native. =
Due
> > to
> > > > some issues
> > > > > +# with qemu we use the host's libsdl on which libsdl-image-native
> > > > depends.
> > > > > +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl=
',
> > > > 'opengl', 'opengles2', d)} \
> > > > > +                   sdl airplay ssh libusb libcec samba mysql ava=
hi
> > > > xrandr x11 joystick \
> > > > > +                   mid rtmp libmp3lame optical-drive debug"
> > > > > +
> > > > > +PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,glew"
> > > > > +PACKAGECONFIG[opengles2] =3D "--enable-gles,--enable-gl,"
> > > > > +PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl-mixer
> > > > libsdl-image"
> > > > > +PACKAGECONFIG[airplay] =3D
> > "--enable-airplay,--disable-airplay,libplist"
> > > > > +PACKAGECONFIG[ssh] =3D "--enable-ssh,--disable-ssh,libssh"
> > > > > +PACKAGECONFIG[libcec] =3D "--enable-libcec,--disable-libcec,libc=
ec"
> > > > > +PACKAGECONFIG[libusb] =3D "--enable-libusb,--disable-libusb,libu=
sb"
> > > > > +PACKAGECONFIG[samba] =3D "--enable-samba,--disable-samba,samba"
> > > > > +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5"
> > > > > +PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
> > > > > +PACKAGECONFIG[xrandr] =3D "--enable-xrandr,--disable-xrandr,libx=
randr"
> > > > > +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,"
> > > > > +PACKAGECONFIG[joystick] =3D "--enable-joystick,--disable-joystic=
k,"
> > > > > +PACKAGECONFIG[texturepacker] =3D
> > > > "--enable-texturepacker,--disable-texturepacker,libsdl-image-native"
> > > > > +PACKAGECONFIG[mid] =3D "--enable-mid,--disable-mid,"
> > > > > +PACKAGECONFIG[rtmp] =3D "--enable-rtmp,--disable-rtmp,rtmpdump"
> > > > > +PACKAGECONFIG[optical-drive] =3D
> > > > "--enable-optical-drive,--disable-optical-drive,libcdio"
> > > > > +PACKAGECONFIG[libmp3lame] =3D
> > > > "--enable-libmp3lame,--disable-libmp3lame,lame"
> > > > > +PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug,"
> > > > > +
> > > > > +EXTRA_OECONF_append_qemuarm =3D " --with-platform=3Dqemuarm "
> > > >
> > > > It isn't MACHINE_ARCH, why not disable vfp for all MACHINEs
> > > > (TUNE_PKGARGs) without vfp in TUNE_FEATURES?
> > > >
> > > >
> > > Is not as simple as doing it from configure. And this is because
> > configure
> > > will overwrite this values on a "host" automatic detection. And I nee=
ded
> > to
> > > create a new platform to deactivate neon and vfp. to try to manage vfp
> > and
> > > neon separately... would mean some additional work even though nobody
> > will
> > > actually use xbmc in those configurations. I did it only to unbreak s=
ome
> > of
> > > the platforms ("some" being qemuarm). What do you think?
> >
> > Then lets call the platform novfp (or something like that) and apply it
> > for all armv4 and armv5.
>=20
>=20
> Agreed. What about the neon part?

Feel free to call it novfpnoneon platform and disable both.

The current version of the patch just failed in world build for qemuarm
with:

| CPP     xbmc/cores/dvdplayer/DVDCodecs/Overlay/DVDOverlayCodecTX3G.o
| OpenMaxVideo.cpp:59:8: error: 'PFNEGLCREATEIMAGEKHRPROC' does not name a =
type
|  static PFNEGLCREATEIMAGEKHRPROC eglCreateImageKHR;
|         ^
| OpenMaxVideo.cpp:60:8: error: 'PFNEGLDESTROYIMAGEKHRPROC' does not name a=
 type
|  static PFNEGLDESTROYIMAGEKHRPROC eglDestroyImageKHR;
|         ^
| OpenMaxVideo.cpp:80:30: error: invalid use of incomplete type 'class COpe=
nMaxVideo'
|  COpenMaxVideo::COpenMaxVideo()
|                               ^
| In file included from OpenMaxVideo.cpp:32:0:
| DVDVideoCodec.h:48:7: error: forward declaration of 'class COpenMaxVideo'
|  class COpenMaxVideo;
|        ^
| OpenMaxVideo.cpp:100:31: error: invalid use of incomplete type 'class COp=
enMaxVideo'
|  COpenMaxVideo::~COpenMaxVideo()
|                                ^

Can you look into that? I'll send full log later with updated world build s=
tatus e-mail.

>=20
> --=20
> *Andrei Gherzan*
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+mSjbC2tVdWE/Wop
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzzdUACgkQN1Ujt2V2gBz32ACfZvHvKYhNTaX5Iltv3W2jBSqH
KU8AnjOifE/ZLPh8VKBJJSoxitLLGNkC
=uDwB
-----END PGP SIGNATURE-----

--+mSjbC2tVdWE/Wop--
