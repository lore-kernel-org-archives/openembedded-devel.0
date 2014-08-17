Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id C2C6C610F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 18:58:00 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so4152526wes.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 11:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=blbQdSyphS4N9dVGOaNWDSVGoKW50Vqf/QnIjnOIzbU=;
	b=Sp77CPz0pXOqsanZqI66vGMmVfrgzjUaMlOAHQGn9nYKRYM4dT+C11v0oRmyvcZ2BA
	UV2bbgbn95Lp10kszerhzECdt0PRbcVtGYbirujr/m1o6qFEjnnN4OFsZYg5SJGL7Lli
	T27FZPe773G9nu10Tcf/lnMJAL3jMutGntsx3PN34mwp4XH/EQOsd4oZMSHhMTYDP78U
	rr+OFP6EnZ89s7L6mRw/ehbxKPLGMw06882C3Rum2AlN9aHx6fyL/9lUz2wQY7bfLeKy
	BtsPeDvK2PcCjn9pEex3MqXcAgPHmH5GqVydcaFMlwBGEYIlVdy+MxQXXgul6pZ/9gJ3
	XpKQ==
X-Gm-Message-State: ALoCoQlv+36M14I23bp4faajorG+1KuXlNAE1O5Dlb/04mjAlroU85UtKzvxUQVLnqjcCX+p0bhV
X-Received: by 10.195.11.200 with SMTP id ek8mr37174301wjd.85.1408301881008;
	Sun, 17 Aug 2014 11:58:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.76.5 with HTTP; Sun, 17 Aug 2014 11:57:40 -0700 (PDT)
X-Originating-IP: [195.249.189.34]
In-Reply-To: <20140817173728.GG3660@jama>
References: <1408291083-3690-1-git-send-email-andrei@gherzan.ro>
	<20140817173728.GG3660@jama>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 17 Aug 2014 20:57:40 +0200
