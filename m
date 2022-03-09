Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA41C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 20:31:32 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.1629.1646857892107915053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fT8ncoYC;
 spf=pass (domain: mvista.com, ip: 209.85.222.182,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-qk1-f182.google.com with SMTP id r127so2740046qke.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 12:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oHLi9Zn4TDTHHJwPv6UBaThD7cuyp3MVQEH3I+JKEvY=;
        b=fT8ncoYCFFw8VHFL9tAuZUqkStcU3ysbgU1o8cBTSuANlWSjG84c0UQiNJOgSCZ8wT
         0d/8erEzZqYfAcWIsfZeg81q8e29F5c10RXF4I/tkZSEVpJAdMVYcF9KrUELVBEpbDKV
         L8VeS2mTQeauXbSxrxIaW46oMRjUrkLnDY89Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oHLi9Zn4TDTHHJwPv6UBaThD7cuyp3MVQEH3I+JKEvY=;
        b=SwqnpRtS0z5MPC8sG3+VGE50jqnpyXiIqDwhTHBPImSHg3lxPFLTRdL43safDNj5VO
         qZAAU7lbn5HDgkSC9mIj7s9oFThoBNzBcJkBOheRMu5WZmRfXk+YflVMzkkmb+JuZe2W
         slIphTc3p3Z4VCsWdnodlf2GsFWuSUTPfKAiiD3c/Liv+qNzIQ5vKK0/fSh9oNNDvPyY
         vu86zCsVGidxH+d3ryH9VGOOn+p2ifPcNf8NxMhBRvVXCGIAonRGf/1amh0mZd6AMSY5
         y16Eo7PWVE/kU439bDwXOL0TZ/FA4WFdKM1ndF5+k0W1qkCvQUkQkgBplx4IZJuFYK24
         lWuA==
X-Gm-Message-State: AOAM5335BsOPMSD9R7fQpQ8xuOOOmxiFAHsTkXEV6dhaj1SgpM6eriXX
	pVFZjhXa0anDr10RDEujM/f9fA==
X-Google-Smtp-Source: 
 ABdhPJw4rZ5icSV1LBCQ1FT4sCEjs5hKWRkswVFjdjcdon9Khzf+ap8Z4FMBmk/A1RHbDETbPjDAsg==
X-Received: by 2002:a05:620a:1a15:b0:47e:9aff:14b3 with SMTP id
 bk21-20020a05620a1a1500b0047e9aff14b3mr1017712qkb.372.1646857891149;
        Wed, 09 Mar 2022 12:31:31 -0800 (PST)
Received: from [192.168.1.31] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 188-20020a3709c5000000b0067b147584c2sm1343077qkj.102.2022.03.09.12.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 12:31:30 -0800 (PST)
Message-ID: <ec51b807-97c0-19dc-dbd5-ca11459e44ef@mvista.com>
Date: Wed, 9 Mar 2022 12:31:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [oe] [meta-oe][PATCH] nspr-native: build correclty with extended
 buildtools.
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220309194127.725972-1-jpuhlman@mvista.com>
 <CAMKF1sohSPqiXO=19AF0GxVHuise2RrPC1+hu-55ORd+LJAzcg@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: 
 <CAMKF1sohSPqiXO=19AF0GxVHuise2RrPC1+hu-55ORd+LJAzcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 20:31:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95914



On 3/9/2022 12:06 PM, Khem Raj wrote:
> Thanks Jeremy
>
> I wonder why we don't see it failing on AB or in my local testing. is
> it specific to some build host distro ?

I am seeing the same issue reported on ubuntu 18.04, centos 7 and 8, but 
its only with the extended buildtools.

>
> On Wed, Mar 9, 2022 at 11:41 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>
>> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
>>
>> The linker is not correctly pulling in lrt as needed.
>>
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
>> index f224bcd34..2717f37bc 100644
>> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
>> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
>> @@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>>   # preferred path upstream.
>>   EXTRA_OECONF += "--includedir=${includedir}/nspr"
>>
>> +EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
>> +
>>   do_compile:prepend() {
>>          oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
>>   }
>> --
>> 2.31.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95912): https://lists.openembedded.org/g/openembedded-devel/message/95912
>> Mute This Topic: https://lists.openembedded.org/mt/89670512/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


