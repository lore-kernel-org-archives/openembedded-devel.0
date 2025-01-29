Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A44C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:15:18 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.19497.1738174509228410064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2ahi3JE;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3eb9de518e2so3403309b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 10:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738174508; x=1738779308; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZfGu1G1S7WGSxAxzADa9O8Iaq7o8fU1rBkMptGsY68=;
        b=g2ahi3JEjQ16OhLKS4+1n4OzXzWmnfCzaIGxhM4ELaAjHqNZGe9j1zLoy2N/irB+X5
         qMTe3rJ1tYl0wpglno2KdME0s4c5ND8RkqcAXkUy83aUM+B7oKJjgRS6AcwnY9TpHkEO
         ZOifbWecU+wx8RghxAp/hxmTnJhs7JbKQTFr8coFUuDbvp1J2LLspLUqdflkkgDdQCPD
         grmg2u5RoaxW2ntELiRKbgUn9IT1bxf2wI/XRbhCoFjQfo3QwdK5EEsKIUAv0adGJBj/
         DZf2ORZDzVJCIWgdJzCJKbK7ixbY6woF7D7UqIED06Ydbf0zyjoEsJII9EJQo7/7+B0R
         eJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738174508; x=1738779308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZfGu1G1S7WGSxAxzADa9O8Iaq7o8fU1rBkMptGsY68=;
        b=CxDkw3E+99ii3Y1BRgTXNh4EohO9LVHJ/Bv692W9GqjGrN2BeEQkQG16GDQ4i7gnz7
         BHIO9z5MUAY2J5IjjG4/CwbMWICr+x6UDCzJeypHdMJHtTTwkKlCJD9mIWd/tMmkXyX0
         c+s3CutLZNrsVKrnk4cKfi3L4O3bK0av7U2QA34WMR/d/wFyohXAf8Pk8FmqKkQJF87H
         IO80Im0DqGSFtMtK3/Pn+lKFEKS6XQKsYjq9QYWhY2f5ISsR0BWTsoYgtYp4p2hkbm7O
         bE+3aPDCibMvj6Ijd6zwbiKan9umaFVnngKbb3LZwRJRQZ8vW5aCV3TzAK7pSPXv491O
         7cyg==
X-Gm-Message-State: AOJu0YyOUvyQ4yLPffBcAj8MfO+W/I7HuDzgIpxwyWwHW4g/ynTb/hWm
	0GU9Xr6lTbe/31SajCn3DQ6gj2jd3ricaKkrQBkhhUQgLo8xWpI4v3U9/AigF29Ce/75ugQfzLM
	XzrysH7PqE54SbBXN16XFTlnNBxw=
X-Gm-Gg: ASbGncs40R2IH0w2ny5fPI8ypQyeQ2pBzlf4gMaDzkaAJMSjOaO5wkVZUbKEvItB9F7
	XkmbNPLi542DQ35lTQF8CWZ8JRDYAZ+VIaEPLxrRShxD2UeTDn+ZkVrF3oXW+LiNNQLxBAh4=
X-Google-Smtp-Source: AGHT+IHC+OhntivYtZRV7H8dLfNucVCCQCWPrhNxS2ivoN8dbdZYISTox2TpqS7Vkcnmxm5VaEW0/CD2C42g2Jci1Lc=
X-Received: by 2002:a05:6871:50c2:b0:29e:3484:ae12 with SMTP id
 586e51a60fabf-2b32f34d56cmr2401699fac.33.1738174508373; Wed, 29 Jan 2025
 10:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20250127145533.1510728-1-a-christidis@ti.com> <CAMKF1sq-vDu4S5jPPH6yxHX=SGuK3syJ+0oOjeEdyUcCc-iL1A@mail.gmail.com>
 <f170e856-3e9d-498a-8758-18b26c3ecf18@ti.com> <CAMKF1sojVNko3cHP0mszJg+rkB0wbeWTYfXWBS=UYFBjF2gMMw@mail.gmail.com>
 <CAMKF1sp+gAAcA0L-+=H=9DK9ar5mwLuE77zCEaPdq-jVfpG57A@mail.gmail.com> <631ae050-03ea-40c4-8c9f-b8c1f98a3233@ti.com>
In-Reply-To: <631ae050-03ea-40c4-8c9f-b8c1f98a3233@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2025 10:14:42 -0800
X-Gm-Features: AWEUYZl7oZ8dlqFUQHdoOIoEywkHekWZyPfbeRyo0vjb2YUFOu-wLllsh7MtJHQ
Message-ID: <CAMKF1soFA8RYUtogJowO_ZWp651tygfi2KnxQ+2JqNVfSRAJzg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [master][PATCH] opencl-cts: add recipe
To: Antonios Christidis <a-christidis@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 18:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115139

