Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA51FC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 06:01:35 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.2223.1686117688194111557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 23:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WRKaf985;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-558cf19575dso2224022eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 23:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686117687; x=1688709687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0K9if0pmGPgRZm9FZwcxvZ/obW38KAhPWbzfA+KX08=;
        b=WRKaf985Y5ZGW6niGqxYUQRPPLAztuW1CV0iMwygRen9Oufzaz/brikBQPt/2F1aBB
         L0lmarkaN67oLQUhACJyw/Clyc8wCrIy9Zvu8dBx1RhwAJhGbfTl7gthku9URMifW/80
         T4Hhd7AwqEOnDtDq8imwViKcOFmHMixW5iM5Z890oMMOj/A2h712CyAGt8K+HdGaww+b
         7sS9StJrUJhDHVbuocJxqMU7KBL3VPscHFSHS0eGUbsP1Eq1IZLFcVO6cmhg/gpaAn2X
         K7+nYSRozsmyhoGTu7EFr1EBFGpy1d0oFIESTnATnTHeYlq+9ORhtfPF1YcNXFYqWYMx
         QRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686117687; x=1688709687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0K9if0pmGPgRZm9FZwcxvZ/obW38KAhPWbzfA+KX08=;
        b=EAOjPtnd3oAdWlIQJ0yo0upff3KLv4m19l5F+ihNlSE+/oZLq03HliSudNRlsSybYf
         r0J1nvVAqYD+I+5KAKYDEkXfw1IVo4nOYD7J8ohWlzB+KjSLIdq6TBmOaZxv0GSxkQ2L
         i3gevM4X59nkzMrY3aFTauLoP3KQyC0iFHDhYg9c3UgBv/AGCg1XRMiXvWFujy2HgrH1
         P1zG2cc3zj+Ne6T9kBLjiiH/U1qPeG8Z8yTlP+4OquIY2hYYEXSKD1PPvH3+7tS55YfJ
         hyG3QC2Dq2jRhQMmsngiBjvEMX/2+yIzR+/2QcG2/6Cova+l4D6EYLB0u9fzQpPfpzen
         90qA==
X-Gm-Message-State: AC+VfDwX0xZyDtOfY5YBpGVTdCTNddZb43ZaaAB1O5Owy+vUgnlk4Uko
	x7Kw8iCpi/ME5Y0tH1iOMf4p46dEzClQ9moJsWQ=
X-Google-Smtp-Source: ACHHUZ5lLOgcNzcMVPDIQu+cKL9Lboe92j9HSnaB7JIh+IQWQ2mBd1zVhDnsYVnkPiMMabZPqic9qaerjGwAJ9he43A=
X-Received: by 2002:a4a:a287:0:b0:558:b4b6:7f8c with SMTP id
 h7-20020a4aa287000000b00558b4b67f8cmr2875989ool.6.1686117687187; Tue, 06 Jun
 2023 23:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230606110147.1797218-1-zboszor@gmail.com>
In-Reply-To: <20230606110147.1797218-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2023 23:01:01 -0700
Message-ID: <CAMKF1soTvEmR5J-1GxH7KXCCK6E25snsLJ6KDNccRDuCb=P_AQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] mpich: Upgrade to 4.1.1
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 06:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103157

its failing to configure for qemumips/clang

https://errors.yoctoproject.org/Errors/Details/707724/

