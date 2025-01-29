Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D334DC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 05:11:03 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.6605.1738127460721945897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 21:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbUY1yrZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2a3bf796cccso2820391fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 21:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738127460; x=1738732260; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2qdWHNQJ/gVR95JiA3cx2j3iSLguRIbVX+sOfcGiM4=;
        b=PbUY1yrZDjDcWdKFY+mQx6dJagUXN5lUp5qipeX36bXIIrfYNWZenrlVL1WPp/Mc3c
         +ICLB0aO2gMToierPbvtl6yCoCZdkju1IYAtuN4wdEH53+e5+OMg+dBenGzgS8pfcRMF
         b0VMJT1jcGpoFc/CU2cpqsZIZ7sC+A3ask5+5BYzFxVxP+PCqFIbhiVFXEcNN/5PKjjz
         A3vY14ggwc/0asbKxwRoddbM2GXVYXutFxcUVOEMt8SzZK54LrOdCsyLYm5dPaviJL61
         RqJaOVo6ph/9yiu09EjU7n/Z8L7lhVkEQXrCYgzKt5A+yKOt7wbzOpSo21AhYnVCJ2YR
         hpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738127460; x=1738732260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2qdWHNQJ/gVR95JiA3cx2j3iSLguRIbVX+sOfcGiM4=;
        b=m8XA9hhBX8WtxW0Qoz/Vx0s2E3kUHsIS8JdDm37voaoFJXiTY0ESooRR0umr7Mys8n
         7OEtxlwyFOY0iY8iCqdWRJIM2CSK0+cgryKAKDx9JZd2zoyXYI4xGbFz64dLmYmUyAlD
         B0DtVFttqiSGA0OT6SuQI7Mu6xasnjahX2maePsXM2PPfVhQjxw3/YAi+nnBFovmXCQH
         e6nrv4nGrHPFCk6oh9ILHLHl/cO+s40VsRxCVWjulB+iL+eLaZLIvXPhAUNN7oYjgme1
         TK9mLs1LF8xGIU8TCFSCFUVkFd6q3kyaOtmimTM4Y0qX5UkhOCJUbojW9svkv83xgx6z
         dEhA==
X-Gm-Message-State: AOJu0Yydac2LaUol1IDkuXHc/zgR9Dchm8G2qkqx2Q8tx6X9fPHefctj
	27ui2wHuimZhmOD93R3TBEzfknSXNRsRFzQsD6zE2T5cnrY/jtel9oPHhNWAiJ/kuBnDaIL5CF2
	HVP3okDR5DpabVPvYt1hRM5NiJpQ=
X-Gm-Gg: ASbGncvhOpgkD4ZX6qkBn+aRxC3qy7U9a9Ez81Hf0q0rW9BvziONsepP6K32fTROvVM
	XEzr5DrC/B+0tAEdTYjzGLFzOVbPj4p98vInEjQ7wd6nyXWa2fNOXjHodcaf60Kub15brT0ZxBs
	UEqsn++U0=
X-Google-Smtp-Source: AGHT+IEcqJhuWdHP+7tIan5QBooDcqqhQ4nCb/iLEcneznYWUdyl1L78QIO2EHaQ2IMLfRn5eIV2zmMcU4xBC7EApTk=
X-Received: by 2002:a05:6870:ec87:b0:29f:c5f3:a827 with SMTP id
 586e51a60fabf-2b32f2e6a6emr1240739fac.35.1738127459713; Tue, 28 Jan 2025
 21:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20250127145533.1510728-1-a-christidis@ti.com> <CAMKF1sq-vDu4S5jPPH6yxHX=SGuK3syJ+0oOjeEdyUcCc-iL1A@mail.gmail.com>
 <f170e856-3e9d-498a-8758-18b26c3ecf18@ti.com> <CAMKF1sojVNko3cHP0mszJg+rkB0wbeWTYfXWBS=UYFBjF2gMMw@mail.gmail.com>
In-Reply-To: <CAMKF1sojVNko3cHP0mszJg+rkB0wbeWTYfXWBS=UYFBjF2gMMw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2025 21:10:33 -0800
X-Gm-Features: AWEUYZmxhBI3y8DQwLbBDwG7xEcH38aiMRlQHLbcyE4kxdz07zJ-Dc_b3hIDhjk
Message-ID: <CAMKF1sp+gAAcA0L-+=H=9DK9ar5mwLuE77zCEaPdq-jVfpG57A@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [master][PATCH] opencl-cts: add recipe
To: Antonios Christidis <a-christidis@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 05:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115128

FWIW, I have tweaked your patch to add a CMake option to provide a
knob to allow disabling Werror, this is a good to have
especially for distributions, since they may not be interested in
fixing warnings as errors, while developers of this component
might be interested in enabling it.

Please submit this patch to opencl-cts upstream

