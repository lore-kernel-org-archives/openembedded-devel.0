Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E71C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 16:42:00 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.14513.1686242512679690828
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 09:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DC9DHXHc;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-19eab8bca4dso756945fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242512; x=1688834512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw+t2vTiH5yCtbMzEfmQpYMz25OWHHN9bbY7SMXZuUc=;
        b=DC9DHXHcrQUbnj7xFnuaQ8198QS7RM57PwmyVPRhiktKH7y8ri+8laASLM/Gq/LN9O
         OuxFFosNoLEssE9QtyhX3VlKPVW4bPTszYRLoVuVDGF8etYs+22bDcYm5lhVkY6RxFh0
         TYQbRhPB9nw4JUoWxOTG6pTOCD0gJnF4gmk35ITv0bRxgur1XjU7qZ9KKrjVRsJTS32q
         aQduThryIXgFBKeqxbe0RQRjShNI/hXSqNmZK4VkbGY6vgv0Dw3Z6GmCdM0N6SxRjpB/
         skZlfxZpxD3+SfEdp83kt29CDbCJ7U/UCtEkTg0TcnXiV1gPvs6PxrM6ThjaHlRkFT3h
         jJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242512; x=1688834512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iw+t2vTiH5yCtbMzEfmQpYMz25OWHHN9bbY7SMXZuUc=;
        b=bzVEoM9mEfQzX4Mrai8VDBVjbO+ICvjTYP/cCu3soGK1E3TY2IlCn02pJq1UPwldzq
         DC05ib20bipVUMZG/UvPyomBvGuwXg4xa4Xm8Ip28RyvLUXGXcB+UkOvg2b2OH2fp2bU
         GSEgMGfrMgUzxb36uVZvLJ5MgElaZopJmgj5OZGue5gycIduiOhtoqYtePuxh58OdBES
         b4iF8bOD6EJ29KxSllD5xftrtwTzaqAxlPyvRBUWtSozAZg5Te+V0Zqu15ez4nqJJ1MN
         gOgx6q3+BubElr8WoptEBG+1gk/ArJ7QzDQAzJQtWFheyu6VJ4A2ONg2NK0rJ6fMwkBe
         A0FQ==
X-Gm-Message-State: AC+VfDxJtOhPDigi5iNPISdcLsYaOAyfWW+8ekhy2Q/KJoyH11PaIjzs
	3Rn/QkTXSEZ919GmBIp3WrEuAECQEh0wRKDOEDN5xVNRfF0=
X-Google-Smtp-Source: ACHHUZ5GUvXkfB51z+iKV0GCln8z3auMhL9pGEYKQHFDV6cPeSOcWTWulxaugJikmcevVZRFB/Yb/zdQa1AVCO4eCy0=
X-Received: by 2002:a05:6870:8644:b0:1a2:c291:c120 with SMTP id
 i4-20020a056870864400b001a2c291c120mr8161688oal.32.1686242511725; Thu, 08 Jun
 2023 09:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230607072321.589315-1-zboszor@gmail.com> <8b2cdabf-7e71-bb12-ce14-eefea762c403@gmail.com>
In-Reply-To: <8b2cdabf-7e71-bb12-ce14-eefea762c403@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jun 2023 09:41:25 -0700
Message-ID: <CAMKF1sptTB=_78n84iYnjKigk3_nhgia0gBJapXcsB4iMqhRZw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] mpich: Upgrade to 4.1.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 16:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103190

still seeing issues

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2802

