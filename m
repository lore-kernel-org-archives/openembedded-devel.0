Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.745.1615909301730147710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 08:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k533xvDI;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gb6so10836243pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=f9x6vtfgolDtIIGiarL5jPNtIYwn+LHBkBAzYwJutJE=;
        b=k533xvDIiGelbkUKmSJfB/+6ig7clRiJyz3UA60gvP/yAjAAyGRkW/ZlBqM9MuJ6ZP
         XGd1gCNEd5W+MdsqutCf8iX0jPdL+BZduczIDR0+YTxwsPqvYklB3uAHR0w0Zn450I5Q
         T37qJyaAcVTMw9tUUAFKBeRgHow8QeTkzoBlPhLkG0LU5F8h/HwJt/uniq1uV1Vn/UKU
         o7FwYH0bKNwhIoPYBwcPK305VQEWh7aUAkazDuBuXcyLYAz0/8VzWXGe/aDZyQDXrQJz
         C8bNgRSe4cJ/6ogvU1d6VJ1oyqv08Om5PBCA3SFbRpR8NeBku8Jx+yJGDd3pFcdpJiQR
         dXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=f9x6vtfgolDtIIGiarL5jPNtIYwn+LHBkBAzYwJutJE=;
        b=af/L5mFBUlr4V66neSHcwS2IN9AOa9YNMCz4tJvlBVBau01ivxfLFNjIIaaKz2o2xO
         jsSwSna1i7lhuVElNK8rtzRarS3uCq6DQqdGfGCTGm6tX9/8Yvk3LT7u+Tw8KSNeaiaW
         Cq245i99cf+vmMz+t7EKHgxma2EvdssTYa5cx5aYtEF9PWcShOriwYEGQ1oDkCrT87/H
         PP2Udwc2mRUy9d2nT4DSb7vGAmiVHgmoUoBeU+f1LKegMuR95oiNgmlR8Ux9sbTG6hQS
         hv0vjeBKZ+6f9vVF8G4WWS8sRHM/dkXjxp0E3cqr7iCW8XYfxUDMIpqGMcqpgfQvFP/y
         27zg==
X-Gm-Message-State: AOAM530UwBK5xYpu6f8eeRFAqcWqLeZMUAsCpPozO5PBuq3NeqYYXtcp
	ODTcOws/r/eNaEOs20CvIJ+h0wBScFY=
X-Google-Smtp-Source: ABdhPJzhjvWTo3teteIYiy+y9CONLDn4DNo9+sBt9BL5fZKUT2BK0v7Zvp26KshteG7YNMBaiPyaSw==
X-Received: by 2002:a17:902:b7c9:b029:e6:3d74:5dc5 with SMTP id v9-20020a170902b7c9b02900e63d745dc5mr192540plz.16.1615909300512;
        Tue, 16 Mar 2021 08:41:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:25c8:44cd:2453:cf2a? ([2601:202:4180:a5c0:25c8:44cd:2453:cf2a])
        by smtp.gmail.com with ESMTPSA id t4sm3396261pjs.12.2021.03.16.08.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 08:41:39 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell PATCH] thin-provisioning-tools: switch branch from master to main
To: praneeth@ti.com
Cc: Changqing Li <changqing.li@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315011408.6604-1-praneeth@ti.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d3134ab9-7a6f-584d-0e92-4ab1bccaba36@gmail.com>
Date: Tue, 16 Mar 2021 08:41:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315011408.6604-1-praneeth@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/14/21 6:14 PM, praneeth via lists.openembedded.org wrote:

ah, the subject messed with my filters. I need to fix that

Khem,

I am going to fast track this to dunfell.

-armin
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> [cherry pick commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfell]
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> index 9f89bac22..3f82734ac 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> @@ -7,7 +7,7 @@ SECTION = "devel"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  S = "${WORKDIR}/git"
>  
> -SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
> +SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
>             file://0001-do-not-strip-pdata_tools-at-do_install.patch \
>             file://use-sh-on-path.patch \
>  "
>
> 
>

