Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D38C001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 23:32:02 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.2347.1691278314427708358
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 16:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pVGUCCdP;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-58439daf39fso36221547b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 16:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691278313; x=1691883113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oyfJPJQY4lWLdO2S/1uRrmbNTEfIF0SEHTlJtv8LRSE=;
        b=pVGUCCdPi1bebB9jTWHHXkknEePEtMhAd+yLDqUDbrSEdNeL63Hh6W0xmYjn0e2Ivn
         Uf6lMdbD2CsgVogvI3jj37ZRvPAjAjukaXtEzeC6lT7nosn2Y5wvl/LezccfNBv25UhM
         6qUS/A4Wicnxh92owXKzPNvHUpcIhuy95l0t2nfn1bSFowyTBlo4oIuSfQruYjbInqTp
         0dtuwgx5APCQ9/6WJBtiQEtKiJhrYozpYSWMmJe/NWGSO/qAp72bfmPBklmSCPiqJQ7V
         RQr2h/290VFriaUZP8T5JfmsZ/9f5T1T4gFJBtvzAGsIMHzevFY8Ut3OnXdNQY8pvZpV
         yXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691278313; x=1691883113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyfJPJQY4lWLdO2S/1uRrmbNTEfIF0SEHTlJtv8LRSE=;
        b=GvJQmVM7yiZq02sXTZAD4yJmvL0msCzBsuV6a42Be18SOabTF/QgKIU0oVPSJhvHqA
         WBxvvS7/U2SKqahRh/qnpf3p3ECCBK7KJ1w6njhCsdBq+9Q5ude6iGUTXqbwB3DhdtwZ
         MnkGlpnvrEPgpNz9nJfE9rfxjlJT9grnHE1KsWqszP3b7cdOXh1yQA3+E0xWVqx+nsMp
         JpBYy9KMQKcAyyoJAq+5PWnVjqWTCI3IWrQs+mJ+MpS2dtinliOB1YfIeJ+7RWFcoD5P
         Xr0PjepNImKqHa+VVC2oz+EdwEl4KxhlToTXDfWBVIbBN7wfWjx1CCJ3eEKsyBvRTiHo
         ZWqw==
X-Gm-Message-State: AOJu0Yyyh05Jf69S9JYiGBWtS9Ts3sF9uB0cyqKfFeH0dz7teyilgtsf
	alupKOrCAbIyhI2l/FKmoH8Vtj+IzHsrBtpSJFY=
X-Google-Smtp-Source: AGHT+IGj2Bfovj/NSwb4Gy/g0QzCE07Hr8GGdTNm2Do7BIWV8fD7HqlbLgoZIPSc7u44XBF4O3Vrooq7GjN1w7pJ5Sg=
X-Received: by 2002:a81:4e15:0:b0:583:b7d0:cc7a with SMTP id
 c21-20020a814e15000000b00583b7d0cc7amr6306286ywb.42.1691278313475; Sat, 05
 Aug 2023 16:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230805224642.2268494-1-ticotimo@gmail.com> <CAMKF1sqCYS0Scy1b5V0BFz_F-C_y+mGH3vag7-QDOFO=SdeuYw@mail.gmail.com>
In-Reply-To: <CAMKF1sqCYS0Scy1b5V0BFz_F-C_y+mGH3vag7-QDOFO=SdeuYw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 5 Aug 2023 16:31:42 -0700
Message-ID: <CANx9H-A=HeWMS-2H07WaBfNAHXikaVMFHPHHQzyCwOWva5pitQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] libmodule-build-tiny-perl: upgrade 0.045 -> 0.046
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001751010602356b59"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 23:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104294

--0000000000001751010602356b59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 5, 2023 at 4:29 PM Khem Raj <raj.khem@gmail.com> wrote:

