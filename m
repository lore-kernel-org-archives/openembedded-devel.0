Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.3329.1611882194118507212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 17:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IYYRkTb0;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id c132so5504134pga.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Jan 2021 17:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Cf0KN7qMhGOvR0NbqVOThwIJk3NMqjsQwx3LzUPYQP0=;
        b=IYYRkTb04nwmO/Lki5h0ih+tZeNgesMyKwhPO5tNhVDap1BiPax6pq28Vs3c5/T81C
         6nCEy17Kb511CthJq3oFwJZCo4BFGsopGML2Ql5apkiU770uIvUFXWkrynRqC4NiWCgj
         cw0XGkDSVhpn18mwY5j5v+c78xZLZrwFjr6OT+KFcAQqVYfdrUUdnyY0ZnWrgw/F2pXl
         G7ue0uE06YOX4V9zwV1ICyu5o7KApt2/MeetdxSIreFNIeh4YZvuyU0Ae6xEEh/2zE2A
         J0McM6cB0gTRVm2wbmgbuQvsq0nV/Ok72zmRLot0uSWC9VVY1huVeciDcDma7nrdkfmR
         2FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Cf0KN7qMhGOvR0NbqVOThwIJk3NMqjsQwx3LzUPYQP0=;
        b=MYuIeclYiR9X9rVs/faNM+F8xuqATS8x9hOwTsjIPxKwiAK6MUHGZyfWnOaE+Aeyur
         e1lzSUuiBKDRFBRVSdpslSFAp9Otj2AKv0Ww2/KX89flt5SI5gwFRpbkzLr3Au6WNrAR
         0WPNlrVMJ3LDTUHWEI6PnMcf0yXaCgZdTH0LjlAHlVnqq5fpIDbnu4F8hR9UixX3VOdW
         xb1ChtqM5krsIIennC6AWpzk8WCZihbMX5F4dnvRvXbxRapoFJhlyOOENt8WocxsU/WD
         8MUNG4a7QaQzkw6tdG1jt+x9FXd7m5SLn2Re4Sf77EkO/GbIYNbNrs1ymo3Lp02w0A/r
         dJ/g==
X-Gm-Message-State: AOAM532YbsosaZGcqBlabQS6wuqQbFyb9ZocJ0+xfUB6+i1jenZ2ab3W
	s4QsmuwBM3EEeISYFs0NReM+/22tXn1t4w==
X-Google-Smtp-Source: ABdhPJz2PFuGeuObqehm0Msif6ZJI9QBF2gTBUcnluDOPYO4/IKOXh+L4VA6RAx2P1TPWOx6VrWQrw==
X-Received: by 2002:a63:db05:: with SMTP id e5mr2121328pgg.104.1611882193395;
        Thu, 28 Jan 2021 17:03:13 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:41d5:7688:5129:bafc? ([2601:202:4180:a5c0:41d5:7688:5129:bafc])
        by smtp.gmail.com with ESMTPSA id k4sm6773909pfk.44.2021.01.28.17.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 17:03:11 -0800 (PST)
Subject: Re: [oe] [PATCH 3/3] sip3: simplify recipe
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-devel@lists.openembedded.org
References: <20210127190712.818807-4-steve@sakoman.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <8de8215e-7da5-e084-f018-3374b642bf7d@gmail.com>
Date: Thu, 28 Jan 2021 17:03:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127190712.818807-4-steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/27/21 11:07 AM, Steve Sakoman wrote:
> From: "S. Lockwood-Childs" <sjl@vctlabs.com>
>
> The custom configure block can be shared between target
> and native if you just configure the sysroot option accordingly
> and use STAGING_INCDIR to locate the python headers to build
> against.
>
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 5fe362171c7f3426fced0c7889facec397c9cc5e)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
Gatesgarth needs this one too.
pulling in
-armin
> ---
>  meta-oe/recipes-devtools/sip/sip3_4.19.23.bb | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> index 320755b844..ae8df5055a 100644
> --- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> +++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> @@ -19,24 +19,17 @@ PACKAGES += "python3-sip3"
>  
>  BBCLASSEXTEND = "native"
>  
> -do_configure_prepend_class-target() {
> -    echo "py_platform = linux" > sip.cfg
> -    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
> -    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
> -    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
> -    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
> -    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> -    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
> -}
> +CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
> +CONFIGURE_SYSROOT_class-native = "${STAGING_DIR_NATIVE}"
>  
> -do_configure_prepend_class-native() {
> +do_configure_prepend() {
>      echo "py_platform = linux" > sip.cfg
> -    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
> +    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
>      echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
>      echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
>      echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
>      echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> -    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
> +    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
>  }
>  
>  do_install() {
>
> 
>

