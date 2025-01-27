Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB10FC02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 22:21:03 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4322.1738016454081579584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 14:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=XTRmGMJZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50RMKrxs1903170
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 16:20:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738016453;
	bh=jWMIR9+Gh0LbkFGDJV0q1QKX4CxKv5mvEoAtjw5eA5A=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=XTRmGMJZaA0g4sjlaRp9oZR98Op9gO4kjHP9cXSn9J8H9o8jokEIdLTVjlzgIsmYD
	 ImbbctuXOxvkzGeBgiDNWBck9TFRyzfHYh2sdYpkwK4E1qH2CHUwHDZyVRazvqXpHk
	 wC7JCV8X4dWH30PZ4kboBjaCbja+MMb1KbJ2VSd0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50RMKrQM022886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2025 16:20:53 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 16:20:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 16:20:52 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50RMKq16102117;
	Mon, 27 Jan 2025 16:20:52 -0600
Message-ID: <da0dcacc-368f-4c54-a73a-0bf16e93e767@ti.com>
Date: Mon, 27 Jan 2025 16:20:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [master][PATCH] opencl-cts: add recipe
From: Antonios Christidis <a-christidis@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <20250127145533.1510728-1-a-christidis@ti.com>
 <CAMKF1sq-vDu4S5jPPH6yxHX=SGuK3syJ+0oOjeEdyUcCc-iL1A@mail.gmail.com>
 <f170e856-3e9d-498a-8758-18b26c3ecf18@ti.com>
Content-Language: en-US
In-Reply-To: <f170e856-3e9d-498a-8758-18b26c3ecf18@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 50RMKrxs1903170
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 22:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115113

Hello,

Typo error, meant to say replicate not replace.

Apologies,

Antonios

On 1/27/25 4:14 PM, Antonios Christidis wrote:
> Hello,
>
> I am not able to replace those errors on my end. Are there any=20
> references describing the build environment of the auto builder?=20
> Hoping to follow those and then be able to replicate those errors on=20
> my end.
>
> Side note: This is interesting, as in the logs I'm seeing=20
> "[-Werror=3Dmaybe-uninitialized]" errors which my patch targeted to fix.
>
> Regards,
>
> Antonios
>
>
> On 1/27/25 1:50 PM, Khem Raj wrote:
>> fails with master here=20
>> https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//autobui=
lder.=E2=80=8Ayoctoproject.=E2=80=8Aorg/valkyrie/*/builders/81/builds/320=
/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWNd8Q7mT2lxwrfCEr8VY9ZJDDTdQDw=
d5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$=20
>> cc1plus:=E2=80=8A
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the=20
>> source of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczggGK0zQiXM=
8lsjUIw0foiJ4oL-lS26WbF22UijSS0Ba7zdDBO_8mMm1n2WN9uSVrZzguSdX1Wt-sbhjuKEJ=
9lw_kgnhg9nodQmtYJ2kfTSN9lkr0sCjv4$>=20
>>
>> ZjQcmQRYFpfptBannerEnd
>> fails with master here
>>
>> https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/valky=
rie/*/builders/81/builds/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWN=
d8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$=20
>>
>>
>> cc1plus: error: '-Wformat-security' ignored without '-Wformat'
>> [-Werror=3Dformat-security]
>> | cc1plus: all warnings being treated as errors
>>
>> On Mon, Jan 27, 2025 at 6:55=E2=80=AFAM <a-christidis@ti.com> wrote:
>> >
>> > From: Antonios Christidis <a-christidis@ti.com>
>> >
>> > This recipe provides the opecl-cts suite.=C2=A0 This is a pre-releas=
e=20
>> version
>> > v2024-08-08, which I have tested to work with opencl-headers=20
>> version v2024.05.08
>> > . The pre-release version was picked due to incompatibility issues=20
>> with other
>> > versions of headers.
>> >
>> > The recipe also includes a patch, to allow it to compile and build=20
>> properly.
>> > Further information below.
>> >
>> > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> > ---
>> >=C2=A0 .../files/0001-Ignore-Compiler-Warnings.patch | 37=20
>> +++++++++++++++++++
>> >=C2=A0 .../opencl/opencl-cts_2024.08.08.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 26 +++++++++++++
>> >=C2=A0 2 files changed, 63 insertions(+)
>> >=C2=A0 create mode 100644=20
>> meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
>> >=C2=A0 create mode 100644=20
>> meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
>> >
>> > diff --git=20
>> a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patc=
h=20
>> b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patc=
h
>> > new file mode 100644
>> > index 000000000..2515c7f16
>> > --- /dev/null
>> > +++=20
>> b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patc=
h
>> > @@ -0,0 +1,37 @@
>> > +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00=20
>> 2001
>> > +From: Antonios Christidis <a-christidis@ti.com>
>> > +Date: Fri, 17 Jan 2025 15:05:39 -0600
>> > +Subject: [PATCH] Ignore Compiler Warnings
>> > +
>> > +
>> > +Within the cmake build system, the compiler -Werror flag is=20
>> enabeled.=C2=A0 This
>> > +turns all warnings into errors and doens't allow the system to=20
>> compile
>> > +correctly.=C2=A0 Change the system to ignore the 3 warning rules th=
at=20
>> show up when
>> > +compiling.
>> > +
>> > +Upstream-Status: Inappropriate [oe specific - compilation errors=20
>> due to cross-compiling]
>> > +
>> > +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> > +
>> > +---
>> > + CMakeLists.txt | 4 +++-
>> > + 1 file changed, 3 insertions(+), 1 deletion(-)
>> > +
>> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> > +index 5cfef6b3..71b6ddb4 100644
>> > +--- a/CMakeLists.txt
>> > ++++ b/CMakeLists.txt
>> > +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR=20
>> "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-error=3Dcpp=
) # Allow #warning=20
>> directive
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-unknown-pra=
gmas) # Issue #785
>> > + add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths) # Issue=
=20
>> #784
>> > +-
>> > ++=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-maybe-uninitiali=
zed)
>> > ++=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-stringop-truncat=
ion)
>> > ++=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-strict-aliasing)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 # -msse -mfpmath=3Dsse to force gcc to use=
 sse for float math,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 # avoiding excess precision problems that =
