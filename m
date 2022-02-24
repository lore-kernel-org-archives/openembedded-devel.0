Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8030C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 20:53:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.988.1645736026940867821
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 12:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hCbR0cph;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id x11so2891330pll.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=7sAc6ak4QUe6C+9yrxcIzrtpAQjn0WP9XEJUlUTv58E=;
        b=hCbR0cphNDbakO4MysDhmOObtpSevoWaEjlvQCfvzs2wjMkgJLXuTzzUj4J95Q/vNs
         ewZ13ZW5/NHiRTHGcMAIFMUuKZgaBi2JLQ0yf241vam/jjJlbpVsNOj2Q9iGpigO+L7L
         UEl09rLjoiD4glSd/ZBAZSavRdnVtXVbUPbAKk/RoSzU2m64F2hZr2GLmahdpaRGJFkG
         h+oWe6L3cDMzz9vs8mHbHw9OmEMeevO4UGTrXI0TGM7+D/91B7jPqGi6LpsZgqiifL0j
         DhHYkLbO9DbSaFmTARmbNVWVfYQq1mQz4q1yWdTYHJU+UDlYlSVDvMJSCv/oCRYmC1DF
         hsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=7sAc6ak4QUe6C+9yrxcIzrtpAQjn0WP9XEJUlUTv58E=;
        b=nstdMVMNyrbp8EwKP+1LTtK4XArY+mJXnR77erokovDPAswcwk1SeygSsgtrbNpCRw
         9Lx10euUNKFIzOX+6dVb8AuIcSqRVdcw+riNY5oHOHkQEpEAJBQKKit7Cy5iiDJX8IQ2
         Y3ryiM5VGZdNqDwPUeN6prK3Kl3Jk1Pnk3UMBgdu9UhApcJq8na3n/K1jm4lCydX/iDw
         18mCC+S4z1WKTI/aZcU8RtE4gpJ1AL4Lklm2pk3bvh5dy0XBz/lVRzfU2w0nllW3DXl6
         SBtGV8fKPTYD/AhD3GSXIEviWkzTCSp6+KSPzgeDBEN0DNYBGLseAaOcae0ZoNUqGIiy
         3xCA==
X-Gm-Message-State: AOAM531NgEX3KYUs88D2w29TMGeSJC0qlfi9blA2vjL/7Lx3/FkGiqtg
	evg+J7hte4vh4hfuMHK/EoM=
X-Google-Smtp-Source: 
 ABdhPJwGb8tIv6jxV26/tzDB1xBkBXCl9zGN0hbEr6nII+FRRaE/8uYlzb01VB9KJSgZGPr6W57Rzg==
X-Received: by 2002:a17:903:2405:b0:150:5f2:9bed with SMTP id
 e5-20020a170903240500b0015005f29bedmr4183667plo.14.1645736026353;
        Thu, 24 Feb 2022 12:53:46 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:7596:a911:67c0:3e7d?
 ([2601:646:9200:a0f0:7596:a911:67c0:3e7d])
        by smtp.gmail.com with ESMTPSA id
 g1-20020a056a000b8100b004f111c21535sm390306pfj.80.2022.02.24.12.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 12:53:46 -0800 (PST)
Message-ID: <677976ee-6af6-c24a-786d-c4620769b7ea@gmail.com>
Date: Thu, 24 Feb 2022 12:53:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: RRECOMMENDS bats,
 python3-packaging for libgpiod-ptest
Content-Language: en-US
To: Douglas Royds <douglas.royds@taitradio.com>,
 openembedded-devel@lists.openembedded.org
References: <20220221041039.4036356-1-douglas.royds@taitradio.com>
 <CAFimOt5ZrGjVaec6Ox5eWYwSsGq3Fa_2q7AUuJfteFc+wJWRhw@mail.gmail.com>
 <daa393c2-b56f-a28b-6ebd-ccb77491c9c0@gmail.com>
 <63cfbe7a-ac5a-064a-f467-6b23b520d1c9@taitradio.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <63cfbe7a-ac5a-064a-f467-6b23b520d1c9@taitradio.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 20:53:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95516



On 2/24/22 12:23 PM, Douglas Royds wrote:
> On 22/02/22 3:37 pm, Khem Raj wrote:
>> On 2/21/22 12:26 PM, Douglas via lists.openembedded.org wrote:
>>> I should be adding this to the RDEPENDS:${PN}-ptest, not the 
>>> RRECOMMENDS. I'll send another patch ...
>>>
>>
>> OK thanks. I will wait for v2
> 
> 
> Did you see this one? It doesn't seem to have made it into master-next ...
> 
>     https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg81249.html
> 

Can you send a v3, it is not captured by lore or patchwork.

