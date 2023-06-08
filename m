Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2BFC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 21:11:06 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.5724.1686258661003951518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 14:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MQZkgaqq;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55b3b3e2928so724978eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686258660; x=1688850660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUJBRAFJ+b6ju5ythSXBEIdMfTabRf7oyUD2JNSmtD0=;
        b=MQZkgaqqDTxx8MAglZX4sOptydPrsTcJ++8Qaj8qbPebkvTg1UjiEmVOJG3k9Sbyoz
         InvxxlmvW30YIKNd39Qp4MVufU4NNbWv82/NG2+vVgG3P9sUCHVQEY6ly1fYyoMBDYqe
         SijcewIFWygfGmdByUtDHPaJMoajbX+9B48zoqh97ZH5KBYtk1wcSLHeY2Q4D8B9Hfi5
         aaKvAFMaSjbJn5MpOKad+cChaEh1QzcLcehilsGaRXt0cAgiU2cnFOWBlob54L/zyRBI
         IAvWEORzA5S1HuKgWDdBGovExLsPwujF3lje76dsdFVowxDAcorw0+mJKRYQbPGh28lo
         qI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686258660; x=1688850660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUJBRAFJ+b6ju5ythSXBEIdMfTabRf7oyUD2JNSmtD0=;
        b=C4N7DEuetzCiZ32iaBHQkJMGE7tjP2O+73l/AiQkbwi3t8FEPt/l7nJ3tbnfvQpSga
         kQRA6/C9uyuSLgZPx80fHjq/hRLgN8JSzLJm/5TAMxlL7N2M8lNI8QZuXXpPgj2m9YQ4
         HjM+mENzNslf/TdZCR4POWv+iqVZ/345xo5DpMynwe+ZK34yqid7G4MF/FTu9/a1GAyJ
         nEEXlUOSQSvRIn0lvyE6Yyg2ZYV0daTnniOrSALg52jd59Ed0ijwb1O9RPsoBj7SIBOs
         QxNfrMvDhEPeoh0UQ60jUn5GAq7TCZA/H0EjNPmvDvDC4t25muzFiihuTM30AZGaRWYR
         XtwA==
X-Gm-Message-State: AC+VfDyV/xC4/3cgB1Ty2xl9aHJ3WRaf5214n5ffXeuRxDA94nKuTEuI
	kLHPBs9BBerJBY2FS6bWv75NXei5htXF7hXGJuCb6/Fb
X-Google-Smtp-Source: ACHHUZ44aOheTL5nHmSbdZVLZmb4QFd0QBykKxlRz818GtqEr6hD5/sB8b4pdRQhFjexWErYO7Zi+ue9hsejdOs3JUg=
X-Received: by 2002:a4a:4343:0:b0:558:b78d:8d1c with SMTP id
 l3-20020a4a4343000000b00558b78d8d1cmr616567ooj.7.1686258659879; Thu, 08 Jun
 2023 14:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230607072321.589315-1-zboszor@gmail.com> <8b2cdabf-7e71-bb12-ce14-eefea762c403@gmail.com>
 <CAMKF1sptTB=_78n84iYnjKigk3_nhgia0gBJapXcsB4iMqhRZw@mail.gmail.com> <CAMKF1speJ6nXfDbn3ZRgYN8=HaXRZwh+SZpJa9=4t62z5AEM1A@mail.gmail.com>
In-Reply-To: <CAMKF1speJ6nXfDbn3ZRgYN8=HaXRZwh+SZpJa9=4t62z5AEM1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jun 2023 14:10:33 -0700
Message-ID: <CAMKF1sqseihecRUcvXKAd8hWeecWi4UY7T8+_2amu-vxPoivsw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] mpich: Upgrade to 4.1.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 21:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103192

I have added fixes for the issues I have seen, Please take a look at
the updated patch in master-next

