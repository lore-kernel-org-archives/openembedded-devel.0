Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B7EC26E9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 14:55:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jan 2014 06:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,750,1384329600"; d="scan'208";a="475146354"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2014 06:55:17 -0800
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 30 Jan 2014 14:54:56 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.210]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.202]) with mapi id
	14.03.0123.003; Thu, 30 Jan 2014 14:54:56 +0000
From: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] nodejs 0.8.18: update to 0.10.25
Thread-Index: AQHPHRysgGbyINr+J0KX5lZlHeshUpqcBZcAgAAA+wCAACRgAIABMKnA
Date: Thu, 30 Jan 2014 14:54:55 +0000
Message-ID: <6741EAAB26B57F4995668065CB62D86B339D60AD@IRSMSX102.ger.corp.intel.com>
References: <1391018608-8719-1-git-send-email-krzysztof.m.sywula@intel.com>
	<20140129182830.GQ3718@jama>
	<6741EAAB26B57F4995668065CB62D86B339D5BA5@IRSMSX102.ger.corp.intel.com>
	<20140129204212.GR3718@jama>
In-Reply-To: <20140129204212.GR3718@jama>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>
Subject: Re: [PATCH] nodejs 0.8.18: update to 0.10.25
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
X-List-Received-Date: Thu, 30 Jan 2014 14:55:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Regarding cloud9 and nodejs 0.10.25 I have:
cloud9/0.6-r5/temp/run.do_configure.1786: line 79: node-waf: command not fo=
und
Is that the same problem you had? =


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Wednesday, January 29, 2014 8:42 PM
To: openembedded-devel@lists.openembedded.org
Cc: koen@dominion.thruhere.net
Subject: Re: [oe] [PATCH] nodejs 0.8.18: update to 0.10.25

On Wed, Jan 29, 2014 at 06:33:36PM +0000, Sywula, Krzysztof M wrote:
> No, I didn't try cloud9. =

> Is it a blocker for bumping nodejs? Or in such a case we should preserve =
0.8 and add 0.10 next to it?

Yes, it's blocker, because then I would need to find some volunteer to fix =
cloud9.

preserving 0.8 like nodejs4 is (separate files in sysroot, parallel
installation) would be best.

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org =

> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =

> Of Martin Jansa
> Sent: Wednesday, January 29, 2014 6:29 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: koen@dominion.thruhere.net
> Subject: Re: [oe] [PATCH] nodejs 0.8.18: update to 0.10.25
> =

> On Wed, Jan 29, 2014 at 06:03:28PM +0000, krzysztof.m.sywula@intel.com wr=
ote:
> > From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> > =

> > Regenerated Khem's patch for assembler-arm.cc, skipped:
> > deps/v8/src/platform-linux.cc since it is already correct in current =

> > nodejs version
> =

> Have you tried to build cloud9?
> =

> Last time I've tried:
> http://patchwork.openembedded.org/patch/48253/
> =

> cloud9 wasn't compatible with 0.10*
> =

> > Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> > ---
> >  ...erating-Khem-s-patch-for-assembler-arm.cc.patch | 31 +++++++++++ =

> > ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60
> > ----------------------  .../nodejs/{nodejs_0.8.18.bb =3D> =

> > nodejs_0.10.25.bb} | 12 ++---
> >  3 files changed, 37 insertions(+), 66 deletions(-)  create mode
> > 100644
> > meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patc
> > h- for-assembler-arm.cc.patch  delete mode 100644 =

> > meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define
> > -t o-denote-hard-abi-when-in-.patch  rename =

> > meta-oe/recipes-devtools/nodejs/{nodejs_0.8.18.bb =3D> =

> > nodejs_0.10.25.bb} (73%)
> > =

> > diff --git
> > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-pa
> > tc
> > h-for-assembler-arm.cc.patch
> > b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-pa
> > tc
> > h-for-assembler-arm.cc.patch
> > new file mode 100644
> > index 0000000..19b4b6d
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-
> > +++ s- patch-for-assembler-arm.cc.patch
> > @@ -0,0 +1,31 @@
> > +From 9febf23ae39c6b7a49b3e9a43319ec9dca8ea771 Mon Sep 17 00:00:00
> > +2001
> > +From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> > +Date: Wed, 29 Jan 2014 17:32:13 +0000
> > +Subject: [PATCH] Regenerating Khem's patch for assembler-arm.cc
> > +
> > +deps/v8/src/platform-linux.cc is already fixed in this version of =

> > +nodejs, so no need to patch it again.
> > +---
> > + deps/v8/src/arm/assembler-arm.cc | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/deps/v8/src/arm/assembler-arm.cc
> > +b/deps/v8/src/arm/assembler-arm.cc
> > +index 9be62a4..f919ff1 100644
> > +--- a/deps/v8/src/arm/assembler-arm.cc
> > ++++ b/deps/v8/src/arm/assembler-arm.cc
> > +@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
> > +   // If the compiler is allowed to use VFP then we can use VFP too in=
 our code
> > +   // generation even when generating snapshots. ARMv7 and hardware fl=
oating
> > +   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> > +-#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> > ++#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) =

