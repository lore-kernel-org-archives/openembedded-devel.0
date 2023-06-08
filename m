Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B2EC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 17:23:55 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.116.1686245029232833157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 10:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MRIV2AbG;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-55b3fe7a788so470662eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686245028; x=1688837028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeYgfS+2h38L3ybjn8517Mb+IDWg+IoCXyB+OyIwl58=;
        b=MRIV2AbGP/new7qYVqzm628juJwQtdWfbwxs1et/kV675AtQRZeCV3xtmgjYLd1fXf
         Kh0RNINgG1ODNmBVMNJuhI2iAOzQ+2wsRnSH+fRPue6mDQVpGDkyIEAVmir6tfkjTVXn
         n3O59KOdBR86Dg77vSukdzVn4JF5KPwbXbbIYgBMrGO1e69SmOOsCWJCX9KOnL49W24F
         8PQ9ns8btV4+H4ZwWmU8odpTkpyUDNrjOGRmEHmrJIBbLsJOZv0pYgJfW1kH+RJrJb/A
         3nUKEolgzFWLoB4avo1vt2o7AmnkjcntfTDpDbRmB1hLbshpBLMLyyu/81LNTz0cBXEg
         WRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686245028; x=1688837028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeYgfS+2h38L3ybjn8517Mb+IDWg+IoCXyB+OyIwl58=;
        b=GmK9+xKo3YryWIO1ylGbpiwOoiI2R3KLF7tgqXqyJPovjSxkVqxAmKf0o9RrL3fmmC
         tWnURd3CRRHaBNI69GxMw/PZOuunbqxOMVQnUySePHgpj+VNPGhikuj2CGCQOOXvaegm
         DsdxKYAtLK8X14u30dCMbQMLIpoXiIeZ4AF2VuKkY5j4GmZ5vn+tZ+xk1i5yHvEWGqEL
         tsb+uxhx+xj3YOrXoGfdsqJ0NOGiA5rZVx6q/ss2XVg/hsK4j6na4Cs/la08LgKCHoxj
         nhlHAMiFcnltGbuSH+ej3OMH1+2B2KRHXvtS0C//GvG8YMx0dFLQ+Lr66oPpr8oae8qr
         cttg==
X-Gm-Message-State: AC+VfDwi/xIzT+tGsRoSGzFloTTeoND/Tl28+EdiPNg3W37yzlMP58jT
	KlutKjD9qy8o0+nmjzMtIw1rQHTdKAcgqLOvPO0=
X-Google-Smtp-Source: ACHHUZ6Yce+Y+G7oFfS4VTaA4Jz4TVneo1LMlFyHpykfs/mWkAnC1LFq+gI6XfEPGVERTLjMK4azVYK9e47AOhZX7RA=
X-Received: by 2002:a4a:d034:0:b0:558:ae64:6533 with SMTP id
 w20-20020a4ad034000000b00558ae646533mr308591oor.8.1686245028331; Thu, 08 Jun
 2023 10:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230607072321.589315-1-zboszor@gmail.com> <8b2cdabf-7e71-bb12-ce14-eefea762c403@gmail.com>
 <CAMKF1sptTB=_78n84iYnjKigk3_nhgia0gBJapXcsB4iMqhRZw@mail.gmail.com>
In-Reply-To: <CAMKF1sptTB=_78n84iYnjKigk3_nhgia0gBJapXcsB4iMqhRZw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jun 2023 10:23:22 -0700
Message-ID: <CAMKF1speJ6nXfDbn3ZRgYN8=HaXRZwh+SZpJa9=4t62z5AEM1A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] mpich: Upgrade to 4.1.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 17:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103191

On Thu, Jun 8, 2023 at 9:41=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> still seeing issues
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2802
>

I dropped the unknown option and it went further which is good,
however I am seeing

WARNING: mpich-4.1.1-r0 do_package_qa: QA Issue: File
/usr/lib/libmpi.so.12.3.0 in package mpich contains reference to
TMPDIR
File /usr/bin/mpicc in package mpich contains reference to TMPDIR
File /usr/bin/mpicxx in package mpich contains reference to TMPDIR [buildpa=
ths]

So it will be good to look into this problem as well, why do we see
these QA warnings.

