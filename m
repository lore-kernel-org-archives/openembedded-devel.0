Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0412C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:15:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2843.1686122107129572214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MM7RPP4E;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso58411905e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 00:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686122105; x=1688714105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NlOFbNiDmZJ4s0E/Ok9blX7z3B7Hj5+qoHQwVuqFHn4=;
        b=MM7RPP4E9NpzMAo67aQ+P6BnkIpNy0yahdm2V/ufnjWTbJaHd5vFh/5WS9wyJsRY/j
         DT/J+oQT68oswalj/m2h6ktr9TPt/LePV72BvCL+QaOBOM8X4ZMN9wCeEcD3c6TVzjX1
         vtsUsuWKDLCiFqTDBMmNxodHj7ROE39HPVQBiVgkQ6jQfJhUL6p715G5srvEAE/27Cm3
         RldbuVuln5GOfNKYbogKiABK0YPZmjyfKeLe+kb8h7Lkb0ynJiM0swqEcOkiZiZpmOXi
         //PflL2+f4uAHvaG28NjK9dUmYfWYBiKF0w/iWamIbl5otXKMrf702XOjKYW+t7oKADp
         nRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122105; x=1688714105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlOFbNiDmZJ4s0E/Ok9blX7z3B7Hj5+qoHQwVuqFHn4=;
        b=jBirPRMZGn5f9EYIMMPHLlb2E+HGyo1Z8b7SXbh4SGlMzkjN4bGddHy/ssnSJJYNvI
         VOJACnDw8K0pWkPJoAqS074yEYfY/ylJ0jiVwUSWiuS0Vz1QGQa3oh8MddP/nDgToxlR
         FdHoyh7u0PEjj5mZNgrNZHM6gFIn0XLhm3ohQawl5msWjOwnYLFNWI96BuuBSKDlfDbV
         B9oRCvqioYmPI9yq2CrWYBNFo6QycAC08nIQmZE/RI7sqlUkQ8l4REt6qGmJsGoOV+Qi
         GakueWsZBcHzKxX/2ddlmfQuqIl/6GJ2gMEHuGuPQ1uiq6qiqtXXkQ6svY4FZNQN7Bju
         1P1w==
X-Gm-Message-State: AC+VfDzB8pU7eH4mgT/zhl0vGV7d0SMStE9t1N0QwclMTkmBNdPYTHfp
	g93bX34DpSkK2+lLMgf+pqg=
X-Google-Smtp-Source: ACHHUZ7NDN5N1OYpJmKMZ9bw9H7ZpbBG89EB6zpweVuQSvZweVWKrEgbzFyyaAu/sVg63Qo1B7RFnA==
X-Received: by 2002:a05:600c:3787:b0:3f6:784:9617 with SMTP id o7-20020a05600c378700b003f607849617mr3841278wmr.11.1686122105336;
        Wed, 07 Jun 2023 00:15:05 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d6601000000b0030e5b1fffc3sm766518wru.9.2023.06.07.00.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:15:05 -0700 (PDT)
Message-ID: <60f186a0-5102-a5ba-2153-d7df682e0373@gmail.com>
Date: Wed, 7 Jun 2023 09:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-oe][PATCH v2] mpich: Upgrade to 4.1.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230607064017.4062296-1-zboszor@gmail.com>
 <CAMKF1sp4dZ5Qr5pjNmVzs2jxSuPOc=Vh1yh+Ho1pkPbNoEHZ0Q@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1sp4dZ5Qr5pjNmVzs2jxSuPOc=Vh1yh+Ho1pkPbNoEHZ0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 07:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103164

2023. 06. 07. 8:47 keltezéssel, Khem Raj írta:
>
>
> On Tue, Jun 6, 2023 at 11:40 PM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>
>     mpich 4.1+ has its own official way to allow cross-compiling,
>     use it.
>
>     Remove the old PACKAGECONFIG[x11], the configuration option
>     does not exist anymore.
>
>     Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
>     parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
>     enable either by default to keep the current minimalistic build.
>
>     Remove configuration options that don't exist in the new version.
>
>     Set TOOLCHAIN = "gcc" so gfortran may be used.
>
>
> we do not enable Fortran even with gcc by default, is it a requirement now for this 
> recipe ?

The cross file generator uses it.

Maybe it's better to move the --with-cross= setting into PACKAGEGROUP[fortran].

Also, how to express a build time dependency on arch-gfortran in a generic way?