On Wed, Jan 29, 2025 at 8:02=E2=80=AFAM Antonios Christidis <a-christidis@t=
i.com> wrote:
>
> Hello,
>
> Thank you for taking time and making the patch for Werror disablement.
>
> I have already notified opencl-cts upstream about the warnings, made a
> pull request which has been approved. Now waiting for the merge, once
> that is merged, all warnings should be resolved without the need of
> disabling -Werror.
>
> Once my changes will be merged, they will be included in the next
> release of openl-cts and I'll send new patches here editing the recipe
> accordingly.

This patch still would make sense even with warnings addressed.
perhaps I will post it there.

>
> Regards,
>
> Antonios
>
> On 1/28/25 11:10 PM, Khem Raj wrote:
> > FWIW, I have tweaked your patch to add a CMake option to provide a
> > knob to allow disabling Werror, this is a good to have especially for
> > distributions, since they may not be interested in fixing warnings as
> > errors, while developers of this component
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source
> > of this email and know the content is safe.
> > Report Suspicious
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczggGK0zQgUO0=
v2psgSyQ8iN4-2htHmBpKsKI91RdSZ0HEd7IgSAqdzBMRqACMmOs-zI__9yVKsMYMHFOiW86Jt3=
ID38rqWvMPp95MnO7Iod29NLYwRoEvk$>
> >
> > ZjQcmQRYFpfptBannerEnd
> > FWIW, I have tweaked your patch to add a CMake option to provide a
> > knob to allow disabling Werror, this is a good to have
> > especially for distributions, since they may not be interested in
> > fixing warnings as errors, while developers of this component
> > might be interested in enabling it.
> >
> > Please submit this patch to opencl-cts upstream
> >
> > On Tue, Jan 28, 2025 at 11:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> > >
> > > autobuilder config is default poky setup, so unless you are using
> > > other distro options which might impact it, e.g. using clang compiler
> > > or not using security options.
> > >
> > > On Mon, Jan 27, 2025 at 2:14=E2=80=AFPM Antonios Christidis <a-christ=
idis@ti.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > I am not able to replace those errors on my end. Are there any
> > > > references describing the build environment of the auto builder? Ho=
ping
> > > > to follow those and then be able to replicate those errors on my en=
d.
> > > >
> > > > Side note: This is interesting, as in the logs I'm seeing
> > > > "[-Werror=3Dmaybe-uninitialized]" errors which my patch targeted to=
 fix.
