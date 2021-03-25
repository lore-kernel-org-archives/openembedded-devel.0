Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.1136.1616695939769893736
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 11:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GvR0Cvlg;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id y32so1470255pga.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BqYOAp91hCpTexfiequaOZAZkf30AHKyd7emCO5jn9g=;
        b=GvR0CvlgAbQZC5V7Q3xn1+fwGNgv5GihppOBLpFwISTNINv3zwy9mDShlWuXraj1mR
         8wi76tFfEzh/lkCdQpEcyf/vyaenK3mhYKKoy6O4iGlUQuoKagToQD6Ttk2kJ9CWzbUl
         DPBtNts7KHIIKc/DAFKYaj4J99Pmk0YGkJa9om2BFsDICKF0+7QEdJ8QzgYVETwYapWo
         R8vQ+rdoVS2jZGP/MjgaRcljUlddTwhOGiM/B7aALbjSCv5e1TvUFfWhA/xjKFACmqeb
         igxV0Vfo55cYKQnevdzsCoNzQYDpl7yHHhtbnTM8aauZPyuEtWAEC55SEB/G/Zwwdpdx
         UwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BqYOAp91hCpTexfiequaOZAZkf30AHKyd7emCO5jn9g=;
        b=Oein+nL/phPUVxNueCoYlJr2d+pO/6Cv61cc5sD8wZ66elYcdBZlW/M83u79KojYah
         WwLvrSDn7I4HRT+jJBIyw9AqKwf5vg3fnMf7Hr6AbLy/RB/lCmVOeSNa49y6H/xWi/Kn
         4Bbqp++UWEvM5Qfuq1mJtqclh0iUm6GFK5khC0GrsDEHOETZQFjPGATAP6JuM7VD1wMN
         nY37GYJKCaQVy+v9OBthvSs5Z6ReErMlcETtGhzs5PD57Nfsjt1fvYI0ZStmb/j1DuKp
         rl3xARxvzOFJfa4My7yqsm7nCBXKolNbt1FFdgQsLdDr/+zzKRwKYNmAcYT1JRJ/bySa
         DlvA==
X-Gm-Message-State: AOAM533t2oPInj7tXl+J9CGgNyiRlvI+DH25dzlvZBbE3n44AXEyelwC
	EmnN2cYDDMMSFmR/bRc+qPrq7uRcQjxoSw==
X-Google-Smtp-Source: ABdhPJyNV1T3aDPtfiQaeo3jGBQtSwFlmMYN49OI4YY9xnig8VN8D2QXUWsoVZGPzxswkXX6Vspr3A==
X-Received: by 2002:a63:1402:: with SMTP id u2mr8527020pgl.417.1616695939020;
        Thu, 25 Mar 2021 11:12:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:941c:402e:75f3:dc06? ([2601:646:9200:a0f0:941c:402e:75f3:dc06])
        by smtp.gmail.com with ESMTPSA id w18sm6099229pjh.19.2021.03.25.11.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 11:12:18 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
To: dzagorui@cisco.com, openembedded-devel@lists.openembedded.org
References: <20210325161828.41393-1-dzagorui@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7f3a1c21-5425-c29b-ebc3-5c6363905b3c@gmail.com>
Date: Thu, 25 Mar 2021 11:12:17 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325161828.41393-1-dzagorui@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/25/21 9:18 AM, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco) 
via lists.openembedded.org wrote:
> Have not seen build issues for 5.4 and 5.10
> x86-64 kernels so allow to build it
> 
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>   meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
>   meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
>   2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index c717d45e5..6f7e6fc74 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -608,12 +608,12 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
>       trace-cmd \
>   "
>   RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " intel-speed-select ipmiutil pm-graph turbostat"
> -RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat"
> +RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat bpftool"
>   RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
>   
>   # Kernel-selftest does not build with 5.8 and its exluded from build too so until its fixed remove it
>   RDEPENDS_packagegroup-meta-oe-kernel_remove = "kernel-selftest"
> -RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash intel-speed-select kernel-selftest minicoredumper turbostat"
> +RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "bpftool crash intel-speed-select kernel-selftest minicoredumper turbostat"
>   
>   RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch = "makedumpfile"
>   RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> index 1758430bc..e58bdd493 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> @@ -32,4 +32,3 @@ python do_package_prepend() {
>   }
>   
>   B = "${WORKDIR}/${BPN}-${PV}"
> -PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
> 

you need to set proper COMPATIBLE_HOST here too.

> 
> 
> 
> 
