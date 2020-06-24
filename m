Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.7412.1592976217956437156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 22:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QI4Chlow;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: uvv.mail@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id l188so786675qkf.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2020 22:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=a5SmkYO+J196LfU5WvoHMvM3F1/Bil+m5FW7cmvOoCw=;
        b=QI4ChlowfIeGwTL/5pnYr6c2AkRIj/Nbka+Zi1Kg6wGXI5a/GedFVBI5pyYuxVDjeg
         eUxWpbhFuntLfsT6ZrD34k3n/UIz2UuFpQzT/o25EwPEQPPHpAfo+nViXrR2LFJGTnDE
         FLvhKbcI5u/2IGqqmsY2MQKbLyz2hHWLPnq8rxBLKnYUcKRddD9c7cB/qy1cE7oXz3Cp
         KxRNiC3QH+UNge67DSFKUmCiQ3eg60WK0Q5AjaCmMv6JajdZgy1m3VWo/EiXzoEKi3pY
         dPTZyV6u4RQfnu7Ov2ww12+/hbcSe0agWu+ea/PLFO6tGBnYkTjoWRbpSXwzwDU+ufqE
         TZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=a5SmkYO+J196LfU5WvoHMvM3F1/Bil+m5FW7cmvOoCw=;
        b=X0lTfV310WHznRYPo5Lao2PaBZMeQFwK5sElBEsvqDEl9liymqa7D2zvDIzvOiAKww
         sxTnrHofbqBgm6U3uvsdIYHbIyT/Q3VNiO6CjylAPgKOsooPDbhO4OCq6aJ4qY7ynrpB
         NRCFHgAdjDvyS8b7gP/mzLeK2ygh9wBdmySdiXyV8zhqzsK391DIRkTTfZFgCEvkALcH
         TSmoj4snmpYEIAo64HolTHncV9VSFwn/+Tx9P0jU364hLOfMLZ918fyPD/FNswqpuw2t
         hT7jtgFYQI2m+aBaauA7uhXyVnVmdqB0ThVJCC2vVSLCZ1RA3LSv05VWwgkyZl69e4ha
         HZWA==
X-Gm-Message-State: AOAM532yjmdv4j1K+ntP1cLNpjtTRXFwKh6BEISiLLwQ6U0tSmDe/ufk
	Kq1UvbD04cv66FAh3M35UV4=
X-Google-Smtp-Source: ABdhPJyBXhC1nC8f90vY5nQMZG1KEllEitgQYmCUxkC21SDcCfCWnsVuP31sUxtBCrUmbqCRezZoyw==
X-Received: by 2002:a37:90c3:: with SMTP id s186mr8833837qkd.354.1592976217106;
        Tue, 23 Jun 2020 22:23:37 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.162])
        by smtp.gmail.com with ESMTPSA id c21sm707626qtb.49.2020.06.23.22.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 22:23:36 -0700 (PDT)
Subject: Re: [oe] [meta-java][PATCH] icedtea7-native: set unique download file names
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-devel@lists.openembedded.org,
 Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20200623122341.34613-1-uvv.mail@gmail.com>
 <20200623180806.GA52708@pcleri>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <79a74ea2-dda2-bf50-c3c4-8a8f34151037@gmail.com>
Date: Wed, 24 Jun 2020 07:23:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623180806.GA52708@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richards,
Thanks for the quick review.

The problem is that the whole file in general has tabs/spaces mixed, 
even just withing EXTRA_OECONF declaration. It's also not clear to me 
why two empty lines needed in it. In my patch I simply left indentation 
as it was in original file. Do you think it would be better just to 
change the whole EXTRA_OECONF to spaces?

Thanks,
Vyacheslav

On 23.06.2020 20:08, Richard Leitner wrote:
> Hi Vyacheslav,
> thanks for your patch. Please find my comments inline.
>
> On Tue, Jun 23, 2020 at 02:23:41PM +0200, Vyacheslav Yurkov wrote:
>> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> It would be great if you could describe the change in a few more words
> here. Thanks!
>
>> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>> ---
>>   recipes-core/icedtea/icedtea7-native.inc      | 14 +++----
>>   .../icedtea/openjdk-7-release-03b147.inc      | 40 +++++++++++--------
>>   2 files changed, 31 insertions(+), 23 deletions(-)
>>
>> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
>> index b0b9419..70738e7 100644
>> --- a/recipes-core/icedtea/icedtea7-native.inc
>> +++ b/recipes-core/icedtea/icedtea7-native.inc
>> @@ -83,13 +83,13 @@ EXTRA_OECONF = "\
>>   	--with-javac=${STAGING_BINDIR_NATIVE}/javac \
>>   	--with-rhino=${STAGING_DATADIR_NATIVE}/java/rhino.jar \
>>   	\
>> -	--with-openjdk-src-zip=${DL_DIR}/${OPENJDK_FILE} \
>> -        --with-hotspot-src-zip=${DL_DIR}/${HOTSPOT_FILE} \
>> -        --with-corba-src-zip=${DL_DIR}/${CORBA_FILE} \
>> -        --with-jaxp-src-zip=${DL_DIR}/${JAXP_FILE} \
>> -        --with-jaxws-src-zip=${DL_DIR}/${JAXWS_FILE} \
>> -        --with-jdk-src-zip=${DL_DIR}/${JDK_FILE} \
>> -        --with-langtools-src-zip=${DL_DIR}/${LANGTOOLS_FILE} \
>> +	--with-openjdk-src-zip=${DL_DIR}/${OPENJDK_FILE_DOWNLOAD} \
> Looks like you have some whitespace issues here.
>
> Apart from that the patch looks good, therefore I'm looking forward to a
> v2. Thanks!
>
> regards;rl
>