On Wed, Jun 7, 2023 at 12:28=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2023. 06. 07. 9:23 keltez=C3=A9ssel, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9n=
yi =C3=ADrta:
> > mpich 4.1+ has its own official way to allow cross-compiling,
> > use it.
> >
> > Remove the old PACKAGECONFIG[x11], the configuration option
> > does not exist anymore.
> >
> > Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
> > parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
> > enable either by default to keep the current minimalistic build.
> >
> > Remove configuration options that don't exist in the new version.
> >
> > Set TOOLCHAIN =3D "gcc".
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > ---
> >   meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 -----------------
> >   meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 64 ++++++++++++++++++=
+
> >   2 files changed, 64 insertions(+), 58 deletions(-)
> >   delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> >   create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> >
> > diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-oe/re=
cipes-devtools/mpich/mpich_4.0.3.bb
> > deleted file mode 100644
> > index 000f73981..000000000
> > --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> > +++ /dev/null
> > @@ -1,58 +0,0 @@
> > -SUMMARY =3D "Message Passing Interface (MPI) implementation"
> > -HOMEPAGE =3D "http://www.mpich.org/"
> > -SECTION =3D "devel"
> > -
> > -LICENSE =3D "BSD-2-Clause"
> > -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2a4e0=
1c8c163"
> > -
> > -SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.t=
ar.gz"
> > -SRC_URI[sha256sum] =3D "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4=
e8c5ebe4a3e3b6c501"
> > -
> > -RDEPENDS:${PN} +=3D "bash perl libxml2"
> > -
> > -EXTRA_OECONF =3D "--enable-debuginfo \
> > -    --enable-fast \
> > -    --enable-shared  \
> > -    --with-pm=3Dgforker  \
> > -    --disable-rpath \
> > -    --disable-f77 \
> > -    --disable-fc \
> > -    --disable-fortran \
> > -    --disable-cxx \
> > -    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> > -    PERL=3D'${USRBINPATH}/env perl' \
> > -    --with-device=3Dch3:nemesis \
> > -    --with-rdmacm=3Dno \
> > -    --disable-numa \
> > -"
> > -
> > -PACKAGECONFIG +=3D " \
> > -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> > -"
> > -PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGING_INCDIR} --x-=
libraries=3D${STAGING_LIBDIR},--without-x,virtual/libx11"
> > -
> > -# libmpi.so needs symbols like __multf3 and somehow it does not respec=
t --rtlib option passed by clang
> > -LDFLAGS:append:x86-64 =3D " -lgcc"
> > -LDFLAGS:append:x86 =3D " -lgcc"
> > -
> > -inherit autotools gettext pkgconfig
> > -
> > -do_configure() {
> > -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
> > -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/co=
nfdb \
> > -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/conf=
ig \
> > -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  =
do
> > -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gu=
ess ${S}/$d
> > -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.su=
b ${S}/$d
> > -    done
> > -#    cd ${S}
> > -#    autoupdate
> > -#    autoreconf --verbose --install --force
> > -#    cd ${B}
> > -    oe_runconf
> > -}
> > -
> > -do_install:append() {
> > -    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> > -    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.p=
c
> > -}
> > diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/re=
cipes-devtools/mpich/mpich_4.1.1.bb
> > new file mode 100644
> > index 000000000..cb9c0f1dd
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> > @@ -0,0 +1,64 @@
> > +SUMMARY =3D "Message Passing Interface (MPI) implementation"
> > +HOMEPAGE =3D "http://www.mpich.org/"
> > +SECTION =3D "devel"
> > +
> > +LICENSE =3D "BSD-2-Clause"
> > +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df1804c45b8b4e816e53eb1f17=
5d810f3"
> > +
> > +SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.t=
ar.gz"
> > +SRC_URI[sha256sum] =3D "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f=
138443072ff4284ca2"
> > +
> > +TOOLCHAIN =3D "gcc"
> > +
> > +RDEPENDS:${PN} +=3D "bash perl libxml2"
> > +
> > +EXTRA_OECONF =3D "--enable-debuginfo \
> > +    --enable-fast \
> > +    --enable-shared  \
> > +    --with-pm=3Dgforker  \
> > +    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> > +    PERL=3D'${USRBINPATH}/env perl' \
> > +    --with-device=3Dch3:nemesis \
> > +"
> > +
> > +PACKAGECONFIG ??=3D ""
> > +
> > +PACKAGECONFIG[cxx] =3D "--enable-cxx,--disable-cxx"
> > +PACKAGECONFIG[fortran] =3D "--with-cross=3D${WORKDIR}/cross_values.txt=
 --enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfortran"
> > +
> > +# libmpi.so needs symbols like __multf3 and somehow it does not respec=
t --rtlib option passed by clang
> > +LDFLAGS:append:x86-64 =3D " -lgcc"
> > +LDFLAGS:append:x86 =3D " -lgcc"
> > +
> > +inherit autotools gettext pkgconfig qemu
> > +
> > +DEPENDS +=3D "qemu-native"
> > +
> > +do_configure() {
> > +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', d)=
}" =3D "1" ]; then
> > +        qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DI=
R_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR=
_HOST}${base_libdir}')])}"
> > +        cat > ${WORKDIR}/qemuwrapper << EOF
> > +#!/bin/sh
> > +$qemu_binary "\$@"
> > +EOF
> > +        chmod +x ${WORKDIR}/qemuwrapper
> > +
> > +        sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKD=
IR}/t`;:' ${S}/maint/gen_cross.pl
> > +
> > +        cd ${WORKDIR}
> > +        perl ${S}/maint/gen_cross.pl
> > +    fi
> > +
> > +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=3D.*\) }"$:\1 }, ":' ${WOR=
KDIR}/cross_values.txt
>
> This must be in the if [] above. Just sent v4 with this fix.
>
> > +
> > +    cd ${S}
> > +    ./autogen.sh
> > +
> > +    cd ${B}
> > +    oe_runconf
> > +}
> > +
> > +do_install:append() {
> > +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> > +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.p=
c
> > +}
>