>
>
>
>     Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>     ---
>      meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb <http://mpich_4.0.3.bb> | 58
>     -----------------
>      meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb <http://mpich_4.1.1.bb> | 63
>     +++++++++++++++++++
>      2 files changed, 63 insertions(+), 58 deletions(-)
>      delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>     <http://mpich_4.0.3.bb>
>      create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>     <http://mpich_4.1.1.bb>
>
>     diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb <http://mpich_4.0.3.bb>
>     b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb <http://mpich_4.0.3.bb>
>     deleted file mode 100644
>     index 000f73981..000000000
>     --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb <http://mpich_4.0.3.bb>
>     +++ /dev/null
>     @@ -1,58 +0,0 @@
>     -SUMMARY = "Message Passing Interface (MPI) implementation"
>     -HOMEPAGE = "http://www.mpich.org/"
>     -SECTION = "devel"
>     -
>     -LICENSE = "BSD-2-Clause"
>     -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
>     -
>     -SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz
>     <http://www.mpich.org/static/downloads/$%7BPV%7D/mpich-$%7BPV%7D.tar.gz>"
>     -SRC_URI[sha256sum] = "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501"
>     -
>     -RDEPENDS:${PN} += "bash perl libxml2"
>     -
>     -EXTRA_OECONF = "--enable-debuginfo \
>     -    --enable-fast \
>     -    --enable-shared  \
>     -    --with-pm=gforker  \
>     -    --disable-rpath \
>     -    --disable-f77 \
>     -    --disable-fc \
>     -    --disable-fortran \
>     -    --disable-cxx \
>     -    BASH_SHELL='${USRBINPATH}/env bash' \
>     -    PERL='${USRBINPATH}/env perl' \
>     -    --with-device=ch3:nemesis \
>     -    --with-rdmacm=no \
>     -    --disable-numa \
>     -"
>     -
>     -PACKAGECONFIG += " \
>     -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>     -"
>     -PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR}
>     --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
>     -
>     -# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib
>     option passed by clang
>     -LDFLAGS:append:x86-64 = " -lgcc"
>     -LDFLAGS:append:x86 = " -lgcc"
>     -
>     -inherit autotools gettext pkgconfig
>     -
>     -do_configure() {
>     -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
>     -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb \
>     -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config \
>     -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
>     -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
>     -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
>     -    done
>     -#    cd ${S}
>     -#    autoupdate
>     -#    autoreconf --verbose --install --force
>     -#    cd ${B}
>     -    oe_runconf
>     -}
>     -
>     -do_install:append() {
>     -    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la <http://libmpi.la>
>     -    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
>     -}
>     diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb <http://mpich_4.1.1.bb>
>     b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb <http://mpich_4.1.1.bb>
>     new file mode 100644
>     index 000000000..e65f9074e
>     --- /dev/null
>     +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb <http://mpich_4.1.1.bb>
>     @@ -0,0 +1,63 @@
>     +SUMMARY = "Message Passing Interface (MPI) implementation"
>     +HOMEPAGE = "http://www.mpich.org/"
>     +SECTION = "devel"
>     +
>     +LICENSE = "BSD-2-Clause"
>     +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f1804c45b8b4e816e53eb1f175d810f3"
>     +
>     +SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz
>     <http://www.mpich.org/static/downloads/$%7BPV%7D/mpich-$%7BPV%7D.tar.gz>"
>     +SRC_URI[sha256sum] = "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f138443072ff4284ca2"
>     +
>     +TOOLCHAIN = "gcc"
>     +
>     +RDEPENDS:${PN} += "bash perl libxml2"
>     +
>     +EXTRA_OECONF = "--enable-debuginfo \
>     +    --enable-fast \
>     +    --enable-shared  \
>     +    --with-pm=gforker  \
>     +    BASH_SHELL='${USRBINPATH}/env bash' \
>     +    PERL='${USRBINPATH}/env perl' \
>     +    --with-device=ch3:nemesis \
>     +    --with-cross=${WORKDIR}/cross_values.txt \
>     +"
>     +
>     +PACKAGECONFIG ??= ""
>     +
>     +PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx"
>     +PACKAGECONFIG[fortran] = "--enable-fortran,--disable-f77 --disable-fc
>     --disable-fortran,libgfortran"
>     +
>     +# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib
>     option passed by clang
>     +LDFLAGS:append:x86-64 = " -lgcc"
>     +LDFLAGS:append:x86 = " -lgcc"
>     +
>     +inherit autotools gettext pkgconfig qemu
>     +
>     +DEPENDS += "qemu-native"
>     +
>     +do_configure() {
>     +    qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
>     [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
>     +    cat > ${WORKDIR}/qemuwrapper << EOF
>     +#!/bin/sh
>     +$qemu_binary "\$@"
>     +EOF
>     +    chmod +x ${WORKDIR}/qemuwrapper
>     +
>     +    sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKDIR}/t`;:'
>     ${S}/maint/gen_cross.pl <http://gen_cross.pl>
>     +
>     +    cd ${WORKDIR}
>     +    perl ${S}/maint/gen_cross.pl <http://gen_cross.pl>
>     +
>     +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=.*\) }"$:\1 }, ":'
>     ${WORKDIR}/cross_values.txt
>     +
>     +    cd ${S}
>     +    ./autogen.sh
>     +
>     +    cd ${B}
>     +    oe_runconf
>     +}
>     +
>     +do_install:append() {
>     +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la <http://libmpi.la>
>     +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
>     +}
>     -- 
>     2.40.1
>


