Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.4164.1593038285901588761
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 15:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g+ZzHgk/;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id bh7so1756665plb.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2020 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Inr8exr7Kxvt91ug/gZ1fYHsNHbjyyqFq9mlhrpiPlk=;
        b=g+ZzHgk/JcspOH+ITtrWuHcSFDusFKwQL2KKghnO0tFmRwPFIsfDyuNbEThuZyQZu5
         ktNkmiBUg0zouoncK2PgjwcSSiz5qSAB+JXhkRA8iHiJH3aVrpB2AAi2eOLXDYpnmgQM
         hwJoveG3/aks/HPXGTNpFNH50LRdi/fINMBRKJZBd0fjSRInZWYJRB7h2pQLEdOFSOWr
         07wmYo512nTrAfPNbsF8exe+EEjWP5bzWtNJg5pPWYaaBEC9CCh7nkeLoTPSL7fd/PtT
         TQa4AfWx2ptRMnocBbi0RVLDZIsK87fm7XVZRR0FDTDXxOn4hx9O18uG4MV0CIb7En1T
         mxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Inr8exr7Kxvt91ug/gZ1fYHsNHbjyyqFq9mlhrpiPlk=;
        b=NrjDzhvm1+pp37Df9OrMlpF0b4Hzv8ZfZvbhd2BjKwA0LC2Hh6Wq5ORJII2NZAQFds
         3WzZfDl2WklHGQlFtPsGVOY9vu0oEHJryOyTAYGOn7VnJAya5rtrrfxklf6A/YeBVhuY
         jp+JCnupwEXz3tMeidwWojTahc4NsLciBI5sfTUp6zvenrxm2dtUBdF0aQg69Zfk0aS0
         BeX1Octy8vviYMoyMQxUpZULpCK1lj0nCqXFg4FI4Zy1HZbSxHDna3UQCeHaPa+I4fvA
         hgl6w+AbKABaMlnXp3itB5SAlBheCmzStf660qdoLy+LFA/HnIn/ByVVKXw52lcCAuQt
         jVKA==
X-Gm-Message-State: AOAM530Ktp3CN6CBSs5eflCiQGO+ZfW/hRt0i80zUQEZfC3Q+GP1dvgR
	xplwYLFZiu1dDiQuzlRRFcalF/J5rCU=
X-Google-Smtp-Source: ABdhPJzIvmdXPkCEV63mjvXNpa/r4dReNNpXnX10HmmlTHeYSn4WbK5QztPQkAL+YAeLuSawJYmDtQ==
X-Received: by 2002:a17:90a:7643:: with SMTP id s3mr31151634pjl.183.1593038284827;
        Wed, 24 Jun 2020 15:38:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:15eb:110c:bfc6:4796? ([2601:646:9200:4e0:15eb:110c:bfc6:4796])
        by smtp.gmail.com with ESMTPSA id 21sm1750773pfu.124.2020.06.24.15.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 15:38:04 -0700 (PDT)
Subject: Re: [oe] [PATCH] Revert "packagegroup-xfce-base: add RDEPEND packagegroup-core-x11"
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624201148.3151718-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <8b3194f0-a359-90af-1b19-065326c37b48@gmail.com>
Date: Wed, 24 Jun 2020 15:38:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624201148.3151718-1-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 6/24/20 1:11 PM, Andreas Müller wrote:
> packagegroup-core-x11 drags stuff not everybody needs e.g xserver-nodm-init and
> that's not what everybody wants. packagegroup-core-x11 is something to add into
> images.
>
right, I am fine with this change but

> This reverts commit 394567c0078c627642e7b80b722f147da5a6f376.

Can you also address the original issue this commit was fixing originally

> ---
>   meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> index 6ddf8ee91..70ef909ef 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> @@ -7,7 +7,6 @@ inherit packagegroup features_check
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
>   RDEPENDS_${PN} = " \
> -    packagegroup-core-x11 \
>       xfwm4 \
>       xfce4-session \
>       xfconf \
> 
> 
> 
> 