> > ++\
> > +     && !defined(__SOFTFP__)
> > +   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2; -#endif  //
> > +defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
> > ++#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) &&
> > ++defined(__ARM_PCS_VFP)
> > +         // && !defined(__SOFTFP__)  #endif  // _arm__
> > +   if (answer & (1u << ARMv7)) {
> > +--
> > +1.7.12.2
> > +
> > diff --git
> > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defi
> > ne
> > -to-denote-hard-abi-when-in-.patch
> > b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defi
> > ne
> > -to-denote-hard-abi-when-in-.patch
> > deleted file mode 100644
> > index 6268d69..0000000
> > ---
> > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defi
> > ne
> > -to-denote-hard-abi-when-in-.patch
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -From bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00
> > 2001
> > -From: Koen Kooi <koen@dominion.thruhere.net>
> > -Date: Wed, 30 Jan 2013 10:43:47 +0100
> > -Subject: [PATCH] gcc has a builtin define to denote hard abi when in u=
se, e.g.
> > - when using -mfloat-abi=3Dhard it will define __ARM_PCS_VFP to 1 and =

> > therefore
> > - we should check that to determine which calling convention is in =

> > use and not
> > - __VFP_FP__ which merely indicates presence of VFP unit
> > -
> > -The fix has been provided by Khem Raj <raj.khem@gmail.com>
> > -
> > -Upstream-Status: Forwarded
> > -
> > -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ----
> > - deps/v8/src/arm/assembler-arm.cc | 4 ++--
> > - deps/v8/src/platform-linux.cc    | 4 ++--
> > - 2 files changed, 4 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/deps/v8/src/arm/assembler-arm.cc
> > b/deps/v8/src/arm/assembler-arm.cc
> > -index 1787d15..c64ef58 100644
> > ---- a/deps/v8/src/arm/assembler-arm.cc
> > -+++ b/deps/v8/src/arm/assembler-arm.cc
> > -@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
> > -   // If the compiler is allowed to use VFP then we can use VFP too in=
 our code
> > -   // generation even when generating snapshots. ARMv7 and hardware fl=
oating
> > -   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> > --#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> > -+#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) =

> > -+\
> > -     && !defined(__SOFTFP__)
> > -   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
> > --#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) &&
> > defined(__VFP_FP__)
> > -+#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) &&
> > -+defined(__ARM_PCS_VFP)
> > -         // && !defined(__SOFTFP__)
> > - #endif  // _arm__
> > -
> > -diff --git a/deps/v8/src/platform-linux.cc =

> > b/deps/v8/src/platform-linux.cc -index ed9eb79..10d1879 100644
> > ---- a/deps/v8/src/platform-linux.cc
> > -+++ b/deps/v8/src/platform-linux.cc
> > -@@ -170,7 +170,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
> > - // calling this will return 1.0 and otherwise 0.0.
> > - static void ArmUsingHardFloatHelper() {
> > -   asm("mov r0, #0":::"r0");
> > --#if defined(__VFP_FP__) && !defined(__SOFTFP__)
> > -+#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> > -   // Load 0x3ff00000 into r1 using instructions available in both ARM
> > -   // and Thumb mode.
> > -   asm("mov r1, #3":::"r1");
> > -@@ -195,7 +195,7 @@ static void ArmUsingHardFloatHelper() {
> > - #else
> > -   asm("vmov d0, r0, r1");
> > - #endif  // __thumb__
> > --#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
> > -+#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> > -   asm("mov r1, #0":::"r1");
> > - }
> > -
> > ---
> > -1.8.1
> > -
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> > similarity index 73%
> > rename from meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > rename to meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> > index ec9e4cf..a6e8c3f 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> > @@ -1,15 +1,15 @@
> >  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> >  HOMEPAGE =3D "http://nodejs.org"
> >  LICENSE =3D "MIT & BSD"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e=
3c72d"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a31e6c424761191227143b86f5=
8a1ef"
> >  =

> >  DEPENDS =3D "openssl"
> >  =

> > -SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> > -           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-whe=
n-in-.patch \
> > -"
> > -SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
> > -SRC_URI[sha256sum] =3D "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1d=
da3b71306fe9ae00f9"
> > +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
> > +#           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-wh=
en-in-.patch =

> > +
> > +SRC_URI[md5sum] =3D "153bdbf77b4473df2600b8ce123ef331"
> > +SRC_URI[sha256sum] =3D "46eef3b9d5475a2081dc2b2f7cf1f4c3a56824d1fc9b04=
e7ed1d7a88e8f6b36f"
> >  =

> >  S =3D "${WORKDIR}/node-v${PV}"
> >  =

> > --
> > 1.7.12.2
> > =

> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> =

> -- =

> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> -------------------------------------------------------------
> Intel Ireland Limited (Branch)
> Collinstown Industrial Park, Leixlip, County Kildare, Ireland =

> Registered Number: E902934
> =

> This e-mail and any attachments may contain confidential material for =

> the sole use of the intended recipient(s). Any review or distribution =

> by others is strictly prohibited. If you are not the intended =

> recipient, please contact the sender and delete all copies.
> =

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- =

Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