On Thu, Jun 8, 2023 at 10:23=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Thu, Jun 8, 2023 at 9:41=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > still seeing issues
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2802
> >
>
> I dropped the unknown option and it went further which is good,
> however I am seeing
>
> WARNING: mpich-4.1.1-r0 do_package_qa: QA Issue: File
> /usr/lib/libmpi.so.12.3.0 in package mpich contains reference to
> TMPDIR
> File /usr/bin/mpicc in package mpich contains reference to TMPDIR
> File /usr/bin/mpicxx in package mpich contains reference to TMPDIR [build=
paths]
>
> So it will be good to look into this problem as well, why do we see
> these QA warnings.
>
> > On Wed, Jun 7, 2023 at 12:28=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=
=C3=A1n <zboszor@gmail.com> wrote:
> > >
> > > 2023. 06. 07. 9:23 keltez=C3=A9ssel, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi =C3=ADrta:
> > > > mpich 4.1+ has its own official way to allow cross-compiling,
> > > > use it.
> > > >
> > > > Remove the old PACKAGECONFIG[x11], the configuration option
> > > > does not exist anymore.
> > > >
> > > > Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
> > > > parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
> > > > enable either by default to keep the current minimalistic build.
> > > >
> > > > Remove configuration options that don't exist in the new version.
> > > >
> > > > Set TOOLCHAIN =3D "gcc".
> > > >
> > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> > > > ---
> > > >   meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 --------------=
---
> > > >   meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 64 ++++++++++++++=
+++++
> > > >   2 files changed, 64 insertions(+), 58 deletions(-)
> > > >   delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> > > >   create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> > > >
> > > > diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-o=
e/recipes-devtools/mpich/mpich_4.0.3.bb
> > > > deleted file mode 100644
> > > > index 000f73981..000000000
> > > > --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> > > > +++ /dev/null
> > > > @@ -1,58 +0,0 @@
> > > > -SUMMARY =3D "Message Passing Interface (MPI) implementation"
> > > > -HOMEPAGE =3D "http://www.mpich.org/"
> > > > -SECTION =3D "devel"
> > > > -
> > > > -LICENSE =3D "BSD-2-Clause"
> > > > -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2=
a4e01c8c163"
> > > > -
> > > > -SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${P=
V}.tar.gz"
> > > > -SRC_URI[sha256sum] =3D "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f7=
7ac4e8c5ebe4a3e3b6c501"
> > > > -
> > > > -RDEPENDS:${PN} +=3D "bash perl libxml2"
> > > > -
> > > > -EXTRA_OECONF =3D "--enable-debuginfo \
> > > > -    --enable-fast \
> > > > -    --enable-shared  \
> > > > -    --with-pm=3Dgforker  \
> > > > -    --disable-rpath \
> > > > -    --disable-f77 \
> > > > -    --disable-fc \
> > > > -    --disable-fortran \
> > > > -    --disable-cxx \
> > > > -    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> > > > -    PERL=3D'${USRBINPATH}/env perl' \
> > > > -    --with-device=3Dch3:nemesis \
> > > > -    --with-rdmacm=3Dno \
> > > > -    --disable-numa \
> > > > -"
> > > > -
> > > > -PACKAGECONFIG +=3D " \
> > > > -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} =
\
> > > > -"
> > > > -PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGING_INCDIR} =
--x-libraries=3D${STAGING_LIBDIR},--without-x,virtual/libx11"
> > > > -
> > > > -# libmpi.so needs symbols like __multf3 and somehow it does not re=
spect --rtlib option passed by clang
> > > > -LDFLAGS:append:x86-64 =3D " -lgcc"
> > > > -LDFLAGS:append:x86 =3D " -lgcc"
> > > > -
> > > > -inherit autotools gettext pkgconfig
> > > > -
> > > > -do_configure() {
> > > > -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
> > > > -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mp=
l/confdb \
> > > > -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/=
config \
> > > > -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confd=
b;  do
> > > > -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/confi=
g.guess ${S}/$d
> > > > -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/confi=
g.sub ${S}/$d
> > > > -    done
> > > > -#    cd ${S}
> > > > -#    autoupdate
> > > > -#    autoreconf --verbose --install --force
> > > > -#    cd ${B}
> > > > -    oe_runconf
> > > > -}
> > > > -
> > > > -do_install:append() {
> > > > -    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> > > > -    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpi=
ch.pc
> > > > -}
> > > > diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-o=
e/recipes-devtools/mpich/mpich_4.1.1.bb
> > > > new file mode 100644
> > > > index 000000000..cb9c0f1dd
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> > > > @@ -0,0 +1,64 @@
> > > > +SUMMARY =3D "Message Passing Interface (MPI) implementation"
> > > > +HOMEPAGE =3D "http://www.mpich.org/"
> > > > +SECTION =3D "devel"
> > > > +
> > > > +LICENSE =3D "BSD-2-Clause"
> > > > +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df1804c45b8b4e816e53eb=
1f175d810f3"
> > > > +
> > > > +SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${P=
V}.tar.gz"
> > > > +SRC_URI[sha256sum] =3D "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32=
fd4f138443072ff4284ca2"
> > > > +
> > > > +TOOLCHAIN =3D "gcc"
> > > > +
> > > > +RDEPENDS:${PN} +=3D "bash perl libxml2"
> > > > +
> > > > +EXTRA_OECONF =3D "--enable-debuginfo \
> > > > +    --enable-fast \
> > > > +    --enable-shared  \
> > > > +    --with-pm=3Dgforker  \
> > > > +    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> > > > +    PERL=3D'${USRBINPATH}/env perl' \
> > > > +    --with-device=3Dch3:nemesis \
> > > > +"
> > > > +
> > > > +PACKAGECONFIG ??=3D ""
> > > > +
> > > > +PACKAGECONFIG[cxx] =3D "--enable-cxx,--disable-cxx"
> > > > +PACKAGECONFIG[fortran] =3D "--with-cross=3D${WORKDIR}/cross_values=
.txt --enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfort=
ran"
> > > > +
> > > > +# libmpi.so needs symbols like __multf3 and somehow it does not re=
spect --rtlib option passed by clang
> > > > +LDFLAGS:append:x86-64 =3D " -lgcc"
> > > > +LDFLAGS:append:x86 =3D " -lgcc"
> > > > +
> > > > +inherit autotools gettext pkgconfig qemu
> > > > +
> > > > +DEPENDS +=3D "qemu-native"
> > > > +
> > > > +do_configure() {
> > > > +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', ''=
, d)}" =3D "1" ]; then
> > > > +        qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGIN=
G_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING=
_DIR_HOST}${base_libdir}')])}"
> > > > +        cat > ${WORKDIR}/qemuwrapper << EOF
> > > > +#!/bin/sh
> > > > +$qemu_binary "\$@"
> > > > +EOF
> > > > +        chmod +x ${WORKDIR}/qemuwrapper
> > > > +
> > > > +        sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${W=
ORKDIR}/t`;:' ${S}/maint/gen_cross.pl
> > > > +
> > > > +        cd ${WORKDIR}
> > > > +        perl ${S}/maint/gen_cross.pl
> > > > +    fi
> > > > +
> > > > +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=3D.*\) }"$:\1 }, ":' $=
{WORKDIR}/cross_values.txt
> > >
> > > This must be in the if [] above. Just sent v4 with this fix.
> > >
> > > > +
> > > > +    cd ${S}
> > > > +    ./autogen.sh
> > > > +
> > > > +    cd ${B}
> > > > +    oe_runconf
> > > > +}
> > > > +
> > > > +do_install:append() {
> > > > +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> > > > +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpi=
ch.pc
> > > > +}
> > >

