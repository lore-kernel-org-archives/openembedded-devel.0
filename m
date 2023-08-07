Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D02DC001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 17:53:54 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.41677.1691430829220079166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 10:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oMmZxO4z;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1bef8f0904eso3525249fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691430828; x=1692035628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8E5EUyLwle+iKCeTHYTTTPkOUUqSLQQlVzSMQ6+NlJI=;
        b=oMmZxO4z4hAPgd25O0d3ept92APRMo++Evr70yPGhn5OXdF9eEqhKyZ7///KoUPLs2
         QpwKIevXVrFHiETACllupqF6yI33U8KgVrDHvE6713/9WsfTOIEBtMLiO5u3OJ5DGi6Y
         TbWgHG3j51up7pQc9o4P48EOnciEzHhX8jvdO0o7PnEvsfduadysOSsKlyXWTM9TCUJU
         BCBtaDUmR4BhG3gF+zAmFpNzugQBAPROUv4wSYFHnvX8I5GpR1PTMWNi3ZTxwzRXyNX0
         z49yddC6fVpEIOEtJ27Q/xsTWrDJ+Aq2CIwlBRlOpci+j3HcbKg8vLIcXvwq1aWRtubj
         9bWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691430828; x=1692035628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8E5EUyLwle+iKCeTHYTTTPkOUUqSLQQlVzSMQ6+NlJI=;
        b=QCX7B866zI3WSQ1pUJZaRjPiEgC71n6darbg3nTmF4IltTeP2ERXxYLyExOG7UDR82
         s5C9aL29pMUe/LXqk6QheiyAaCg2sHs8SqnZfGNKe+PupRPSiIw6u4GK5u5rU/sWoctH
         2D+MW0uwTi72YqXT3mgk+kmu3tZ7n5fixZjEHFVKgJ8HpcJ5BtlJ9zHbRH7npS0MAmFM
         xVKk0zmSynth05etTozCBlT0Jqn71up25Hyab9Qy0U3PxU/6674CxipHqBIDpBYYU3AW
         2m1UsOZeqKXbUDmf1voujBwxEVlg/6R3SFUcV00ctAFubgWahydWmB23OwNOWs4smERq
         CEyw==
X-Gm-Message-State: AOJu0Yy1JdLXRY+DspJfCvmq82QbMVeSrLUMUbHB+x32Oc8wiGGPYxqn
	8P7emt8ehTSBleY69ZuCfyFsDq/uSXDxESpsZPI=
X-Google-Smtp-Source: AGHT+IG2yMuPqwRRvY0qMTDAlXOzfHhcsExHUmM/1avNkWLZvm+8jm0L+TRD7PZIJBqro4bKtvkaqD6bAXqUWCzoXxI=
X-Received: by 2002:a05:6870:9708:b0:1aa:30e3:6a5e with SMTP id
 n8-20020a056870970800b001aa30e36a5emr11074889oaq.22.1691430827500; Mon, 07
 Aug 2023 10:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230807164452.381251-1-ticotimo@gmail.com> <CAMKF1srD-yabN0QN3FCLuGeRDBQSnKnNh=LFd2-a5VcPUQm-jQ@mail.gmail.com>
 <CANx9H-Csz-+o3FOxWXQeRGbWDJ+BkXcjQbsjBKp_bABizvog=A@mail.gmail.com>
In-Reply-To: <CANx9H-Csz-+o3FOxWXQeRGbWDJ+BkXcjQbsjBKp_bABizvog=A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Aug 2023 10:53:21 -0700
Message-ID: <CAMKF1sp9JaRgSJigcd6ZXspKcG+ffk0aVOJn0q8zEoacJ0hHfg@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH v2] libmodule-build-tiny-perl: upgrade
 0.045 -> 0.046
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 17:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104305

