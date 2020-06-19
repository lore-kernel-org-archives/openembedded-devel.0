Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.10286.1592582502350003908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q15KHGqF;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id y17so4081925plb.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 09:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IqowMNtrXhhrGaHGaOz7DA2nsekB3dVhYCDLtprRCK8=;
        b=Q15KHGqFfwB+b5E92v6auPENXsv8heoLZFi/OjanAxilhrQFo67goKVCez/kVJmkF1
         HIU7lB3t397x63LEs96OWAwLj4mC+MDvld8K2QzUQQsAvfdzOMYNc99Deg7CXQXcIcA3
         CDCm1bSgz/WXrqgoBF2EETdrGSDNBGH5J60rD8O9vwmre5yZvTHtJxUPGZL8/6IwnLcQ
         j314urkVcZbvSUegIaLOPo31bYt0zuVWHpLO/kcruAyq+6sq1QmF8WuvjfmHB0Ou4RRw
         u2E7GYE9cv09Vzrq3pfA2C8GtcSgEZWa+wweF5IsLngF3Cc9C8BS/sqaKxOhf5XYrGpa
         KAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IqowMNtrXhhrGaHGaOz7DA2nsekB3dVhYCDLtprRCK8=;
        b=MG1T7GvWv9jUsMCdlsT44ZRXjUsy+c0QAVGwQOGS5FeENOcLrf076FaNIUgewEg7Be
         Vem6BUZGLrsOaS/ag9qNTEev54D1sPVwp/yQCJio4WZnB8aREdzrUKYtBMOo8uPIbQsR
         hiBgSly1ow2hKG0Hq0CAYump9OfTNzQTE+VVyuGhX/tQYmxHl3ZMRKa0YVQdkFQn4yPs
         zNRiSj3yv6u/1W57tnzxYagIF8K0R8P1Sv0ygGtgFd4Sp8a/M8cCP8uDpDAoW0vShP19
         4N4F2xbjUIRSaHuvloFCZTlfUYDS2MNQL4+wbF60yu9ghDQ2Za9cXmAYQ5078HH/yZ0N
         ApfQ==
X-Gm-Message-State: AOAM5316hIy26vwu+er6958lG1epnvkB8tUufMtRRQZR/ntBfjhWEIYh
	zy+94qLiWCx8v9K2poxCBiU=
X-Google-Smtp-Source: ABdhPJyE/cNNTdQ1Xu0VWLpdcgju5/QPH27moiH2+K5cmG/JYW2dBDjiGFA48Rm1wDpi+h/FUj6crA==
X-Received: by 2002:a17:90a:fa04:: with SMTP id cm4mr4171522pjb.218.1592582500644;
        Fri, 19 Jun 2020 09:01:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::dedc? ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id q16sm6383224pfg.49.2020.06.19.09.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 09:01:40 -0700 (PDT)
Subject: Re: [oe] [meta-network][PATCH] squid: upgrade 4.9 -> 4.12
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20200619154506.43803-1-adrian.freihofer@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 mQGiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdLQdS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT6IYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
 Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
 4evWolFf5cMmp7kEDQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiiEkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Message-ID: <2345fb9e-e2a3-d89c-5978-6cc33168456b@gmail.com>
Date: Fri, 19 Jun 2020 09:01:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619154506.43803-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Adrian

On 6/19/20 8:45 AM, Adrian Freihofer wrote:
> ---
>  .../recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb}   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb} (95%)
> 
> diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.12.bb
> similarity index 95%
> rename from meta-networking/recipes-daemons/squid/squid_4.9.bb
> rename to meta-networking/recipes-daemons/squid/squid_4.12.bb
> index 19949acd8..6e49790fe 100644
> --- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_4.12.bb
> @@ -28,11 +28,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
>  
>  SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
>  
> -SRC_URI[md5sum] = "b315d0dce37627dfe61eec7f5304baaf"
> -SRC_URI[sha256sum] = "0f5829d878002147e7c4d9b8901c2c3c051693465e82e45cef9ab0e226e3e729"
> +SRC_URI[md5sum] = "5d058f7f8f1db9fa4ce3db910a008b0e"
> +SRC_URI[sha256sum] = "eae0ad993921e472ce36cce34674c47a224fc2868b65ef0c4b41b2f5f18378a0"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://errors/COPYRIGHT;md5=19cc4dd146f397e72f3ff6f9f58fbfbe \
> +                    file://errors/COPYRIGHT;md5=4c3268f394af77fbbf541875cef96a6c \

Please document the reason for this change in commit message as well.
See [1]

>                      "
>  DEPENDS = "libtool krb5 openldap db cyrus-sasl"
>  


[1]
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describing_license_changes
