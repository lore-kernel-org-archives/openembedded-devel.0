Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIj-0007mg-AK
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:04:23 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so675213eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=qLo7iOAXj6KIGW4rPHZT/M/x0viNp6q7VlCNNT0ia6U=;
	b=WiHHNktiUf2hl98vVV/+h5uup3HBp9NwUCCnixP7q3fdUj/B2uJI3PP19+SDWesrI6
	iBy6FoD1wc753xI+LBilC31ZGqYXWd1gD8d2pmXKiZeMN0uTz5TOkWJngbFTJ7XKcEiv
	eSdEcktl71GJl11CY+YWIcjAgVJUl5+9vlJvCnP8GQY4w/Mj/5+YWTMzPBFxb/chDvWg
	e128EEDNstB2qWZTOaBuror1ZdUh4gDrKi85lN761e/zFnmcP/mKTlVwmGCM8dEiy9Fh
	y1CCk0WRctM7GQmfFLXimTbn2604Xgfz0GwIF3uwwIzsQfU3/TIgtbf9o1PnGUJgtsBZ
	GTyQ==
X-Received: by 10.14.107.69 with SMTP id n45mr15742221eeg.23.1365677218583;
	Thu, 11 Apr 2013 03:46:58 -0700 (PDT)
Received: from ?IPv6:2001:610:612::3489:27c8:de55:7ab2?
	([2001:610:612:0:3489:27c8:de55:7ab2])
	by mx.google.com with ESMTPS id u44sm4919612eel.7.2013.04.11.03.46.55
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130411094749.GC2477@jama>
Date: Thu, 11 Apr 2013 12:46:56 +0200
Message-Id: <15C34B98-3B0D-4BD8-B5C8-EBA1C9439D1A@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
	<20130411094749.GC2477@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkHz0VNnqKUXsBJ/mA8/BEKELCJsR98odzvIR2wYSgIAMn2GxOBhYn8HTV0SIlF0eauIBqG
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/8] nodejs: add 0.8.18
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
X-List-Received-Date: Thu, 11 Apr 2013 11:04:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 apr. 2013, om 11:47 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Wed, Apr 10, 2013 at 06:14:15PM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Replying on first, because there isn't any cover letter :).
>=20
> I've merged 1/8 (from previous version with fix for dash and dropped
> RDEPENDS_virtclass-native), 7/8 and 8/8 (2/8 was already there)
>=20
> 3/8, 4/8, 5/8 have some feedback and 6/8 depends on 5/8 afaik

Hmm, I sent v2 yesterday, but it seems the list rejected them, resending =
those. Then I'll rebase and look at v3

