Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676EDC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:02:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.16126.1738166566511465789
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=usX8LQ1w;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50TG2j7U1342201
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 10:02:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738166565;
	bh=orjDr1BVJSbJm9q+MPM5KPPr7eXxqsAW3W3Fi8cZkYc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=usX8LQ1wWy+gAMyziDn1BOsnHudptG96U50EzYsWwWXqdZhGqxdu8mX4GbxG7gNVf
	 GvXEfXGBbhehMZZxtcWRytjJaPR17rhH4QD68BcyySSRet6kft9gV0WYBWd9px73Ve
	 bxTKm58z7H578jf+RgFeDnWf5ZmeDaIoerLzJrmg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50TG2jLI001424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jan 2025 10:02:45 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 Jan 2025 10:02:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 Jan 2025 10:02:44 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50TG2i1m059194;
	Wed, 29 Jan 2025 10:02:44 -0600
Message-ID: <631ae050-03ea-40c4-8c9f-b8c1f98a3233@ti.com>
Date: Wed, 29 Jan 2025 10:02:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [master][PATCH] opencl-cts: add recipe
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <20250127145533.1510728-1-a-christidis@ti.com>
 <CAMKF1sq-vDu4S5jPPH6yxHX=SGuK3syJ+0oOjeEdyUcCc-iL1A@mail.gmail.com>
 <f170e856-3e9d-498a-8758-18b26c3ecf18@ti.com>
 <CAMKF1sojVNko3cHP0mszJg+rkB0wbeWTYfXWBS=UYFBjF2gMMw@mail.gmail.com>
 <CAMKF1sp+gAAcA0L-+=H=9DK9ar5mwLuE77zCEaPdq-jVfpG57A@mail.gmail.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <CAMKF1sp+gAAcA0L-+=H=9DK9ar5mwLuE77zCEaPdq-jVfpG57A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 50TG2j7U1342201
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 16:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115138

Hello,

Thank you for taking time and making the patch for Werror disablement.

I have already notified opencl-cts upstream about the warnings, made a=20
pull request which has been approved. Now waiting for the merge, once=20
that is merged, all warnings should be resolved without the need of=20
disabling -Werror.

Once my changes will be merged, they will be included in the next=20
release of openl-cts and I'll send new patches here editing the recipe=20
accordingly.

Regards,

Antonios

On 1/28/25 11:10 PM, Khem Raj wrote:
> FWIW, I have tweaked your patch to add a CMake option to provide a=20
> knob to allow disabling Werror, this is a good to have especially for=20
> distributions, since they may not be interested in fixing warnings as=20
> errors, while developers of this component
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczggGK0zQgUO0=
v2psgSyQ8iN4-2htHmBpKsKI91RdSZ0HEd7IgSAqdzBMRqACMmOs-zI__9yVKsMYMHFOiW86J=
t3ID38rqWvMPp95MnO7Iod29NLYwRoEvk$>=20
>
> ZjQcmQRYFpfptBannerEnd
> FWIW, I have tweaked your patch to add a CMake option to provide a
> knob to allow disabling Werror, this is a good to have
> especially for distributions, since they may not be interested in
> fixing warnings as errors, while developers of this component
> might be interested in enabling it.
>
> Please submit this patch to opencl-cts upstream
>
> On Tue, Jan 28, 2025 at 11:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> >
> > autobuilder config is default poky setup, so unless you are using
> > other distro options which might impact it, e.g. using clang compiler
> > or not using security options.
> >
> > On Mon, Jan 27, 2025 at 2:14=E2=80=AFPM Antonios Christidis <a-christ=
idis@ti.com> wrote:
> > >
> > > Hello,
> > >
> > > I am not able to replace those errors on my end. Are there any
> > > references describing the build environment of the auto builder? Ho=
ping
> > > to follow those and then be able to replicate those errors on my en=
d.
> > >
> > > Side note: This is interesting, as in the logs I'm seeing
> > > "[-Werror=3Dmaybe-uninitialized]" errors which my patch targeted to=
 fix.
