Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46D0C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 14:57:17 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.39909.1711551429016241517
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 07:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LeS4mS/Q;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5a56a5f597dso1385224eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711551428; x=1712156228; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phk9tvbKMI9J1i9tYsbv03kqD/95YRoUJXsEDaQZC2M=;
        b=LeS4mS/QSRnUL43urho9rptuod59Qnza04jwTfoZSM2cZpGaaxzinpCnlPz/fVy0Ra
         z20+18CrEKvWRWrW17bpLz5ZUxiw4S734maJE8tX7+sZRHVAo6MVLA//H3Mjb2sfm0XW
         zySdm6AmVVxOh7oGPYwC+05GbQdvvCfBLSNi7Ly0mSi5G6FHPzNbLZ1UV4nZZzyNb0KZ
         q2zgqdLRjZLMQmfMy8VAceHRNjjUP5c5sTN3Hi61/C8gR0GznCdwXTyUu1IPPmQEln9V
         lo+tJOcWSf06iWjP3UFDIdQPoLki8JvUwcdHJEiP8d5dXOLCcHbZgGxu9TQeJ4kQzhds
         4aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711551428; x=1712156228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phk9tvbKMI9J1i9tYsbv03kqD/95YRoUJXsEDaQZC2M=;
        b=rwTOQYaFJj0SIXZptY+6WPdwV8bJqHG/n5KoPEsVDokXGUib6Uv5Q7XPCJvsMR5TpJ
         QaNuMszC38V8cLk1PofOpQLBw89eZVnNgw0I+2o55EgqqSsbfrmFJ19F44NC0wn2XOfZ
         20b0WviWIIEli4d1W29TplNkuc4gF/yoJBou+MHxj/F9qCA7ZOgt9Ef/nIs+ONwcLpwm
         4VTjMWRADlGECoHmjobr0alXt1xuy+BwmMuRpqvfJl4ViNSdRdsyEyQTIYnb4/m1eZQ5
         ySKY+hZBR7LrLPwfr9G8U44ANfVK/zpQAFu3Lp1HPdu9T1Z+VPqPfEHpB6XAWxvGmCgE
         U5/Q==
X-Gm-Message-State: AOJu0Yye3aOPLIC+gey+wO1Fkf55YE4BdxJyMWc2DPz8oi4vq5MDt9ND
	33lbgWih297OJZHgQxoJV1NijB14o/Xv7orzWO2JMhovTuNpF+UuGzJ1Hq/HjOgIiTJ+3jNNqew
	9iIjOxeWHaqn7rjEhWQVwziojHoxPTLozwF0=
X-Google-Smtp-Source: AGHT+IHFDNOIWtwRIoWe9a6wb75I2NKS7ycMGY5YKjWaB+vM1RWS703UVy5sgfPf/fSg7CMPaz1YK0nGsWoUVaVuRgM=
X-Received: by 2002:a05:6871:e78f:b0:22a:8e5:93f with SMTP id
 qb15-20020a056871e78f00b0022a08e5093fmr5406414oac.0.1711551428224; Wed, 27
 Mar 2024 07:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240326215346.586439-1-peter.marko@siemens.com>
In-Reply-To: <20240326215346.586439-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Mar 2024 07:56:42 -0700
Message-ID: <CAMKF1so8Zc4w9WuD94+H360HJtnYmG_Qt50cPh8BdB+LxdKN3Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] microsoft-cpr: add new recipe including ptest
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 14:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109645

fails build with clang - https://errors.yoctoproject.org/Errors/Details/761=
058/

On Tue, Mar 26, 2024 at 2:54=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> The Guidelines Support Library (GSL) contains functions
> and types that are suggested for use by the C++ Core Guidelines
> maintained by the Standard C++ Foundation.
> This repo contains Microsoft's implementation of GSL.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  .../microsoft-gsl/microsoft-gsl/run-ptest     |  4 +++
>  .../microsoft-gsl/microsoft-gsl_4.0.0.bb      | 36 +++++++++++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/=
run-ptest
>  create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_=
4.0.0.bb
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
> index fadec1221..70e5dad08 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -27,6 +27,7 @@ PTESTS_FAST_META_OE =3D "\
>      libxml++-5.0 \
>      libyang \
>      lmdb \
> +    microsoft-gsl \
>      minicoredumper \
>      neon \
>      nlohmann-json \
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6e2012dae..bc15373b6 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -310,6 +310,7 @@ RDEPENDS:packagegroup-meta-oe-devtools =3D"\
>      yasm \
>      json-schema-validator \
>      poke \
> +    microsoft-gsl \
>  "
>  RDEPENDS:packagegroup-meta-oe-devtools:append:x86 =3D " cpuid msr-tools =
pahole pmtools"
>  RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 =3D " cpuid msr-too=
ls pahole pcimem pmtools"
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-pte=
st b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
> new file mode 100644
> index 000000000..2d5bdf4ff
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +gsl_tests && echo "PASS: gsl_tests" || echo "FAIL: gsl_tests"
> +gsl_noexcept_tests && echo "PASS: gsl_noexcept_tests" || echo "FAIL: gsl=
_noexcept_tests"
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.b=
b b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> new file mode 100644
> index 000000000..d07430709
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "GSL: Guidelines Support Library"
> +DESCRIPTION =3D "The Guidelines Support Library (GSL) contains functions=
 \
> +    and types that are suggested for use by the C++ Core Guidelines \
> +    maintained by the Standard C++ Foundation. \
> +    This repo contains Microsoft's implementation of GSL."
> +HOMEPAGE =3D "https://github.com/microsoft/GSL"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D363055e71e77071107ba2bb9a54bd=
9a7"
> +
> +SRC_URI =3D "git://github.com/microsoft/GSL.git;protocol=3Dhttps;branch=
=3Dmain \
> +    file://run-ptest"
> +SRCREV =3D "a3534567187d2edc428efd3f13466ff75fe5805c"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig ptest
> +
> +# this is header-only library
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest',=
'', d)}"
> +PACKAGECONFIG[ptest] =3D "-DGSL_TEST=3DON,-DGSL_TEST=3DOFF,googletest"
> +
> +do_install_ptest() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/tests/gsl_tests ${D}${bindir}
> +    install -m 0755 ${B}/tests/gsl_noexcept_tests ${D}${bindir}
> +}
> +
> +FILES:${PN}-ptest =3D "${bindir}/gsl*_tests"
> +
> +# there is already other gsl recipe, so recipe name does not match the r=
eal component name
> +CVE_PRODUCT =3D "microsoft:gsl"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109631): https://lists.openembedded.org/g/openembedde=
d-devel/message/109631
> Mute This Topic: https://lists.openembedded.org/mt/105167194/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