On Mon, Aug 7, 2023 at 10:46=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wro=
te:
>
>
>
> On Mon, Aug 7, 2023 at 10:26=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> On Mon, Aug 7, 2023 at 9:47=E2=80=AFAM Tim Orling <ticotimo@gmail.com> w=
rote:
>> >
>> > * Drop redundant do_install
>> > * Use four spaces for indent in RDEPENDS
>> > * RDEPENDS:
>> >   - +=3D not =3D
>> >   - sort alphabetically
>> >   - Add perl-module-perl-ostype
>> >   - Add perl-module-extutils-cbuilder-base
>> >   - Replace perl-module-ipc-open3 with -ipc-cmd
>> >   - Add perl-module-metadata
>> >   - Add perl-module-parse-cpan-meta
>> >   - Add perl-module-extutils-install
>> >   - Add perl-module-encode-encoding
>> > * Enable ptest
>> > * RDEPENDS for ptest:
>> >   - Add perl-module-ipc-open2
>> >   - Add perl-module-blib
>> >   - Add packagegroup-core-standalone-sdk-target
>> >   - Add gcc
>> >   - Add binutils
>> >   - Add perl-dev (for "EXTERN.h")
>> > * INSANE_SKIP dev-deps for -ptest
>> >
>> > 0.046 2023-06-01 19:31:21+02:00 Europe/Amsterdam
>> >       - Add src/ to include paths
>> >
>> > License-Update: Updated Artistic-1.0 (Perl) text
>> >
>> > Signed-off-by: Tim Orling <ticotimo@gmail.com>
>> > ---
>> > Changes in v2:
>> >   * use packagegroup-core-standalone-sdk-target intead of
>> >     individual libgcc-dev etc. components to be musl friendly
>> >   * ptest results are the same for qemux86-musl and qemux86-64
>> >
>> >  .../include/ptest-packagelists-meta-perl.inc  |  1 +
>> >  .../libmodule-build-tiny-perl_0.045.bb        | 53 ---------------
>> >  .../libmodule-build-tiny-perl_0.046.bb        | 67 ++++++++++++++++++=
+
>> >  3 files changed, 68 insertions(+), 53 deletions(-)
>> >  delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-t=
iny-perl_0.045.bb
>> >  create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-t=
iny-perl_0.046.bb
>> >
>> > diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b=
/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
>> > index 1a8c759b1..e27981de7 100644
>> > --- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
>> > +++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
>> > @@ -13,6 +13,7 @@ PTESTS_FAST_META_PERL =3D "\
>> >      libextutils-config-perl \
>> >      libhtml-tagset-perl \
>> >      libmozilla-ca-perl \
>> > +    libmodule-build-tiny-perl \
>> >      libstrictures-perl \
>> >      libterm-readkey-perl \
>> >      libtest-nowarnings-perl \
>> > diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-per=
l_0.045.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.0=
45.bb
>> > deleted file mode 100644
>> > index 17ee50d7c..000000000
>> > --- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045=
.bb
>> > +++ /dev/null
>> > @@ -1,53 +0,0 @@
>> > -SUMMARY =3D "Module::Build::Tiny - A tiny replacement for Module::Bui=
ld"
>> > -DESCRIPTION =3D "Many Perl distributions use a Build.PL file instead =
of a \
>> > -Makefile.PL file to drive distribution configuration, build, test and=
 \
>> > -installation. Traditionally, Build.PL uses Module::Build as the under=
lying \
>> > -build system. This module provides a simple, lightweight, drop-in rep=
lacement. \
>> > -Whereas Module::Build has over 6,700 lines of code; this module has l=
ess than \
>> > -120, yet supports the features needed by most distributions."
>> > -SECTION =3D "libs"
>> > -
>> > -HOMEPAGE =3D "http://search.cpan.org/~leont/Module-Build-Tiny/"
>> > -
>> > -LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6374136f6774db2f51cc116f5e=
fbf705"
>> > -
>> > -DEPENDS =3D "libextutils-config-perl-native libextutils-helpers-perl-=
native libextutils-installpaths-perl-native"
>> > -
>> > -SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-$=
{PV}.tar.gz"
>> > -SRC_URI[sha256sum] =3D "d20692eee246d0b329b7f7659f36286b14ae0696fe910=
78a64b7078f8876d300"
>> > -
>> > -S =3D "${WORKDIR}/Module-Build-Tiny-${PV}"
>> > -
>> > -inherit cpan_build
>> > -
>> > -do_install () {
>> > -        cpan_build_do_install
>> > -}
>> > -
>> > -RDEPENDS:${PN} =3D " libextutils-config-perl \
>> > -                   libextutils-helpers-perl \
>> > -                   libextutils-installpaths-perl \
>> > -                   perl-module-xsloader \
>> > -                   perl-module-file-spec \
>> > -                   perl-module-io-handle \
>> > -                   perl-module-tap-harness-env \
>> > -                   perl-module-ipc-open3 \
>> > -                   perl-module-file-path \
>> > -                   perl-module-cpan \
>> > -                   perl-module-extutils-cbuilder \
>> > -                   perl-module-getopt-long \
>> > -                   perl-module-extutils-makemaker \
>> > -                   perl-module-exporter \
>> > -                   perl-module-carp \
>> > -                   perl-module-test-more \
>> > -                   perl-module-text-parsewords \
>> > -                   perl-module-load \
>> > -                   perl-module-file-temp \
>> > -                   perl-module-data-dumper \
>> > -                   perl-module-extutils-parsexs \
>> > -                   perl-module-pod-man \
>> > -                   perl-module-json-pp \
>> > -"
>> > -
>> > -BBCLASSEXTEND =3D "native"
>> > diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-per=
l_0.046.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.0=
46.bb
>> > new file mode 100644
>> > index 000000000..efbccdda8
>> > --- /dev/null
>> > +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046=
.bb
>> > @@ -0,0 +1,67 @@
>> > +SUMMARY =3D "Module::Build::Tiny - A tiny replacement for Module::Bui=
ld"
>> > +DESCRIPTION =3D "Many Perl distributions use a Build.PL file instead =
of a \
>> > +Makefile.PL file to drive distribution configuration, build, test and=
 \
