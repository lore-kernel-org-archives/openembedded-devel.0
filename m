Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA749C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 19:56:39 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.6520.1738094190867276527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 11:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a0C+R3VG;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2a3bf796cccso2644575fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 11:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738094190; x=1738698990; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNvf4ZyjCVOcaxrECVCwVrQYjFkoYE4dEqbmotr0NrI=;
        b=a0C+R3VGbOznm9R6bQ9LTMswHN8mvO8rlL+sEeaSQqEeZCOaT7yVDKKLFx1sosba0Q
         vDRshLtEX60NKgdXAJgTTr4szlidOyXoVHTCyI5tgE7nQ+/TKPEmiY4QIl7OdDC31jl4
         k747Q8Sd5CalTU36y9pK5i5Fhboe0K0Zun4Aid0xqg+1LV3ir7SC5BoqgykCSU2MdR40
         gEwURS58ll5AqScimquZJCIA12U2CbDxLXqKVX8uAGoBEJMAnTyDNJDhuIFkilMDG7kx
         1U/OygQzevGNl8qm78CG4++hOvx+kADmhhCNjVkIWs419WsUd7eHcLKddkidEwtUgh4E
         Va6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738094190; x=1738698990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNvf4ZyjCVOcaxrECVCwVrQYjFkoYE4dEqbmotr0NrI=;
        b=hlly0oWsMS+QvQBzBKvhsMmWIVCfe7ZVz4nbPASI5TXBVBRoFRTxpB6oBB1SqVYUPN
         VJxhxC98E/JYA8tnCJc20/LOChaAgQKoA2LwsI/nKZ3ai1/PWkkRKH4MDt9nGm/xUgaK
         z1WCNBHrX5O3Z+9Yf5MXhOrDhsqH3ejv4+Z7uWEC5YV+u3XhQEyefOXEr2OfkRD3xtBP
         Kwlw8mA+ok3lR5Z6m7qnhwddKXq3F2oTq56VNsPLI1xtVaBYFMEsHgZSs7S1EO+rAUvv
         Il6WnVYBp8ohVUPX77XZpjHGsLcvmTE0RHX6CezQgI5bDp9GZkFd6Q9Zse3L3n/e1j5z
         LqBg==
X-Gm-Message-State: AOJu0YwXZvadHos2PycyDzH5QZVzjFTY+StMedj/VjFaUitxT80wXzjg
	wuoMM7yDAaFYdmOOZS6OCqmTznvWFB9LokYYTNQNdRv8OYGNKhvyZoEIqDn2bZ8ZLOjZUYtgBbG
	bJT2xz8oC3bwTsN35aGJUbN0ivWQ=
X-Gm-Gg: ASbGncs0Vm1TaH7jBe3YgXxxYKOa9QMRK4dBtgxKcC7Vw1u/KCLFptilbnsCK1+Ir9q
	/ByacQSP6joSHJCBCurrwtIVUuCwsK0jaoToSGQAQbTsvaLiGBvA0Li6p8+zWXQUlovbDI7cvaM
	+uUefNVe6ylbJUl+jldiY6JKmtCw==
X-Google-Smtp-Source: AGHT+IH6fCfLyCKMUT8CRj3T6wezKuqAuraVoSXF7AdPMbI+SgxPYHGeKVjKuqGH+TCwGZseR49LsFAZjdQnzuCRCno=
X-Received: by 2002:a05:6870:c69c:b0:2a0:d2d:e606 with SMTP id
 586e51a60fabf-2b32f2f8538mr270785fac.38.1738094190016; Tue, 28 Jan 2025
 11:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20250127145533.1510728-1-a-christidis@ti.com> <CAMKF1sq-vDu4S5jPPH6yxHX=SGuK3syJ+0oOjeEdyUcCc-iL1A@mail.gmail.com>
 <f170e856-3e9d-498a-8758-18b26c3ecf18@ti.com>
In-Reply-To: <f170e856-3e9d-498a-8758-18b26c3ecf18@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2025 11:56:04 -0800
X-Gm-Features: AWEUYZkSQCdgFhMQyrKXu842xnWEIkrmMHm9QlANsMrGeg4SA90tWLLgeU9-P5Y
Message-ID: <CAMKF1sojVNko3cHP0mszJg+rkB0wbeWTYfXWBS=UYFBjF2gMMw@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [master][PATCH] opencl-cts: add recipe
To: Antonios Christidis <a-christidis@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 19:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115123

autobuilder config is default poky setup, so unless you are using
other distro options which might impact it, e.g. using clang compiler
or not using security options.

