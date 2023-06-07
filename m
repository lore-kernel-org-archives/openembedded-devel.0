Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26F4C7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 06:48:15 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.2607.1686120488560227371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 23:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=e3gUmPD2;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5585f2f070bso5148069eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686120488; x=1688712488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17Ej7yWXfjKZCEk7g9bcnlxHt+00ss+hDkT2bvq2urk=;
        b=e3gUmPD2BpfKZKRY0NYb+6kf4U2sIS8usEEXuEW7GPy4/UzUWoBcb+nkMs/E8PO1gF
         X+4xtVoOUXL6skq38oaNC0QQ48pIYelIhttqbtmmKLT8u8OlY5kvUN3pL36v4TBlVBkD
         wT2nfvDsyGW5HK4q2RmgID690jkWHZvNwKTsWnr+iGF1EJz+jkcVP3bKFAiBr+IPPGys
         ZdtXZTUmAOyGQ+HUdw5kGHj2qqNvbmzwfDEbq1fS3zC2n3rhvI2fPfHezUNNAQj2esRn
         aNzOk5/ud88mb4lBYbHiNSP/20EQ+EBWp4fWQmc+gz9jGQHuloU/cp7N01T6S6MAITTm
         FfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686120488; x=1688712488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17Ej7yWXfjKZCEk7g9bcnlxHt+00ss+hDkT2bvq2urk=;
        b=YkanSIeWjwpQSAS8x9NMN55JuCQst0YbGGWHaLqPLE7RbuMQ8AKsi9/Cl2BNvQ/pBg
         q2/helAJzSnshJCqOfce02HjLoe1MFlqC2mD4fYFCLdYkpf3uYiWjbMPaI+NEDMVRQWL
         PI3zbY0wAe8tnyDki1pVtswFv1/txaT7HQp+okerc8xZHcC+tzmDZL+xXzfSg1xVamyD
         8m2jno2BAxgVw4tWBNhi+XSjw6lvELr1DpCPK2tjZuJkVddU/9bQ9P5pbHZ3TpChsJiB
         JOrzpbXWEPNNZwK6E+hDjrYW7Q4gGV29XC8zOHAy4c6CbHVSiWPKG7KwNKm5jHdqJlQn
         1xUA==
X-Gm-Message-State: AC+VfDx4L4GxE6V886WSCI400eLa4tvlLtCtuN2RZtWhv+/Qc1/iEbdK
	c5hWO8ryrUnBqIPPg6wQiXbaptmQHoFuCjyejA3QZX1u
X-Google-Smtp-Source: ACHHUZ6KnmdeAO6p6QlMG92XCIwhcz+sGFkvOPfMypg+gMcNJYzAwW9/bSYIrzhO6u3Cmc69R4oAqjExpMOuAcE6icg=
X-Received: by 2002:a4a:ca85:0:b0:555:7ed9:6f9d with SMTP id
 x5-20020a4aca85000000b005557ed96f9dmr3404113ooq.9.1686120487387; Tue, 06 Jun
 2023 23:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230607064017.4062296-1-zboszor@gmail.com>
In-Reply-To: <20230607064017.4062296-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2023 23:47:56 -0700
Message-ID: <CAMKF1sp4dZ5Qr5pjNmVzs2jxSuPOc=Vh1yh+Ho1pkPbNoEHZ0Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] mpich: Upgrade to 4.1.1
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b3064105fd848428"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 06:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103161

--000000000000b3064105fd848428
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 11:40 PM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbo=
szor@gmail.com>
wrote:

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
> Set TOOLCHAIN =3D "gcc" so gfortran may be used.


we do not enable Fortran even with gcc by default, is it a requirement now
for this recipe ?


