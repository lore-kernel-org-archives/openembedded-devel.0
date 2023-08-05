Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E2DC001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 23:29:42 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.2333.1691278178423718321
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 16:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K0AezTxa;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-56cb1e602e7so2207146eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 16:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691278177; x=1691882977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5crPjx7JmYHybPF6e5yK0LFmQ9NtQacUEkVFAszwm0=;
        b=K0AezTxaJVk4POk22190yPduyrrjp359msoHgbreR2gD+yhNe+1zajGRKOYQpcBmkl
         oZfngOVkrKm+9Urlr+M5/zKD7NjYxncFRRdCcTHfppd3qvKVVrCJgs0cbqy4tDqrVcIF
         I7tGWLJUxYuHex18neoyIyiYPj0ox8pCMoVhsmOVTP29Bb6Ev64eZ8aoPd/6T13oDwl9
         yLeSr01GBUx43Tjehe/8ThBnYmCwxKRsaYnmrjYw2KSM4kqTdH827ugNQdX140+3G8cD
         odCEtN3CJNtosmEc5uGyqlFCI+7xDSJV1vPq/GEQILnAT4cxS04JThgrYxXc3a30AsKv
         3kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691278177; x=1691882977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5crPjx7JmYHybPF6e5yK0LFmQ9NtQacUEkVFAszwm0=;
        b=hM85n89Be554EzHzHgGXswYBqiAw/qxQwCJ2kwjvb+8ieJS2KrejtTqIK//d8gxzX1
         9JxJ4DUubpTCv3SDBdRGCp0ZndgpB7cyfHinvdaxDxfiy9tobH3w+Gs+wtGaoDSPpd5k
         7Kpwh7Da70UoUPIZXVkcfblH2tQr2Cebes3PglF0rSIk3GzcJv0xcF8nveimOQqqobdF
         C8h74+O35oOHpEiWc3FVZikd/kyB1/vxB1XMoXBh7Yoq0FcmOALUVSxLg5XRCVWuxMJa
         eXmypIBQcLe+e2qw49Hzp0lyGGlLofeyUWRMMC461/zcHyth9XOvdZ8kS4+7inWAXG58
         0EEg==
X-Gm-Message-State: AOJu0Yzt3dQxMAqIIUCInTbwP0U24S7haxash/ExmHe9ntw0Jo6uvxMy
	MPkZX9gDPIBXLSftgP+Qiw5CqonJYrqxWnQ0LJs=
X-Google-Smtp-Source: AGHT+IEkKuogUpICv5QlFGizAweGMs7mSVuy0yTvhsQFPVPFEorDIQ2cccaX0JhtRneH5moDQ7vETVh6mIy0OHd6iTI=
X-Received: by 2002:a4a:2750:0:b0:56c:cc05:c053 with SMTP id
 w16-20020a4a2750000000b0056ccc05c053mr5241793oow.5.1691278177520; Sat, 05 Aug
 2023 16:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230805224642.2268494-1-ticotimo@gmail.com>
In-Reply-To: <20230805224642.2268494-1-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Aug 2023 16:29:11 -0700
Message-ID: <CAMKF1sqCYS0Scy1b5V0BFz_F-C_y+mGH3vag7-QDOFO=SdeuYw@mail.gmail.com>
Subject: Re: [oe] [PATCH] libmodule-build-tiny-perl: upgrade 0.045 -> 0.046
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 23:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104293

Hi Tim

On Sat, Aug 5, 2023 at 3:48=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wrot=
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
>   - Add gcc
>   - Add binutils (for 'as')
>   - Add glibc-dev (for crti.o and friends)
>   - Add libgcc
>   - Add libgcc-dev (for crtbeginS.o)
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
> Ptests throw one warning in perl-dev itself
> (meta-perl-ptest-image-libmodule-build-tiny-perl on qemux86-64)
>
> root@qemux86-64:~# time ptest-runner 2>&1 | tee ptest-runner.log
> START: ptest-runner
> 2023-08-05T22:45
> BEGIN: /usr/lib/libmodule-build-tiny-perl/ptest
> Creating new 'Build' script for 'Foo-Bar' version '0.001'
> ok 1 - Ran Build.PL
> ok 2 - Build created
> ok 3 - Build is executable
> ok 4 - Build has shebang line with $^X
> ok 5 - _build_params created
> ok 6 - Could run Build
> In file included from /usr/lib/perl5/5.36.1/x86_64-linux/CORE/perl.h:7247=
,
>                  from lib/Foo/Bar.xs:3:
> /usr/lib/perl5/5.36.1/x86_64-linux/CORE/sv_inline.h:519:1: warning: 'alwa=
ys_inline' function might not be inlinable [-Wattributes]
>   519 | Perl_newSV_type_mortal(pTHX_ const svtype type)
>       | ^~~~~~~~~~~~~~~~~~~~~~
> ok 7 - Build output looks correctly
> ok 8 - created blib
> ok 9 - created blib/lib
> ok 10 - created blib/script
> ok 11 - Foo::Bar copied to blib
> ok 12 - pm contents are correct
> ok 13 - pm file in blib is readonly
> ok 14 - bin/simple copied to blib
> ok 15 - blib/script/simple contents are correct
> ok 16 - blib/script/simple is executable
> ok 17 - script in blib is readonly
> ok 18 - blib/script/simple has shebang line with $^X
> ok 19 - dist sharedir has been made
> ok 20 - dist sharedir file has been made
> ok 21 - moduole sharedir has been made
> ok 22 - module sharedir file has been made
> ok 23 - Can run XSub Foo::Bar::foo
> ok 24 - Module gets manified properly
> ok 25 - Could run Build install
> ok 26 - Build install output looks correctly
> ok 27 - Module is installed
> ok 28 - Script is installed
> 1..28
> PASS: t/simple
> DURATION: 15
> END: /usr/lib/libmodule-build-tiny-perl/ptest
> 2023-08-05T22:45
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
> real    0m 15.44s
> user    0m 4.04s
> sys     0m 1.53s
>
>  .../include/ptest-packagelists-meta-perl.inc  |  1 +
>  .../libmodule-build-tiny-perl_0.045.bb        | 53 --------------
>  .../libmodule-build-tiny-perl_0.046.bb        | 69 +++++++++++++++++++
>  3 files changed, 70 insertions(+), 53 deletions(-)
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
> index 000000000..64bb4b4a3
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
> @@ -0,0 +1,69 @@
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
> +    glibc-dev \

This will not work with musl e.g. however we can make it work.
It seems this needs a working C/C++ toolchain on target so I would suggest =
to
rdepend on packagegroup-core-standalone-sdk-target instead of hand-picking
toolchain elements. This will abstract it nicely for different runtime
and toolchain
variants we have e.g. musl vs glibc, clang vs gcc etc.

> +    libgcc \
> +    libgcc-dev \
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
> View/Reply Online (#104292): https://lists.openembedded.org/g/openembedde=
d-devel/message/104292
> Mute This Topic: https://lists.openembedded.org/mt/100573061/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