>=20
> Now jenkins is running another clean build for PN-systemd removal..
>=20
>> ---
>> ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 =
++++++++++++++++++++++
>> meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 42 =
+++++++++++++++
>> 2 files changed, 102 insertions(+)
>> create mode 100644 =
meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-de=
note-hard-abi-when-in-.patch
>> create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>>=20
>> diff --git =
a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-=
denote-hard-abi-when-in-.patch =
b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-=
denote-hard-abi-when-in-.patch
>> new file mode 100644
>> index 0000000..6268d69
>> --- /dev/null
>> +++ =
b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-=
denote-hard-abi-when-in-.patch
>> @@ -0,0 +1,60 @@
>> +=46rom bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00 =
2001
>> +From: Koen Kooi <koen@dominion.thruhere.net>
>> +Date: Wed, 30 Jan 2013 10:43:47 +0100
>> +Subject: [PATCH] gcc has a builtin define to denote hard abi when in =
use, e.g.
>> + when using -mfloat-abi=3Dhard it will define __ARM_PCS_VFP to 1 and =
therefore
>> + we should check that to determine which calling convention is in =
use and not
>> + __VFP_FP__ which merely indicates presence of VFP unit
>> +
>> +The fix has been provided by Khem Raj <raj.khem@gmail.com>
>> +
>> +Upstream-Status: Forwarded
>> +
>> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> +---
>> + deps/v8/src/arm/assembler-arm.cc | 4 ++--
>> + deps/v8/src/platform-linux.cc    | 4 ++--
>> + 2 files changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/deps/v8/src/arm/assembler-arm.cc =
b/deps/v8/src/arm/assembler-arm.cc
>> +index 1787d15..c64ef58 100644
>> +--- a/deps/v8/src/arm/assembler-arm.cc
>> ++++ b/deps/v8/src/arm/assembler-arm.cc
>> +@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
>> +   // If the compiler is allowed to use VFP then we can use VFP too =
in our code
>> +   // generation even when generating snapshots. ARMv7 and hardware =
floating
>> +   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
>> +-#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
>> ++#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
>> +     && !defined(__SOFTFP__)
>> +   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
>> +-#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && =
defined(__VFP_FP__)
>> ++#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && =
defined(__ARM_PCS_VFP)
>> +         // && !defined(__SOFTFP__)
>> + #endif  // _arm__
>> +=20
>> +diff --git a/deps/v8/src/platform-linux.cc =
b/deps/v8/src/platform-linux.cc
>> +index ed9eb79..10d1879 100644
>> +--- a/deps/v8/src/platform-linux.cc
>> ++++ b/deps/v8/src/platform-linux.cc
>> +@@ -170,7 +170,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
>> + // calling this will return 1.0 and otherwise 0.0.
>> + static void ArmUsingHardFloatHelper() {
>> +   asm("mov r0, #0":::"r0");
>> +-#if defined(__VFP_FP__) && !defined(__SOFTFP__)
>> ++#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
>> +   // Load 0x3ff00000 into r1 using instructions available in both =
ARM
>> +   // and Thumb mode.
>> +   asm("mov r1, #3":::"r1");
>> +@@ -195,7 +195,7 @@ static void ArmUsingHardFloatHelper() {
>> + #else
>> +   asm("vmov d0, r0, r1");
>> + #endif  // __thumb__
>> +-#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
>> ++#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
>> +   asm("mov r1, #0":::"r1");
>> + }
>> +=20
>> +--=20
>> +1.8.1
>> +
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb =
b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>> new file mode 100644
>> index 0000000..4c4a18c
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>> @@ -0,0 +1,42 @@
>> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>> +HOMEPAGE =3D "http://nodejs.org"
>> +LICENSE =3D "MIT & BSD"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e3c72d"
>> +
>> +DEPENDS =3D "openssl"
>> +
>> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>> +           =
file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
>> +"
>> +SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
>> +SRC_URI[sha256sum] =3D =
"1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
>> +
>> +S =3D "${WORKDIR}/node-v${PV}"
>> +
>> +# v8 errors out if you have set CCACHE
>> +CCACHE =3D ""
>> +
>> +ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES', =
'callconvention-hard', '--with-arm-float-abi=3Dhard', =
'--with-arm-float-abi=3Dsoftfp', d)}"
>> +ARCHFLAGS ?=3D ""
>> +
>> +# Node is way too cool to use proper autotools, so we install two =
wrappers to forcefully inject proper arch cflags to workaround gypi
>> +do_configure () {
>> +  export LD=3D"${CXX}"
>> +
>> +  ./configure --prefix=3D${prefix} --without-snapshot ${ARCHFLAGS}
>> +}
>> +
>> +do_compile () {
>> +  export LD=3D"${CXX}"
>> +  make BUILDTYPE=3DRelease
>> +}
>> +
>> +do_install () {
>> +  DESTDIR=3D${D} oe_runmake install
>> +}
>> +
>> +RDEPENDS_${PN} =3D "curl python-shell python-datetime =
python-subprocess python-crypt python-textutils python-netclient "
>> +RDEPENDS_${PN}_virtclass-native =3D "curl-native python-native"
>> +
>> +FILES_${PN} +=3D "${libdir}/node/wafadmin ${libdir}/node_modules =
${libdir}/dtrace"
>> +BBCLASSEXTEND =3D "native"
>> --=20
>> 1.8.1.4
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



