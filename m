Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.3882.1630159910034565374
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 07:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H6YETp9S;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s11so8694510pgr.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Aug 2021 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=XQZsCWqY2zqobgViGj+q+/DaGJ+0KEiV8ZsvL+8z0Pw=;
        b=H6YETp9S37g7ezB6LI5RHsa3nji/pTwQOVt96B6ecX5eME4e7GZnt8ZSvaUCailJFx
         9rfBId62e0Tjrb92sZMJU7Rdr4ub5KVudfCZGRCv7aa4u+SQV28HT8+o5fdx8UjwSoYg
         gYCU+cG0GBHUwBGcATvOIH2tzaJovO3/aZFb2p0UPWL1ctg+bXRUu3K2EGWfmn6v50CR
         JK9RFYNt0CUZeS/UxKB/Z6bHX9UFIPMsEN/kCfjoin8PA77imaQls3sCATftzion5LLS
         jVlVzu0rJXCB/yBopdvvXfkhvqJloC7kslwdMr5BYif+B5PU3RB24vV0/sSm3Iwrkr3J
         Vyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=XQZsCWqY2zqobgViGj+q+/DaGJ+0KEiV8ZsvL+8z0Pw=;
        b=Y9BFbP8d091sMwrcNdpOv834A/Jgnk2pLanHJPWbKHNzIkxY3a0L69Qi9n14R73tMm
         Ff3zPF0esd3mcjPuFXTVAutjfgshjUbAecBuWcD0zB319abjBkXC0rp+XxY1J12AJQk+
         3vBNBOURPVu7KcGzRIPGBiENN/VZOgtLA1cBtFM10AI3Jajk5yfqKbuzHrv/et89uOb/
         8K0Dq6YJBku45jqfamHJJRLeGT7Z1F6ltrmuTU0l3xkpL6TlAE9DKrWuE9fuTl29g6QI
         KEw4is+8RjDyWpPb+3myRfp/cxyui1PKlbBPl4xEm0kf9hOiTBSQMbjxaOT3iC9UX9eZ
         XYvg==
X-Gm-Message-State: AOAM5307KWI6Ff+qHJLlb1s8PlBiTR5LhX4hwfDHfuWVq0b3BobtEesm
	mSNQY1KlKl/Fze/ioWLmYmx3iN6JkILN5Q==
X-Google-Smtp-Source: ABdhPJxuc8jSOaGZ9NbF2W+Uqa0UtHFdm3BiXBxwjxXIAC30oUGGmLPeSmwAiJYgnM4wPuDm64gZWw==
X-Received: by 2002:a63:c147:: with SMTP id p7mr12545623pgi.247.1630159909595;
        Sat, 28 Aug 2021 07:11:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:718a:f86b:7e24:3a01? ([2601:646:9200:a0f0:718a:f86b:7e24:3a01])
        by smtp.gmail.com with ESMTPSA id f24sm9628897pjh.15.2021.08.28.07.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 07:11:49 -0700 (PDT)
Message-ID: <b7f3d268-2b9d-c081-87e4-65967d4d2632@gmail.com>
Date: Sat, 28 Aug 2021 07:11:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-cached-property: Add recipe for version 1.5.2
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>,
 openembedded-devel@lists.openembedded.org
References: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
 <20210828134727.277771-2-vesa.jaaskelainen@vaisala.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210828134727.277771-2-vesa.jaaskelainen@vaisala.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/28/21 6:47 AM, Vesa Jääskeläinen wrote:
> "A decorator for caching properties in classes."
> 
> Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
> ---
>   .../python/python3-cached-property_1.5.2.bb         | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb b/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb
> new file mode 100644
> index 000000000..6f9266325
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cached-property_1.5.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "A decorator for caching properties in classes."
> +DESCRIPTION = "Makes caching of time or computational expensive properties quick and easy."
> +HOMEPAGE = "https://pypi.org/project/cached-property/"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=db7ff60c4e14f58534201242803d8abc"
> +
> +SRC_URI[md5sum] = "3451c63f8733ea0756ca1dd2b0c04bb8"

you can ignore md5sums now a days only sha256sum is enough

> +SRC_URI[sha256sum] = "9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1b499f7bd89a130"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"
> 
> 
> 
> 
> 
