Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DD3C0015E
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 18:09:28 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.95591.1691604564094575273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Aug 2023 11:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=loidIA5Y;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1bba254a7d4so50445fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Aug 2023 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691604563; x=1692209363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O9lKzFQ3WWCApfkx5khFZ+85wfcgVkDzOu6dY8Kz1g=;
        b=loidIA5YcEsodZbvTSkxaN1Iyoz0wiNue9wBDzxpVFVLnSuCJzC+pNFij3uhzMlehO
         iKrvHUjaNhMIv/Pj/gyQZ5H/G940jC81Jj102unWHRqRBQ6KGndGfOKaITSyRfB406L8
         eTQ5EXS8fDz5gfApzqPcqGGEw3jF8zEaiTezqtXYPOUdJZbKyUdOTXaHGVf49rzMgO9D
         cgZPzfMv64qjXHw2NNFdQ+IOBL+jARbPshk0fHce4dSgQYJ2Z9tmgQi569FcXOTN4fRl
         ubRjDn5yE5UuG1pU8s+oFi35n4Hqb8Vj64QUXL4HKYCKp4SoUy81V7adlivz8txDbD0K
         rGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691604563; x=1692209363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O9lKzFQ3WWCApfkx5khFZ+85wfcgVkDzOu6dY8Kz1g=;
        b=BfiJRv5re7Vy5KfIyNOMiARPHgj30kMDcxTYpZEq76QkXN3lA2zTDRbVCbMdRVihfu
         3xppjnLf60L8Frvmhqcnpm+ycpY3oAcz91USqvQErFwwXPw4dT02nxhdLcWsy3b6opXW
         3mboHwFKxTAw54lIz1fMSeOMPkrYLNbs0nBbI5B6akO9MZ3Bcr5E+YxQpcJQrVzAM9u2
         iicXB5oHcZtYpS0S/5BEn87wTPEhzUHgPoxDMxVPseiYoVuN/vGuhEYJx6Q3eHguDl5I
         xgkveofpELGE0cqZV9FG7FP9ueLh2JGKpjaGsd/mLCNT6uP/9HwUTSTkZfwelbKMT+Rr
         OJGg==
X-Gm-Message-State: AOJu0Yw11XsDGwSBiDSAlHehmYzpvv5dTwbr8+KR/etKLypkjd9VxDql
	nmvgvLTtAU/I8wlcz3gRYlGSb7afdQj3zhAO0B0=
X-Google-Smtp-Source: AGHT+IF1wfNSYnH4Qu2ZY5Z7Mdpl6Dye3DtKJ2hucZmffs0ILMN3mv5g47q9UcZLl4Z/t2ZNOEyBbrWG2cdSGTvzMHI=
X-Received: by 2002:a05:6870:8a09:b0:1bb:742a:4f62 with SMTP id
 p9-20020a0568708a0900b001bb742a4f62mr3733042oaq.45.1691604563218; Wed, 09 Aug
 2023 11:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230809014419.3606952-1-ticotimo@gmail.com>
In-Reply-To: <20230809014419.3606952-1-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Aug 2023 11:08:57 -0700
Message-ID: <CAMKF1spDxpfw_GsY2n6vERSnoZQKyi32pojybPOn2cJi_4TeRA@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH v3] libmodule-build-tiny-perl: upgrade
 0.045 -> 0.046
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Aug 2023 18:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104311

Thanks for reworking this Tim, I can see it pass with musl+clang too -
https://snips.sh/f/8ePH3RMHC9

On Tue, Aug 8, 2023 at 6:47=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wrot=
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
>   - Add packagegroup-core-buildessential
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
> Changes in v3:
>   - add packagegroup-core-buildessential instead of
>     - gcc
>     - buildutils
>     - packagegroup-core-standalone-sdk
>
> Results from ptest are the same as previous v2
>
>  .../include/ptest-packagelists-meta-perl.inc  |  1 +
>  .../libmodule-build-tiny-perl_0.045.bb        | 53 ---------------
>  .../libmodule-build-tiny-perl_0.046.bb        | 65 +++++++++++++++++++
>  3 files changed, 66 insertions(+), 53 deletions(-)
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
> index 000000000..1e23d87a6
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
> @@ -0,0 +1,65 @@
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
> +    packagegroup-core-buildessential \
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
> View/Reply Online (#104309): https://lists.openembedded.org/g/openembedde=
d-devel/message/104309
> Mute This Topic: https://lists.openembedded.org/mt/100635825/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

