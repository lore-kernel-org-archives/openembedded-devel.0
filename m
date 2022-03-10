Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F37C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 17:58:40 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.12654.1646935119929919665
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TP2r+K1h;
 spf=pass (domain: mvista.com, ip: 209.85.222.179,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-qk1-f179.google.com with SMTP id v15so5035274qkg.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qioDf6iOUIfBOKZ1Q9dOqbJ8yKSHCfB4s3DXS8F7c4A=;
        b=TP2r+K1hoSy0pdvYkcZP1vM0WtkFySc/1zgKdo4lXk3pUnYe+dmTBfWPd4xRbXX7EB
         995roRbrjQLu5V7xcBtDYnMtTVCKT2HFqH78IVv4NCmTWpW4cgj7dF6lG9K6K/JTIyBc
         bTr4/mVlmAYHAVMUr800VcbWzg/7o+jo6us0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qioDf6iOUIfBOKZ1Q9dOqbJ8yKSHCfB4s3DXS8F7c4A=;
        b=h/QpVA5jHdVPBCgUYG4VP93oSpVnuM05B2y1IXfIMjPKb+vrTWyJsUdL2XUY9xaVhv
         Dst+Ch1WZbKIPC/Wjvr8T0YBE51zXltQAQYAWlI2C6sdTGLDoClwCLIe19TClpyEUu6Z
         LJM3n+BSUccRpzh2ujm7y6PJ8J4bZ+D3ZibhjhSGOHAat/l56pwr5N94gXl3sfssjcKu
         8fQl90CP+HQYEGtHjFEJgG8hRfVoFKdinbyAxsbqctKQ5n2/3KYX9Uyz8US2z4EMQmGg
         XJIgslXOfeYNsMgZKFRk0262lqyqo32ZKpa5EreGmwtLP6ZbQs0Uora5pjI4wI+PSvNF
         GXhQ==
X-Gm-Message-State: AOAM531xdZw9B3ZDZF3RKE3+O9szk6zdkLYk/GEP+r+DTliNqi4ewHyC
	Hh7EY79u5ES76s+p+7lUAVRt2Q==
X-Google-Smtp-Source: 
 ABdhPJyQoAiAx9zq00Ss3w9ScJMSMY/Q4XD3KexOtVyxPu6smcpYF/LamvC1WpzkFC+u/xu0oHVczg==
X-Received: by 2002:a37:6690:0:b0:67d:335c:29d4 with SMTP id
 a138-20020a376690000000b0067d335c29d4mr3937488qkc.726.1646935118987;
        Thu, 10 Mar 2022 09:58:38 -0800 (PST)
Received: from [192.168.1.31] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 z19-20020a05622a029300b002e1a763dac1sm2198377qtw.9.2022.03.10.09.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 09:58:38 -0800 (PST)
Message-ID: <4dd1ae18-bfb6-8e1e-9e48-d2a09bdce570@mvista.com>
Date: Thu, 10 Mar 2022 09:58:37 -0800
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
 <ec51b807-97c0-19dc-dbd5-ca11459e44ef@mvista.com>
 <CAMKF1srGE-FkTAru3Jn2dokRLcU4jX3WFvS9R_sqgkVPohN_9g@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: 
 <CAMKF1srGE-FkTAru3Jn2dokRLcU4jX3WFvS9R_sqgkVPohN_9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 17:58:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95937

Adding -ldl should resolve it. It corrected the issue on ubuntu-18.04 + 
extended-buildtools and with out. Lemme check centos as well.


On 3/10/2022 9:04 AM, Khem Raj wrote:
> sadly I am seeing this failure
>
> https://errors.yoctoproject.org/Errors/Details/651342/
>
> On Wed, Mar 9, 2022 at 12:31 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>
>>
>> On 3/9/2022 12:06 PM, Khem Raj wrote:
>>> Thanks Jeremy
>>>
>>> I wonder why we don't see it failing on AB or in my local testing. is
>>> it specific to some build host distro ?
>> I am seeing the same issue reported on ubuntu 18.04, centos 7 and 8, but
>> its only with the extended buildtools.
>>
>>> On Wed, Mar 9, 2022 at 11:41 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>>>
>>>> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
>>>>
>>>> The linker is not correctly pulling in lrt as needed.
>>>>
>>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>>> ---
>>>>    meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
>>>> index f224bcd34..2717f37bc 100644
>>>> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
>>>> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
>>>> @@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>>>>    # preferred path upstream.
>>>>    EXTRA_OECONF += "--includedir=${includedir}/nspr"
>>>>
>>>> +EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
>>>> +
>>>>    do_compile:prepend() {
>>>>           oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
>>>>    }
>>>> --
>>>> 2.31.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#95912): https://lists.openembedded.org/g/openembedded-devel/message/95912
>>>> Mute This Topic: https://lists.openembedded.org/mt/89670512/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


