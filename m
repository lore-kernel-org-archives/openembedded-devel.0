Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498F7C001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 17:26:54 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.40964.1691429213342339990
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 10:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UBbyDeEp;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bca3588edbso3071681a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691429212; x=1692034012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEYvUyWyQ0yxi6HNRSeRcKINHFOFDXjfTpYXTlA6Uv0=;
        b=UBbyDeEplKrn2U87hjX3wkrWpOa1XpnFEumDiVtfhLPP5s/CdF5GVhKje+3dMn3+r8
         6yhRkIrLc9GbJ86HMSxy1opPxvt4GzQljZEINnRxO4KNxceBq8f3bsqLE8/IEwBTGcIW
         RETg2cqN5MaiQod6TbJofeeLRlopABg6H8irKMbp8T5o/JDCWePinnYZAROC8x0og//8
         ZdX3rLL5NDnvxenAOrXrep3isriPhMhhQBXF+41YInBCKbx9PdVacipw8BhMlafPOOXN
         0td13Lg+yPkr7Gsbj8Z8JrclUycAyM1D9FoILaIe5g56vxXawNEkFlIc9c29suvUv470
         XfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691429212; x=1692034012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEYvUyWyQ0yxi6HNRSeRcKINHFOFDXjfTpYXTlA6Uv0=;
        b=cFKFOwuDxe1czYUfwUPh2VVTgJybTPYGatWyqjEpt50mwB4hzsd3hC1RCJFhM7WU44
         c7y+WmaAxH9/dZPXkjopMqrq8Y2d7HWrnXS4tn1F8JPMq3qXMGo9zANzsxCc5nxTrKwZ
         pn4WSlITftRkjjnPmLUKAdYhesiPtA0FM3luKzuAfTZbnPGfvuaHfEJRLkrOijqk53kO
         jo1c4cT2UKfKXsPgJ/7xlvimM+Vk7w5+11T+IX9Wz6Nrqb1hy/ZS/6GtuIurbm4kAmjL
         VCkLosKdgLIqrPfom0ncfuSTJxQSZx/2j3E+MvQr6oD220vDIkgeTII4t3xHCXdRvd7j
         nVeQ==
X-Gm-Message-State: AOJu0Yz6fW8bsgXdLf8imGE32o/2Kq9oWz6gKYnvm+osORGgTn2AhWcx
	JkgWKj8OWI5utAJKkR7MZhzTxREcVRBbWx0umZw=
X-Google-Smtp-Source: AGHT+IGPHT4kfmxMMD7iyRq1ICsg5VEd1zn0guLhsLLOdbODH+Yba5udQ52X6fVfMIvZNwOS8jlIwpgFUukY935yr5Q=
X-Received: by 2002:a05:6871:814:b0:1b7:5ede:ddd6 with SMTP id
 q20-20020a056871081400b001b75ededdd6mr10122053oap.25.1691429212499; Mon, 07
 Aug 2023 10:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230807164452.381251-1-ticotimo@gmail.com>
In-Reply-To: <20230807164452.381251-1-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Aug 2023 10:26:26 -0700
Message-ID: <CAMKF1srD-yabN0QN3FCLuGeRDBQSnKnNh=LFd2-a5VcPUQm-jQ@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH v2] libmodule-build-tiny-perl: upgrade
 0.045 -> 0.046
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 17:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104303

On Mon, Aug 7, 2023 at 9:47=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
> * Drop redundant do_install
> * Use four spaces for indent in RDEPENDS
> * RDEPENDS:
>   - +=3D not =3D
>   - sort alphabetically
>   - Add perl-module-perl-ostype
>   - Add perl-module-extutils-cbuilder-base
>   - Replace perl-module-ipc-open3 with -ipc-cmd
>   - Add perl-module-metadata
>   - Add perl-module-parse-cpan-meta
>   - Add perl-module-extutils-install
>   - Add perl-module-encode-encoding
> * Enable ptest
> * RDEPENDS for ptest:
>   - Add perl-module-ipc-open2
>   - Add perl-module-blib
>   - Add packagegroup-core-standalone-sdk-target
>   - Add gcc
>   - Add binutils
>   - Add perl-dev (for "EXTERN.h")
> * INSANE_SKIP dev-deps for -ptest
>
> 0.046 2023-06-01 19:31:21+02:00 Europe/Amsterdam
>       - Add src/ to include paths
>
> License-Update: Updated Artistic-1.0 (Perl) text
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
> Changes in v2:
>   * use packagegroup-core-standalone-sdk-target intead of
>     individual libgcc-dev etc. components to be musl friendly
>   * ptest results are the same for qemux86-musl and qemux86-64
>
>  .../include/ptest-packagelists-meta-perl.inc  |  1 +
>  .../libmodule-build-tiny-perl_0.045.bb        | 53 ---------------
>  .../libmodule-build-tiny-perl_0.046.bb        | 67 +++++++++++++++++++
>  3 files changed, 68 insertions(+), 53 deletions(-)
>  delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny=
-perl_0.045.bb
>  create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny=
-perl_0.046.bb
>
> diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/me=
ta-perl/conf/include/ptest-packagelists-meta-perl.inc
> index 1a8c759b1..e27981de7 100644
> --- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
> +++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
> @@ -13,6 +13,7 @@ PTESTS_FAST_META_PERL =3D "\
>      libextutils-config-perl \
>      libhtml-tagset-perl \
>      libmozilla-ca-perl \
> +    libmodule-build-tiny-perl \
>      libstrictures-perl \
>      libterm-readkey-perl \
>      libtest-nowarnings-perl \
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0=
.045.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.=
bb
> deleted file mode 100644
> index 17ee50d7c..000000000
> --- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -SUMMARY =3D "Module::Build::Tiny - A tiny replacement for Module::Build"
> -DESCRIPTION =3D "Many Perl distributions use a Build.PL file instead of =
a \
> -Makefile.PL file to drive distribution configuration, build, test and \
> -installation. Traditionally, Build.PL uses Module::Build as the underlyi=
ng \
> -build system. This module provides a simple, lightweight, drop-in replac=
ement. \
> -Whereas Module::Build has over 6,700 lines of code; this module has less=
 than \