On Mon, Jan 27, 2025 at 2:14=E2=80=AFPM Antonios Christidis <a-christidis@t=
i.com> wrote:
>
> Hello,
>
> I am not able to replace those errors on my end. Are there any
> references describing the build environment of the auto builder? Hoping
> to follow those and then be able to replicate those errors on my end.
>
> Side note: This is interesting, as in the logs I'm seeing
> "[-Werror=3Dmaybe-uninitialized]" errors which my patch targeted to fix.
>
> Regards,
>
> Antonios
>
>
> On 1/27/25 1:50 PM, Khem Raj wrote:
> > fails with master here
> > https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//autobuil=
der.=E2=80=8Ayoctoproject.=E2=80=8Aorg/valkyrie/*/builders/81/builds/320/st=
eps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWNd8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5Swa=
rmDepPE58aL0--mucfFnOkooRNNbihy_k$
> > cc1plus:
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source
> > of this email and know the content is safe.
> > Report Suspicious
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczggGK0zQiXM8=
lsjUIw0foiJ4oL-lS26WbF22UijSS0Ba7zdDBO_8mMm1n2WN9uSVrZzguSdX1Wt-sbhjuKEJ9lw=
_kgnhg9nodQmtYJ2kfTSN9lkr0sCjv4$>
> >
> > ZjQcmQRYFpfptBannerEnd
> > fails with master here
> >
> > https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/valkyr=
ie/*/builders/81/builds/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWNd8Q=
7mT2lxwrfCEr8VY9ZJDDTdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$
> >
> > cc1plus: error: '-Wformat-security' ignored without '-Wformat'
> > [-Werror=3Dformat-security]
> > | cc1plus: all warnings being treated as errors
> >
> > On Mon, Jan 27, 2025 at 6:55=E2=80=AFAM <a-christidis@ti.com> wrote:
> > >
> > > From: Antonios Christidis <a-christidis@ti.com>
> > >
> > > This recipe provides the opecl-cts suite.  This is a pre-release vers=
ion
> > > v2024-08-08, which I have tested to work with opencl-headers version =
v2024.05.08
> > > . The pre-release version was picked due to incompatibility issues wi=
th other
> > > versions of headers.
> > >
> > > The recipe also includes a patch, to allow it to compile and build pr=
operly.
> > > Further information below.
> > >
> > > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > ---
> > >  .../files/0001-Ignore-Compiler-Warnings.patch | 37 +++++++++++++++++=
++
> > >  .../opencl/opencl-cts_2024.08.08.bb           | 26 +++++++++++++
> > >  2 files changed, 63 insertions(+)
> > >  create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Com=
piler-Warnings.patch
> > >  create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08=
.bb
> > >
> > > diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-W=
arnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warn=
ings.patch
> > > new file mode 100644
> > > index 000000000..2515c7f16
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings=
.patch
> > > @@ -0,0 +1,37 @@
> > > +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 20=
01
> > > +From: Antonios Christidis <a-christidis@ti.com>
> > > +Date: Fri, 17 Jan 2025 15:05:39 -0600
> > > +Subject: [PATCH] Ignore Compiler Warnings
> > > +
> > > +
> > > +Within the cmake build system, the compiler -Werror flag is enabeled=
.  This
> > > +turns all warnings into errors and doens't allow the system to compi=
le
> > > +correctly.  Change the system to ignore the 3 warning rules that sho=
w up when
> > > +compiling.
> > > +
> > > +Upstream-Status: Inappropriate [oe specific - compilation errors due=
 to cross-compiling]
> > > +
> > > +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > +
> > > +---
> > > + CMakeLists.txt | 4 +++-
> > > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > +index 5cfef6b3..71b6ddb4 100644
> > > +--- a/CMakeLists.txt
> > > ++++ b/CMakeLists.txt
> > > +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPI=
LER_ID}" MATCHES "(Apple)?Clang"
> > > +     add_cxx_flag_if_supported(-Wno-error=3Dcpp) # Allow #warning di=
rective
> > > +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
> > > +     add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths) # Is=
sue #784
> > > +-
> > > ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> > > ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> > > ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> > > +     # -msse -mfpmath=3Dsse to force gcc to use sse for float math,
> > > +     # avoiding excess precision problems that cause tests like int2=
float
> > > +     # to falsely fail. -ffloat-store also works, but WG suggested
> > > +--
> > > +2.34.1
> > > +
> > > diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/m=
eta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > new file mode 100644
> > > index 000000000..f6f4e9466
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > @@ -0,0 +1,26 @@
> > > +SUMMARY =3D "OpenCL CTS"
> > > +DESCRIPTION =3D "OpenCL CTS test suite"
> > > +LICENSE =3D "Apache-2.0"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57"
> > > +
> > > +inherit pkgconfig cmake
> > > +
> > > +DEPENDS +=3D "opencl-headers opencl-icd-loader"
> > > +RDEPENDS:${PN} +=3D "python3-core python3-io"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=
=3Dhttps;branch=3Dmain;lfs=3D0 \
> > > +          file://0001-Ignore-Compiler-Warnings.patch"
> > > +
> > > +SRCREV =3D "a406b340913f622da089b00f284a597656c10239"
> > > +
> > > +EXTRA_OECMAKE:append =3D " -DCL_INCLUDE_DIR=3D${STAGING_INCDIR} -DCL=
_LIB_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
> > > +
> > > +do_install() {
> > > +        install -d ${D}${bindir}/opencl_test_conformance
> > > +        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conf=
ormance
> > > +        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/=
opencl_test_conformance/run_conformance.py
> > > +        find "${D}${bindir}/opencl_test_conformance" -name cmake_ins=
tall.cmake -type f -delete
> > > +        find "${D}${bindir}/opencl_test_conformance" -name CMakeFile=
s -type d -exec rm -rf "{}" \; -depth
> > > +}
> > > --
> > > 2.34.1
> > >

