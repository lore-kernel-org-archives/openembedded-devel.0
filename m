Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E1BC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:28:05 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2966.1686122884806538393
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TcxN1Nzz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so57009275e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686122883; x=1688714883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsiHeJbe9kvGZxXUjyxAP8gIwrCrEaoZ5Xqw7TF/JAM=;
        b=TcxN1NzzeZIfHLvJKB+dEZ01L14fw9OS+g9eKMuj+XuSTnPffv23V7mr6Sk0iT6rTX
         VUAbrUNH6WN64VK1E38I81lxE7C/MMMB08e6j9CPlSa14wobT2ukt7MwtbNRC30uQm9P
         E/Ypucc/51FjhGzFYMMB6DuJsYUjkfsFdH1jqBuOaSeuA2TS6F4IM5yc4+UWEPp2UcMm
         GylXgPvfeVkHSklkkz68PIj0nZb1uGoGTGWom7YLmqTYMkRX0eeq9CkvtrZC83z57oZV
         V5jyl9AkxBsIHjRqZafeLm8fQuhBlMQuQpN3Jzvg7gnYYR/VfC0cSS1WTySkP/hbX2SO
         Di1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122883; x=1688714883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsiHeJbe9kvGZxXUjyxAP8gIwrCrEaoZ5Xqw7TF/JAM=;
        b=CU+BuHJJ5Rw/BukMHNJKIi+/YBwHFBfZOZ9a2SEBkPM0fzL0hIEM552rFHUSmgLowi
         lN/WvMboz+Zx9taQb1qIsfvjGdIz6C0FFaJTbGnrF6jGoOT2kAOfq5fdWKCQS9OTQLNs
         yd7mqrQmxlMprbDpjsexZkeAVSQePaw8BaMtLguYxrhrMpEkfVVeGzJ3ksyLYBl0mVYq
         I7n5oCqxC/ks5LGnkWVMVSH+7Ge4CxXUY7wOcsQme193I156oVM4YmwNYaYfr2vdwNqp
         RI9q+s1eRh20/OJNz/7V8YZcjhDsU+K12Dx34eVBhNgLF0beGkPB34BWJKmOzzuOtNo7
         WgWA==
X-Gm-Message-State: AC+VfDz8w77+PL58a5r1yByC+p/tckrYbDuAla30cOhgWkKDEsSQkvhM
	eSsiw91H7xciBZnlcDTrDaviAtCgaMg=
X-Google-Smtp-Source: ACHHUZ4KLhdrLXm1Rn9Spaj3s3Lxu60GI5sRHcZepH/uxDYi7xxjFTfMfsq3vHx/7/iWgsGH0uGMHg==
X-Received: by 2002:a1c:4c11:0:b0:3f7:408e:b89a with SMTP id z17-20020a1c4c11000000b003f7408eb89amr3617101wmf.37.1686122882823;
        Wed, 07 Jun 2023 00:28:02 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm14654681wrw.70.2023.06.07.00.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:28:02 -0700 (PDT)
Message-ID: <8b2cdabf-7e71-bb12-ce14-eefea762c403@gmail.com>
Date: Wed, 7 Jun 2023 09:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-oe][PATCH v3] mpich: Upgrade to 4.1.1
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20230607072321.589315-1-zboszor@gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230607072321.589315-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 07:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103167

2023. 06. 07. 9:23 keltezéssel, Zoltán Böszörményi írta:
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
> Set TOOLCHAIN = "gcc".
>
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 -----------------
>   meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 64 +++++++++++++++++++
>   2 files changed, 64 insertions(+), 58 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>   create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> deleted file mode 100644
> index 000f73981..000000000
> --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -SUMMARY = "Message Passing Interface (MPI) implementation"
> -HOMEPAGE = "http://www.mpich.org/"
> -SECTION = "devel"
> -
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
> -
> -SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
> -SRC_URI[sha256sum] = "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501"
> -
> -RDEPENDS:${PN} += "bash perl libxml2"
> -
> -EXTRA_OECONF = "--enable-debuginfo \
> -    --enable-fast \
> -    --enable-shared  \
> -    --with-pm=gforker  \
> -    --disable-rpath \
> -    --disable-f77 \
> -    --disable-fc \
> -    --disable-fortran \
> -    --disable-cxx \
> -    BASH_SHELL='${USRBINPATH}/env bash' \
> -    PERL='${USRBINPATH}/env perl' \
> -    --with-device=ch3:nemesis \
> -    --with-rdmacm=no \
> -    --disable-numa \
> -"
> -
> -PACKAGECONFIG += " \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> -"
> -PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
> -
> -# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
> -LDFLAGS:append:x86-64 = " -lgcc"
> -LDFLAGS:append:x86 = " -lgcc"
> -
> -inherit autotools gettext pkgconfig
> -
> -do_configure() {
> -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
> -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb \
> -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config \
> -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
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
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> new file mode 100644
> index 000000000..cb9c0f1dd
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
> @@ -0,0 +1,64 @@
> +SUMMARY = "Message Passing Interface (MPI) implementation"
> +HOMEPAGE = "http://www.mpich.org/"
> +SECTION = "devel"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f1804c45b8b4e816e53eb1f175d810f3"
> +
> +SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f138443072ff4284ca2"
> +
> +TOOLCHAIN = "gcc"
> +
> +RDEPENDS:${PN} += "bash perl libxml2"
> +
> +EXTRA_OECONF = "--enable-debuginfo \
> +    --enable-fast \
> +    --enable-shared  \
> +    --with-pm=gforker  \
> +    BASH_SHELL='${USRBINPATH}/env bash' \
> +    PERL='${USRBINPATH}/env perl' \
> +    --with-device=ch3:nemesis \
> +"
> +
> +PACKAGECONFIG ??= ""
> +
> +PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx"
> +PACKAGECONFIG[fortran] = "--with-cross=${WORKDIR}/cross_values.txt --enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfortran"
> +
> +# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
> +LDFLAGS:append:x86-64 = " -lgcc"
> +LDFLAGS:append:x86 = " -lgcc"
> +
> +inherit autotools gettext pkgconfig qemu
> +
> +DEPENDS += "qemu-native"
> +
> +do_configure() {
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', d)}" = "1" ]; then
> +        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
> +        cat > ${WORKDIR}/qemuwrapper << EOF
> +#!/bin/sh
> +$qemu_binary "\$@"
> +EOF
> +        chmod +x ${WORKDIR}/qemuwrapper
> +
> +        sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKDIR}/t`;:' ${S}/maint/gen_cross.pl
> +
> +        cd ${WORKDIR}
> +        perl ${S}/maint/gen_cross.pl
> +    fi
> +
> +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=.*\) }"$:\1 }, ":' ${WORKDIR}/cross_values.txt

This must be in the if [] above. Just sent v4 with this fix.

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


