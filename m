Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.17216.1626630413062683372
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jul 2021 10:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uaO2w1PC;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id o8so8223940plg.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jul 2021 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Ckdj83w4PPnkaP1YrfXK0963oSuUM+VHmBvqaXuLW6Y=;
        b=uaO2w1PC2C7D8DtuOJ2SZXl/w+Z2P08XnaEw9GtMSNKqhwZzIOi7ikmj5VFx4XAzAa
         EOKxVHDYD+4jpXrG91wsU4ouWnwmUtJTr0J669VWpG7Ihxr/ynL6pc5fqXYS5kpePWaV
         RD4jUlEmu7phL4JjNakqShhYvfme6DYZhwiradRPvr6tSeF1dknu172+kui+VeNzswjX
         vr0iCw4cbKPNEKoyBXj+aaXbAdjR6dwcH+GzO7KXqGMggqLuaBbdkV2hTuQdcMIlYG3T
         nrlOxPhvZUQj8DEuubbHG6Ym3r8SNIgc/9DzCz6NnyUOUFx7l88wZO0C8zCr9/IbLXXY
         KIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ckdj83w4PPnkaP1YrfXK0963oSuUM+VHmBvqaXuLW6Y=;
        b=N/+pyf2NDMFS9z/g49bgze6hIWl73eBTurnZ0BkwIkw7M6ASgL8joNgx6ZN2eu9KmG
         YGy+NKT+r/YsIImr08APN5DCBwmYp/inX6bFlDhOH2X/M0ck1rZh1aADcoubjBcMEtMD
         wx3nnvehYCJGZJFzoUzYCRd+lHu+rP9OwYcfom5SJgg+InTrlQ1L01nw52fvGJnEsC18
         6086nb2xgaMzB9ld1FyCB3laIOhkjOHyez/Co8B1jMNC6fHneP+5nFKXia+6Aq5G9kt/
         2w7juXZP6MaXLoiFgdhFkFsavbdU8BM1RAVFxQOym0zMBYFHUEAbCdd5NFWy6f3ZyNv7
         wSNw==
X-Gm-Message-State: AOAM530IfqDH22figAIgJIYufElrUeUJzLCu2+ja6yEO39LK0ayb4ETL
	Ka/div64d1vCs/YqwSq41EHPBPK57K8=
X-Google-Smtp-Source: ABdhPJzhFH5gU4c6AYqbbGCVfWX12jY25bLHrjnCAhQYKwi8SQ1mGNNyJcVb6BjQJKbo5/EEqQWttw==
X-Received: by 2002:a17:902:e052:b029:12b:491f:4eb6 with SMTP id x18-20020a170902e052b029012b491f4eb6mr16302395plx.81.1626630412409;
        Sun, 18 Jul 2021 10:46:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3b2f:89be:7392:671a? ([2601:202:4180:a5c0:3b2f:89be:7392:671a])
        by smtp.gmail.com with ESMTPSA id e30sm19459759pga.63.2021.07.18.10.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jul 2021 10:46:51 -0700 (PDT)
Subject: Re: [oe] [PATCH] layers: Fix git send-email instructions in README
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210717160823.12894-1-raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <fa4050d6-8972-0d7f-4653-dc4567d8e509@gmail.com>
Date: Sun, 18 Jul 2021 10:46:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717160823.12894-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/17/21 9:08 AM, Khem Raj wrote:
> This ensures that cut-n-paste of this command from README will work

with backport ?

-armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-filesystems/README     | 3 +--
>  meta-initramfs/README       | 2 +-
>  meta-multimedia/README      | 4 ++--
>  meta-networking/MAINTAINERS | 2 +-
>  meta-perl/README            | 3 +--
>  meta-python/README          | 5 ++---
>  meta-xfce/README            | 2 +-
>  7 files changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index edcf8bfeef..78a4429ce2 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -30,7 +30,7 @@ When sending single patches, please use something like:
>  
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=meta-filesystems][PATCH
> +        --subject-prefix='meta-filesystems][PATCH'
>  
>  
>  Table of Contents
> @@ -99,4 +99,3 @@ II. Misc
>  
>    --- xfsprogs ---
>    It provides XFS filesystem utilities.
> -
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 79244d43f0..a8f17ba859 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -23,7 +23,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org
>  with '[meta-initramfs]' in the subject.
>  
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
>  
>  Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
>  
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index b4c2455a11..9c649ff87c 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -9,10 +9,10 @@ layers: meta-oe
>  branch: master
>  revision: HEAD
>  
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
>  
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
>  
>  You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
>  
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index 5c4c4ce052..77e90668c4 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -8,7 +8,7 @@ When sending single patches, please use something like:
>  
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=meta-networking][PATCH
> +        --subject-prefix='meta-networking][PATCH'
>  
>  You may also contact the maintainers directly.
>  
> diff --git a/meta-perl/README b/meta-perl/README
> index 67f291079f..2419ae2281 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -78,7 +78,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
>  '[meta-perl]' in the subject.
>  
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
>  
>  Layer maintainers:
>      Hongxu Jia <hongxu.jia@windriver.com>
> @@ -90,4 +90,3 @@ License
>  All metadata is MIT licensed unless otherwise stated. Source code included
>  in tree for individual recipes is under the LICENSE stated in each recipe
>  (.bb file) unless otherwise stated.
> -
> diff --git a/meta-python/README b/meta-python/README
> index ca0a290d9f..df6abe0e2e 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -37,8 +37,8 @@ before posting.
>  Send pull requests to openembedded-devel@lists.openembedded.org with
>  '[meta-python]' in the subject.
>  
> -When sending single patches, please use something like: 
> -'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
> +When sending single patches, please use something like:
> +git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
>  
>  Maintenance
>  -------------------------
> @@ -47,4 +47,3 @@ Layer Maintainers:
>          Tim "moto-timo" Orling <TicoTimo@gmail.com>
>          Derek Straka <derek@asterius.io>
>          Trevor Gamblin <trevor.gamblin@windriver.com>
> -
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 70ad47a2d1..bbf4b2edf2 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -17,6 +17,6 @@ BBMASK = "meta-xfce/recipes-multimedia"
>  Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
>  
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
>  
>  Layer maintainer: Kai Kang <kai.kang@windriver.com>
>
> 
>

