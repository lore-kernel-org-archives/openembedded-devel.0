Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.8149.1605289864389397161
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2020 09:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ilffGoaR;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d3so4891158plo.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kLlvOreId2GyBHN+KNwT+F8/3mQL8L1NbcSrdETVmXU=;
        b=ilffGoaRSo37KZ4821rzyR4bRPOOI3IExwQCPBe1Q7IVJ2IeZD+2AY4jQGeP8YN90h
         agkvW9BBhw6Wtjv70lVfiNv6hz9O5SFqMxgF3Agr1FBAZ/gem90BpLXsp4VDzddZ+uCb
         W7jDevxOqvFIS1DgSuLr4UbBTXgN4D8H5U7SbK6WQYVR2kAt7K40eMs2FDTKRvnSHnRn
         5/7K48YhySbZoibSksj4GmoQkd8IwfI3PJ2bdUpsE8u4TtDiuhb6I4cE8+Tgnm/SRKYt
         sPxi+KtrN1IcyqAbB0tPlN1npHI7xC96ldCyzGnL73OQ++AX+AcN9HWv/OrnSZsJd0Im
         V0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kLlvOreId2GyBHN+KNwT+F8/3mQL8L1NbcSrdETVmXU=;
        b=kCyq5G3d8Ohmr2+DZ0EnOiA2d6I4RGy+eS0Y15OnFtt2KyMTM3YcTxNnvTugqkZx0N
         /sGhH0vIT2u1OQCYsGrIZT79deokGvRWpbrK+9URmUwEdgxDolhChhZCFersL0zIXXTo
         PUSQlIuTJVr5N3vXoCVsJf89U4GSxjzevs+OxOl7NanqrzlnzZc4uE9T2Mb1uHDxwuVc
         bOEVOtKefwGazN1AvwZj8mCqfgrXXbO1N0VTQE43Vml/n2322jFVPJGBNVhCf4pVlTlh
         iAbRYP/k1V6pSItd5AoKzSBtsdjERFEjl6tp4Pjs/WGCJqLs7TNbp882UfDo1CswcxVt
         6Emg==
X-Gm-Message-State: AOAM530RtvMDErd/DlBvwDNCDRUiPKQ40nuuKGGHvUC/DH6xKPHEBLMI
	d43g2HCHjD1jzzUnE+FmxAyyp7q8Y3GnZg==
X-Google-Smtp-Source: ABdhPJxACjpkgYlnZ71h+l1YLhQ9rUNhwvtfXi3GWTxm234CuraWh7J5Vqk4rL54AOqGdsoSA2H1rA==
X-Received: by 2002:a17:902:eed3:b029:d6:db13:6679 with SMTP id h19-20020a170902eed3b02900d6db136679mr2811168plb.47.1605289861080;
        Fri, 13 Nov 2020 09:51:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:2d0a:525f:8d30:8b71? ([2601:646:9200:4e0:2d0a:525f:8d30:8b71])
        by smtp.gmail.com with ESMTPSA id t8sm10239019pfe.65.2020.11.13.09.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 09:51:00 -0800 (PST)
Subject: Re: [oe] [meta-mono] Build error on the latest version of mono.
To: Kory Maincent <kory.maincent@bootlin.com>,
 openembedded-devel@lists.openembedded.org
References: <20201113144333.64d57b47@kmaincent-XPS-13-7390>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9b5256a1-9ba1-3a16-46e2-27c5204e0db0@gmail.com>
Date: Fri, 13 Nov 2020 09:50:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201113144333.64d57b47@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/13/20 5:43 AM, Kory Maincent wrote:
> Hello,
> 
> Got this error when trying to build mono:
> | ./include/private/gc_atomic_ops.h:105:11: fatal error: atomic_ops.h: No
> such file or directory
> |   105 | # include "atomic_ops.h"
> 
> I am on Dunfell version of OE.
> The last commit bring this error:
> 89f6d12 (HEAD -> dunfell, origin/dunfell) mono: add support for mono-6.10.0.104
> 
> I have never dive into mono building, could someone give me a hint to solve
> that issue.
> 

can you try adding atomic-ops to DEPENDS and see if it helps

> Regards,
> 
> 
> 
> 
> 