>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 -----------------
>  meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 58 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>  create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
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
.gz
> "
> -SRC_URI[sha256sum] =3D
> "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501"
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
> -PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGING_INCDIR}
> --x-libraries=3D${STAGING_LIBDIR},--without-x,virtual/libx11"
> -
> -# libmpi.so needs symbols like __multf3 and somehow it does not respect
> --rtlib option passed by clang
> -LDFLAGS:append:x86-64 =3D " -lgcc"
> -LDFLAGS:append:x86 =3D " -lgcc"
> -
> -inherit autotools gettext pkgconfig
> -
> -do_configure() {
> -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
> -        src/pm/hydra/tools/topo/hwloc/hwloc/config
> src/pm/hydra/mpl/confdb \
> -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config=
 \
> -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gues=
s
> ${S}/$d
> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub
> ${S}/$d
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
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> new file mode 100644
> index 000000000..e65f9074e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> @@ -0,0 +1,63 @@
> +SUMMARY =3D "Message Passing Interface (MPI) implementation"
> +HOMEPAGE =3D "http://www.mpich.org/"
> +SECTION =3D "devel"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df1804c45b8b4e816e53eb1f175d=
810f3"
> +
> +SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar=
.gz
> "
> +SRC_URI[sha256sum] =3D
> "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f138443072ff4284ca2"
> +
> +TOOLCHAIN =3D "gcc"
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
> +PACKAGECONFIG[fortran] =3D "--enable-fortran,--disable-f77 --disable-fc
> --disable-fortran,libgfortran"
> +
> +# libmpi.so needs symbols like __multf3 and somehow it does not respect
> --rtlib option passed by clang
> +LDFLAGS:append:x86-64 =3D " -lgcc"
> +LDFLAGS:append:x86 =3D " -lgcc"
> +
> +inherit autotools gettext pkgconfig qemu
> +
> +DEPENDS +=3D "qemu-native"
> +
> +do_configure() {
> +    qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST=
'),
> [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${=
base_libdir}')])}"
> +    cat > ${WORKDIR}/qemuwrapper << EOF
> +#!/bin/sh
> +$qemu_binary "\$@"
> +EOF
> +    chmod +x ${WORKDIR}/qemuwrapper
> +
> +    sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper
> ${WORKDIR}/t`;:' ${S}/maint/gen_cross.pl
> +
> +    cd ${WORKDIR}
> +    perl ${S}/maint/gen_cross.pl
> +
> +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=3D.*\) }"$:\1 }, ":'
> ${WORKDIR}/cross_values.txt
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
>

--000000000000b3064105fd848428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 6, 2023 at 11:40 PM Zolt=C3=A1n B=C3=B6sz=C3=B6=
rm=C3=A9nyi &lt;<a href=3D"mailto:zboszor@gmail.com">zboszor@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">mpich 4.1+ has its own official way to=
 allow cross-compiling,<br>
use it.<br>
<br>
Remove the old PACKAGECONFIG[x11], the configuration option<br>
does not exist anymore.<br>
<br>
Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN<br>
parts. Both are needed by intel-oneapi-mkl in meta-intel. Don&#39;t<br>
enable either by default to keep the current minimalistic build.<br>
<br>
Remove configuration options that don&#39;t exist in the new version.<br>
<br>
Set TOOLCHAIN =3D &quot;gcc&quot; so gfortran may be used.</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">we do not enable Fortran even wit=
h gcc by default, is it a requirement now for this recipe ?=C2=A0</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_4.0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">mpich_4.0.3.bb</a> | 58 -----------------=
<br>
=C2=A0meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_4.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mpich_4.1.1.bb</a> | 63 +++++++++++++++++=
++<br>
=C2=A02 files changed, 63 insertions(+), 58 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/mpich/<a href=3D"http://m=
pich_4.0.3.bb" rel=3D"noreferrer" target=3D"_blank">mpich_4.0.3.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/mpich/<a href=3D"http://m=
pich_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">mpich_4.1.1.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_4.0.3.b=
b" rel=3D"noreferrer" target=3D"_blank">mpich_4.0.3.bb</a> b/meta-oe/recipe=
s-devtools/mpich/<a href=3D"http://mpich_4.0.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">mpich_4.0.3.bb</a><br>
deleted file mode 100644<br>
index 000f73981..000000000<br>
--- a/meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_4.0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">mpich_4.0.3.bb</a><br>
+++ /dev/null<br>
@@ -1,58 +0,0 @@<br>
-SUMMARY =3D &quot;Message Passing Interface (MPI) implementation&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.mpich.org/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.mpich.org/</a>&quot;<br>
-SECTION =3D &quot;devel&quot;<br>
-<br>
-LICENSE =3D &quot;BSD-2-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2a4e=
01c8c163&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://www.mpich.org/static/downloads/$%7BPV%=
7D/mpich-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.=
mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac=
4e8c5ebe4a3e3b6c501&quot;<br>
-<br>
-RDEPENDS:${PN} +=3D &quot;bash perl libxml2&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot;--enable-debuginfo \<br>
-=C2=A0 =C2=A0 --enable-fast \<br>
-=C2=A0 =C2=A0 --enable-shared=C2=A0 \<br>
-=C2=A0 =C2=A0 --with-pm=3Dgforker=C2=A0 \<br>
-=C2=A0 =C2=A0 --disable-rpath \<br>
-=C2=A0 =C2=A0 --disable-f77 \<br>
-=C2=A0 =C2=A0 --disable-fc \<br>
-=C2=A0 =C2=A0 --disable-fortran \<br>
-=C2=A0 =C2=A0 --disable-cxx \<br>
-=C2=A0 =C2=A0 BASH_SHELL=3D&#39;${USRBINPATH}/env bash&#39; \<br>
-=C2=A0 =C2=A0 PERL=3D&#39;${USRBINPATH}/env perl&#39; \<br>
-=C2=A0 =C2=A0 --with-device=3Dch3:nemesis \<br>
-=C2=A0 =C2=A0 --with-rdmacm=3Dno \<br>
-=C2=A0 =C2=A0 --disable-numa \<br>
-&quot;<br>
-<br>
-PACKAGECONFIG +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39=
;, &#39;x11&#39;, &#39;&#39;, d)} \<br>
-&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;--with-x --x-includes=3D${STAGING_INCDIR} --x=
-libraries=3D${STAGING_LIBDIR},--without-x,virtual/libx11&quot;<br>
-<br>
-# libmpi.so needs symbols like __multf3 and somehow it does not respect --=
rtlib option passed by clang<br>
-LDFLAGS:append:x86-64 =3D &quot; -lgcc&quot;<br>
-LDFLAGS:append:x86 =3D &quot; -lgcc&quot;<br>
-<br>
-inherit autotools gettext pkgconfig<br>
-<br>
-do_configure() {<br>
-=C2=A0 =C2=A0 for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 src/pm/hydra/tools/topo/hwloc/hwloc/config src=
/pm/hydra/mpl/confdb \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 modules/yaksa/m4 modules/json-c modules/ucx mo=
dules/hwloc/config \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 test/mpi/dtpools/confdb src/mpl/confdb src/mpi=
/romio/confdb;=C2=A0 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-=
config/config.guess ${S}/$d<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-=
config/config.sub ${S}/$d<br>
-=C2=A0 =C2=A0 done<br>
-#=C2=A0 =C2=A0 cd ${S}<br>
-#=C2=A0 =C2=A0 autoupdate<br>
-#=C2=A0 =C2=A0 autoreconf --verbose --install --force<br>
-#=C2=A0 =C2=A0 cd ${B}<br>
-=C2=A0 =C2=A0 oe_runconf<br>
-}<br>
-<br>
-do_install:append() {<br>
-=C2=A0 =C2=A0 sed -i &#39;s,${S}/,,g&#39; ${D}/${libdir}/<a href=3D"http:/=
/libmpi.la" rel=3D"noreferrer" target=3D"_blank">libmpi.la</a><br>
-=C2=A0 =C2=A0 sed -i &#39;s,${DEBUG_PREFIX_MAP},,g&#39; ${D}/${libdir}/pkg=
config/mpich.pc<br>
-}<br>
diff --git a/meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_4.1.1.b=
b" rel=3D"noreferrer" target=3D"_blank">mpich_4.1.1.bb</a> b/meta-oe/recipe=
s-devtools/mpich/<a href=3D"http://mpich_4.1.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">mpich_4.1.1.bb</a><br>
new file mode 100644<br>
index 000000000..e65f9074e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_4.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mpich_4.1.1.bb</a><br>
@@ -0,0 +1,63 @@<br>
+SUMMARY =3D &quot;Message Passing Interface (MPI) implementation&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.mpich.org/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.mpich.org/</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Df1804c45b8b4e816e53eb1f1=
75d810f3&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://www.mpich.org/static/downloads/$%7BPV%=
7D/mpich-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.=
mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4=
f138443072ff4284ca2&quot;<br>
+<br>
+TOOLCHAIN =3D &quot;gcc&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;bash perl libxml2&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot;--enable-debuginfo \<br>
+=C2=A0 =C2=A0 --enable-fast \<br>
+=C2=A0 =C2=A0 --enable-shared=C2=A0 \<br>
+=C2=A0 =C2=A0 --with-pm=3Dgforker=C2=A0 \<br>
+=C2=A0 =C2=A0 BASH_SHELL=3D&#39;${USRBINPATH}/env bash&#39; \<br>
+=C2=A0 =C2=A0 PERL=3D&#39;${USRBINPATH}/env perl&#39; \<br>
+=C2=A0 =C2=A0 --with-device=3Dch3:nemesis \<br>
+=C2=A0 =C2=A0 --with-cross=3D${WORKDIR}/cross_values.txt \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[cxx] =3D &quot;--enable-cxx,--disable-cxx&quot;<br>
+PACKAGECONFIG[fortran] =3D &quot;--enable-fortran,--disable-f77 --disable-=
fc --disable-fortran,libgfortran&quot;<br>
+<br>
+# libmpi.so needs symbols like __multf3 and somehow it does not respect --=
rtlib option passed by clang<br>
+LDFLAGS:append:x86-64 =3D &quot; -lgcc&quot;<br>
+LDFLAGS:append:x86 =3D &quot; -lgcc&quot;<br>
+<br>
+inherit autotools gettext pkgconfig qemu<br>
+<br>
+DEPENDS +=3D &quot;qemu-native&quot;<br>
+<br>
+do_configure() {<br>
+=C2=A0 =C2=A0 qemu_binary=3D&quot;${@qemu_wrapper_cmdline(d, d.getVar(&#39=
;STAGING_DIR_HOST&#39;), [d.expand(&#39;${STAGING_DIR_HOST}${libdir}&#39;),=
d.expand(&#39;${STAGING_DIR_HOST}${base_libdir}&#39;)])}&quot;<br>
+=C2=A0 =C2=A0 cat &gt; ${WORKDIR}/qemuwrapper &lt;&lt; EOF<br>
+#!/bin/sh<br>
+$qemu_binary &quot;\$@&quot;<br>
+EOF<br>
+=C2=A0 =C2=A0 chmod +x ${WORKDIR}/qemuwrapper<br>
+<br>
+=C2=A0 =C2=A0 sed -i &#39;s:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper $=
{WORKDIR}/t`;:&#39; ${S}/maint/<a href=3D"http://gen_cross.pl" rel=3D"noref=
errer" target=3D"_blank">gen_cross.pl</a><br>
+<br>
+=C2=A0 =C2=A0 cd ${WORKDIR}<br>
+=C2=A0 =C2=A0 perl ${S}/maint/<a href=3D"http://gen_cross.pl" rel=3D"noref=
errer" target=3D"_blank">gen_cross.pl</a><br>
+<br>
+=C2=A0 =C2=A0 sed -i &#39;s:\(CROSS_F90_INTEGER_MODEL_MAP=3D.*\) }&quot;$:=
\1 }, &quot;:&#39; ${WORKDIR}/cross_values.txt<br>
+<br>
+=C2=A0 =C2=A0 cd ${S}<br>
+=C2=A0 =C2=A0 ./autogen.sh<br>
+<br>
+=C2=A0 =C2=A0 cd ${B}<br>
+=C2=A0 =C2=A0 oe_runconf<br>
+}<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 sed -i &#39;s,${S}/,,g&#39; ${D}/${libdir}/<a href=3D"http:/=
/libmpi.la" rel=3D"noreferrer" target=3D"_blank">libmpi.la</a><br>
+=C2=A0 =C2=A0 sed -i &#39;s,${DEBUG_PREFIX_MAP},,g&#39; ${D}/${libdir}/pkg=
config/mpich.pc<br>
+}<br>
-- <br>
2.40.1<br>
<br>
</blockquote></div></div>

--000000000000b3064105fd848428--

