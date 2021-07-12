Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.13067.1626105717564384822
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jul 2021 09:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XTe4YFrC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id i16-20020a17090acf90b02901736d9d2218so270417pju.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jul 2021 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aE9UqTsvqOpM/5zuzO/Bj6k2AP/vmex971iUP3gkGmE=;
        b=XTe4YFrCCKA0ysTlmFjWgXbHSILWv3VoJvb/+GUNos3a+MmSJztqNrj+j8XJN3OcB7
         ZYYkxEeh/zXkvX/5cglwKStuTAK+mw+90bJeyLi/tcyfAfyxd5clTWWz5yFbOE18NxfY
         abN1U6Ty85OxvoaEQXaNWI1iHdnvS+svQYMNFC0xUIpjn0QCBYIpLnWMBcdYztnbKK2J
         j3l4o5CItNN3SHnjqEDgqKA08cJohJHXHPIjPxdJ+2el/e/44bjOghr3yF7oWQ/L04Xx
         LJMjXNbAT+Extle4o28ZhpVnHwxLHicNTRJV+iLlLYoJBqL6Eoj8TycuQmID0W1XDp4u
         ni+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aE9UqTsvqOpM/5zuzO/Bj6k2AP/vmex971iUP3gkGmE=;
        b=pR5wzBrfUNV3wgNJvNROx1rzwl/3c1+dHt1FjnHE+xnAqJdNMcpo8QW4sKhkSqYWLL
         6KaSj+4iZ/pU3VJEw4w9V8DkEpLxY4uZZ3p1B3ELW5J1tiettQAuYyD1GvxKivgoETCJ
         eaBqj7CYLD2x8RzVfaF548Cr/otmpzBNjyql/1fHuHY7Y29SB+9McFuCyqqkxrE19eYl
         6z/JvmSv17FSbnda2946yBqCe0+Og9wQVHW6+V7z/3qrcBctaQJL0zY3Wh11Ja+ZLW4q
         G6tL0mOrQlyQUw2nvQwDnzurjCHBcx/WFmo70wOQlJx3bB4VB/wSu3Ijn0rwMAnbB6QM
         dirQ==
X-Gm-Message-State: AOAM530VFKG67nvO9e/E0UoA8BQx0KWpWCiA7/F3wn9exbUB/uPg0/H0
	jQfe8cwBMUg0/r7WyL8ZMve6HAw6QnFp5Q==
X-Google-Smtp-Source: ABdhPJxINwmBcMCZYb0J6hwrqGXde9pDTBGfjUuCa8eVXLUhar43oCrf0A5Y2MNbngBCwO/Zy4OpBA==
X-Received: by 2002:a17:90a:9f06:: with SMTP id n6mr14556915pjp.219.1626105716647;
        Mon, 12 Jul 2021 09:01:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:38a9:580f:3566:e17c? ([2601:646:9200:a0f0:38a9:580f:3566:e17c])
        by smtp.gmail.com with ESMTPSA id o3sm4818339pjr.49.2021.07.12.09.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 09:01:56 -0700 (PDT)
Subject: Re: [oe] Upstream scipy recipe to meta-openembedded
To: Gregory Anders <greg@gpanders.com>,
 openembedded-devel@lists.openembedded.org
References: <YOxdaI1jQgdxKTQn@gpanders.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <59d33c0b-fbf0-593c-a259-be23aac0de6a@gmail.com>
Date: Mon, 12 Jul 2021 09:01:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOxdaI1jQgdxKTQn@gpanders.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/12/21 8:19 AM, Gregory Anders wrote:
> Hello all,
> 
> I wrote and maintain a recipe to provide scipy in the OpenEmbedded build 
> system [1]. I would like to upstream this recipe into meta-python so 
> that it is more broadly available to those who need it as well as to 
> reduce my own maintenance burden.
> 
> Before sending a patch, however, I'd like to solicit feedback from the 
> meta-oe community on how best to integrate this recipe into the 
> meta-openembedded project. If you look at the source for the recipe at 
> [1] you will see that there are a few steps/hacks that need to be done 
> in order to get scipy to correctly cross-compile:
> 
> 1. We have to add a CMake parameter to lapack ("-DCBLAS=ON"). This    
> causes LAPACK to build the C BLAS library instead of the Fortran BLAS    
> library. This is necessary as scipy tries to link against `cblas_*`    
> functions.
> 2. We have to patch numpy to force it not to include rpaths in the    
> compiled shared object file. Otherwise the bitbake QA fails as it    
> detects rpaths from the build system.
> 3. Two variables must be set in either the local.conf or distro.conf    
> file to enable Fortran support. These can't be added in the scipy    
> recipe directly (at least, last time I tried it they couldn't be) so    
> users have to manually add these themselves.
> 
> I am by no means an expert in bitbake or in the broader OE build 
> environment. If you know of a better solution to any of the problems 
> outlined above, please share them. I am also more than happy to provide 
> more detail if anyone has any questions.
> 
> Ultimately, the ideal goal is to have a single 'python3_scipy.bb' recipe 
> file that I can send as a patch for inclusion in the meta-python layer 
> rather than maintaining an entirely separate meta-scipy layer.
> 

I think meta-python is right layer for this.

> Thanks!
> 
> Greg
> 
> [1]: https://github.com/gpanders/meta-scipy
> 
> 
> 
> 
