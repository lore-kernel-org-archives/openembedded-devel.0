Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.69.1631909502137729955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 13:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZB5PWi9a;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id il14-20020a17090b164e00b0019c7a7c362dso4087039pjb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Sep 2021 13:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Xv4/4BJnp9z+lE0DZQsSZ2GFNLqT84dacZfBLRx2K2w=;
        b=ZB5PWi9aTKj6vujGQvAzUwXJXQi4YtYvrVHE8SVjHU8zAZ0XeraRa0nHK8Go0lsY3P
         dDTOR8t++p+7jTQJs3CBUEGTV1mZ0zNuBBSB3gVPUyLkuPyL/PmOjNoIPPlW3irJLiH8
         7K6oZ/5NREhaBmtyCmqLGIOKMcv44krJRtg48Y0yNpKzBSxqZXWhnhvXnj9UudPMXoqs
         gfzwxa/SE8n7HiBpSa26f2WTLa9mYQDmmNLVex4NDtIWkjVClrdPsrtu4tQD4Ri+DnpA
         ch0lwouow4KifPsNMT/R63xbxEv8UnKwmri1T6DwXPnZlFvBsSbltMNJLHWzx0tldv7u
         Conw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Xv4/4BJnp9z+lE0DZQsSZ2GFNLqT84dacZfBLRx2K2w=;
        b=e9wQ2W2PDYvkAwZDdIbeYLwfRw4wRhpWkrsAFHj3M1ZfnLB6RbyuFE2oJ8NiNmlKlH
         yKumBSHWlOGs3dELdcQep81GdyDH65M5jjmMY1n6ZP2nXMt8mz7k9WtcX4nTqb/V4MgB
         wZjMmg2cnI0Gy/w1gHp3Hh9l3Eamxl3AMb29TtJ4nxAPjc24Is3RD+hDAWGKnclx5C1z
         qYOVUPjPGVpZXugL7CmIDyKoBHNKfQbMBV3DFyqvg85UFrpujhp6Pu5PkG+JCyp0sQDJ
         5D+qwy5yboRVCgEaM6osc9ZmbFPLHH04t/fk3IaPogYsPQ+hLJ6Jje4pcGXGRo53WkDx
         9wEw==
X-Gm-Message-State: AOAM531UVwqs80psfaFbk+6NJc64MGv1wXt2FGvvWXNBkRKEmQOlDjyY
	SdFHV1xazdFCtVJA6ujylNKvkzz/sU0=
X-Google-Smtp-Source: ABdhPJwnj30Oj0Wyxl9iy4YVnZ1EmNuNaOJ7YIJj08bkx9E73zzOuNoxF+VGshiIQ0Tgzj3sHD8KWQ==
X-Received: by 2002:a17:90a:1915:: with SMTP id 21mr23698696pjg.24.1631909501491;
        Fri, 17 Sep 2021 13:11:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2b6e:6174:9286:e61b? ([2601:202:4180:a5c0:2b6e:6174:9286:e61b])
        by smtp.gmail.com with ESMTPSA id q21sm6015700pjg.55.2021.09.17.13.11.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 13:11:41 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] libiio: Make libiio-python3 depend on python3-core
To: openembedded-devel@lists.openembedded.org
References: <20210917191140.19563-1-pkj@axis.com>
 <16A5B50193EFFE17.25470@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <8cd38eec-ad9e-f5ab-6f99-6bca6e5b34d6@gmail.com>
Date: Fri, 17 Sep 2021 13:11:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16A5B50193EFFE17.25470@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/17/21 1:10 PM, Armin Kuster via lists.openembedded.org wrote:
>
> On 9/17/21 12:11 PM, Peter Kjellerstedt wrote:
>> Inheriting setuptools3 incorrectly adds the dependency on python3-core
>> to libiio instead of to libiio-python3 where it belongs.
> Doesn't this also affect Master?
yes. just saw this on the list for master.

thanks,

>
> -armin
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ---
>>  meta-oe/recipes-support/libiio/libiio_git.bb | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
>> index d7e4cc60a..cfd9746bd 100644
>> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
>> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
>> @@ -37,7 +37,10 @@ PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
>>  
>>  PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
>>  
>> -RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
>> +# Inheriting setuptools3 incorrectly adds the dependency on ${PYTHON_PN}-core
>> +# to ${PN} instead of to ${PN}-${PYTHON_PN} where it belongs.
>> +RDEPENDS_${PN}_remove = "${PYTHON_PN}-core"
>> +RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-core ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
>>  
>>  FILES_${PN}-iiod = " \
>>      ${sbindir}/iiod \
>>
>>
>>
>
> 
>