> > >
> > > Regards,
> > >
> > > Antonios
> > >
> > >
> > > On 1/27/25 1:50 PM, Khem Raj wrote:
> > > > fails with master here
> > > > https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//au=
tobuilder.=E2=80=8Ayoctoproject.=E2=80=8Aorg/valkyrie/*/builders/81/build=
s/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWNd8Q7mT2lxwrfCEr8VY9ZJDD=
TdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$
> > > > cc1plus:
> > > > ZjQcmQRYFpfptBannerStart
> > > > This message was sent from outside of Texas Instruments.
> > > > Do not click links or open attachments unless you recognize the s=
ource
> > > > of this email and know the content is safe.
> > > > Report Suspicious
> > > > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczggGK0=
zQiXM8lsjUIw0foiJ4oL-lS26WbF22UijSS0Ba7zdDBO_8mMm1n2WN9uSVrZzguSdX1Wt-sbh=
juKEJ9lw_kgnhg9nodQmtYJ2kfTSN9lkr0sCjv4$>
> > > >
> > > > ZjQcmQRYFpfptBannerEnd
> > > > fails with master here
> > > >
> > > > https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/=
valkyrie/*/builders/81/builds/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G=
4EdWNd8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$=20
> >  <https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/va=
lkyrie/*/builders/81/builds/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4E=
dWNd8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$
> >>> >
> > > > cc1plus: error: '-Wformat-security' ignored without '-Wformat'
> > > > [-Werror=3Dformat-security]
> > > > | cc1plus: all warnings being treated as errors
> > > >
> > > > On Mon, Jan 27, 2025 at 6:55=E2=80=AFAM <a-christidis@ti.com> wro=
te:
> > > > >
> > > > > From: Antonios Christidis <a-christidis@ti.com>
> > > > >
> > > > > This recipe provides the opecl-cts suite.  This is a pre-releas=
e version
> > > > > v2024-08-08, which I have tested to work with opencl-headers ve=
rsion v2024.05.08
> > > > > . The pre-release version was picked due to incompatibility iss=
ues with other
> > > > > versions of headers.
> > > > >
> > > > > The recipe also includes a patch, to allow it to compile and bu=
ild properly.
> > > > > Further information below.
> > > > >
> > > > > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > > > ---
> > > > >  .../files/0001-Ignore-Compiler-Warnings.patch | 37 +++++++++++=
++++++++
> > > > >  .../opencl/opencl-cts_2024.08.08.bb           | 26 +++++++++++=
++
> > > > >  2 files changed, 63 insertions(+)
> > > > >  create mode 100644 meta-oe/recipes-core/opencl/files/0001-Igno=
re-Compiler-Warnings.patch
> > > > >  create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024=
.08.08.bb
> > > > >
> > > > > diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Comp=
iler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compi=
ler-Warnings.patch
> > > > > new file mode 100644
> > > > > index 000000000..2515c7f16
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Wa=
rnings.patch
> > > > > @@ -0,0 +1,37 @@
> > > > > +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00=
:00 2001
> > > > > +From: Antonios Christidis <a-christidis@ti.com>
> > > > > +Date: Fri, 17 Jan 2025 15:05:39 -0600
> > > > > +Subject: [PATCH] Ignore Compiler Warnings
> > > > > +
> > > > > +
> > > > > +Within the cmake build system, the compiler -Werror flag is en=
abeled.  This
> > > > > +turns all warnings into errors and doens't allow the system to=
 compile
> > > > > +correctly.  Change the system to ignore the 3 warning rules th=
at show up when
> > > > > +compiling.
> > > > > +
> > > > > +Upstream-Status: Inappropriate [oe specific - compilation erro=
rs due to cross-compiling]
> > > > > +
> > > > > +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > > > +
> > > > > +---
> > > > > + CMakeLists.txt | 4 +++-
> > > > > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > +
> > > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > > +index 5cfef6b3..71b6ddb4 100644
> > > > > +--- a/CMakeLists.txt
> > > > > ++++ b/CMakeLists.txt
> > > > > +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX=
_COMPILER_ID}" MATCHES "(Apple)?Clang"
> > > > > +     add_cxx_flag_if_supported(-Wno-error=3Dcpp) # Allow #warn=
ing directive
> > > > > +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #=
785
> > > > > +     add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths=
) # Issue #784
> > > > > +-
> > > > > ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> > > > > ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> > > > > ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> > > > > +     # -msse -mfpmath=3Dsse to force gcc to use sse for float =
math,
> > > > > +     # avoiding excess precision problems that cause tests lik=
e int2float
> > > > > +     # to falsely fail. -ffloat-store also works, but WG sugge=
sted
> > > > > +--
> > > > > +2.34.1
> > > > > +
> > > > > diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.=
bb b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > > > new file mode 100644
> > > > > index 000000000..f6f4e9466
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > > > @@ -0,0 +1,26 @@
> > > > > +SUMMARY =3D "OpenCL CTS"
> > > > > +DESCRIPTION =3D "OpenCL CTS test suite"
> > > > > +LICENSE =3D "Apache-2.0"
> > > > > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57"
> > > > > +
> > > > > +inherit pkgconfig cmake
> > > > > +
> > > > > +DEPENDS +=3D "opencl-headers opencl-icd-loader"
> > > > > +RDEPENDS:${PN} +=3D "python3-core python3-io"
> > > > > +
> > > > > +S =3D "${WORKDIR}/git"
> > > > > +
> > > > > +SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;prot=
ocol=3Dhttps;branch=3Dmain;lfs=3D0 \
> > > > > +          file://0001-Ignore-Compiler-Warnings.patch"
> > > > > +
> > > > > +SRCREV =3D "a406b340913f622da089b00f284a597656c10239"
> > > > > +
> > > > > +EXTRA_OECMAKE:append =3D " -DCL_INCLUDE_DIR=3D${STAGING_INCDIR=
} -DCL_LIB_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
> > > > > +
> > > > > +do_install() {
> > > > > +        install -d ${D}${bindir}/opencl_test_conformance
> > > > > +        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_tes=
t_conformance
> > > > > +        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bi=
ndir}/opencl_test_conformance/run_conformance.py
> > > > > +        find "${D}${bindir}/opencl_test_conformance" -name cma=
ke_install.cmake -type f -delete
> > > > > +        find "${D}${bindir}/opencl_test_conformance" -name CMa=
keFiles -type d -exec rm -rf "{}" \; -depth
> > > > > +}
> > > > > --
> > > > > 2.34.1
> > > > >

