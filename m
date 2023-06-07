Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EC1C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 06:33:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2482.1686119623019987353
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 23:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sqJjNuJo;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so58427875e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 23:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686119621; x=1688711621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaRQjf56n1KTZQ+UszV0Gcapd6ZAEQenliLTTbHorJg=;
        b=sqJjNuJo1v0Nc9YU/BqocgVGKDCmt4QK0Y7GnAGPxcErMHPiEGTT6gPXKllulbXnba
         1uV838LvCnyI8DKbXqbBNQJ6wQbdgUJpDcArEiKGziLTwIocIfjtEIhzkUFPsp41INRN
         CnuPCjztzc2L0WJYtugkDsoXexEuDvvNnsoqqau6MyMJbGRVLRr1jD0i7kzeAeaPgkq4
         bXVfFi7DpEkdmeniqW2U/ASzA+Lu5GzNAQMj5vjBCbtJTTFxDIsrSJdcab435foOvVxH
         +bzul4Kvv7LSFUUZFjzx63YHkjsq1B/TsKqbscBynN50q2JvbU4J6304wlQTMlBr3RHU
         VYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686119621; x=1688711621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaRQjf56n1KTZQ+UszV0Gcapd6ZAEQenliLTTbHorJg=;
        b=JNCE/qvgyUchacI2ZHffkSxh6oM8H9rGBJQZynQl8A0XowTJohe481Ay+vwRrlNyyw
         o3ItmOvCMtBlhRdksHAKIPSqGzOiGzZiXbhfQ2oE+4zmj7s6adBTDJrMZJ11soNniZbI
         Kf0bbSvGW5uqdTcttlMpbEy77/8ZR7hcNUTGCH54eO+RXUaLbV3Ir6OygLDvf3vc6qUz
         Rly4nCCh+mIs2rbVQAeOxRm8fnnk6Ju72gRibJHww+S3gJ6Jvxl/QiW4e/tpojTRQmM8
         Xs4kfcz0JePmPrDg7mcccwRbOfET8JeUAhNDYeVhEH8F4/ihle5pEONKbO83sTUI5RQZ
         UxwQ==
X-Gm-Message-State: AC+VfDybSlsgIy9LAOMk9dy6vMLB44UAo97lwY57rihKCOaUPIxHBAYh
	YuDZsMq6KDx+tC7NkVFjwJc=
X-Google-Smtp-Source: ACHHUZ6lAw7MMdbjMjofS7hAlvS8A6DRwFWw8XAX/aZOQ5tclS9/2H7TyPTaFqTqLT2UQT4u3/JImQ==
X-Received: by 2002:a1c:7c0d:0:b0:3f6:13f5:d1ea with SMTP id x13-20020a1c7c0d000000b003f613f5d1eamr3765218wmc.11.1686119621168;
        Tue, 06 Jun 2023 23:33:41 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id o1-20020a5d6841000000b003079c402762sm14483397wrw.19.2023.06.06.23.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 23:33:40 -0700 (PDT)
Message-ID: <38ca51c2-d822-875e-0f7a-57b97cedb5c3@gmail.com>
Date: Wed, 7 Jun 2023 08:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-oe][PATCH] mpich: Upgrade to 4.1.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230606110147.1797218-1-zboszor@gmail.com>
 <CAMKF1soTvEmR5J-1GxH7KXCCK6E25snsLJ6KDNccRDuCb=P_AQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1soTvEmR5J-1GxH7KXCCK6E25snsLJ6KDNccRDuCb=P_AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 06:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103159

Since it absolutely wants to use gfortran, is it acceptable
to set TOOLCHAIN="gcc"?

