Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQENS-0002PV-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 12:05:13 +0200
Received: by mail-wg0-f46.google.com with SMTP id j13so1396938wgh.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CGse2v940U5xKzApzLAeQwLhi/J57LmGj3Dn5EYF47o=;
	b=jYu6qGrLq/nYzRKnrFFLSPKF6FSiiPd+xpql/If2Ifzq11QaOWlOhlOaYS+8pJGQZw
	genihTbF2ELXp51pa4wAYkYg4vBm8o9N04B4ATDoPkHtgsaK3bhy+gb0xWIIrSnDb82r
	6Yt6LRcnX2pbn229ljopc8QOdfIMLb4BY64TlcjBnYpFAvIZG/YlIDv17LL6CGGYFv5G
	LiwPr72aiYBY1stVmxjuZwGfsOufDNcOU+MqN0VFE/cwDZd+m6vObj3OMKrIB2HacjhS
	G7Er31/mnwFEbapkaegPn6Cu4Rg8nst4oxdgxWb7SOUjbHg8xnH50JENlFzZjp7d60Gg
	qwXw==
X-Received: by 10.194.109.35 with SMTP id hp3mr9393479wjb.15.1365673668068;
	Thu, 11 Apr 2013 02:47:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fg6sm2237271wib.10.2013.04.11.02.47.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 02:47:47 -0700 (PDT)
Date: Thu, 11 Apr 2013 11:47:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130411094749.GC2477@jama>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 11 Apr 2013 10:05:13 -0000
X-Groupsio-MsgNum: 44056
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline

--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 06:14:15PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Replying on first, because there isn't any cover letter :).

I've merged 1/8 (from previous version with fix for dash and dropped
RDEPENDS_virtclass-native), 7/8 and 8/8 (2/8 was already there)

3/8, 4/8, 5/8 have some feedback and 6/8 depends on 5/8 afaik

Now jenkins is running another clean build for PN-systemd removal..

> ---
>  ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 42 +++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a=
-builtin-define-to-denote-hard-abi-when-in-.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builti=
n-define-to-denote-hard-abi-when-in-.patch b/meta-oe/recipes-devtools/nodej=
s/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
> new file mode 100644
> index 0000000..6268d69
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defin=
e-to-denote-hard-abi-when-in-.patch
> @@ -0,0 +1,60 @@
> +From bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Wed, 30 Jan 2013 10:43:47 +0100
> +Subject: [PATCH] gcc has a builtin define to denote hard abi when in use=
, e.g.
> + when using -mfloat-abi=3Dhard it will define __ARM_PCS_VFP to 1 and the=
refore
> + we should check that to determine which calling convention is in use an=
d not
> + __VFP_FP__ which merely indicates presence of VFP unit
> +
> +The fix has been provided by Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Forwarded
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + deps/v8/src/arm/assembler-arm.cc | 4 ++--
> + deps/v8/src/platform-linux.cc    | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assemble=
r-arm.cc
> +index 1787d15..c64ef58 100644
> +--- a/deps/v8/src/arm/assembler-arm.cc
> ++++ b/deps/v8/src/arm/assembler-arm.cc
> +@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
> +   // If the compiler is allowed to use VFP then we can use VFP too in o=
ur code
> +   // generation even when generating snapshots. ARMv7 and hardware floa=
ting
> +   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> +-#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> ++#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
> +     && !defined(__SOFTFP__)
> +   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
> +-#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
> ++#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
> +         // && !defined(__SOFTFP__)
> + #endif  // _arm__
> +=20
> +diff --git a/deps/v8/src/platform-linux.cc b/deps/v8/src/platform-linux.=
cc
> +index ed9eb79..10d1879 100644
> +--- a/deps/v8/src/platform-linux.cc
> ++++ b/deps/v8/src/platform-linux.cc
> +@@ -170,7 +170,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
> + // calling this will return 1.0 and otherwise 0.0.
> + static void ArmUsingHardFloatHelper() {
> +   asm("mov r0, #0":::"r0");
> +-#if defined(__VFP_FP__) && !defined(__SOFTFP__)
> ++#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> +   // Load 0x3ff00000 into r1 using instructions available in both ARM
> +   // and Thumb mode.
> +   asm("mov r1, #3":::"r1");
> +@@ -195,7 +195,7 @@ static void ArmUsingHardFloatHelper() {
> + #else
> +   asm("vmov d0, r0, r1");
> + #endif  // __thumb__
> +-#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
> ++#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> +   asm("mov r1, #0":::"r1");
> + }
> +=20
> +--=20
> +1.8.1
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.8.18.bb
> new file mode 100644
> index 0000000..4c4a18c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE =3D "http://nodejs.org"
> +LICENSE =3D "MIT & BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e3c=
72d"
> +
> +DEPENDS =3D "openssl"
> +
> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> +           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-=
in-.patch \
> +"
> +SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
> +SRC_URI[sha256sum] =3D "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda=
3b71306fe9ae00f9"
> +
> +S =3D "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE =3D ""
> +
> +ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconvention=
-hard', '--with-arm-float-abi=3Dhard', '--with-arm-float-abi=3Dsoftfp', d)}"
> +ARCHFLAGS ?=3D ""
> +
> +# Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
> +do_configure () {
> +  export LD=3D"${CXX}"
> +
> +  ./configure --prefix=3D${prefix} --without-snapshot ${ARCHFLAGS}
> +}
> +
> +do_compile () {
> +  export LD=3D"${CXX}"
> +  make BUILDTYPE=3DRelease
> +}
> +
> +do_install () {
> +  DESTDIR=3D${D} oe_runmake install
> +}
> +
> +RDEPENDS_${PN} =3D "curl python-shell python-datetime python-subprocess =
python-crypt python-textutils python-netclient "
> +RDEPENDS_${PN}_virtclass-native =3D "curl-native python-native"
> +
> +FILES_${PN} +=3D "${libdir}/node/wafadmin ${libdir}/node_modules ${libdi=
r}/dtrace"
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFmhsUACgkQN1Ujt2V2gBxl2QCfZfBLROF6SzOsXzA/GJ+TqIEt
ulAAn15diftwoIcp1a18DwlALAFdbggS
=GSN7
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