>> > +installation. Traditionally, Build.PL uses Module::Build as the under=
lying \
>> > +build system. This module provides a simple, lightweight, drop-in rep=
lacement. \
>> > +Whereas Module::Build has over 6,700 lines of code; this module has l=
ess than \
>> > +120, yet supports the features needed by most distributions."
>> > +SECTION =3D "libs"
>> > +
>> > +HOMEPAGE =3D "http://search.cpan.org/~leont/Module-Build-Tiny/"
>> > +
>> > +LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D147a7b891d1584d3d33e478b1f=
2327c5"
>> > +
>> > +DEPENDS =3D "libextutils-config-perl-native libextutils-helpers-perl-=
native libextutils-installpaths-perl-native"
>> > +
>> > +SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-$=
{PV}.tar.gz"
>> > +SRC_URI[sha256sum] =3D "be193027e2debb4c9926434aaf1aa46c9fc7bf4db83dc=
c347eb6e359ee878289"
>> > +
>> > +S =3D "${WORKDIR}/Module-Build-Tiny-${PV}"
>> > +
>> > +inherit cpan_build ptest-perl
>> > +
>> > +RDEPENDS:${PN} +=3D " \
>> > +    libextutils-config-perl \
>> > +    libextutils-helpers-perl \
>> > +    libextutils-installpaths-perl \
>> > +    perl-module-carp \
>> > +    perl-module-cpan \
>> > +    perl-module-data-dumper \
>> > +    perl-module-encode-encoding \
>> > +    perl-module-exporter \
>> > +    perl-module-extutils-cbuilder \
>> > +    perl-module-extutils-cbuilder-base \
>> > +    perl-module-extutils-install \
>> > +    perl-module-extutils-makemaker \
>> > +    perl-module-extutils-parsexs \
>> > +    perl-module-file-path \
>> > +    perl-module-file-spec \
>> > +    perl-module-file-temp \
>> > +    perl-module-getopt-long \
>> > +    perl-module-io-handle \
>> > +    perl-module-ipc-cmd \
>> > +    perl-module-json-pp \
>> > +    perl-module-load \
>> > +    perl-module-metadata \
>> > +    perl-module-parse-cpan-meta \
>> > +    perl-module-perl-ostype \
>> > +    perl-module-pod-man \
>> > +    perl-module-tap-harness-env \
>> > +    perl-module-test-more \
>> > +    perl-module-text-parsewords \
>> > +    perl-module-xsloader \
>> > +"
>> > +
>> > +RDEPENDS:${PN}-ptest +=3D " \
>> > +    binutils \
>> > +    gcc \
>>
>> binutils and gcc should be part of packagegroup below
>> so you can remove it as well.
>>
>
> They are not. I built without them added and neither "gcc" (-musl-gcc) no=
r "as" (-musl-as) were present.
> The packagegroup only includes libgcc and friends, but not the tools in /=
usr/bin/
>

Looking at the core you are right. Contrary to name this packagegroup
does not provide tools but just runtime.
perhaps packagegroup-core-buildessential is more appropriate instead.

>>
>> > +    packagegroup-core-standalone-sdk-target \
>> > +    perl-dev \
>> > +    perl-module-blib \
>> > +    perl-module-ipc-open2 \
>> > +"
>> > +
>> > +INSANE_SKIP:${PN}-ptest +=3D "dev-deps"
>> > +
>> > +BBCLASSEXTEND =3D "native"
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#104302): https://lists.openembedded.org/g/openembe=
dded-devel/message/104302
>> > Mute This Topic: https://lists.openembedded.org/mt/100603983/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