> > > >
> > > > Regards,
> > > >
> > > > Antonios
> > > >
> > > >
> > > > On 1/27/25 1:50 PM, Khem Raj wrote:
> > > > > fails with master here
> > > > > https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//au=
tobuilder.=E2=80=8Ayoctoproject.=E2=80=8Aorg/valkyrie/*/builders/81/builds/=
320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdWNd8Q7mT2lxwrfCEr8VY9ZJDDTdQD=
wd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$
> > > > > cc1plus:
> > > > > ZjQcmQRYFpfptBannerStart
> > > > > This message was sent from outside of Texas Instruments.
> > > > > Do not click links or open attachments unless you recognize the s=
ource
> > > > > of this email and know the content is safe.
> > > > > Report Suspicious
> > > > > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczggGK0=
zQiXM8lsjUIw0foiJ4oL-lS26WbF22UijSS0Ba7zdDBO_8mMm1n2WN9uSVrZzguSdX1Wt-sbhju=
KEJ9lw_kgnhg9nodQmtYJ2kfTSN9lkr0sCjv4$>
> > > > >
> > > > > ZjQcmQRYFpfptBannerEnd
> > > > > fails with master here
> > > > >
> > > > > https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/=
valkyrie/*/builders/81/builds/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4E=
dWNd8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$
> > >  <https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/va=
lkyrie/*/builders/81/builds/320/steps/14/logs/stdio__;Iw!!G3vK!U1telv7G4EdW=
Nd8Q7mT2lxwrfCEr8VY9ZJDDTdQDwd5SwarmDepPE58aL0--mucfFnOkooRNNbihy_k$
> > >>> >
> > > > > cc1plus: error: '-Wformat-security' ignored without '-Wformat'
> > > > > [-Werror=3Dformat-security]
> > > > > | cc1plus: all warnings being treated as errors
> > > > >
> > > > > On Mon, Jan 27, 2025 at 6:55=E2=80=AFAM <a-christidis@ti.com> wro=
te:
> > > > > >
> > > > > > From: Antonios Christidis <a-christidis@ti.com>
> > > > > >
> > > > > > This recipe provides the opecl-cts suite.  This is a pre-releas=
e version
> > > > > > v2024-08-08, which I have tested to work with opencl-headers ve=
rsion v2024.05.08
> > > > > > . The pre-release version was picked due to incompatibility iss=
ues with other
> > > > > > versions of headers.
> > > > > >
> > > > > > The recipe also includes a patch, to allow it to compile and bu=
ild properly.
> > > > > > Further information below.
> > > > > >
> > > > > > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > > > > ---
> > > > > >  .../files/0001-Ignore-Compiler-Warnings.patch | 37 +++++++++++=
++++++++
> > > > > >  .../opencl/opencl-cts_2024.08.08.bb           | 26 +++++++++++=
++
> > > > > >  2 files changed, 63 insertions(+)
> > > > > >  create mode 100644 meta-oe/recipes-core/opencl/files/0001-Igno=
re-Compiler-Warnings.patch
> > > > > >  create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024=
.08.08.bb
> > > > > >
> > > > > > diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Comp=
iler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compile=
r-Warnings.patch
> > > > > > new file mode 100644
> > > > > > index 000000000..2515c7f16
> > > > > > --- /dev/null
> > > > > > +++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Wa=
rnings.patch
> > > > > > @@ -0,0 +1,37 @@
> > > > > > +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00=
:00 2001
> > > > > > +From: Antonios Christidis <a-christidis@ti.com>
> > > > > > +Date: Fri, 17 Jan 2025 15:05:39 -0600
> > > > > > +Subject: [PATCH] Ignore Compiler Warnings
> > > > > > +
> > > > > > +
> > > > > > +Within the cmake build system, the compiler -Werror flag is en=
abeled.  This
> > > > > > +turns all warnings into errors and doens't allow the system to=
 compile
> > > > > > +correctly.  Change the system to ignore the 3 warning rules th=
at show up when
> > > > > > +compiling.
> > > > > > +
> > > > > > +Upstream-Status: Inappropriate [oe specific - compilation erro=
rs due to cross-compiling]
> > > > > > +
> > > > > > +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > > > > > +
> > > > > > +---
> > > > > > + CMakeLists.txt | 4 +++-
> > > > > > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > > +
> > > > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > > > +index 5cfef6b3..71b6ddb4 100644
> > > > > > +--- a/CMakeLists.txt
> > > > > > ++++ b/CMakeLists.txt
> > > > > > +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX=
_COMPILER_ID}" MATCHES "(Apple)?Clang"
> > > > > > +     add_cxx_flag_if_supported(-Wno-error=3Dcpp) # Allow #warn=
ing directive
> > > > > > +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #=
785
> > > > > > +     add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths=
) # Issue #784
> > > > > > +-
> > > > > > ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> > > > > > ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> > > > > > ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> > > > > > +     # -msse -mfpmath=3Dsse to force gcc to use sse for float =
math,
> > > > > > +     # avoiding excess precision problems that cause tests lik=
e int2float
> > > > > > +     # to falsely fail. -ffloat-store also works, but WG sugge=
sted
> > > > > > +--
> > > > > > +2.34.1
> > > > > > +
> > > > > > diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.=
bb b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > > > > new file mode 100644
> > > > > > index 000000000..f6f4e9466
> > > > > > --- /dev/null
> > > > > > +++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> > > > > > @@ -0,0 +1,26 @@
> > > > > > +SUMMARY =3D "OpenCL CTS"
> > > > > > +DESCRIPTION =3D "OpenCL CTS test suite"
> > > > > > +LICENSE =3D "Apache-2.0"
> > > > > > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57"
> > > > > > +
> > > > > > +inherit pkgconfig cmake
> > > > > > +
> > > > > > +DEPENDS +=3D "opencl-headers opencl-icd-loader"
> > > > > > +RDEPENDS:${PN} +=3D "python3-core python3-io"
> > > > > > +
> > > > > > +S =3D "${WORKDIR}/git"
> > > > > > +
> > > > > > +SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;prot=
ocol=3Dhttps;branch=3Dmain;lfs=3D0 \
> > > > > > +          file://0001-Ignore-Compiler-Warnings.patch"
> > > > > > +
> > > > > > +SRCREV =3D "a406b340913f622da089b00f284a597656c10239"
> > > > > > +
> > > > > > +EXTRA_OECMAKE:append =3D " -DCL_INCLUDE_DIR=3D${STAGING_INCDIR=
} -DCL_LIB_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
> > > > > > +
> > > > > > +do_install() {
> > > > > > +        install -d ${D}${bindir}/opencl_test_conformance
> > > > > > +        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_tes=
t_conformance
> > > > > > +        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bi=
ndir}/opencl_test_conformance/run_conformance.py
> > > > > > +        find "${D}${bindir}/opencl_test_conformance" -name cma=
ke_install.cmake -type f -delete
> > > > > > +        find "${D}${bindir}/opencl_test_conformance" -name CMa=
keFiles -type d -exec rm -rf "{}" \; -depth
> > > > > > +}
> > > > > > --
> > > > > > 2.34.1
> > > > > >

