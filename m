Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8577.1626450902540355114
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 08:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gBXwssAN;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id o8so5503437plg.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fM1DySd4NJgvGPCNOC3DtjNgyVTZYA2eAboN89sLDQA=;
        b=gBXwssAN+0CM8BZxwiyotqq5PZ++YrSva+2x0AWBHw7RG/l5kdC+aVbaYeAP5aVNwJ
         XKsgOYz8/vTd2ny0zMICZfJOepJMm+IEI+4eXNiKEaQYjdiRen8R8+IH10K4h2olr9lK
         UcNwIS+M5vrYqsHzcU+jXf141ryJkrSx8rnZ4Rnt/UTwLpamAxay4yJqGI9cZXVOJbko
         De56BQhSv8gQnt4OY/funPG47DaHh2df5H1s/srhucjr+ttx5UyGVXMaPz6EChJdeDZb
         1TnYDTYTxetmcGBCXuQYpdnjb6q4J+uJXGgpZl64EWQWcwj+e9dMdbcIqQ9E4sIrxcLs
         5LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fM1DySd4NJgvGPCNOC3DtjNgyVTZYA2eAboN89sLDQA=;
        b=XS+hlfkl62oBFC/+ZDkJa3Wggw5APuuVrdEUWHFY31McPjBUvU0T60tZ0X3TvgT1/P
         k0m9pBhyDOIEM3R9vP3FbEzR6NyA3buYnksmfxDiydiIqdcyRQdfxtmiaeBlgfyCUZI8
         46+iBKIU7M1acQbUn77r0n4sMLjh+rtPdN0DjwmiKiZdy7zrR3HPFs+xMCH+lCsMr22h
         Ic5Cm5projW+pUKlcuhz6b+T9o16CjJJfheaa2DR+eFoEbGjqemyCLb1jNQe3Wh+QoXA
         jxrSLJgo+7YX0i2fPFFLWrJlxVuqnSIMrGJPNi8XcyNd+0u0GhSz7sfmh0wl9ld1roFw
         lcqQ==
X-Gm-Message-State: AOAM530lb1xgWXz7OXN4PfaL3Hj76+EwuIVud4ubuVX1WnOpV8UGAQT/
	a3pemgzH2IQeMGt8Gwy07ZEvPR8xkxNISQ==
X-Google-Smtp-Source: ABdhPJwazCJpiQ4JQc7qc+J1PODUEJzsTA7PdpNUSjK8fpS0tfEeAlwKHxjW2PdMnCimtAOgZvOK5A==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id lb13mr16207116pjb.221.1626450901387;
        Fri, 16 Jul 2021 08:55:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:e860:da2d:adaa:e2c1? ([2601:646:9200:a0f0:e860:da2d:adaa:e2c1])
        by smtp.gmail.com with ESMTPSA id 11sm10658001pfl.41.2021.07.16.08.55.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 08:55:01 -0700 (PDT)
Subject: Re: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.143 -> 2.4.144
To: openembedded-devel@lists.openembedded.org
References: <1626416951-107506-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e6afb711-846b-f7d8-d496-3090fd8d37ae@gmail.com>
Date: Fri, 16 Jul 2021 08:54:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626416951-107506-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Thanks for your contribution, this patch does not have right encoding 
and as a result it does not apply when downloaded from mbox

Content-Type: y

it has to be manually edited to

Content-Type: text/plain

for git to accept this patch. Can you check if this is problem on your
sender side ?

On 7/15/21 11:29 PM, zhengruoqin wrote:
> v2.4.144 (2021-06-07)
> ---------------------
> 
> Changes
> ~~~~~~~
> - Bump version. [Raphaël Vinot]
> - Bump object templates. [Raphaël Vinot]
> - Bump deps. [Raphaël Vinot]
> - Bump deps. [Raphaël Vinot]
> - Bump deps. [Raphaël Vinot]
> 
> Other
> ~~~~~
> - Fix misp API response content parsing. [Silvian I]
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   .../{python3-pymisp_2.4.143.bb => python3-pymisp_2.4.144.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.143.bb => python3-pymisp_2.4.144.bb} (92%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
> index 1e3ef27a79..1e97b27aed 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>   
>   SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
> -SRCREV = "c2e9663765e83f1a4aa70099546bec653ed770e7"
> +SRCREV = "7dbaf665d9288f2a2692bee3d6207bb6abe3c51f"
>   S = "${WORKDIR}/git"
>   
>   inherit setuptools3
> 
> 
> 
> 
> 
