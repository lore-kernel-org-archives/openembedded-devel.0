Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.2278.1596086511607761665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 22:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lrp8bgDF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u10so3657263plr.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 22:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=dLVby2+rsRC9KENWg3Py+3RcAy8K9iYZXHQU7Xt9/ec=;
        b=Lrp8bgDFj4TMg+TSsaMypedD1FHKmV098njqR51Oh8VFe1w0rG/kUPDvENB5mIh1n8
         NcwR1ELrDw3tI5ZQHtMo6nkUvZLtGusaQQXB4WVuKGo/6QHA8f+yhkVJJHyo+YrRCPEm
         JpgNj1wuys3cwPGEy5IeTus1OHpU/i7O7e/GuoeMIPfoNzGHn3il+WQTjWTRLeciy2yM
         FPk1Y9Mo+qw8HLxHJYCCJAKE0YI+Q+7ImdF2HCF/9+A9bC2UYcyc+w/Lj0Rm1yL+7pWV
         d44Xa/DeQ1iiwQSNh/1qUfND4QCyvndpTDye2MwsKf1Vx+VYCelot4AsR/5Oy3KFDp1b
         7znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dLVby2+rsRC9KENWg3Py+3RcAy8K9iYZXHQU7Xt9/ec=;
        b=iy/ACYj5hEle/hpuzU36fy7BixALQwPK1rSm37xs1sL4nKkjnW58xdAANeQo590h3Z
         r6EYJ+Aul5rXZ5G/Hk0NWyx1XUdbaj1qZPkhbzrI95BT76/xsYtlWvrGgqPnDtikUwwu
         1vmo497CweAcxBSFTqp+eHVvHH2zI1eBXRYu2TjO7fQr7258DtRD/I702+mNC8wECU9i
         iC776eFMB4o8/FzBkt7M5VLCAOuGA00gju9/fvEhOYNfWCz+WbFqsN8vKT3ak/gEHlrK
         ckLqPJx54um0x9oGdIFgVmw3IDsSINeoS9jfSaoAfseYXY5JN657p0dOTkkmJtuK25ry
         +C+w==
X-Gm-Message-State: AOAM5305unDYXa8x9KJevIRUPsy/g1qp6DhOOW53kkWq9CTyiqK6X+dp
	dvs62l68RIUp/qgoNqcfE/WP5ig2ofQ=
X-Google-Smtp-Source: ABdhPJyjR4yN5/3J10frzoY5lVoBwmeoYKCi6XxypqVYr7kt+9bd8b+EeB16SIMP5+ooHUbXxUEVQQ==
X-Received: by 2002:a17:90a:b63:: with SMTP id 90mr13938744pjq.47.1596086510659;
        Wed, 29 Jul 2020 22:21:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5ba:2655:68eb:112e? ([2601:646:9200:4e0:5ba:2655:68eb:112e])
        by smtp.gmail.com with ESMTPSA id x128sm4173590pfb.120.2020.07.29.22.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 22:21:50 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-oe] broadcom-bt-firmware: update to 12.0.1.1105_p2
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20200726100352.3964129-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <9e726b0e-ddd1-3a3f-8320-2acaf85e9b58@gmail.com>
Date: Wed, 29 Jul 2020 22:21:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200726100352.3964129-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/26/20 3:03 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   ...firmware_git.bb => broadcom-bt-firmware_12.0.1.1105_p2.bb} | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>   rename meta-oe/recipes-kernel/broadcom-bt-firmware/{broadcom-bt-firmware_git.bb => broadcom-bt-firmware_12.0.1.1105_p2.bb} (96%)
> 
> diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
> similarity index 96%
> rename from meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
> rename to meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
> index 8c474ecdc4..010bbcb4b4 100644
> --- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
> +++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
> @@ -10,9 +10,7 @@ NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
>   SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git"
> -SRCREV = "c0bd928b8ae5754b6077c99afe6ef5c949a58f32"
> -PE = "1"

not sure if we can drop PE here

> -PV = "0.0+git${SRCPV}"
> +SRCREV = "1af1116f73782951bd7bbe2139928e497c3a634b"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
