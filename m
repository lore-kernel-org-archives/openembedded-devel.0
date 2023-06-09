Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7021CC83005
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 04:16:06 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.6010.1686284158672352218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 21:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Y80V9ziB;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51478f6106cso2316937a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 21:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686284157; x=1688876157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0nSg51VSjPex+5nXQu5sZ/MZuj4rqla6C6kvDtlZ9Y=;
        b=Y80V9ziBipKK27zqeWeKSS6qFDfnLnAanHmck7etOpC8xt2kw0ojlZTvH1vXKQhtZS
         F4LrTdNV+ZdDUCIPXc4obPEfX9dTxssx1SVkf4ewHcEM1mn+r8rwF4GdKO5jj1JkRAXg
         XfGkkbpgDvwmiabP82F2CoO3C45VZY2wolMYGKQ/Bli3/h9u8dXOhihXgmYtpClalkU0
         5mzM/WsG/nvcc4Yxro326BWWy2A2ma7dnuXbLGk31m0WMKK+//mVQeFz/oF9/RvIsQJR
         0s7r46npkwNJEnwgKT3iACmrXgHZjd8mbuxKsg48tFqL3djwdoBF0fNMHlCvqwJ2NwlZ
         9yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686284157; x=1688876157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0nSg51VSjPex+5nXQu5sZ/MZuj4rqla6C6kvDtlZ9Y=;
        b=BhrGCzfap8gBiHPxuvDHcHcw0SLAXiY5FVfbgwjvEB70gr407SZ4+hmqHiNJE2bNQm
         PEDLYxrwcJwXU8ojQbxijVP2zPT7LNlzFhiroGPJifCT4PvNgmSeYSf7QPdVfldZKId/
         b4cKZVWbJWjgZ52ErqvQ/G6Qb3XM7h5229FN60RAQ06e/I679FRPxPH+PydiQW/nFPAc
         BphyQEyC3rCvKfHFRt1L4e0WjlxlgFqocRfGbvz82fSOr3xH+IwYu2gDdqTjSPeHQBu8
         Yx8BQWata8qQSkcC+I9rMNrkRfRlrNgerpna9y1nTDVJVaSEgyDMeAbALiWCRDRXRw38
         xAWA==
X-Gm-Message-State: AC+VfDyJqrRLfbMOV9b19wUoFwgC2MqNo/SJjun/g3V6dFqbbyNjBrJD
	1mz+RX2tEPsndf9hg63U5ds=
X-Google-Smtp-Source: ACHHUZ7kAAzCD3+0hQyPlaoxMtCZq/e1OlSCDxvL3QHX612e7v06R8tyJsGNLMoUi1CwomvPc7Xkcw==
X-Received: by 2002:a17:907:320b:b0:96a:3e7:b592 with SMTP id xg11-20020a170907320b00b0096a03e7b592mr574878ejb.25.1686284156574;
        Thu, 08 Jun 2023 21:15:56 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i1-20020adffc01000000b0030aee3da084sm3210033wrr.49.2023.06.08.21.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 21:15:56 -0700 (PDT)
Message-ID: <ae8268f1-aec8-df0e-b425-1a0db2d3b3e6@gmail.com>
Date: Fri, 9 Jun 2023 06:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-oe][PATCH v3] mpich: Upgrade to 4.1.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230607072321.589315-1-zboszor@gmail.com>
 <8b2cdabf-7e71-bb12-ce14-eefea762c403@gmail.com>
 <CAMKF1sptTB=_78n84iYnjKigk3_nhgia0gBJapXcsB4iMqhRZw@mail.gmail.com>
 <CAMKF1speJ6nXfDbn3ZRgYN8=HaXRZwh+SZpJa9=4t62z5AEM1A@mail.gmail.com>
 <CAMKF1sqseihecRUcvXKAd8hWeecWi4UY7T8+_2amu-vxPoivsw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1sqseihecRUcvXKAd8hWeecWi4UY7T8+_2amu-vxPoivsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 04:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103196

2023. 06. 08. 23:10 keltezéssel, Khem Raj írta:
> I have added fixes for the issues I have seen, Please take a look at
> the updated patch in master-next

Thanks, it looks good.

