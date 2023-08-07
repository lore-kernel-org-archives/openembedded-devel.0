Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A30C001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 17:46:44 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.41532.1691430402144503797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 10:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BCXuSSjr;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-584243f84eeso55390297b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691430401; x=1692035201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5n7GYZZeVu7k8E/jZ0Fl6x4cE5N+xugpPmgK/+3hfjk=;
        b=BCXuSSjrtS4XP0iQOvvmjyCtWLTS0SxFkeWmpn6GQSkRFDy913K4CWO4uV04J+KIfW
         4RucFcPcrW7VXceegxmRqgKV9E5kVhrPrHZeXhJ14AwnvPbuMp7CyK2M3087OeQcoxHD
         GSDl5ExS8jn9F8oVo/sgkglbCSnMvROuAjgjsDpbnkbFHlYNnQGS6AcekH5dT4HuSWvD
         4h6Qya9yDSDzbvsRvNhU5gUM2I+rG9GxeZwf0MUPRgrUg0VCNFXFE//i9stic9h+X9rC
         wM+GMk6xr8j4GgDm6d65WctLwwM9Gj9jSfcbweocKb0CsFyzsDqvw1mfKOW7tH+CZZO7
         9I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691430401; x=1692035201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n7GYZZeVu7k8E/jZ0Fl6x4cE5N+xugpPmgK/+3hfjk=;
        b=NIjGLCQeWTvjcihChNykEuPJEhCcicXDlG1xtsyEmGv7ZyMmHGtAPuAOa2gM3EyJLv
         sgUw14K9NilnKPlUDYVdYgKvbBEyC9y4xelXSE8viCV+7FEWLz4ti2E8HLc7tmvT/OOx
         ErPMsskBF/+94f+LRtKDKgv3QA37TzAlDP8f6NCMGD12BlgznvD4REsLg0Cx8FIAWdMp
         LsxsgwKe4GhUg86D1jdgMzNwD6M8UvV/FBJGLCpWS1KxOZpos+/NfMAZ6XqR5pWmRA/z
         IRZQxGSFWh9M69kOVaxkW3hz0zR2U1XEiy+XMLc5Pz0VSqE9TTh5qleYAU+h2xEW5B3z
         VuwA==
X-Gm-Message-State: AOJu0YxqfGIb7QvY4i0rp+LAeb0+ToQXJX72PMofRuaB39G2jW4IAu87
	yGng8VMANAI+13mXmq/eB577hFD4OHVWIqqiQFk=
X-Google-Smtp-Source: AGHT+IHe1IX5Dk1LHSHVPupf37cizLloMnW/7qMkmuhJqp0plHFPsON8z0lITd8XmAZFNNUmmJ3cYAo3WDklID93qsM=
X-Received: by 2002:a0d:cb13:0:b0:577:617c:8cd with SMTP id
 n19-20020a0dcb13000000b00577617c08cdmr12502895ywd.35.1691430401201; Mon, 07
 Aug 2023 10:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230807164452.381251-1-ticotimo@gmail.com> <CAMKF1srD-yabN0QN3FCLuGeRDBQSnKnNh=LFd2-a5VcPUQm-jQ@mail.gmail.com>
In-Reply-To: <CAMKF1srD-yabN0QN3FCLuGeRDBQSnKnNh=LFd2-a5VcPUQm-jQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 7 Aug 2023 10:46:30 -0700
Message-ID: <CANx9H-Csz-+o3FOxWXQeRGbWDJ+BkXcjQbsjBKp_bABizvog=A@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH v2] libmodule-build-tiny-perl: upgrade
 0.045 -> 0.046
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000039de17060258d4db"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 17:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104304

