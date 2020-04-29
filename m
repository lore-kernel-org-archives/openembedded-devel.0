Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.1988.1588160484877063549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 04:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QnoTaoDE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id e26so1651272wmk.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rP+dsA2zVEvz7Fq48hK47AlX43f5uE7KR8MrC2/dauQ=;
        b=QnoTaoDEg10tBlLHIm1pAlJ8pOJZx2Z8B1hAn1jdjBUM6Gm9N7Tt4nLorf2A6seQFh
         pVXn6wlkBU78waI8kkMcEztEzHbFrYABgHNgAMDkOJ83u603rA98eVm8hzJOPxylbvJU
         VXv3PaRrRysckS05y+4TLamWHVMPLaIxrpoRB8L1DfvbG227TSccWVSsd9/SdGJ8AHOA
         rQ+8UMnwSnCBE/q9l3BJaJwQvUH5JJNAUXMhn+DrFViw/4HiD02U3UFd5+WIkCgl/+ov
         /EZl8dfk3cF2iaTrPW/VgE9f8WW8LfWASB2l9pImpPQhpq5rYsZ4ugrF1nraX7D7Gejl
         rnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rP+dsA2zVEvz7Fq48hK47AlX43f5uE7KR8MrC2/dauQ=;
        b=HkPGB/vTze2QA+2LQiv+LNIMk3Pw2Rxl9zd/FAXrjufINOF/PC25bIn07JDCvQj3X1
         CymssxRDOCGdRxLv3u9adDWjrheBDrsXS13oPP3Td3gquV99lkYID2WkA+H4gC/GbtGM
         V7/G85OqSblKRlWpnj2Oij+MqC6XMVYW4pRvjzLDhQaCL0zOZGaiMS2K4WPteqVnPx7j
         n8R/Z9byZp2prupxibg7KErP+E7PTYMcF+7vfKnK/eX05RI9Cv8iQAilj0h6cOB4epeB
         xhuKZ9NF648/ZcWQJ5ZENcFJ9Sh5vEW0/fnZGj0HZV3Gd5F2hbEPAvyTqhuJEdZz0zBs
         Gk9w==
X-Gm-Message-State: AGi0PuaFfDTA+ZK4mOsJAw6Z+6/w4XMiHVgIHQB+9/fUjr2iSmiIznfF
	L1K6MheW7jSdaY0SjqRwO5s=
X-Google-Smtp-Source: APiQypKk78B1nanC157W0QCO4mkI9E9GnQJQMICddDBcuPsLP9RBCUOwgCWyPbpnVtIozGMWv05MaQ==
X-Received: by 2002:a1c:4985:: with SMTP id w127mr2811752wma.100.1588160483301;
        Wed, 29 Apr 2020 04:41:23 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id v1sm30597530wrv.19.2020.04.29.04.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 04:41:22 -0700 (PDT)
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-devel@lists.openembedded.org,
 Robert Berger <robert.berger@reliableembeddedsystems.com>
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
From: "Robert Berger" <robert.berger.oe.devel@gmail.com>
Message-ID: <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
Date: Wed, 29 Apr 2020 14:41:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429100259.GA249641@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

My comments are in line.

On 29/04/2020 13:02, Richard Leitner wrote:
> Hi Robert,
> sorry for the delay.

No prob. I know what it means to be busy ;)

> 
> I pushed the "g0hl1n/jdk8-fix" branch to the meta-java git repository.
> It is a temporary test branch and it should fix the GCC version
> dependencies (as long as you have GCC >= v6).
> 
> It would be great if you could do a quick test and give me feedback ;-)

You mean that should work against dunfell?

I will give it a try.

... for the archiver issue I think I might be able to figure out in 
Python who called the function and react accordingly. Will have a look 
at this as well as time permits.

> 
> thanks & regards;rl

Regards,

Robert

> 
> On Fri, Mar 20, 2020 at 06:53:17PM +0200, robert.berger.oe.devel wrote:
>> Hi,
>>
>> I tried to add support for a host gcc-9 and suggested this patch[1]
>>
>> [1] https://github.com/RobertBerger/meta-java/commit/898a0ae33c9102387aae2e3427a007e3935e663e
>>
>> and, as per your suggestion, since it restricts the host compiler to >= gcc9
>> I added "-Wno-unknown-warning".
>>
>> https://github.com/RobertBerger/meta-java/commit/3d8ae5afb639ec7abcc48f15c74b42b373863c57
>>
>> ... but it does not build:
>>
>> https://pastebin.com/B1nxHcPH
>>
>> cc1plus: error: unrecognized command line option ‘-Wno-unknown-warning’
>> [-Werror]
>>
>> That's my host gcc:
>>
>> pokyuser@3a469e7032d9:/workdir$ gcc --version
>> gcc (Ubuntu 9.2.1-17ubuntu1~16.04) 9.2.1 20191102
>> Copyright (C) 2019 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.  There is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>
>> pokyuser@3a469e7032d9:/workdir$
>>
>> Please advise.
>>
>> Regards,
>>
>> Robert