>
> On Thu, Jun 8, 2023 at 10:23 AM Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Jun 8, 2023 at 9:41 AM Khem Raj <raj.khem@gmail.com> wrote:
>>> still seeing issues
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2802
>>>
>> I dropped the unknown option and it went further which is good,
>> however I am seeing
>>
>> WARNING: mpich-4.1.1-r0 do_package_qa: QA Issue: File
>> /usr/lib/libmpi.so.12.3.0 in package mpich contains reference to
>> TMPDIR
>> File /usr/bin/mpicc in package mpich contains reference to TMPDIR
>> File /usr/bin/mpicxx in package mpich contains reference to TMPDIR [buildpaths]
>>
>> So it will be good to look into this problem as well, why do we see
>> these QA warnings.
>>
>>> On Wed, Jun 7, 2023 at 12:28 AM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>> 2023. 06. 07. 9:23 keltezéssel, Zoltán Böszörményi írta:
>>>>> mpich 4.1+ has its own official way to allow cross-compiling,
>>>>> use it.
>>>>>
>>>>> Remove the old PACKAGECONFIG[x11], the configuration option
>>>>> does not exist anymore.
>>>>>
>>>>> Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
>>>>> parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
>>>>> enable either by default to keep the current minimalistic build.
>>>>>
>>>>> Remove configuration options that don't exist in the new version.
>>>>>
>>>>> Set TOOLCHAIN = "gcc".
>>>>>
>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>> ---
>>>>>    meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 -----------------
>>>>>    meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 64 +++++++++++++++++++
>>>>>    2 files changed, 64 insertions(+), 58 deletions(-)
>>>>>    delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>>>>>    create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>>>>>
>>>>> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>>>>> deleted file mode 100644
>>>>> index 000f73981..000000000
>>>>> --- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
>>>>> +++ /dev/null
>>>>> @@ -1,58 +0,0 @@
>>>>> -SUMMARY = "Message Passing Interface (MPI) implementation"
>>>>> -HOMEPAGE = "http://www.mpich.org/"
>>>>> -SECTION = "devel"
>>>>> -
>>>>> -LICENSE = "BSD-2-Clause"
>>>>> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
>>>>> -
>>>>> -SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
>>>>> -SRC_URI[sha256sum] = "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501"
>>>>> -
>>>>> -RDEPENDS:${PN} += "bash perl libxml2"
>>>>> -
>>>>> -EXTRA_OECONF = "--enable-debuginfo \
>>>>> -    --enable-fast \
>>>>> -    --enable-shared  \
>>>>> -    --with-pm=gforker  \
>>>>> -    --disable-rpath \
>>>>> -    --disable-f77 \
>>>>> -    --disable-fc \
>>>>> -    --disable-fortran \
>>>>> -    --disable-cxx \
>>>>> -    BASH_SHELL='${USRBINPATH}/env bash' \
>>>>> -    PERL='${USRBINPATH}/env perl' \
>>>>> -    --with-device=ch3:nemesis \
>>>>> -    --with-rdmacm=no \
>>>>> -    --disable-numa \
>>>>> -"
>>>>> -
>>>>> -PACKAGECONFIG += " \
>>>>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>>>>> -"
>>>>> -PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
>>>>> -
>>>>> -# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
>>>>> -LDFLAGS:append:x86-64 = " -lgcc"
>>>>> -LDFLAGS:append:x86 = " -lgcc"
>>>>> -
>>>>> -inherit autotools gettext pkgconfig
>>>>> -
>>>>> -do_configure() {
>>>>> -    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
>>>>> -        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb \
>>>>> -        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config \
>>>>> -        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
>>>>> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
>>>>> -        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
>>>>> -    done
>>>>> -#    cd ${S}
>>>>> -#    autoupdate
>>>>> -#    autoreconf --verbose --install --force
>>>>> -#    cd ${B}
>>>>> -    oe_runconf
>>>>> -}
>>>>> -
>>>>> -do_install:append() {
>>>>> -    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
>>>>> -    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
>>>>> -}
>>>>> diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>>>>> new file mode 100644
>>>>> index 000000000..cb9c0f1dd
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
>>>>> @@ -0,0 +1,64 @@
>>>>> +SUMMARY = "Message Passing Interface (MPI) implementation"
>>>>> +HOMEPAGE = "http://www.mpich.org/"
>>>>> +SECTION = "devel"
>>>>> +
>>>>> +LICENSE = "BSD-2-Clause"
>>>>> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f1804c45b8b4e816e53eb1f175d810f3"
>>>>> +
>>>>> +SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
>>>>> +SRC_URI[sha256sum] = "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f138443072ff4284ca2"
>>>>> +
>>>>> +TOOLCHAIN = "gcc"
>>>>> +
>>>>> +RDEPENDS:${PN} += "bash perl libxml2"
>>>>> +
>>>>> +EXTRA_OECONF = "--enable-debuginfo \
>>>>> +    --enable-fast \
>>>>> +    --enable-shared  \
>>>>> +    --with-pm=gforker  \
>>>>> +    BASH_SHELL='${USRBINPATH}/env bash' \
>>>>> +    PERL='${USRBINPATH}/env perl' \
>>>>> +    --with-device=ch3:nemesis \
>>>>> +"
>>>>> +
>>>>> +PACKAGECONFIG ??= ""
>>>>> +
>>>>> +PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx"
>>>>> +PACKAGECONFIG[fortran] = "--with-cross=${WORKDIR}/cross_values.txt --enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfortran"
>>>>> +
>>>>> +# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
>>>>> +LDFLAGS:append:x86-64 = " -lgcc"
>>>>> +LDFLAGS:append:x86 = " -lgcc"
>>>>> +
>>>>> +inherit autotools gettext pkgconfig qemu
>>>>> +
>>>>> +DEPENDS += "qemu-native"
>>>>> +
>>>>> +do_configure() {
>>>>> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', d)}" = "1" ]; then
>>>>> +        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
>>>>> +        cat > ${WORKDIR}/qemuwrapper << EOF
>>>>> +#!/bin/sh
>>>>> +$qemu_binary "\$@"
>>>>> +EOF
>>>>> +        chmod +x ${WORKDIR}/qemuwrapper
>>>>> +
>>>>> +        sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKDIR}/t`;:' ${S}/maint/gen_cross.pl
>>>>> +
>>>>> +        cd ${WORKDIR}
>>>>> +        perl ${S}/maint/gen_cross.pl
>>>>> +    fi
>>>>> +
>>>>> +    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=.*\) }"$:\1 }, ":' ${WORKDIR}/cross_values.txt
>>>> This must be in the if [] above. Just sent v4 with this fix.
>>>>
>>>>> +
>>>>> +    cd ${S}
>>>>> +    ./autogen.sh
>>>>> +
>>>>> +    cd ${B}
>>>>> +    oe_runconf
>>>>> +}
>>>>> +
>>>>> +do_install:append() {
>>>>> +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
>>>>> +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
>>>>> +}