--00000000000039de17060258d4db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 10:26=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Mon, Aug 7, 2023 at 9:47=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wr=
ote:
> >
> > * Drop redundant do_install
> > * Use four spaces for indent in RDEPENDS
> > * RDEPENDS:
> >   - +=3D not =3D
> >   - sort alphabetically
> >   - Add perl-module-perl-ostype
> >   - Add perl-module-extutils-cbuilder-base
> >   - Replace perl-module-ipc-open3 with -ipc-cmd
> >   - Add perl-module-metadata
> >   - Add perl-module-parse-cpan-meta
> >   - Add perl-module-extutils-install
> >   - Add perl-module-encode-encoding
> > * Enable ptest
> > * RDEPENDS for ptest:
> >   - Add perl-module-ipc-open2
> >   - Add perl-module-blib
> >   - Add packagegroup-core-standalone-sdk-target
> >   - Add gcc
> >   - Add binutils
> >   - Add perl-dev (for "EXTERN.h")
> > * INSANE_SKIP dev-deps for -ptest
> >
> > 0.046 2023-06-01 19:31:21+02:00 Europe/Amsterdam
> >       - Add src/ to include paths
> >
> > License-Update: Updated Artistic-1.0 (Perl) text
> >
> > Signed-off-by: Tim Orling <ticotimo@gmail.com>
> > ---
> > Changes in v2:
> >   * use packagegroup-core-standalone-sdk-target intead of
> >     individual libgcc-dev etc. components to be musl friendly
> >   * ptest results are the same for qemux86-musl and qemux86-64
> >
> >  .../include/ptest-packagelists-meta-perl.inc  |  1 +
> >  .../libmodule-build-tiny-perl_0.045.bb        | 53 ---------------
> >  .../libmodule-build-tiny-perl_0.046.bb        | 67 +++++++++++++++++++
> >  3 files changed, 68 insertions(+), 53 deletions(-)
> >  delete mode 100644 meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.045.bb
> >  create mode 100644 meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.046.bb
> >
> > diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
> b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
> > index 1a8c759b1..e27981de7 100644
> > --- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
> > +++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
> > @@ -13,6 +13,7 @@ PTESTS_FAST_META_PERL =3D "\
> >      libextutils-config-perl \
> >      libhtml-tagset-perl \
> >      libmozilla-ca-perl \
> > +    libmodule-build-tiny-perl \
> >      libstrictures-perl \
> >      libterm-readkey-perl \
> >      libtest-nowarnings-perl \
> > diff --git a/meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.045.bb b/meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.045.bb
> > deleted file mode 100644
> > index 17ee50d7c..000000000
> > --- a/meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.045.bb
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -SUMMARY =3D "Module::Build::Tiny - A tiny replacement for Module::Buil=
d"
> > -DESCRIPTION =3D "Many Perl distributions use a Build.PL file instead o=
f a
> \
> > -Makefile.PL file to drive distribution configuration, build, test and =
\
> > -installation. Traditionally, Build.PL uses Module::Build as the
> underlying \
> > -build system. This module provides a simple, lightweight, drop-in
> replacement. \
> > -Whereas Module::Build has over 6,700 lines of code; this module has
> less than \
> > -120, yet supports the features needed by most distributions."
> > -SECTION =3D "libs"
> > -
> > -HOMEPAGE =3D "http://search.cpan.org/~leont/Module-Build-Tiny/"
> > -
> > -LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6374136f6774db2f51cc116f5ef=
bf705"
> > -
> > -DEPENDS =3D "libextutils-config-perl-native
> libextutils-helpers-perl-native libextutils-installpaths-perl-native"
> > -
> > -SRC_URI =3D
> "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
> > -SRC_URI[sha256sum] =3D
> "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a64b7078f8876d300"
> > -
> > -S =3D "${WORKDIR}/Module-Build-Tiny-${PV}"
> > -
> > -inherit cpan_build
> > -
> > -do_install () {
> > -        cpan_build_do_install
> > -}
> > -
> > -RDEPENDS:${PN} =3D " libextutils-config-perl \
> > -                   libextutils-helpers-perl \
> > -                   libextutils-installpaths-perl \
> > -                   perl-module-xsloader \
> > -                   perl-module-file-spec \
> > -                   perl-module-io-handle \
> > -                   perl-module-tap-harness-env \
> > -                   perl-module-ipc-open3 \
> > -                   perl-module-file-path \
> > -                   perl-module-cpan \
> > -                   perl-module-extutils-cbuilder \
> > -                   perl-module-getopt-long \
> > -                   perl-module-extutils-makemaker \
> > -                   perl-module-exporter \
> > -                   perl-module-carp \
> > -                   perl-module-test-more \
> > -                   perl-module-text-parsewords \
> > -                   perl-module-load \
> > -                   perl-module-file-temp \
> > -                   perl-module-data-dumper \
> > -                   perl-module-extutils-parsexs \
> > -                   perl-module-pod-man \
> > -                   perl-module-json-pp \
> > -"
> > -
> > -BBCLASSEXTEND =3D "native"
> > diff --git a/meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.046.bb b/meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.046.bb
> > new file mode 100644
> > index 000000000..efbccdda8
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.046.bb
> > @@ -0,0 +1,67 @@
> > +SUMMARY =3D "Module::Build::Tiny - A tiny replacement for Module::Buil=
d"
> > +DESCRIPTION =3D "Many Perl distributions use a Build.PL file instead o=
f a
> \
> > +Makefile.PL file to drive distribution configuration, build, test and =
\
> > +installation. Traditionally, Build.PL uses Module::Build as the
> underlying \
> > +build system. This module provides a simple, lightweight, drop-in
> replacement. \
> > +Whereas Module::Build has over 6,700 lines of code; this module has
> less than \
> > +120, yet supports the features needed by most distributions."
> > +SECTION =3D "libs"
> > +
> > +HOMEPAGE =3D "http://search.cpan.org/~leont/Module-Build-Tiny/"
> > +
> > +LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D147a7b891d1584d3d33e478b1f2=
327c5"
> > +
> > +DEPENDS =3D "libextutils-config-perl-native
> libextutils-helpers-perl-native libextutils-installpaths-perl-native"
> > +
> > +SRC_URI =3D
> "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
> > +SRC_URI[sha256sum] =3D
> "be193027e2debb4c9926434aaf1aa46c9fc7bf4db83dcc347eb6e359ee878289"
> > +
> > +S =3D "${WORKDIR}/Module-Build-Tiny-${PV}"
> > +
> > +inherit cpan_build ptest-perl
> > +
> > +RDEPENDS:${PN} +=3D " \
> > +    libextutils-config-perl \
> > +    libextutils-helpers-perl \
> > +    libextutils-installpaths-perl \
> > +    perl-module-carp \
> > +    perl-module-cpan \
> > +    perl-module-data-dumper \
> > +    perl-module-encode-encoding \
> > +    perl-module-exporter \
> > +    perl-module-extutils-cbuilder \
> > +    perl-module-extutils-cbuilder-base \
> > +    perl-module-extutils-install \
> > +    perl-module-extutils-makemaker \
> > +    perl-module-extutils-parsexs \
> > +    perl-module-file-path \
> > +    perl-module-file-spec \
> > +    perl-module-file-temp \
> > +    perl-module-getopt-long \
> > +    perl-module-io-handle \
> > +    perl-module-ipc-cmd \
> > +    perl-module-json-pp \
> > +    perl-module-load \
> > +    perl-module-metadata \
> > +    perl-module-parse-cpan-meta \
> > +    perl-module-perl-ostype \
> > +    perl-module-pod-man \
> > +    perl-module-tap-harness-env \
> > +    perl-module-test-more \
> > +    perl-module-text-parsewords \
> > +    perl-module-xsloader \
> > +"
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +    binutils \
> > +    gcc \
>
> binutils and gcc should be part of packagegroup below
> so you can remove it as well.
>
>
They are not. I built without them added and neither "gcc" (-musl-gcc) nor
"as" (-musl-as) were present.
The packagegroup only includes libgcc and friends, but not the tools in
/usr/bin/


