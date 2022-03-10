Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AA3C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 18:48:40 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.525.1646938119174069312
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Drf5MIK9;
 spf=pass (domain: mvista.com, ip: 209.85.222.175,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-qk1-f175.google.com with SMTP id c7so5157764qka.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5qKvFEPlFuZuCnaiJwJbx1V6XXFuQV0VME2LXDXRN88=;
        b=Drf5MIK94mRaO01Ibdo2JjIvpm5vYCZQR5cc5fXm0PsrfDXTI74JOQMTzMepxx4kbN
         CodRiz/HN7PlyDnAX44beRA7INXBXtwR+BmF+6KWukkS1ERr9QyJ/yeXIOFBkRmULbT+
         z6NTxbwLsgdO677x86VyuSRQKtsz0ktnC13R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5qKvFEPlFuZuCnaiJwJbx1V6XXFuQV0VME2LXDXRN88=;
        b=jYhYzwMQcgYjnxDy7VyUaLqjIz7ytVRNdjPpRLnR1DgHMr0t9fWWK2UxHLJdD4C1cE
         vt1G/SBHrh5texspuP1vTlvy0IU5/L33/v5EKEyCBUt1FBy5CquzEikNnaZBmwIVUG20
         BuxAtKekSw8YEaovyH92qZcWznbRLQD5d7ABH3ZuCRjTzTSE0qAZ6g2kp9H3vxwcE7HL
         dOXXGmHhyZpmLSk5dZpr5KroUAZAnk3RkSBarxqLwJ0aecPrTW4Zb4ymFHzFR2rSHuCV
         4pNl4RYRybMKPjqG7Qcbr3cUa/csXNq/liXBdQyix6Zd4skdWvnd8BT59biwDiSmxuaZ
         fMpQ==
X-Gm-Message-State: AOAM533R1ZmAmIvpeXNVlxn6ksym6BhP+sIb4/6ULlDsZHCftPGcktm4
	FN7240Qtjwnj2iS6h+Qyb1bZ24Xy2kAhWw==
X-Google-Smtp-Source: 
 ABdhPJzOBr0AJuiFpnJTjwy8KgWnQU+wWAN9tvzn+k/E7AwFnE9fOWWhVTcRaTgCxsFVBkkIw6BJnA==
X-Received: by 2002:a05:620a:1181:b0:60d:f3ab:595f with SMTP id
 b1-20020a05620a118100b0060df3ab595fmr4005014qkk.275.1646938118235;
        Thu, 10 Mar 2022 10:48:38 -0800 (PST)
Received: from [192.168.1.31] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 j20-20020a37a014000000b0067b3a0c7d89sm2643257qke.38.2022.03.10.10.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 10:48:37 -0800 (PST)
Message-ID: <31e29b82-e6f0-d07c-68e2-0f5697caa58c@mvista.com>
Date: Thu, 10 Mar 2022 10:48:36 -0800
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
 <4dd1ae18-bfb6-8e1e-9e48-d2a09bdce570@mvista.com>
 <CAMKF1sqSTtuzY+=7OnKBwkWZpssSo5SAyECNetvxSk6C6_u9sA@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: 
 <CAMKF1sqSTtuzY+=7OnKBwkWZpssSo5SAyECNetvxSk6C6_u9sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 18:48:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95940



On 3/10/2022 10:21 AM, Khem Raj wrote:
> On Thu, Mar 10, 2022 at 9:58 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>> Adding -ldl should resolve it. It corrected the issue on ubuntu-18.04 +
>> extended-buildtools and with out. Lemme check centos as well.
>>
> Thanks Jeremy
> Since, I merged the patch. Please send and incremental fix.
Patch sent. Seems to work fine in:
ubuntu 18.04 + extended-buildtools
ubuntu 18.04
ubuntu 20.04 + extended-buildtools
ubuntu 20.04
centos 8 + extended-buildtools
centos 8
centos 7 + extended-buildtools
>
>> On 3/10/2022 9:04 AM, Khem Raj wrote:
>>> sadly I am seeing this failure
>>>
>>> https://errors.yoctoproject.org/Errors/Details/651342/
>>>
>>> On Wed, Mar 9, 2022 at 12:31 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>>>
>>>> On 3/9/2022 12:06 PM, Khem Raj wrote:
>>>>> Thanks Jeremy
>>>>>
>>>>> I wonder why we don't see it failing on AB or in my local testing. is
>>>>> it specific to some build host distro ?
>>>> I am seeing the same issue reported on ubuntu 18.04, centos 7 and 8, but
>>>> its only with the extended buildtools.
>>>>
>>>>> On Wed, Mar 9, 2022 at 11:41 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>>>>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>>>>>
>>>>>> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
>>>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
>>>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
>>>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
>>>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
>>>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
>>>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
>>>>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
>>>>>>
>>>>>> The linker is not correctly pulling in lrt as needed.
>>>>>>
>>>>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>>>>> ---
>>>>>>     meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
>>>>>> index f224bcd34..2717f37bc 100644
>>>>>> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
>>>>>> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
>>>>>> @@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>>>>>>     # preferred path upstream.
>>>>>>     EXTRA_OECONF += "--includedir=${includedir}/nspr"
>>>>>>
>>>>>> +EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
>>>>>> +
>>>>>>     do_compile:prepend() {
>>>>>>            oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
>>>>>>     }
>>>>>> --
>>>>>> 2.31.1
>>>>>>
>>>>>>
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#95912): https://lists.openembedded.org/g/openembedded-devel/message/95912
>>>>>> Mute This Topic: https://lists.openembedded.org/mt/89670512/1997914
>>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>