Message-ID: <CAK18fxFoGifFVbMUAemLWJRw+jyzXrX_=Oe_jXdb5f7GssckMg@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Sun, 17 Aug 2014 18:58:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 17, 2014 at 7:37 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Aug 17, 2014 at 05:58:03PM +0200, Andrei Gherzan wrote:
> > * refactor dependencies
> > * remove already merged patches
> > * define PACKAGECONFIG for different configurations
> > * have above PACKAGECONFIG values activated by default
> > * various cleanups and refactoring
> > * use internal ffmpeg - there are some known issues while compiling
> > with external libav
> > * define --with-arch to be passed to internal ffmpeg configuration
> > script
> > * add support for qemuarm
> >
> > Tested on Fedora 20 host using poky + meta-oe master:
> > 1. build only qemux86
> > 2. build only qemuarm
> > 3. build and runtime test raspberrypi - (patches to come).
> >
> > This patch depends on two other patches:
> >
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/097729.html
> >
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/097730.html
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > Change-Id: I538f4907a9d1dd5df31648bfb60a18cacfed9d69
> > ---
> >  ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch | 118
> ++++++++++-----------
> >  ...d-ios-Add-memory-barriers-to-cas-assembly.patch |  82 +++++++-------
> >  .../xbmc/xbmc/0004-Support-for-qemuarm.patch       | 104
> ++++++++++++++++++
> >  ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |  43 --------
> >  .../xbmc/configure.in-Avoid-running-code.patch     |  32 ------
> >  .../recipes-mediacentre/xbmc/xbmc_13.1.bb          | 114
> ++++++++++++++++++++
> >  .../recipes-mediacentre/xbmc/xbmc_git.bb           |  99
> -----------------
> >  7 files changed, 313 insertions(+), 279 deletions(-)
> >  create mode 100644
> meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuarm.patch
> >  delete mode 100644
> meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
> >  delete mode 100644
> meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
> >  create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/
> xbmc_13.1.bb
> >  delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> >
> > diff --git
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
> > index e0a4037..d3ae75e 100644
> > ---
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
> > +++
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
> > @@ -24,74 +24,68 @@ The build (OpenEmbedded `angstrom-2010.x` for
> `MACHINE = "beagleboard") fails wi
> >          make[1]: *** [Atomics.o] Error 1
> >          make[1]: Leaving directory
> `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
> >          make: *** [xbmc/threads/threads.a] Error 2
> > ----
> > - xbmc/threads/Atomics.cpp |    8 --------
> > - 1 files changed, 0 insertions(+), 8 deletions(-)
> >
> > -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
> > -index 5b09f18..0a98a7e 100644
> > ---- a/xbmc/threads/Atomics.cpp
> > -+++ b/xbmc/threads/Atomics.cpp
> > -@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
> > - {
> > +Index: git/xbmc/threads/Atomics.cpp
> > +===================================================================
> > +--- git.orig/xbmc/threads/Atomics.cpp
> > ++++ git/xbmc/threads/Atomics.cpp
> > +@@ -168,14 +166,12 @@ long AtomicIncrement(volatile long* pAdd
> > + #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
> >     register long val;
> >     asm volatile (
> > --                "dmb      ish            \n" // Memory barrier. Make
> sure all memory accesses appearing before this complete before any that
> appear after
> > -                 "1:                     \n"
> > -                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > -                 "add     %0,  #1        \n" // (val += 1)
> > -                 "strex   r1,  %0, [%1]      \n"
> > -                 "cmp     r1,   #0       \n"
> > -                 "bne     1b             \n"
> > --                "dmb     ish            \n" // Memory barrier.
> > -                 : "=&r" (val)
> > -                 : "r"(pAddr)
> > -                 : "r1"
> > -@@ -273,14 +271,12 @@ long AtomicAdd(volatile long* pAddr, long amount)
> > - {
> > +-    "dmb      ish            \n" // Memory barrier. Make sure all
> memory accesses appearing before this complete before any that appear after
> > +     "1:                     \n"
> > +     "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > +     "add     %0,  #1        \n" // (val += 1)
> > +     "strex   r1,  %0, [%1]  \n"
> > +     "cmp     r1,   #0       \n"
> > +     "bne     1b             \n"
> > +-    "dmb     ish            \n" // Memory barrier.
> > +     : "=&r" (val)
> > +     : "r"(pAddr)
> > +     : "r1"
> > +@@ -246,14 +242,12 @@ long AtomicAdd(volatile long* pAddr, lon
> > + #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
> >     register long val;
> >     asm volatile (
> > --                "dmb      ish            \n" // Memory barrier. Make
> sure all memory accesses appearing before this complete before any that
> appear after
> > -                 "1:                     \n"
> > -                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > -                 "add     %0,  %2        \n" // (val += amount)
> > -                 "strex   r1,  %0, [%1]      \n"
> > -                 "cmp     r1,   #0       \n"
> > -                 "bne     1b             \n"
> > --                "dmb     ish            \n" // Memory barrier.
> > -                 : "=&r" (val)
> > -                 : "r"(pAddr), "r"(amount)
> > -                 : "r1"
> > -@@ -351,14 +347,12 @@ long AtomicDecrement(volatile long* pAddr)
> > - {
> > +-    "dmb      ish           \n" // Memory barrier. Make sure all
> memory accesses appearing before this complete before any that appear after
> > +   "1:                       \n"
> > +     "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > +     "add     %0,  %2        \n" // (val += amount)
> > +     "strex   r1,  %0, [%1]  \n"
> > +     "cmp     r1,   #0       \n"
> > +     "bne     1b             \n"
> > +-    "dmb     ish            \n" // Memory barrier.
> > +     : "=&r" (val)
> > +     : "r"(pAddr), "r"(amount)
> > +     : "r1"
> > +@@ -324,14 +318,12 @@ long AtomicDecrement(volatile long* pAdd
> > + #elif defined(__arm__)
> >     register long val;
> >     asm volatile (
> > --                "dmb      ish            \n" // Memory barrier. Make
> sure all memory accesses appearing before this complete before any that
> appear after
> > -                 "1:                     \n"
> > -                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > -                 "sub     %0,  #1        \n" // (val -= 1)
> > -                 "strex   r1,  %0, [%1]      \n"
> > -                 "cmp     r1,   #0       \n"
> > -                 "bne     1b             \n"
> > --                "dmb     ish            \n" // Memory barrier.
> > -                 : "=&r" (val)
> > -                 : "r"(pAddr)
> > -                 : "r1"
> > -@@ -431,14 +425,12 @@ long AtomicSubtract(volatile long* pAddr, long
> amount)
> > - {
> > +-    "dmb      ish           \n" // Memory barrier. Make sure all
> memory accesses appearing before this complete before any that appear after
> > +     "1:                     \n"
> > +     "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > +     "sub     %0,  #1        \n" // (val -= 1)
> > +     "strex   r1,  %0, [%1]  \n"
> > +     "cmp     r1,   #0       \n"
> > +     "bne     1b             \n"
> > +-    "dmb     ish            \n" // Memory barrier.
> > +     : "=&r" (val)
> > +     : "r"(pAddr)
> > +     : "r1"
> > +@@ -403,14 +395,12 @@ long AtomicSubtract(volatile long* pAddr
> > + #elif defined(__arm__)
> >     register long val;
> >     asm volatile (
> > --                "dmb     ish            \n" // Memory barrier. Make
> sure all memory accesses appearing before this complete before any that
> appear after
> > -                 "1:                     \n"
> > -                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > -                 "sub     %0,  %2        \n" // (val -= amount)
> > -                 "strex   r1,  %0, [%1]      \n"
> > -                 "cmp     r1,   #0       \n"
> > -                 "bne     1b             \n"
> > --                "dmb     ish            \n" // Memory barrier.
> > -                 : "=&r" (val)
> > -                 : "r"(pAddr), "r"(amount)
> > -                 : "r1"
> > ---
> > -1.7.2.5
> > -
> > +-    "dmb     ish            \n" // Memory barrier. Make sure all
> memory accesses appearing before this complete before any that appear after
> > +     "1:                     \n"
> > +     "ldrex   %0, [%1]       \n" // (val = *pAddr)
> > +     "sub     %0,  %2        \n" // (val -= amount)
> > +     "strex   r1,  %0, [%1]  \n"
> > +     "cmp     r1,   #0       \n"
> > +     "bne     1b             \n"
> > +-    "dmb     ish            \n" // Memory barrier.
> > +     : "=&r" (val)
> > +     : "r"(pAddr), "r"(amount)
> > +     : "r1"
> > diff --git
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
> > index 629017b..f93fa9e 100644
> > ---
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
> > +++
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
> > @@ -16,54 +16,50 @@ The build (OpenEmbedded `angstrom-2010.x` for
> `MACHINE = "beagleboard") fails wi
> >          make[1]: *** [Atomics.o] Error 1
> >          make[1]: Leaving directory
> `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/threads'
> >          make: *** [xbmc/threads/threads.a] Error 2
> > ----
> > - xbmc/threads/Atomics.cpp |   33 ++++++++++++++++-----------------
> > - 1 files changed, 16 insertions(+), 17 deletions(-)
> > -
> > -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
> > -index 0a98a7e..0967eb2 100644
> > ---- a/xbmc/threads/Atomics.cpp
> > -+++ b/xbmc/threads/Atomics.cpp
> > -@@ -49,23 +49,22 @@ long cas(volatile long *pAddr, long expectedVal,
> long swapVal)
> > - #elif defined(__arm__)
> > - long cas(volatile long* pAddr, long expectedVal, long swapVal)
> > - {
> > +Index: git/xbmc/threads/Atomics.cpp
> > +===================================================================
> > +--- git.orig/xbmc/threads/Atomics.cpp
> > ++++ git/xbmc/threads/Atomics.cpp
> > +@@ -43,24 +43,24 @@ long cas(volatile long *pAddr, long expe
> > +     : "cc", "memory");                              /* Clobbers */
> > +   return prev;
> > +
> > +-#elif defined(__arm__)
> >  -  register long prev;
> >  -  asm volatile (
> > --                "dmb      ish            \n" // Memory barrier. Make
> sure all memory accesses appearing before this complete before any that
> appear after
> > --                "1:                      \n"
> > --                "ldrex    %0, [%1]       \n" // Load the current value
> of *pAddr(%1) into prev (%0) and lock pAddr,
> > --                "cmp      %0,  %2        \n" // Verify that the
> current value (%0) == old value (%2)
> > --                "bne      2f             \n" // Bail if the two values
> are not equal [not as expected]
> > --                "strex    r1,  %3, [%1]  \n"
> > --                "cmp      r1,  #0        \n"
> > --                "bne      1b             \n"
> > --                "dmb      ish            \n" // Memory barrier.
> > --                "2:                      \n"
> > --                : "=&r" (prev)
> > --                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > --                : "r1"
> > --                );
> > +-    "dmb      ish            \n" // Memory barrier. Make sure all
> memory accesses appearing before this complete before any that appear after
> > +-    "1:                      \n"
> > +-    "ldrex    %0, [%1]       \n" // Load the current value of
> *pAddr(%1) into prev (%0) and lock pAddr,
> > +-    "cmp      %0,  %2        \n" // Verify that the current value (%0)
> == old value (%2)
> > +-    "bne      2f             \n" // Bail if the two values are not
> equal [not as expected]
> > +-    "strex    r1,  %3, [%1]  \n"
> > +-    "cmp      r1,  #0        \n"
> > +-    "bne      1b             \n"
> > +-    "dmb      ish            \n" // Memory barrier.
> > +-    "2:                      \n"
> > +-    : "=&r" (prev)
> > +-    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > +-    : "r1"
> > +-    );
> >  -  return prev;
> > -+  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVal));
> > ++//#elif defined(__arm__)
> >  +//  register long prev;
> >  +//  asm volatile (
> > -+//                "1:                      \n"
> > -+//                "ldrex    %0, [%1]       \n" /* Load the current
> value of *pAddr(%1) into prev (%0) and lock pAddr,  */
> > -+//                "cmp      %0,  %2        \n" /* Verify that the
> current value (%0) == old value (%2) */
> > -+//                "bne      2f             \n" /* Bail if the two
> values are not equal [not as expected] */
> > -+//                "strex    r1,  %3, [%1]  \n"
> > -+//                "cmp      r1,  #0        \n"
> > -+//                "bne      1b             \n"
> > -+//                "2:                        "
> > -+//                : "=&r" (prev)
> > -+//                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > -+//                : "r1"
> > -+//                );
> > ++//    "dmb      ish            \n" // Memory barrier. Make sure all
> memory accesses appearing before this complete before any that appear after
> > ++//    "1:                      \n"
> > ++//    "ldrex    %0, [%1]       \n" // Load the current value of
> *pAddr(%1) into prev (%0) and lock pAddr,
> > ++//    "cmp      %0,  %2        \n" // Verify that the current value
> (%0) == old value (%2)
> > ++//    "bne      2f             \n" // Bail if the two values are not
> equal [not as expected]
> > ++//    "strex    r1,  %3, [%1]  \n"
> > ++//    "cmp      r1,  #0        \n"
> > ++//    "bne      1b             \n"
> > ++//    "dmb      ish            \n" // Memory barrier.
> > ++//    "2:                      \n"
> > ++//    : "=&r" (prev)
> > ++//    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
> > ++//    : "r1"
> > ++//    );
> >  +//  return prev;
> > - }
> >
> >   #elif defined(__mips__)
> > ---
> > -1.7.2.5
> > -
> > + // TODO:
> > diff --git
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuarm.patch
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuarm.patch
> > new file mode 100644
> > index 0000000..48f3d29
> > --- /dev/null
> > +++
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-Support-for-qemuarm.patch
> > @@ -0,0 +1,104 @@
> > +From 54ce0e5fef8d8f4a374eb9df68c22781f989b52d Mon Sep 17 00:00:00 2001
> > +From: Andrei Gherzan <andrei.gherzan@windriver.com>
> > +Date: Sun, 17 Aug 2014 14:47:36 +0200
> > +Subject: [PATCH] Add support for qemuarm
> > +
> > +Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +---
> > + configure.in           | 17 +++++++++++++++++
> > + m4/xbmc_arch.m4        |  3 +++
> > + xbmc/utils/MathUtils.h |  6 ++++--
> > + 3 files changed, 24 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure.in b/configure.in
> > +index a195d00..6e2d432 100644
> > +--- a/configure.in
> > ++++ b/configure.in
> > +@@ -231,6 +231,12 @@ AC_ARG_ENABLE([neon],
> > +   [use_neon=$enableval],
> > +   [use_neon=no])
> > +
> > ++AC_ARG_ENABLE([vfp],
> > ++  [AS_HELP_STRING([--enable-vfp],
> > ++  [enable vfp passing to ffmpeg (default is yes)])],
> > ++  [use_vfp=$enableval],
> > ++  [use_vfp=yes])
> > ++
> > + AC_ARG_ENABLE([optimizations],
> > +   [AS_HELP_STRING([--enable-optimizations],
> > +   [enable optimization (default is yes)])],
> > +@@ -750,6 +756,11 @@ case $use_platform in
> > +      CXXFLAGS="$CXXFLAGS"
> > +      ffmpeg_target_os=linux
> > +      ;;
> > ++  qemuarm)
> > ++     use_arch="arm"
> > ++     use_neon=no
> > ++     use_vfp=no
> > ++     ;;
> > + esac
> > +
> > + XBMC_SETUP_ARCH_DEFINES()
> > +@@ -2757,6 +2768,11 @@ XB_CONFIG_MODULE([lib/ffmpeg], [
> > +       else
> > +         ffmpg_config="$ffmpg_config --disable-neon"
> > +       fi
> > ++      if test "$use_vfp"  = "yes"; then
> > ++        ffmpg_config="$ffmpg_config --enable-vfp"
> > ++      else
> > ++        ffmpg_config="$ffmpg_config --disable-vfp"
> > ++      fi
> > +     else
> > +       ffmpg_config="$ffmpg_config --disable-amd3dnow"
> > +     fi
> > +@@ -2815,6 +2831,7 @@ XB_CONFIG_MODULE([lib/ffmpeg], [
> > +       `if test "$use_arch" != "no"; then echo --arch=$use_arch; fi`\
> > +       `if test "$use_cpu" != "no"; then echo --cpu=$use_cpu; fi`\
> > +       `if test "$use_neon" = "yes"; then echo --enable-neon; else echo
> --disable-neon; fi`\
> > ++      `if test "$use_vfp" = "yes"; then echo --enable-vfp; else echo
> --disable-vfp; fi`\
> > +       --target-os=$ffmpeg_target_os \
> > +       --disable-muxers \
> > +       --enable-muxer=spdif \
> > +diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
> > +index 5bcdd81..f349cb2 100644
> > +--- a/m4/xbmc_arch.m4
> > ++++ b/m4/xbmc_arch.m4
> > +@@ -47,5 +47,8 @@ case $use_platform in
> > +   raspberry-pi)
> > +      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX
> -D_ARMEL -DTARGET_RASPBERRY_PI")
> > +      ;;
> > ++  qemuarm)
> > ++     AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX
> -DTARGET_QEMUARM")
> > ++     ;;
> > + esac
> > + ])
> > +diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
> > +index 96af9f4..69fd058 100644
> > +--- a/xbmc/utils/MathUtils.h
> > ++++ b/xbmc/utils/MathUtils.h
> > +@@ -36,7 +36,8 @@
> > +     defined(__powerpc__) || \
> > +    (defined(TARGET_DARWIN_IOS) && defined(__llvm__)) || \
> > +    (defined(TARGET_ANDROID) && defined(__arm__)) || \
> > +-    defined(TARGET_RASPBERRY_PI)
> > ++    defined(TARGET_RASPBERRY_PI) || \
> > ++    defined(TARGET_QEMUARM)
> > +   #define DISABLE_MATHUTILS_ASM_ROUND_INT
> > + #endif
> > +
> > +@@ -44,7 +45,8 @@
> > +     defined(__powerpc__) || \
> > +    (defined(TARGET_DARWIN) && defined(__llvm__)) || \
> > +    (defined(TARGET_ANDROID) && defined(__arm__)) || \
> > +-    defined(TARGET_RASPBERRY_PI)
> > ++    defined(TARGET_RASPBERRY_PI) || \
> > ++    defined(TARGET_QEMUARM)
> > +   #define DISABLE_MATHUTILS_ASM_TRUNCATE_INT
> > + #endif
> > +
> > +--
> > +1.9.3
> > +
> > diff --git
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
> > deleted file mode 100644
> > index 345e20e..0000000
> > ---
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -From fd8f73826240aae543a41a2bfeea0056e2fe594d Mon Sep 17 00:00:00 2001
> > -From: Koen Kooi <koen@dominion.thruhere.net>
> > -Date: Mon, 11 Mar 2013 11:04:29 +0100
> > -Subject: [PATCH] configure: cope with ld-is-gold DISTRO_FEATURE
> > -
> > -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ----
> > -
> > -Upstream-Stature: backport
> > -
> > - configure.in |   12 +++++++-----
> > - 1 files changed, 7 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/configure.in b/configure.in
> > -index ef94683..c8b459b 100755
> > ---- a/configure.in
> > -+++ b/configure.in
> > -@@ -18,9 +18,14 @@ tolower(){
> > - # check for library basenames
> > - AC_DEFUN([XB_FIND_SONAME],
> > - [
> > -+  #set -x
> > -   if [[ "$host_vendor" != "apple" ]]; then
> > -     AC_MSG_CHECKING([for lib$2 soname])
> > -     $1_FILENAME=$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-M
> 2>/dev/null | grep "^LOAD.*$2" | awk '{V=2; print $V}')
> > -+    if [[ -z $$1_FILENAME ]]; then
> > -+      #try gold linker syntax
> > -+      $1_FILENAME=$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-t
> 3>&1 1>&2 2>&3 | grep "$2")
> > -+    fi
> > -     if [[ ! -z $$1_FILENAME ]]; then
> > -       $1_SONAME=$(objdump -p $$1_FILENAME | grep "SONAME.*$2" | awk
> '{V=2; print $V}')
> > -     fi
> > -@@ -55,6 +60,7 @@ AC_DEFUN([XB_FIND_SONAME],
> > -     AC_MSG_RESULT([$$1_SONAME])
> > -     AC_SUBST($1_SONAME)
> > -   fi
> > -+  #set +x
> > - ])
> > -
> > - # Function to push and pop libs and includes for a command
> > ---
> > -1.7.7.6
> > -
> > diff --git
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
> > deleted file mode 100644
> > index 5c14059..0000000
> > ---
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From cfd851660a594801a591e80dc820c65cb7bd7836 Mon Sep 17 00:00:00 2001
> > -From: Otavio Salvador <otavio@ossystems.com.br>
> > -Date: Sat, 6 Oct 2012 06:40:03 -0300
> > -Subject: [PATCH] configure.in: Avoid running code or we break
> cross-compile
> > -
> > -Upstream-Status: Backport [similar change done for 12.0]
> > -
> > -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ----
> > - configure.in |    6 +-----
> > - 1 files changed, 1 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/configure.in b/configure.in
> > -index ef94683..d7efcb0 100755
> > ---- a/configure.in
> > -+++ b/configure.in
> > -@@ -1246,11 +1246,7 @@ if test "$use_external_ffmpeg" = "yes"; then
> > -   AC_DEFINE([USE_EXTERNAL_FFMPEG], [1], [Whether to use external
> FFmpeg libraries.])
> > -
> > -   # Disable vdpau support if external libavcodec doesn't have it
> > --  AC_RUN_IFELSE(
> > --    AC_LANG_PROGRAM([[#include <libavcodec/avcodec.h>]],
> > --      [[avcodec_register_all();
> > --        AVCodec *codec = avcodec_find_decoder_by_name("vc1_vdpau");
> > --        return (codec) ? 0 : 1;]]),,
> > -+  AC_CHECK_LIB([avcodec], [ff_vdpau_vc1_decode_picture],,
> > -     [if test "x$use_vdpau" = "xyes"; then
> > -       AC_MSG_ERROR($ffmpeg_vdpau_not_supported)
> > -     else
> > ---
> > -1.7.2.5
> > -
> > diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> > new file mode 100644
> > index 0000000..9a46d50
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.bb
> > @@ -0,0 +1,114 @@
> > +SUMMARY = "XBMC Media Center"
> > +DESCRIPTION = "XBMC is an award-winning free and open source (GPL)
> software \
> > +media player and entertainment hub that can be installed on Linux, OSX,
> \
> > +Windows, iOS, and Android, featuring a 10-foot user interface for use
> with \
> > +televisions and remote controls."
> > +HOMEPAGE = "http://xbmc.org/"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
> > +
> > +DEPENDS = "yajl libxmu fribidi mpeg2dec curl python libmodplug
> libmicrohttpd \
> > +           sqlite3 libcdio libpcre boost lzo taglib libtinyxml jasper
> libass \
> > +           libmad jpeg libsamplerate0 libvorbis tiff libxslt
> libgpg-error \
> > +           libsdl virtual/egl swig-native gperf-native unzip-native
> zip-native"
> > +
> > +DEPENDS_append_arm = " cmake-native"
> > +DEPENDS_append_x86 = " nasm-native"
> > +
> > +CODENAME = "Gotham"
> > +SRCREV = "84725b0b1df072aecd26a55b82ef50ec828e595b"
> > +SRC_URI = "git://github.com/xbmc/xbmc.git;branch=${CODENAME} \
> > +
>  file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
> > +
>  file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
> > +
>  file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
> > +           file://0004-Support-for-qemuarm.patch"
> > +
> > +inherit autotools-brokensep gettext python-dir
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +# Don't activate texturepacker as it needs libsdl-image-native. Due to
> some issues
> > +# with qemu we use the host's libsdl on which libsdl-image-native
> depends.
> > +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl',
> 'opengl', 'opengles2', d)} \
> > +                   sdl airplay ssh libusb libcec samba mysql avahi
> xrandr x11 joystick \
> > +                   mid rtmp libmp3lame optical-drive debug"
> > +
> > +PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,glew"
> > +PACKAGECONFIG[opengles2] = "--enable-gles,--enable-gl,"
> > +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl-mixer
> libsdl-image"
> > +PACKAGECONFIG[airplay] = "--enable-airplay,--disable-airplay,libplist"
> > +PACKAGECONFIG[ssh] = "--enable-ssh,--disable-ssh,libssh"
> > +PACKAGECONFIG[libcec] = "--enable-libcec,--disable-libcec,libcec"
> > +PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb"
> > +PACKAGECONFIG[samba] = "--enable-samba,--disable-samba,samba"
> > +PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
> > +PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
> > +PACKAGECONFIG[xrandr] = "--enable-xrandr,--disable-xrandr,libxrandr"
> > +PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,"
> > +PACKAGECONFIG[joystick] = "--enable-joystick,--disable-joystick,"
> > +PACKAGECONFIG[texturepacker] =
> "--enable-texturepacker,--disable-texturepacker,libsdl-image-native"
> > +PACKAGECONFIG[mid] = "--enable-mid,--disable-mid,"
> > +PACKAGECONFIG[rtmp] = "--enable-rtmp,--disable-rtmp,rtmpdump"
> > +PACKAGECONFIG[optical-drive] =
> "--enable-optical-drive,--disable-optical-drive,libcdio"
> > +PACKAGECONFIG[libmp3lame] =
> "--enable-libmp3lame,--disable-libmp3lame,lame"
> > +PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,"
> > +
> > +EXTRA_OECONF_append_qemuarm = " --with-platform=qemuarm "
>
> It isn't MACHINE_ARCH, why not disable vfp for all MACHINEs
> (TUNE_PKGARGs) without vfp in TUNE_FEATURES?
>
>
Is not as simple as doing it from configure. And this is because configure
will overwrite this values on a "host" automatic detection. And I needed to
create a new platform to deactivate neon and vfp. to try to manage vfp and
neon separately... would mean some additional work even though nobody will
actually use xbmc in those configurations. I did it only to unbreak some of
the platforms ("some" being qemuarm). What do you think?


-- 
*Andrei Gherzan*

