Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.736.1606331170824954298
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2020 11:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RHeXyTao;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id t8so3211934pfg.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 11:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dbyTQjR+F2Vx1x5/b9Bf7DmbXPgULPkFWEw3ittxZqM=;
        b=RHeXyTaoYfE2+IRNIL532blZw2bbRjoP1AlbuLN/3JWGW02HPxhAJMwJVkbIzrOXbD
         7fmjHChIghJZ0Ir77+LT7/KihUv1AHqwFijR866a13h7wtnxEcgZLiGydpHLROdLt2gb
         x84B6heYrGuIoxKxXpCMKRGPi0HCtQMC2vQw2kXvQGCfSlrU7K4gs2zy5O47Ko0O61ei
         R0sNqSQELgoFwuExDn7FGGSh8VL6/BJS4P5oNb+HRXytvd8t3LXPtgq0O1W1DZn5tuh2
         0amhxPlKx4HMUX33sbvh2cV/bDciV8GVOZ9CVeAm/dQGvER/pFlBbX12xRGm3zVSa319
         xJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dbyTQjR+F2Vx1x5/b9Bf7DmbXPgULPkFWEw3ittxZqM=;
        b=GYT5XOgpATyBMxsdK4Ay21BG0fA7OJFcQLnyaLL9OiCxF4PRMJ2yzmE1JbxkKF37ae
         bISg09uMkKw4SgSCNLutBNo2ZBbTVfcs+uQRf2IdeVo63puX83FZ+4I60IVJNJQcyxe/
         QKDCyq6SWv49w1lIcO4QoxaajB+ptWF+2645StC5z/M8PXMJOboJwvNxo8USptswkFU+
         FgR+KX+U9Mq0Oqc0LquMs8jpG5wnmD/yuml6Ee7c3UWCkrZ+QDRL6qnBlQYP/AydSj9i
         biZIrSLjCZjt1Of26Unf3F05a+ql0z+a+DUMtb6BF9IxkBT+gjt5TSkUB3/d2qS5NVC/
         i6Pg==
X-Gm-Message-State: AOAM5327iUjsVxZddZiDMIWK59d/xfwpjgQthwISk852jsZMFUzmsCyI
	tfQr0XlnFUwdJ2V2YZSiqyQ831ns6+LfSg==
X-Google-Smtp-Source: ABdhPJzu/3tiWyBySmJvECvtdhMyXWt95Rb6DRIXqZgT+9R/4w3qblgQxHAFt6N7kWNdzqC50TepSw==
X-Received: by 2002:a63:2045:: with SMTP id r5mr4232460pgm.6.1606331169672;
        Wed, 25 Nov 2020 11:06:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:ecdb:94e8:2d6c:dea4? ([2601:646:9200:4e0:ecdb:94e8:2d6c:dea4])
        by smtp.gmail.com with ESMTPSA id c22sm2536753pfo.211.2020.11.25.11.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 11:06:08 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH v2] cdrkit: split into more packages
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
References: <88100> <20201125185548.577818-1-maciej.pijanowski@3mdeb.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c1384786-d8db-142d-15e0-c3277966eaaf@gmail.com>
Date: Wed, 25 Nov 2020 11:06:06 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125185548.577818-1-maciej.pijanowski@3mdeb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks Maciej this one looks good but it fails to apply on master-next, 
can you rebase and resend please

On 11/25/20 10:55 AM, Maciej Pijanowski wrote:
> Mimic the Debian pacaking scheme to allow for more fine-grained
> installation choice (install the binaries we need). Moreover, dirsplit
> was moved to a separate package, as it pulls in perl interpreter.
> 
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>   .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
>   .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
>   2 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 8358e933d712..4f12d4d3bdda 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -207,7 +207,7 @@ RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv64 = "crash oprofile"
>   RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv32 = "crash oprofile"
>   
>   RDEPENDS_packagegroup-meta-oe-multimedia ="\
> -    alsa-oss audiofile cdrkit id3lib \
> +    alsa-oss audiofile dirsplit genisoimage icedax wodim id3lib \
>       a2jmidid jack libass libburn libcdio libcdio-paranoia \
>       libdvdread libmms libmodplug libopus live555 \
>       mplayer-common opus-tools \
> diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> index 3b10e978ef79..132e8f26b88c 100644
> --- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> +++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> @@ -17,7 +17,37 @@ SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc7
>   inherit cmake
>   
>   DEPENDS = "libcap file bzip2"
> -RDEPENDS_${PN} = "perl"
> +RDEPENDS_dirsplit = "perl"
> +
> +PACKAGES =+ "dirsplit genisoimage icedax wodim"
> +
> +FILES_dirsplit = " \
> +    ${bindir}/dirsplit \
> +"
> +
> +FILES_genisoimage = " \
> +    ${bindir}/devdump \
> +    ${bindir}/genisoimage \
> +    ${bindir}/isodebug \
> +    ${bindir}/isodump \
> +    ${bindir}/isoinfo \
> +    ${bindir}/isovfy \
> +    ${bindir}/mkisofs \
> +"
> +
> +FILES_icedax = " \
> +    ${bindir}/cdda2mp3 \
> +    ${bindir}/cdda2ogg \
> +    ${bindir}/icedax \
> +    ${bindir}/pitchplay \
> +    ${bindir}/readmult \
> +"
> +
> +FILES_wodim = " \
> +    ${bindir}/readom \
> +    ${bindir}/wodim \
> +    ${sbindir}/netscsid \
> +"
>   
>   do_install_append() {
>       ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
> 
> 
> 
> 
> 
