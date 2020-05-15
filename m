Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.20274.1589568135595437776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 11:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QOfuuUfC;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id f4so3759781iov.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 11:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NFVm2xlK1OisPPfn8to3FjmZbQhyX3aJ64ehb/zRxXs=;
        b=QOfuuUfCUqNiE3qPX2SPFzMtqcslc5o8Fr20Ke88Q8kb+X9TviA7Lz4aM1gQW5dmkC
         wqzUlJ9qm/wGP+DingOq7c7WpCCcKw5inB/bqRY4U/iLcNo66hs1u6HVyVWwXPXYIAGI
         s0Zb94ZjKiyb+47pIizJoDur6Lq622wOuwoGXKr1HXoqvY+OC3SM9eHuzmn/wEXL6IIg
         tCyRy8uIsjQDAaC3oJ1LW2dgVT7vznMV8U651lWL9lr7ALEaq/PlddLcwCVJjTuSksRf
         L1U2/dOxMaW+wY0Gx+h4Emf6tD0NrmenzhzIZWNIMUH5Ag193TBJS0BFzuXmJuGSQDLl
         Otag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NFVm2xlK1OisPPfn8to3FjmZbQhyX3aJ64ehb/zRxXs=;
        b=WAI8nngpsGHaoBU5WfJQCMPjrq3n+YbbELp/oD1m8u96EFfkfgE3ob8KnV/cjAZpvR
         ZxfYKKjRErM3sP4OW5VK6CVniWcXfNRJikPV1Nyp+jzaoUmfZ3GW34drvKvSgHBWf7BC
         zpPgugImaCrqmlyf5MJ/5/nx0yEZRkwhQ3v1Ys6J3LsYFCDcWa6x1b7fdtRSwF6BzekO
         bOcNK8fApaA4RPCkwaGu7DNFckc799U1Nh3+Nyt/+C/01t3q7GtqkK6GTW03y2d5QzSs
         UJ2Wg6H4bmE2sRk8JcxCcUjOSwNpAni84bqEsUMEfq8RC+SN/1XJlqY9IrXC0DFx8x9e
         eM5Q==
X-Gm-Message-State: AOAM531SUfc1D/nd0Lh75fSDyNACesUZzptKM/1r5H7J/xt74Lk5x5/Q
	GDN1RcwAQpXhYX3b6tsgSLICtBcslcQ=
X-Google-Smtp-Source: ABdhPJzxoWixdklHvyVrrbF62F1SlYeKWHi9Tjfe+kDjuG1aKY+qYWUXs5kxML3X4SkkfdRTfaFfFw==
X-Received: by 2002:a5e:891a:: with SMTP id k26mr4237550ioj.18.1589568134546;
        Fri, 15 May 2020 11:42:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:33:f6fe:2ae3:dbd8? ([2601:646:9200:4e0:33:f6fe:2ae3:dbd8])
        by smtp.gmail.com with ESMTPSA id l10sm1202186ild.44.2020.05.15.11.42.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 11:42:13 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 0/2] remove pycryptodome(x) and pyelftools
To: openembedded-devel@lists.openembedded.org
References: <160F47A92CF7AFC2.6323@lists.openembedded.org>
 <20200515184114.GC11927@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <d67d77d6-d3bc-3635-06c0-09a58a1ed8db@gmail.com>
Date: Fri, 15 May 2020 11:42:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515184114.GC11927@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/15/20 11:41 AM, Denys Dmytriyenko wrote:
> Joshua,
> 
> FYI
> 
> 
> On Fri, May 15, 2020 at 02:39:38PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> python3-pycryptodome(x) and python3-pyelftools have been moved to OE-Core.
>> Remove from meta-python now.
>>
>> OE-Core changes are still in master-next, so may need to wait until merged
>> to master.
>>

thanks, if you are watching this please send a note once its in master.

>> Denys Dmytriyenko (2):
>>    python3-pycryptodome(x): moved to OE-Core, remove from meta-python
>>    python3-pyelftools: moved to OE-Core, remove from meta-python
>>
>>   .../python/python-pycryptodome.inc                 | 29 ----------------------
>>   .../python/python3-pycryptodome_3.9.4.bb           |  2 --
>>   .../python/python3-pycryptodomex_3.9.4.bb          | 10 --------
>>   .../python/python3-pyelftools_0.25.bb              | 14 -----------
>>   4 files changed, 55 deletions(-)
>>   delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
>>   delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
>>   delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>>   delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
>>
>> -- 
>> 2.7.4
>>
> 
>>
> 
> 
> 
> 