> Hi Tim
>
> On Sat, Aug 5, 2023 at 3:48=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wr=
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
> >   - Add gcc
> >   - Add binutils (for 'as')
> >   - Add glibc-dev (for crti.o and friends)
> >   - Add libgcc
> >   - Add libgcc-dev (for crtbeginS.o)
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
> > Ptests throw one warning in perl-dev itself
> > (meta-perl-ptest-image-libmodule-build-tiny-perl on qemux86-64)
> >
> > root@qemux86-64:~# time ptest-runner 2>&1 | tee ptest-runner.log
> > START: ptest-runner
> > 2023-08-05T22:45
> > BEGIN: /usr/lib/libmodule-build-tiny-perl/ptest
> > Creating new 'Build' script for 'Foo-Bar' version '0.001'
> > ok 1 - Ran Build.PL
> > ok 2 - Build created
> > ok 3 - Build is executable
> > ok 4 - Build has shebang line with $^X
> > ok 5 - _build_params created
> > ok 6 - Could run Build
> > In file included from
> /usr/lib/perl5/5.36.1/x86_64-linux/CORE/perl.h:7247,
> >                  from lib/Foo/Bar.xs:3:
> > /usr/lib/perl5/5.36.1/x86_64-linux/CORE/sv_inline.h:519:1: warning:
> 'always_inline' function might not be inlinable [-Wattributes]
> >   519 | Perl_newSV_type_mortal(pTHX_ const svtype type)
> >       | ^~~~~~~~~~~~~~~~~~~~~~
> > ok 7 - Build output looks correctly
> > ok 8 - created blib
> > ok 9 - created blib/lib
> > ok 10 - created blib/script
> > ok 11 - Foo::Bar copied to blib
> > ok 12 - pm contents are correct
> > ok 13 - pm file in blib is readonly
> > ok 14 - bin/simple copied to blib
> > ok 15 - blib/script/simple contents are correct
> > ok 16 - blib/script/simple is executable
> > ok 17 - script in blib is readonly
> > ok 18 - blib/script/simple has shebang line with $^X
> > ok 19 - dist sharedir has been made
> > ok 20 - dist sharedir file has been made
> > ok 21 - moduole sharedir has been made
> > ok 22 - module sharedir file has been made
> > ok 23 - Can run XSub Foo::Bar::foo
> > ok 24 - Module gets manified properly
> > ok 25 - Could run Build install
> > ok 26 - Build install output looks correctly
> > ok 27 - Module is installed
> > ok 28 - Script is installed
> > 1..28
> > PASS: t/simple
> > DURATION: 15
> > END: /usr/lib/libmodule-build-tiny-perl/ptest
> > 2023-08-05T22:45
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> > real    0m 15.44s
> > user    0m 4.04s
> > sys     0m 1.53s
> >
> >  .../include/ptest-packagelists-meta-perl.inc  |  1 +
> >  .../libmodule-build-tiny-perl_0.045.bb        | 53 --------------
> >  .../libmodule-build-tiny-perl_0.046.bb        | 69 +++++++++++++++++++
> >  3 files changed, 70 insertions(+), 53 deletions(-)
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
> > index 000000000..64bb4b4a3
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libmodule/
> libmodule-build-tiny-perl_0.046.bb
> > @@ -0,0 +1,69 @@
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
> > +    glibc-dev \
>
> This will not work with musl e.g. however we can make it work.
> It seems this needs a working C/C++ toolchain on target so I would sugges=
t
> to
> rdepend on packagegroup-core-standalone-sdk-target instead of hand-pickin=
g
> toolchain elements. This will abstract it nicely for different runtime
> and toolchain
> variants we have e.g. musl vs glibc, clang vs gcc etc.
>

Agreed. Thank you for the suggestion. Ignore this version until I send a v2=
.

(I was already not that satisfied)