cause tests like=20
>> int2float
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 # to falsely fail. -ffloat-store also work=
s, but WG suggested
>> > +--
>> > +2.34.1
>> > +
>> > diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb=20
>> b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
>> > new file mode 100644
>> > index 000000000..f6f4e9466
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
>> > @@ -0,0 +1,26 @@
>> > +SUMMARY =3D "OpenCL CTS"
>> > +DESCRIPTION =3D "OpenCL CTS test suite"
>> > +LICENSE =3D "Apache-2.0"
>> > +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>> > +
>> > +inherit pkgconfig cmake
>> > +
>> > +DEPENDS +=3D "opencl-headers opencl-icd-loader"
>> > +RDEPENDS:${PN} +=3D "python3-core python3-io"
>> > +
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +SRC_URI =3D=20
>> "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=3Dhttps;branch=3D=
main;lfs=3D0=20
>> \
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
Ignore-Compiler-Warnings.patch"
>> > +
>> > +SRCREV =3D "a406b340913f622da089b00f284a597656c10239"
>> > +
>> > +EXTRA_OECMAKE:append =3D " -DCL_INCLUDE_DIR=3D${STAGING_INCDIR}=20
>> -DCL_LIB_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
>> > +
>> > +do_install() {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}=
/opencl_test_conformance
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -r ${B}/test_conforma=
nce/*=20
>> ${D}${bindir}/opencl_test_conformance
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i 's:/usr/bin/pytho=
n:/usr/bin/python3:g'=20
>> ${D}${bindir}/opencl_test_conformance/run_conformance.py
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 find "${D}${bindir}/open=
cl_test_conformance" -name=20
>> cmake_install.cmake -type f -delete
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 find "${D}${bindir}/open=
cl_test_conformance" -name=20
>> CMakeFiles -type d -exec rm -rf "{}" \; -depth
>> > +}
>> > --
>> > 2.34.1
>> >