On Tue, Jun 6, 2023 at 4:01=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9n=
yi <zboszor@gmail.com> wrote:
>
> mpich 4.1+ has its own official way to allow cross-compiling,
> use it.
>
> Remove the old PACKAGECONFIG[x11], the configuration option
> does not exist anymore.
>
> Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
> parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
> enable either by default to keep the current minimalistic build.
>
> Remove configuration options that don't exist in the new version.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 ------------------
>  meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 58 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>  create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-oe/reci=
pes-devtools/mpich/mpich_4.0.3.bb
> deleted file mode 100644
> index 000f73981..000000000
> --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -SUMMARY =3D "Message Passing Interface (MPI) implementation"
> -HOMEPAGE =3D "http://www.mpich.org/"
> -SECTION =3D "devel"
> -
> -LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2a4e01c=
8c163"
> -
> -SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar=
.gz"
> -SRC_URI[sha256sum] =3D "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8=
c5ebe4a3e3b6c501"
> -
> -RDEPENDS:${PN} +=3D "bash perl libxml2"
> -
> -EXTRA_OECONF =3D "--enable-debuginfo \
> -    --enable-fast \
> -    --enable-shared  \
> -    --with-pm=3Dgforker  \
> -    --disable-rpath \
> -    --disable-f77 \
> -    --disable-fc \
> -    --disable-fortran \
> -    --disable-cxx \
> -    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> -    PERL=3D'${USRBINPATH}/env perl' \
> -    --with-device=3Dch3:nemesis \
> -    --with-rdmacm=3Dno \
> -    --disable-numa \
> -"
> -
> -PACKAGECONFIG +=3D " \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> -"
> -PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGING_INCDIR} --x-li=
braries=3D${STAGING_LIBDIR},--without-x,virtual/libx11"
> -
> -# libmpi.so needs symbols like __multf3 and somehow it does not respect =
--rtlib option passed by clang
> -LDFLAGS:append:x86-64 =3D " -lgcc"
> -LDFLAGS:append:x86 =3D " -lgcc"
> -
> -inherit autotools gettext pkgconfig
> -
> -do_configure() {
> -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
> -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/conf=
db \
> -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config=
 \
> -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gues=
s ${S}/$d
> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub =
${S}/$d
> -    done
> -#    cd ${S}
> -#    autoupdate
> -#    autoreconf --verbose --install --force
> -#    cd ${B}
> -    oe_runconf
> -}
> -
> -do_install:append() {
> -    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> -    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
> -}
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/reci=
pes-devtools/mpich/mpich_4.1.1.bb
> new file mode 100644
> index 000000000..990400f5c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> @@ -0,0 +1,61 @@
> +SUMMARY =3D "Message Passing Interface (MPI) implementation"
> +HOMEPAGE =3D "http://www.mpich.org/"
> +SECTION =3D "devel"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df1804c45b8b4e816e53eb1f175d=
810f3"
> +
> +SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar=
.gz"
> +SRC_URI[sha256sum] =3D "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f13=
8443072ff4284ca2"
> +
> +RDEPENDS:${PN} +=3D "bash perl libxml2"
> +
> +EXTRA_OECONF =3D "--enable-debuginfo \
> +    --enable-fast \
> +    --enable-shared  \
> +    --with-pm=3Dgforker  \
> +    BASH_SHELL=3D'${USRBINPATH}/env bash' \
> +    PERL=3D'${USRBINPATH}/env perl' \
> +    --with-device=3Dch3:nemesis \
> +    --with-cross=3D${WORKDIR}/cross_values.txt \
> +"
> +
> +PACKAGECONFIG ??=3D ""
> +
> +PACKAGECONFIG[cxx] =3D "--enable-cxx,--disable-cxx"
> +PACKAGECONFIG[fortran] =3D "--enable-fortran,--disable-f77 --disable-fc =
--disable-fortran,libgfortran"
> +
> +# libmpi.so needs symbols like __multf3 and somehow it does not respect =
--rtlib option passed by clang
> +LDFLAGS:append:x86-64 =3D " -lgcc"
> +LDFLAGS:append:x86 =3D " -lgcc"
> +
> +inherit autotools gettext pkgconfig qemu
> +
> +DEPENDS +=3D "qemu-native"
> +
> +do_configure() {
> +    qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST=
'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}=
${base_libdir}')])}"
> +    cat > ${WORKDIR}/qemuwrapper << EOF
> +#!/bin/sh
> +$qemu_binary "\$@"
> +EOF
> +    chmod +x ${WORKDIR}/qemuwrapper
> +
> +    sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKDIR}/t`=
;:' ${S}/maint/gen_cross.pl
> +
> +    cd ${WORKDIR}
> +    perl ${S}/maint/gen_cross.pl
> +
> +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=3D.*\) }"$:\1 }, ":' ${WORKD=
IR}/cross_values.txt
> +
> +    cd ${S}
> +    ./autogen.sh
> +
> +    cd ${B}
> +    oe_runconf
> +}
> +
> +do_install:append() {
> +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
> +}
> --
> 2.40.1
>