> > +    libgcc \
> > +    libgcc-dev \
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
> > View/Reply Online (#104292):
> https://lists.openembedded.org/g/openembedded-devel/message/104292
> > Mute This Topic: https://lists.openembedded.org/mt/100573061/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000001751010602356b59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Aug 5, 2023 at 4:29 PM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi Tim<br>
<br>
On Sat, Aug 5, 2023 at 3:48=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:tic=
otimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
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
&gt;=C2=A0 =C2=A0- Add gcc<br>
&gt;=C2=A0 =C2=A0- Add binutils (for &#39;as&#39;)<br>
&gt;=C2=A0 =C2=A0- Add glibc-dev (for crti.o and friends)<br>
&gt;=C2=A0 =C2=A0- Add libgcc<br>
&gt;=C2=A0 =C2=A0- Add libgcc-dev (for crtbeginS.o)<br>
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
&gt; Ptests throw one warning in perl-dev itself<br>
&gt; (meta-perl-ptest-image-libmodule-build-tiny-perl on qemux86-64)<br>
&gt;<br>
&gt; root@qemux86-64:~# time ptest-runner 2&gt;&amp;1 | tee ptest-runner.lo=
g<br>
&gt; START: ptest-runner<br>
&gt; 2023-08-05T22:45<br>
&gt; BEGIN: /usr/lib/libmodule-build-tiny-perl/ptest<br>
&gt; Creating new &#39;Build&#39; script for &#39;Foo-Bar&#39; version &#39=
;0.001&#39;<br>
&gt; ok 1 - Ran Build.PL<br>
&gt; ok 2 - Build created<br>
&gt; ok 3 - Build is executable<br>
&gt; ok 4 - Build has shebang line with $^X<br>
&gt; ok 5 - _build_params created<br>
&gt; ok 6 - Could run Build<br>
&gt; In file included from /usr/lib/perl5/5.36.1/x86_64-linux/CORE/perl.h:7=
247,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from lib=
/Foo/Bar.xs:3:<br>
&gt; /usr/lib/perl5/5.36.1/x86_64-linux/CORE/sv_inline.h:519:1: warning: &#=
39;always_inline&#39; function might not be inlinable [-Wattributes]<br>
&gt;=C2=A0 =C2=A0519 | Perl_newSV_type_mortal(pTHX_ const svtype type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0| ^~~~~~~~~~~~~~~~~~~~~~<br>
&gt; ok 7 - Build output looks correctly<br>
&gt; ok 8 - created blib<br>
&gt; ok 9 - created blib/lib<br>
&gt; ok 10 - created blib/script<br>
&gt; ok 11 - Foo::Bar copied to blib<br>
&gt; ok 12 - pm contents are correct<br>
&gt; ok 13 - pm file in blib is readonly<br>
&gt; ok 14 - bin/simple copied to blib<br>
&gt; ok 15 - blib/script/simple contents are correct<br>
&gt; ok 16 - blib/script/simple is executable<br>
&gt; ok 17 - script in blib is readonly<br>
&gt; ok 18 - blib/script/simple has shebang line with $^X<br>
&gt; ok 19 - dist sharedir has been made<br>
&gt; ok 20 - dist sharedir file has been made<br>
&gt; ok 21 - moduole sharedir has been made<br>
&gt; ok 22 - module sharedir file has been made<br>
&gt; ok 23 - Can run XSub Foo::Bar::foo<br>
&gt; ok 24 - Module gets manified properly<br>
&gt; ok 25 - Could run Build install<br>
&gt; ok 26 - Build install output looks correctly<br>
&gt; ok 27 - Module is installed<br>
&gt; ok 28 - Script is installed<br>
&gt; 1..28<br>
&gt; PASS: t/simple<br>
&gt; DURATION: 15<br>
&gt; END: /usr/lib/libmodule-build-tiny-perl/ptest<br>
&gt; 2023-08-05T22:45<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
&gt; real=C2=A0 =C2=A0 0m 15.44s<br>
&gt; user=C2=A0 =C2=A0 0m 4.04s<br>
&gt; sys=C2=A0 =C2=A0 =C2=A00m 1.53s<br>
&gt;<br>
&gt;=C2=A0 .../include/ptest-packagelists-meta-perl.inc=C2=A0 |=C2=A0 1 +<b=
r>
&gt;=C2=A0 .../<a href=3D"http://libmodule-build-tiny-perl_0.045.bb" rel=3D=
"noreferrer" target=3D"_blank">libmodule-build-tiny-perl_0.045.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 53 --------------<br>
&gt;=C2=A0 .../<a href=3D"http://libmodule-build-tiny-perl_0.046.bb" rel=3D=
"noreferrer" target=3D"_blank">libmodule-build-tiny-perl_0.046.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 69 +++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 70 insertions(+), 53 deletions(-)<br>
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
&gt; index 000000000..64bb4b4a3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-perl/recipes-perl/libmodule/<a href=3D"http://libmodule-bui=
ld-tiny-perl_0.046.bb" rel=3D"noreferrer" target=3D"_blank">libmodule-build=
-tiny-perl_0.046.bb</a><br>
&gt; @@ -0,0 +1,69 @@<br>
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
&gt; +=C2=A0 =C2=A0 glibc-dev \<br>
<br>
This will not work with musl e.g. however we can make it work.<br>
It seems this needs a working C/C++ toolchain on target so I would suggest =
to<br>
rdepend on packagegroup-core-standalone-sdk-target instead of hand-picking<=
br>
toolchain elements. This will abstract it nicely for different runtime<br>
and toolchain<br>
variants we have e.g. musl vs glibc, clang vs gcc etc.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Agreed. Thank yo=
u for the suggestion. Ignore this version until I send a v2.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">(I was already not that satisfied)</d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; +=C2=A0 =C2=A0 libgcc \<br>
&gt; +=C2=A0 =C2=A0 libgcc-dev \<br>
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
&gt; View/Reply Online (#104292): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/104292" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/104292</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10057306=
1/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100573061/1997914</a><br>
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

--0000000000001751010602356b59--

