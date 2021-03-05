Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.14806.1614962789741404109
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gwZnSrQQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d11so1677478plo.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 08:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ByqKHm9FXfjjy4z427LSPgxilXTNEPxB3dXuPdfQrGQ=;
        b=gwZnSrQQcilKCj9Oh2HBGXLj5OwAlgFZN9YjenSwJDA4HbZeqvyMZlYmGYWL4WQ0cr
         /8M3yoR5ESgz3z64Hbt0B5mO2X74vJpYoJukBFyIbIbP/O0J0tGpzZxKpmP15WKmkGTO
         zV/XJ0eLSPrZ+AFEuIjqyojESEMAN72vlIlhxAwK/frx4xPPYnQjikRRAQGWojTKl8mD
         91D1NAhDPKFBcf6eDaom87IwHxmpVBpcPLEO2xr+5cOjfwsWO/y5/KxXJn9UMoS8QxMZ
         F1c+WUF6FCsJfLkAuTr24nvsZDILYT7jShfEwqdUGm/WNF8vGV31gEj7+IhSKQL8UR4P
         8iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ByqKHm9FXfjjy4z427LSPgxilXTNEPxB3dXuPdfQrGQ=;
        b=tvpupSd+tK0IszUWt2kWGVnmGoQ5CXQEFqg34HmEy2+BRVGMpHJzWK9JwUFVvyDW6I
         4OiXxKosMc+URuyr82rEOOUuxHuGkh1nJ6qWCd/HdShD9/wfHYzxDmb1OHuar+8TJWDI
         jGv0RmLuSyE3aczkEMaHEGInmYIFZCbfqJA12ujycwo8+tcRwXRCbjE83BrQtVyrBDu9
         4ih475EBVp4+aPtau/OCncmitFd3GkSwOOp+gPbIDPhI9PGu+368MWVqCYi/8VOLid8Q
         /jtlaMpiL8ubJfjwDi+WUZbWv4Lk2puZl/fUw0UJtGM5nUQ89+Cyt8e/9n7VlgoVurfg
         aMZw==
X-Gm-Message-State: AOAM5336whujU4aBM0PMGUKZrmYfVYo8VaRd+qXfrj6YdAeLGTQeHUYa
	ntVg9Rtv0TCNCFfUox41mjA=
X-Google-Smtp-Source: ABdhPJwLKZxe/EYQR0UIl+/SY9saWNG/ZEv8oOHwE1ZsIsIJPUC3U/t6hT80TkbFnHE1GXYz4RLoXA==
X-Received: by 2002:a17:90b:a0d:: with SMTP id gg13mr10842218pjb.29.1614962788954;
        Fri, 05 Mar 2021 08:46:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b3bf? ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id 138sm3062255pfv.192.2021.03.05.08.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 08:46:28 -0800 (PST)
Subject: Re: [oe] [meta-python][PATCH v2 3/6] python3-aiohue: Integrate the hue control python module
To: Andrei Gherzan <andrei@gherzan.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
 <20210303133241.29781-3-andrei@gherzan.com>
 <074a21a4-17bf-6024-d3a7-d9d44c43cc95@windriver.com>
 <b6a0e026-da05-4c5b-b768-a3aaf96a36d1@www.fastmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <6550b85f-4da4-d245-0ce0-3fb13866b143@gmail.com>
Date: Fri, 5 Mar 2021 08:46:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b6a0e026-da05-4c5b-b768-a3aaf96a36d1@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/5/21 8:04 AM, Andrei Gherzan wrote:
> On Fri, 5 Mar 2021, at 14:21, Trevor Gamblin wrote:
>>
>>
>> On 2021-03-03 8:32 a.m., Andrei Gherzan wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> From: Andrei Gherzan<andrei.gherzan@huawei.com>  <mailto:andrei.gherzan@huawei.com>
>>>
>>> Signed-off-by: Andrei Gherzan<andrei.gherzan@huawei.com>  <mailto:andrei.gherzan@huawei.com>
>>
>> The path here looks off. The recipe is at 
>> recipes-devtools/python/python3-aiohue_2.2.0.bb when it should be at 
>> meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb. Can you 
>> submit a v3 with the path fixed? Please check any other recipes you 
>> have added.
>>
> For a second I was just confused of how could this have happened. But 
> the explanation was simple (git am from another layer that doesn't have 
> multiple layers at its root). Send v3.

yeah its a problem with monolithic trees where layers are fudged. 
something like git submodules can give you best of both worlds where you 
have monolithic view but preserves layers as well.

> 
> ---
> Andrei
> 
> 
> 
> 
