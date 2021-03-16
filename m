Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.4785.1615875673196742587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 23:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HWceIq+h;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so3116277pjb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 23:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hAF3lZNYyFJSBKChXKPReb8QaQbzs3yjx3qdFkpDjD4=;
        b=HWceIq+h9ABNj8F305w6hKVV9/070oUqshU1AQhxsDXzRgoZpv1RCiQImT7IdOGeBC
         ZUUX3m9N0I3Q/hsMoF8FZkpvZuuXfZ8sf8sm9ov0/25ZU64XVIsrY1yGh3YR0wP6XiwE
         Xx9rK89pI1rUZ3raHwJ4nfXYGqAJ98OvfoODOYy9sFOKdGRK2JO/TFRoHBXnyvPO1CvG
         isAGFs9ERzJ2oFToyNNv/rWucJgt+5vORJoAJQo4h7oaYjDulUaUx8gWFpjl4rirYZzh
         bd7xrnhqtjkQm9Sj80MuDozn9dAq79Nmg0yS1fS4GR1gcxQgTiV/4+iwOzcwQyZriA1X
         vfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hAF3lZNYyFJSBKChXKPReb8QaQbzs3yjx3qdFkpDjD4=;
        b=eLb2B1MwnZQiYTZnsywEgPMb6GWNMQCEcg81AptFU9jsMvlKyH/L07w3/FD1ZuUUO9
         EOugPogq+IePbURVi0eXK4dWOHN+QxBGddDgixmndc7sXIjotn++lemDakbpss/OwrA6
         DMdvwhtU9sLCGFjdAPmeoiIVHTzwDLYtSzc9YNj+Ir4UlcLWX+XQFgzu/di8LjTgYIx5
         FEWc1RdFbSzPdUxR+sBhdocAy7L1bduzbBK8No0WRhoE8zXFdkMAxr4qdihVmLfYyutJ
         ZWDy5afuT67RRLzDpak//0DumLyPKzaTcOMOisd/6LNqdVc8quS+DDvok5/K3V1GD4Mh
         BV5g==
X-Gm-Message-State: AOAM5302uAvwe0OCuNwnBi1o8LT/wbJYcbEVC00no9kMbYPX83qcWecb
	IDiFkgiuNSATfa0/ZMDg/RM=
X-Google-Smtp-Source: ABdhPJzPcwRhOBw3nNhEjtqPMZkyMDJ+InUBdy0uaVx2IUYLFoDucLDvAkmz6Qd6Fc25pLHXm26TbQ==
X-Received: by 2002:a17:90a:c201:: with SMTP id e1mr3215334pjt.30.1615875672454;
        Mon, 15 Mar 2021 23:21:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7b3a? ([2601:646:9200:a0f0::7b3a])
        by smtp.gmail.com with ESMTPSA id d14sm15481768pfh.42.2021.03.15.23.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 23:21:12 -0700 (PDT)
Subject: Re: [oe] [PATCH] python3-pastedeploy: Add recipe
To: DPringle@digi.com, openembedded-devel@lists.openembedded.org
Cc: Devon Pringle <devon.pringle@digi.com>
References: <8ddd144d-8805-ddea-dc2c-6a4d0024544c@gmail.com>
 <20210316052716.1950548-1-DPringle@digi.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <846a6a1a-f690-5cf7-e04d-9aae18310d1b@gmail.com>
Date: Mon, 15 Mar 2021 23:21:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316052716.1950548-1-DPringle@digi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks for follow-up, It would be good if you added Singed-off-by lines 
as well as described in patch guidelines see 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

On 3/15/21 10:27 PM, Devon Pringle via lists.openembedded.org wrote:
> From: Devon Pringle <devon.pringle@digi.com>
> 
> ---
>   .../packagegroups/packagegroup-meta-python.bb |  1 +
>   .../python/python3-pastedeploy_2.0.1.bb       | 26 +++++++++++++++++++
>   2 files changed, 27 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> 
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 4512f839f..9530c7201 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -251,6 +251,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-parse-type \
>       python3-parso \
>       python3-passlib \
> +    python3-pastedeploy \
>       python3-pathtools3 \
>       python3-pep8 \
>       python3-periphery \
> diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> new file mode 100644
> index 000000000..b7c8c61d2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Load, configure, and compose WSGI applications and servers"
> +HOMEPAGE = "https://pylonsproject.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c"
> +
> +inherit pypi
> +PYPI_PACKAGE = "PasteDeploy"
> +SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
> +SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
> +SRC_URI[PasteDeploy-license.txt.md5sum] = "1798f29d55080c60365e6283cb49779c"
> +
> +S = "${WORKDIR}/PasteDeploy-${PV}"
> +
> +inherit setuptools3
> +
> +# Uncomment this line to enable all the optional features.
> +#PACKAGECONFIG ?= "paste docs"
> +PACKAGECONFIG[paste] = ",,,python3-paste"
> +PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
> +
> +DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
> +RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
> +
> +# PyPI tarball is missing license.txt
> +# We will need to keep retrieving this from the online repository until version 2.1.0
> +SRC_URI += "https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt"
> \ No newline at end of file
> 
> 
> 
> 
> 