> > +    packagegroup-core-standalone-sdk-target \
> > +    perl-dev \
> > +    perl-module-blib \
> > +    perl-module-ipc-open2 \
> > +"
> > +
> > +INSANE_SKIP:${PN}-ptest +=3D "dev-deps"
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#104302):
> https://lists.openembedded.org/g/openembedded-devel/message/104302
> > Mute This Topic: https://lists.openembedded.org/mt/100603983/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000039de17060258d4db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 7, 2023 at 10:26=E2=80=AF=
AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Mon, Aug 7, 2023 at 9:47=E2=80=AFAM Tim Orling &lt;<a href=3D"mailto:ticoti=
mo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * Drop redundant do_install<br>
&gt; * Use four spaces for indent in RDEPENDS<br>
&gt; * RDEPENDS:<br>
&gt;=C2=A0 =C2=A0- +=3D not =3D<br>
&gt;=C2=A0 =C2=A0- sort alphabetically<br>
&gt;=C2=A0 =C2=A0- Add perl-module-perl-ostype<br>
&gt;=C2=A0 =C2=A0- Add perl-module-extutils-cbuilder-base<br>
&gt;=C2=A0 =C2=A0- Replace perl-module-ipc-open3 with -ipc-cmd<br>
&gt;=C2=A0 =C2=A0- Add perl-module-metadata<br>
&gt;=C2=A0 =C2=A0- Add perl-module-parse-cpan-meta<br>
&gt;=C2=A0 =C2=A0- Add perl-module-extutils-install<br>
&gt;=C2=A0 =C2=A0- Add perl-module-encode-encoding<br>
&gt; * Enable ptest<br>
&gt; * RDEPENDS for ptest:<br>
&gt;=C2=A0 =C2=A0- Add perl-module-ipc-open2<br>
&gt;=C2=A0 =C2=A0- Add perl-module-blib<br>
&gt;=C2=A0 =C2=A0- Add packagegroup-core-standalone-sdk-target<br>
&gt;=C2=A0 =C2=A0- Add gcc<br>
&gt;=C2=A0 =C2=A0- Add binutils<br>
&gt;=C2=A0 =C2=A0- Add perl-dev (for &quot;EXTERN.h&quot;)<br>
&gt; * INSANE_SKIP dev-deps for -ptest<br>
&gt;<br>
&gt; 0.046 2023-06-01 19:31:21+02:00 Europe/Amsterdam<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Add src/ to include paths<br>
&gt;<br>
&gt; License-Update: Updated Artistic-1.0 (Perl) text<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0* use packagegroup-core-standalone-sdk-target intead of<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0individual libgcc-dev etc. components to be musl fr=
iendly<br>
&gt;=C2=A0 =C2=A0* ptest results are the same for qemux86-musl and qemux86-=
64<br>
&gt;<br>
&gt;=C2=A0 .../include/ptest-packagelists-meta-perl.inc=C2=A0 |=C2=A0 1 +<b=
r>
&gt;=C2=A0 .../<a href=3D"http://libmodule-build-tiny-perl_0.045.bb" rel=3D=
"noreferrer" target=3D"_blank">libmodule-build-tiny-perl_0.045.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 53 ---------------<br>
&gt;=C2=A0 .../<a href=3D"http://libmodule-build-tiny-perl_0.046.bb" rel=3D=
"noreferrer" target=3D"_blank">libmodule-build-tiny-perl_0.046.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 67 +++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 68 insertions(+), 53 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-perl/recipes-perl/libmodule/<a href=3D"h=
ttp://libmodule-build-tiny-perl_0.045.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libmodule-build-tiny-perl_0.045.bb</a><br>
&gt;=C2=A0 create mode 100644 meta-perl/recipes-perl/libmodule/<a href=3D"h=
ttp://libmodule-build-tiny-perl_0.046.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libmodule-build-tiny-perl_0.046.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b=
/meta-perl/conf/include/ptest-packagelists-meta-perl.inc<br>
&gt; index 1a8c759b1..e27981de7 100644<br>
&gt; --- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc<br>
&gt; +++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc<br>
&gt; @@ -13,6 +13,7 @@ PTESTS_FAST_META_PERL =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libextutils-config-perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libhtml-tagset-perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libmozilla-ca-perl \<br>
&gt; +=C2=A0 =C2=A0 libmodule-build-tiny-perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libstrictures-perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libterm-readkey-perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libtest-nowarnings-perl \<br>
&gt; diff --git a/meta-perl/recipes-perl/libmodule/<a href=3D"http://libmod=
ule-build-tiny-perl_0.045.bb" rel=3D"noreferrer" target=3D"_blank">libmodul=
e-build-tiny-perl_0.045.bb</a> b/meta-perl/recipes-perl/libmodule/<a href=
=3D"http://libmodule-build-tiny-perl_0.045.bb" rel=3D"noreferrer" target=3D=
"_blank">libmodule-build-tiny-perl_0.045.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 17ee50d7c..000000000<br>
&gt; --- a/meta-perl/recipes-perl/libmodule/<a href=3D"http://libmodule-bui=
ld-tiny-perl_0.045.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build=
-tiny-perl_0.045.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,53 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Module::Build::Tiny - A tiny replacement for Module=
::Build&quot;<br>
&gt; -DESCRIPTION =3D &quot;Many Perl distributions use a Build.PL file ins=
tead of a \<br>
&gt; -Makefile.PL file to drive distribution configuration, build, test and=
 \<br>