> -120, yet supports the features needed by most distributions."
> -SECTION =3D "libs"
> -
> -HOMEPAGE =3D "http://search.cpan.org/~leont/Module-Build-Tiny/"
> -
> -LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6374136f6774db2f51cc116f5efbf=
705"
> -
> -DEPENDS =3D "libextutils-config-perl-native libextutils-helpers-perl-nat=
ive libextutils-installpaths-perl-native"
> -
> -SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV=
}.tar.gz"
> -SRC_URI[sha256sum] =3D "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a=
64b7078f8876d300"
> -
> -S =3D "${WORKDIR}/Module-Build-Tiny-${PV}"
> -
> -inherit cpan_build
> -
> -do_install () {
> -        cpan_build_do_install
> -}
> -
> -RDEPENDS:${PN} =3D " libextutils-config-perl \
> -                   libextutils-helpers-perl \
> -                   libextutils-installpaths-perl \
> -                   perl-module-xsloader \
> -                   perl-module-file-spec \
> -                   perl-module-io-handle \
> -                   perl-module-tap-harness-env \
> -                   perl-module-ipc-open3 \
> -                   perl-module-file-path \
> -                   perl-module-cpan \
> -                   perl-module-extutils-cbuilder \
> -                   perl-module-getopt-long \
> -                   perl-module-extutils-makemaker \
> -                   perl-module-exporter \
> -                   perl-module-carp \
> -                   perl-module-test-more \
> -                   perl-module-text-parsewords \
> -                   perl-module-load \
> -                   perl-module-file-temp \
> -                   perl-module-data-dumper \
> -                   perl-module-extutils-parsexs \
> -                   perl-module-pod-man \
> -                   perl-module-json-pp \
> -"
> -
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0=
.046.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.=
bb
> new file mode 100644
> index 000000000..efbccdda8
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
> @@ -0,0 +1,67 @@
> +SUMMARY =3D "Module::Build::Tiny - A tiny replacement for Module::Build"
> +DESCRIPTION =3D "Many Perl distributions use a Build.PL file instead of =
a \
> +Makefile.PL file to drive distribution configuration, build, test and \
> +installation. Traditionally, Build.PL uses Module::Build as the underlyi=
ng \
> +build system. This module provides a simple, lightweight, drop-in replac=
ement. \
> +Whereas Module::Build has over 6,700 lines of code; this module has less=
 than \
> +120, yet supports the features needed by most distributions."
> +SECTION =3D "libs"
> +
> +HOMEPAGE =3D "http://search.cpan.org/~leont/Module-Build-Tiny/"
> +
> +LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D147a7b891d1584d3d33e478b1f232=
7c5"
> +
> +DEPENDS =3D "libextutils-config-perl-native libextutils-helpers-perl-nat=
ive libextutils-installpaths-perl-native"
> +
> +SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV=
}.tar.gz"
> +SRC_URI[sha256sum] =3D "be193027e2debb4c9926434aaf1aa46c9fc7bf4db83dcc34=
7eb6e359ee878289"
> +
> +S =3D "${WORKDIR}/Module-Build-Tiny-${PV}"
> +
> +inherit cpan_build ptest-perl
> +
> +RDEPENDS:${PN} +=3D " \
> +    libextutils-config-perl \
> +    libextutils-helpers-perl \
> +    libextutils-installpaths-perl \
> +    perl-module-carp \
> +    perl-module-cpan \
> +    perl-module-data-dumper \
> +    perl-module-encode-encoding \
> +    perl-module-exporter \
> +    perl-module-extutils-cbuilder \
> +    perl-module-extutils-cbuilder-base \
> +    perl-module-extutils-install \
> +    perl-module-extutils-makemaker \
> +    perl-module-extutils-parsexs \
> +    perl-module-file-path \
> +    perl-module-file-spec \
> +    perl-module-file-temp \
> +    perl-module-getopt-long \
> +    perl-module-io-handle \
> +    perl-module-ipc-cmd \
> +    perl-module-json-pp \
> +    perl-module-load \
> +    perl-module-metadata \
> +    perl-module-parse-cpan-meta \
> +    perl-module-perl-ostype \
> +    perl-module-pod-man \
> +    perl-module-tap-harness-env \
> +    perl-module-test-more \
> +    perl-module-text-parsewords \
> +    perl-module-xsloader \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    binutils \
> +    gcc \

binutils and gcc should be part of packagegroup below
so you can remove it as well.

> +    packagegroup-core-standalone-sdk-target \
> +    perl-dev \
> +    perl-module-blib \
> +    perl-module-ipc-open2 \
> +"
> +
> +INSANE_SKIP:${PN}-ptest +=3D "dev-deps"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104302): https://lists.openembedded.org/g/openembedde=
d-devel/message/104302
> Mute This Topic: https://lists.openembedded.org/mt/100603983/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