2023. 06. 07. 8:01 keltezéssel, Khem Raj írta:
> its failing to configure for qemumips/clang
>
> https://errors.yoctoproject.org/Errors/Details/707724/
>
> On Tue, Jun 6, 2023 at 4:01 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> mpich 4.1+ has its own official way to allow cross-compiling,
>> use it.
>>
>> Remove the old PACKAGECONFIG[x11], the configuration option
>> does not exist anymore.
>>
>> Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
>> parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
>> enable either by default to keep the current minimalistic build.
>>
>> Remove configuration options that don't exist in the new version.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 ------------------
>>   meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 61 +++++++++++++++++++
>>   2 files changed, 61 insertions(+), 58 deletions(-)
>>   delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>>   create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>>
>> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>> deleted file mode 100644
>> index 000f73981..000000000
>> --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>> +++ /dev/null
>> @@ -1,58 +0,0 @@
>> -SUMMARY = "Message Passing Interface (MPI) implementation"
>> -HOMEPAGE = "http://www.mpich.org/"
>> -SECTION = "devel"
>> -
>> -LICENSE = "BSD-2-Clause"
>> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
>> -
>> -SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
>> -SRC_URI[sha256sum] = "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501"
>> -
>> -RDEPENDS:${PN} += "bash perl libxml2"
>> -
>> -EXTRA_OECONF = "--enable-debuginfo \
>> -    --enable-fast \
>> -    --enable-shared  \
>> -    --with-pm=gforker  \
>> -    --disable-rpath \
>> -    --disable-f77 \
>> -    --disable-fc \
>> -    --disable-fortran \
>> -    --disable-cxx \
>> -    BASH_SHELL='${USRBINPATH}/env bash' \
>> -    PERL='${USRBINPATH}/env perl' \
>> -    --with-device=ch3:nemesis \
>> -    --with-rdmacm=no \
>> -    --disable-numa \
>> -"
>> -
>> -PACKAGECONFIG += " \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>> -"
>> -PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
>> -
>> -# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
>> -LDFLAGS:append:x86-64 = " -lgcc"
>> -LDFLAGS:append:x86 = " -lgcc"
>> -
>> -inherit autotools gettext pkgconfig
>> -
>> -do_configure() {
>> -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
>> -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb \
>> -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config \
>> -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
>> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
>> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
>> -    done
>> -#    cd ${S}
>> -#    autoupdate
>> -#    autoreconf --verbose --install --force
>> -#    cd ${B}
>> -    oe_runconf
>> -}
>> -
>> -do_install:append() {
>> -    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
>> -    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
>> -}
>> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>> new file mode 100644
>> index 000000000..990400f5c
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>> @@ -0,0 +1,61 @@
>> +SUMMARY = "Message Passing Interface (MPI) implementation"
>> +HOMEPAGE = "http://www.mpich.org/"
>> +SECTION = "devel"
>> +
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f1804c45b8b4e816e53eb1f175d810f3"
>> +
>> +SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
>> +SRC_URI[sha256sum] = "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f138443072ff4284ca2"
>> +
>> +RDEPENDS:${PN} += "bash perl libxml2"
>> +
>> +EXTRA_OECONF = "--enable-debuginfo \
>> +    --enable-fast \
>> +    --enable-shared  \
>> +    --with-pm=gforker  \
>> +    BASH_SHELL='${USRBINPATH}/env bash' \
>> +    PERL='${USRBINPATH}/env perl' \
>> +    --with-device=ch3:nemesis \
>> +    --with-cross=${WORKDIR}/cross_values.txt \
>> +"
>> +
>> +PACKAGECONFIG ??= ""
>> +
>> +PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx"
>> +PACKAGECONFIG[fortran] = "--enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfortran"
>> +
>> +# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
>> +LDFLAGS:append:x86-64 = " -lgcc"
>> +LDFLAGS:append:x86 = " -lgcc"
>> +
>> +inherit autotools gettext pkgconfig qemu
>> +
>> +DEPENDS += "qemu-native"
>> +
>> +do_configure() {
>> +    qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
>> +    cat > ${WORKDIR}/qemuwrapper << EOF
>> +#!/bin/sh
>> +$qemu_binary "\$@"
>> +EOF
>> +    chmod +x ${WORKDIR}/qemuwrapper
>> +
>> +    sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKDIR}/t`;:' ${S}/maint/gen_cross.pl
>> +
>> +    cd ${WORKDIR}
>> +    perl ${S}/maint/gen_cross.pl
>> +
>> +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=.*\) }"$:\1 }, ":' ${WORKDIR}/cross_values.txt
>> +
>> +    cd ${S}
>> +    ./autogen.sh
>> +
>> +    cd ${B}
>> +    oe_runconf
>> +}
>> +
>> +do_install:append() {
>> +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
>> +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
>> +}
>> --
>> 2.40.1
>>