On Tue, Jan 28, 2025 at 11:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> autobuilder config is default poky setup, so unless you are using
> other distro options which might impact it, e.g. using clang compiler
> or not using security options.
>
> On Mon, Jan 27, 2025 at 2:14=E2=80=AFPM Antonios Christidis <a-christidis=
@ti.com> wrote:
> >
> > Hello,
> >
> > I am not able to replace those errors on my end. Are there any
> > references describing the build environment of the auto builder? Hoping
> > to follow those and then be able to replicate those errors on my end.
> >
> > Side note: This is interesting, as in the logs I'm seeing
> > "[-Werror=3Dmaybe-uninitialized]" errors which my patch targeted to fix=
.
> >
> > Regards,
> >
> > Antonios
> >
> >
> > On 1/27/25 1:50 PM, Khem Raj wrote:
> > > fails with master here
> > > https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//autobu=
ilder.=E2=80=8Ayoctoproject.=E2=80=8Aorg/valkyrie/*/builders/81/builds/320/=
steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWNd8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5S=
warmDepPE58aL0--mucfFnOkooRNNbihy_k$
> > > cc1plus:
> > > ZjQcmQRYFpfptBannerStart
> > > This message was sent from outside of Texas Instruments.
> > > Do not click links or open attachments unless you recognize the sourc=
e
> > > of this email and know the content is safe.
> > > Report Suspicious
> > > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczggGK0zQiX=
M8lsjUIw0foiJ4oL-lS26WbF22UijSS0Ba7zdDBO_8mMm1n2WN9uSVrZzguSdX1Wt-sbhjuKEJ9=
lw_kgnhg9nodQmtYJ2kfTSN9lkr0sCjv4$>
> > >
> > > ZjQcmQRYFpfptBannerEnd
> > > fails with master here
> > >
> > > https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/valk=
yrie/*/builders/81/builds/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWNd=
8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$
> > >
> > > cc1plus: error: '-Wformat-security' ignored without '-Wformat'
> > > [-Werror=3Dformat-security]
> > > | cc1plus: all warnings being treated as errors
> > >
> > > On Mon, Jan 27, 2025 at 6:55=E2=80=AFAM <a-christidis@ti.com> wrote:
> > > >
> > > > From: Antonios Christidis <a-christidis@ti.com>
> > > >
> > > > This recipe provides the opecl-cts suite.  This is a pre-release ve=
rsion
> > > > v2024-08-08, which I have tested to work with opencl-headers versio=
n v2024.05.08
> > > > . The pre-release version was picked due to incompatibility issues =
with other
> > > > versions of headers.
> > > >
> > > > The recipe also includes a patch, to allow it to compile and build =
properly.
> > > > Further information below.
> > > >
> > > > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > > ---
> > > >  .../files/0001-Ignore-Compiler-Warnings.patch | 37 +++++++++++++++=
++++
> > > >  .../opencl/opencl-cts_2024.08.08.bb           | 26 +++++++++++++
> > > >  2 files changed, 63 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-C=
ompiler-Warnings.patch
> > > >  create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.=
08.bb
> > > >
> > > > diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler=
-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Wa=
rnings.patch
> > > > new file mode 100644
> > > > index 000000000..2515c7f16
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnin=
gs.patch
> > > > @@ -0,0 +1,37 @@
> > > > +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 =
2001
> > > > +From: Antonios Christidis <a-christidis@ti.com>
> > > > +Date: Fri, 17 Jan 2025 15:05:39 -0600
> > > > +Subject: [PATCH] Ignore Compiler Warnings
> > > > +
> > > > +
> > > > +Within the cmake build system, the compiler -Werror flag is enabel=
ed.  This
> > > > +turns all warnings into errors and doens't allow the system to com=
pile
> > > > +correctly.  Change the system to ignore the 3 warning rules that s=
how up when
> > > > +compiling.
> > > > +
> > > > +Upstream-Status: Inappropriate [oe specific - compilation errors d=
ue to cross-compiling]
> > > > +
> > > > +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > > +
> > > > +---
> > > > + CMakeLists.txt | 4 +++-
> > > > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index 5cfef6b3..71b6ddb4 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COM=
PILER_ID}" MATCHES "(Apple)?Clang"
> > > > +     add_cxx_flag_if_supported(-Wno-error=3Dcpp) # Allow #warning =
directive
> > > > +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
> > > > +     add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths) # =
Issue #784
> > > > +-
> > > > ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> > > > ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> > > > ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> > > > +     # -msse -mfpmath=3Dsse to force gcc to use sse for float math=
,
> > > > +     # avoiding excess precision problems that cause tests like in=
t2float
> > > > +     # to falsely fail. -ffloat-store also works, but WG suggested
> > > > +--
> > > > +2.34.1
> > > > +
> > > > diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b=
/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > > new file mode 100644
> > > > index 000000000..f6f4e9466
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > > @@ -0,0 +1,26 @@
> > > > +SUMMARY =3D "OpenCL CTS"
> > > > +DESCRIPTION =3D "OpenCL CTS test suite"
> > > > +LICENSE =3D "Apache-2.0"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57"
> > > > +
> > > > +inherit pkgconfig cmake
> > > > +
> > > > +DEPENDS +=3D "opencl-headers opencl-icd-loader"
> > > > +RDEPENDS:${PN} +=3D "python3-core python3-io"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=
=3Dhttps;branch=3Dmain;lfs=3D0 \
> > > > +          file://0001-Ignore-Compiler-Warnings.patch"
> > > > +
> > > > +SRCREV =3D "a406b340913f622da089b00f284a597656c10239"
> > > > +
> > > > +EXTRA_OECMAKE:append =3D " -DCL_INCLUDE_DIR=3D${STAGING_INCDIR} -D=
CL_LIB_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
> > > > +
> > > > +do_install() {
> > > > +        install -d ${D}${bindir}/opencl_test_conformance
> > > > +        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_co=
nformance
> > > > +        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir=
}/opencl_test_conformance/run_conformance.py
> > > > +        find "${D}${bindir}/opencl_test_conformance" -name cmake_i=
nstall.cmake -type f -delete
> > > > +        find "${D}${bindir}/opencl_test_conformance" -name CMakeFi=
les -type d -exec rm -rf "{}" \; -depth
> > > > +}
> > > > --
> > > > 2.34.1
> > > >