> On Wed, Jun 7, 2023 at 12:28=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=
=C3=A1n <zboszor@gmail.com> wrote:
> >
> > 2023. 06. 07. 9:23 keltez=C3=A9ssel, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi =C3=ADrta:
> > > mpich 4.1+ has its own official way to allow cross-compiling,
> > > use it.
> > >
> > > Remove the old PACKAGECONFIG[x11], the configuration option
> > > does not exist anymore.
> > >
> > > Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
> > > parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
> > > enable either by default to keep the current minimalistic build.
> > >
> > > Remove configuration options that don't exist in the new version.
> > >
> > > Set TOOLCHAIN =3D "gcc".
> > >
> > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> > > ---
> > >   meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 ----------------=
-
> > >   meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 64 ++++++++++++++++=
+++
> > >   2 files changed, 64 insertions(+), 58 deletions(-)
> > >   delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> > >   create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> > >
> > > diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-oe/=
recipes-devtools/mpich/mpich_4.0.3.bb
> > > deleted file mode 100644
> > > index 000f73981..000000000
> > > --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> > > +++ /dev/null
> > > @@ -1,58 +0,0 @@
> > > -SUMMARY =3D "Message Passing Interface (MPI) implementation"
> > > -HOMEPAGE =3D "http://www.mpich.org/"
> > > -SECTION =3D "devel"
> > > -
> > > -LICENSE =3D "BSD-2-Clause"
> > > -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2a4=
e01c8c163"
> > > -
> > > -SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}=
.tar.gz"
> > > -SRC_URI[sha256sum] =3D "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77a=
c4e8c5ebe4a3e3b6c501"
> > > -
> > > -RDEPENDS:${PN} +=3D "bash perl libxml2"
> > > -
> > > -EXTRA_OECONF =3D "--enable-debuginfo \
> > > -    --enable-fast \
> > > -    --enable-shared  \
> > > -    --with-pm=3Dgforker  \
> > > -    --disable-rpath \
> > > -    --disable-f77 \
> > > -    --disable-fc \
> > > -    --disable-fortran \
> > > -    --disable-cxx \
> > > -    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> > > -    PERL=3D'${USRBINPATH}/env perl' \
> > > -    --with-device=3Dch3:nemesis \
> > > -    --with-rdmacm=3Dno \
> > > -    --disable-numa \
> > > -"
> > > -
> > > -PACKAGECONFIG +=3D " \
> > > -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> > > -"
> > > -PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGING_INCDIR} --=
x-libraries=3D${STAGING_LIBDIR},--without-x,virtual/libx11"
> > > -
> > > -# libmpi.so needs symbols like __multf3 and somehow it does not resp=
ect --rtlib option passed by clang
> > > -LDFLAGS:append:x86-64 =3D " -lgcc"
> > > -LDFLAGS:append:x86 =3D " -lgcc"
> > > -
> > > -inherit autotools gettext pkgconfig
> > > -
> > > -do_configure() {
> > > -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
> > > -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/=
confdb \
> > > -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/co=
nfig \
> > > -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;=
  do
> > > -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.=
guess ${S}/$d
> > > -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.=
sub ${S}/$d
> > > -    done
> > > -#    cd ${S}
> > > -#    autoupdate
> > > -#    autoreconf --verbose --install --force
> > > -#    cd ${B}
> > > -    oe_runconf
> > > -}
> > > -
> > > -do_install:append() {
> > > -    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> > > -    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich=
.pc
> > > -}
> > > diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/=
recipes-devtools/mpich/mpich_4.1.1.bb
> > > new file mode 100644
> > > index 000000000..cb9c0f1dd
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> > > @@ -0,0 +1,64 @@
> > > +SUMMARY =3D "Message Passing Interface (MPI) implementation"
> > > +HOMEPAGE =3D "http://www.mpich.org/"
> > > +SECTION =3D "devel"
> > > +
> > > +LICENSE =3D "BSD-2-Clause"
> > > +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df1804c45b8b4e816e53eb1f=
175d810f3"
> > > +
> > > +SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}=
.tar.gz"
> > > +SRC_URI[sha256sum] =3D "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd=
4f138443072ff4284ca2"
> > > +
> > > +TOOLCHAIN =3D "gcc"
> > > +
> > > +RDEPENDS:${PN} +=3D "bash perl libxml2"
> > > +
> > > +EXTRA_OECONF =3D "--enable-debuginfo \
> > > +    --enable-fast \
> > > +    --enable-shared  \
> > > +    --with-pm=3Dgforker  \
> > > +    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> > > +    PERL=3D'${USRBINPATH}/env perl' \
> > > +    --with-device=3Dch3:nemesis \
> > > +"
> > > +
> > > +PACKAGECONFIG ??=3D ""
> > > +
> > > +PACKAGECONFIG[cxx] =3D "--enable-cxx,--disable-cxx"
> > > +PACKAGECONFIG[fortran] =3D "--with-cross=3D${WORKDIR}/cross_values.t=
xt --enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfortra=
n"
> > > +
> > > +# libmpi.so needs symbols like __multf3 and somehow it does not resp=
ect --rtlib option passed by clang
> > > +LDFLAGS:append:x86-64 =3D " -lgcc"
> > > +LDFLAGS:append:x86 =3D " -lgcc"
> > > +
> > > +inherit autotools gettext pkgconfig qemu
> > > +
> > > +DEPENDS +=3D "qemu-native"
> > > +
> > > +do_configure() {
> > > +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', =
d)}" =3D "1" ]; then
> > > +        qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_=
DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_D=
IR_HOST}${base_libdir}')])}"
> > > +        cat > ${WORKDIR}/qemuwrapper << EOF
> > > +#!/bin/sh
> > > +$qemu_binary "\$@"
> > > +EOF
> > > +        chmod +x ${WORKDIR}/qemuwrapper
> > > +
> > > +        sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WOR=
KDIR}/t`;:' ${S}/maint/gen_cross.pl
> > > +
> > > +        cd ${WORKDIR}
> > > +        perl ${S}/maint/gen_cross.pl
> > > +    fi
> > > +
> > > +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=3D.*\) }"$:\1 }, ":' ${W=
ORKDIR}/cross_values.txt
> >
> > This must be in the if [] above. Just sent v4 with this fix.
> >
> > > +
> > > +    cd ${S}
> > > +    ./autogen.sh
> > > +
> > > +    cd ${B}
> > > +    oe_runconf
> > > +}
> > > +
> > > +do_install:append() {
> > > +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> > > +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich=
.pc
> > > +}
> >

