Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.555.1626799511854539356
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6mokDRT;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id h1so11699345plf.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yu2J8yhmQUf6+Wvtd+3qKNr9CLwBZdHBXPlgJGnbQKE=;
        b=n6mokDRTmsf4WrL7m6Ph8u/DfmvavokoKiL04Aoh7SJxirH736E8KAIAxzZB+2ltSp
         LxIs1wp2dK6WH3Da0+5+rBFl8ZNZviKOH5gfNQHlV4mLR24qIlUQ7JNm4doHRlqUEXfB
         mT5ZDWQhGWwFBroLPEv5V9uaoBjBiP/5RXLhL078IDxL5R7DEydX14hdu/dZngAtVOyB
         Idkykc/lzfy/hYnJiRCEXMZoGBcuJDfDxLDV60OJ8ICb+rCJO9vuqPnbcj4HigxXy+Q3
         fZkL1BAgsgEfBwWA+mLhajXtGgmIrkdE35FfJ6Odjmk3OxA1HdTx0MtUzPvVYvKciYMH
         7+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yu2J8yhmQUf6+Wvtd+3qKNr9CLwBZdHBXPlgJGnbQKE=;
        b=d5DcT9UAyfh3+VLEuEpAXNAtyy4PQfhSH6lVJrmDsdESrIWdtkr9uHd5EANrIP3rMY
         IDIV04Aimm/mzeXUlBcaihMn8VX9/xaJciW1Wsa/ydXbfaS8NxLZ7D9rXsxZh8Jn2pyW
         OdDJJ5BZZiQOxAhxBmyhnfxNM7HhFE4I8ziyxRr7j1oZUNPiqBe8QNCj/WiEawwHq6gc
         aUoyauXf42mdl3+0YXC5/9nWSQOYWUbHelWtaPCv6e5pcjmFS36u1bowhL7N54o6c5eq
         jb/jrbHAI72JRHxhSuBX4lm3/E0lcu9aT5l+vQN5saR+WswS4ceCaT9JMvRtSmw+SWEN
         w/yw==
X-Gm-Message-State: AOAM532Yz58k84sqx7j6j04KRZx4pdzBbKnFT1pgm4hse+faQDGewftP
	4cISDolgOBfmDCN8ubtu8GxriJOaSdPoKA==
X-Google-Smtp-Source: ABdhPJyrXdkJB6RPFeiuio88kKt/8PsWUIkxUbaySlx9dE6ErSj7twph3yEdg71rT6a++zDBO7ZWSQ==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr30565337pjj.233.1626799510908;
        Tue, 20 Jul 2021 09:45:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d8a1:9261:489d:7116? ([2601:646:9200:a0f0:d8a1:9261:489d:7116])
        by smtp.gmail.com with ESMTPSA id z6sm3446837pgs.4.2021.07.20.09.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 09:45:10 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] lvm2: allow lvm2-scripts sort rdep to be configurable
To: Peter Morrow <pdmorrow@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210720130412.733320-1-pemorrow@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1bf5f71e-841b-e4ec-03a4-d6d75b4bfe0c@gmail.com>
Date: Tue, 20 Jul 2021 09:45:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720130412.733320-1-pemorrow@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/20/21 6:04 AM, Peter Morrow wrote:
> By default lvm2-scripts has a runtime dependency on coreutils to
> provide the "sort" binary. There are alternative providers for "sort"
> such as busybox. It isn't desirabled in some cases to pull in a large
> package such as coreutils when busybox can provide the sort binary. This
> patch allows the dependency to be changed to something other than
> coreutils.
> 
> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> ---
>   meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> index 7f3f000e0..fbf424f44 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> @@ -69,11 +69,15 @@ RDEPENDS_${PN}-udevrules = "libdevmapper"
>   RDEPENDS_${PN}_append_class-target = " libdevmapper"
>   RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
>   
> +# Select the runtime dependency for lvm2-scripts which provides the "sort"
> +# binary.
> +VIRTUAL-RUNTIME_sort ?= "coreutils"
> +

if coreutils is pulled in via other rdeps then this will be ineffective. 
Secondly, it seems more like a global setting instead of per recipe 
setting. Maybe turn it into packageconfig

PACKAGECONFIG[busybox-sort] = ",,,busybox"
PACKAGECONFIG[coreutils-sort] = ",,,coreutils"

and then default to coreutils


>   RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) \
>                             bash \
>                             util-linux-lsblk \
>                             util-linux-findmnt \
> -                          coreutils \
> +                          ${VIRTUAL-RUNTIME_sort} \
>   "
>   RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
>   
> 
> 
> 
> 
> 