&gt; -installation. Traditionally, Build.PL uses Module::Build as the under=
lying \<br>
&gt; -build system. This module provides a simple, lightweight, drop-in rep=
lacement. \<br>
&gt; -Whereas Module::Build has over 6,700 lines of code; this module has l=
ess than \<br>
&gt; -120, yet supports the features needed by most distributions.&quot;<br=
>
&gt; -SECTION =3D &quot;libs&quot;<br>
&gt; -<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/~leont/Module-Bu=
ild-Tiny/" rel=3D"noreferrer" target=3D"_blank">http://search.cpan.org/~leo=
nt/Module-Build-Tiny/</a>&quot;<br>
&gt; -<br>
&gt; -LICENSE =3D &quot;Artistic-1.0 | GPL-1.0-or-later&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6374136f6774db2f51cc1=
16f5efbf705&quot;<br>
&gt; -<br>
&gt; -DEPENDS =3D &quot;libextutils-config-perl-native libextutils-helpers-=
perl-native libextutils-installpaths-perl-native&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-T=
iny-${PV}.tar.gz&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d20692eee246d0b329b7f7659f36286b14ae0696=
fe91078a64b7078f8876d300&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/Module-Build-Tiny-${PV}&quot;<br>
&gt; -<br>
&gt; -inherit cpan_build<br>
&gt; -<br>
&gt; -do_install () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpan_build_do_install<br>
&gt; -}<br>
&gt; -<br>
&gt; -RDEPENDS:${PN} =3D &quot; libextutils-config-perl \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
libextutils-helpers-perl \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
libextutils-installpaths-perl \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-xsloader \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-file-spec \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-io-handle \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-tap-harness-env \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-ipc-open3 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-file-path \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-cpan \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-extutils-cbuilder \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-getopt-long \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-extutils-makemaker \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-exporter \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-carp \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-test-more \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-text-parsewords \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-load \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-file-temp \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-data-dumper \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-extutils-parsexs \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-pod-man \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
perl-module-json-pp \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; diff --git a/meta-perl/recipes-perl/libmodule/<a href=3D"http://libmod=
ule-build-tiny-perl_0.046.bb" rel=3D"noreferrer" target=3D"_blank">libmodul=
e-build-tiny-perl_0.046.bb</a> b/meta-perl/recipes-perl/libmodule/<a href=
=3D"http://libmodule-build-tiny-perl_0.046.bb" rel=3D"noreferrer" target=3D=
"_blank">libmodule-build-tiny-perl_0.046.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..efbccdda8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-perl/recipes-perl/libmodule/<a href=3D"http://libmodule-bui=
ld-tiny-perl_0.046.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build=
-tiny-perl_0.046.bb</a><br>
&gt; @@ -0,0 +1,67 @@<br>
&gt; +SUMMARY =3D &quot;Module::Build::Tiny - A tiny replacement for Module=
::Build&quot;<br>
&gt; +DESCRIPTION =3D &quot;Many Perl distributions use a Build.PL file ins=
tead of a \<br>
&gt; +Makefile.PL file to drive distribution configuration, build, test and=
 \<br>
