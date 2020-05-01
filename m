Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.5847.1588319426139363117
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 00:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u+2V8Nnq;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id 188so3321525lfa.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 00:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=aliPNPhDGcoFF/FjLwf3aaPYfhv92GS++cZuQCI//nc=;
        b=u+2V8NnqL84Q7DBV3CFhJaUbNvZGqSF262QP/M/UpWiGK7w/T6OsH0kDp6YqDSVRaT
         nPPJdZ8QmW0UuynxYZu3kSPi+xC38/7OOSJ8rJM24GsA1Bzy3RFoyrYRWQBVNRWznpuB
         j4ZjuuS+0GZzMXO/SeXtADhhwcpg2KfK0CR0dOQbYZF3H9+0A/pVJtya1wxhGE415P5X
         cENJJvcoeic9qboD9Dcd5aayPxWAVPQ6jpieb8dNLI8Atx82peM6cjCjwZuptD+RQjJs
         dvyuIzr41WbtYmZELLGqstovl+U7gdTyNjlC9e5SAJW8LASaoQ13oKLxZoEKowEy2PVL
         q/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aliPNPhDGcoFF/FjLwf3aaPYfhv92GS++cZuQCI//nc=;
        b=Vk87GKBX9Pc6UFa+9WAiTmHI8G0jrmDuAbAiKsOV0pOx0Hl8Fa0HzrB4GBu1QqAIG9
         0m6dQ8za+SwdB3VOXU4HNyQd7HZyP7LJ5jhBKzVY/biHC2nvMcDl13GUpV1ER+P2L3gi
         mpC/LTVl2RPi9DfoO7Q4B/X3wkfkRvlBagQL2Hcpn7I6xs/BcLqIeRR7nrp4ofj18T+u
         Pm1Eb7t+M1FDy1FccPxgdKkWEjYD/UDYAqZQaR1EoxEP7OMf9w96ZUY7qDj8MV5zgK14
         xEUWaxUIdsQq1mMVQj/2dLcFkWQ3TEoF2Ae6H4qvHuXfbM5sjIAbGL0tElLlFae+fXP4
         0MsQ==
X-Gm-Message-State: AGi0Puaqs/3V9Y+8yZZW6iLHry5PzTSxZqaUCy+mXHgwhRK7VDE6nyZA
	oNdjEOEDnOuabTMHpXb76DkoBS3l
X-Google-Smtp-Source: APiQypKaF8Ivc0aVzAR/B0y9fYb5Ad1a76wxsk3FwF1eHABzwPF8kDoVch+mDWVATzKrG4kbVbD6jg==
X-Received: by 2002:ac2:483a:: with SMTP id 26mr1776690lft.5.1588319423502;
        Fri, 01 May 2020 00:50:23 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id w9sm1502566ljj.88.2020.05.01.00.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 00:50:22 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-java 3/3] openjdk-8: Fix building with GCC 10
To: Richard Leitner <richard.leitner@skidata.com>,
 openembedded-devel@lists.openembedded.org
References: <20200430131556.2150334-1-jacob.kroon@gmail.com>
 <20200430131556.2150334-3-jacob.kroon@gmail.com>
 <20200430211019.GA410632@pcleri>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <9f19c70e-d290-2366-a900-00ef7e8ad346@gmail.com>
Date: Fri, 1 May 2020 09:50:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430211019.GA410632@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/30/20 11:10 PM, Richard Leitner wrote:
> Hi Jacob,
> thanks for the patch!
> 
> On Thu, Apr 30, 2020 at 03:15:56PM +0200, Jacob Kroon wrote:
>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> ---
>>   recipes-core/openjdk/openjdk-8-common.inc | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
>> index d8b30b8..5228338 100644
>> --- a/recipes-core/openjdk/openjdk-8-common.inc
>> +++ b/recipes-core/openjdk/openjdk-8-common.inc
>> @@ -176,6 +176,10 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>>   FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>>   FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>>   FLAGS_GCC9 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>> +FLAGS_GCC10 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>> +
>> +# GCC 10 defaults to -fno-common, but OpenJDK 8 is not ready for this.
>> +FLAGS_GCC10_append = " -fcommon"
> 
> Does setting "-fcommon" also work for GCC version > 5 and < 10? In
> icedtea7-native you've appended it to CFLAGS it w/o GCC version.
> 
> Background of the question is that I'm currently planning to drop
> support for GCC versions < 6 in the recipes. If done so, we currently
> have no need for version specific flags. Just want to check if that
> would be an exception. Thanks.
> 
> regards;rl
> 

A quick check shows that support for -fcommon/-fno-common exists since 
at least gcc 4.7.2:
https://gcc.gnu.org/onlinedocs/gcc-4.7.2/gcc/Code-Gen-Options.html
So yes, it should work for 5 < GCC version < 10.

/Jacob