&gt; +installation. Traditionally, Build.PL uses Module::Build as the under=
lying \<br>
&gt; +build system. This module provides a simple, lightweight, drop-in rep=
lacement. \<br>
&gt; +Whereas Module::Build has over 6,700 lines of code; this module has l=
ess than \<br>
&gt; +120, yet supports the features needed by most distributions.&quot;<br=
>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/~leont/Module-Bu=
ild-Tiny/" rel=3D"noreferrer" target=3D"_blank">http://search.cpan.org/~leo=
nt/Module-Build-Tiny/</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;Artistic-1.0 | GPL-1.0-or-later&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D147a7b891d1584d3d33e4=
78b1f2327c5&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;libextutils-config-perl-native libextutils-helpers-=
perl-native libextutils-installpaths-perl-native&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-T=
iny-${PV}.tar.gz&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;be193027e2debb4c9926434aaf1aa46c9fc7bf4d=
b83dcc347eb6e359ee878289&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/Module-Build-Tiny-${PV}&quot;<br>
&gt; +<br>
&gt; +inherit cpan_build ptest-perl<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 libextutils-config-perl \<br>
&gt; +=C2=A0 =C2=A0 libextutils-helpers-perl \<br>
&gt; +=C2=A0 =C2=A0 libextutils-installpaths-perl \<br>
&gt; +=C2=A0 =C2=A0 perl-module-carp \<br>
&gt; +=C2=A0 =C2=A0 perl-module-cpan \<br>
&gt; +=C2=A0 =C2=A0 perl-module-data-dumper \<br>
&gt; +=C2=A0 =C2=A0 perl-module-encode-encoding \<br>
&gt; +=C2=A0 =C2=A0 perl-module-exporter \<br>
&gt; +=C2=A0 =C2=A0 perl-module-extutils-cbuilder \<br>
&gt; +=C2=A0 =C2=A0 perl-module-extutils-cbuilder-base \<br>
&gt; +=C2=A0 =C2=A0 perl-module-extutils-install \<br>
&gt; +=C2=A0 =C2=A0 perl-module-extutils-makemaker \<br>
&gt; +=C2=A0 =C2=A0 perl-module-extutils-parsexs \<br>
&gt; +=C2=A0 =C2=A0 perl-module-file-path \<br>
&gt; +=C2=A0 =C2=A0 perl-module-file-spec \<br>
&gt; +=C2=A0 =C2=A0 perl-module-file-temp \<br>
&gt; +=C2=A0 =C2=A0 perl-module-getopt-long \<br>
&gt; +=C2=A0 =C2=A0 perl-module-io-handle \<br>
&gt; +=C2=A0 =C2=A0 perl-module-ipc-cmd \<br>
&gt; +=C2=A0 =C2=A0 perl-module-json-pp \<br>
&gt; +=C2=A0 =C2=A0 perl-module-load \<br>
&gt; +=C2=A0 =C2=A0 perl-module-metadata \<br>
&gt; +=C2=A0 =C2=A0 perl-module-parse-cpan-meta \<br>
&gt; +=C2=A0 =C2=A0 perl-module-perl-ostype \<br>
&gt; +=C2=A0 =C2=A0 perl-module-pod-man \<br>
&gt; +=C2=A0 =C2=A0 perl-module-tap-harness-env \<br>
&gt; +=C2=A0 =C2=A0 perl-module-test-more \<br>
&gt; +=C2=A0 =C2=A0 perl-module-text-parsewords \<br>
&gt; +=C2=A0 =C2=A0 perl-module-xsloader \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 binutils \<br>
&gt; +=C2=A0 =C2=A0 gcc \<br>
<br>
binutils and gcc should be part of packagegroup below<br>
so you can remove it as well.<br>
<br></blockquote><div><br></div><div>They are not. I built without them add=
ed and neither &quot;gcc&quot; (-musl-gcc) nor &quot;as&quot; (-musl-as) we=
re present.</div><div>The packagegroup only includes libgcc and friends, bu=
t not the tools in /usr/bin/</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 packagegroup-core-standalone-sdk-target \<br>
&gt; +=C2=A0 =C2=A0 perl-dev \<br>
&gt; +=C2=A0 =C2=A0 perl-module-blib \<br>
&gt; +=C2=A0 =C2=A0 perl-module-ipc-open2 \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +INSANE_SKIP:${PN}-ptest +=3D &quot;dev-deps&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#104302): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/104302" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/104302</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10060398=
3/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100603983/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000039de17060258d4db--

