Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.73341.1629394602798844664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 10:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KGVmh8bB;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id w8so6563902pgf.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PWB5aRSrZHMAONfRLA1KtL4U2e2sgxLyPi3SklgNijE=;
        b=KGVmh8bBGeqtnxx2rmT1RI2JU5VShLUF7qxFFtBa9vzWuB4unQXErSHNHigN5rkLnX
         zQbsqy55P8WzIHrobVwGVDukazv07KcD5mAxqCDjDMJ8F0NyDO4dKBJen6To1Kcm9dO4
         xvH1H6Cdy07wP5vYXU9S//l14I0fcM9E4grlGjRDQdYdeuob8zYYBuIDrey61GurLb4B
         xXm3YRjixbDDVc1QlmNegG8QqD17RJ9DkUF38y9mihszkhJKSY4/LAs88HgkDHV1wYWc
         zfqP8Sb0MEt8EOtYI/ZdMFsPHspUKIbaZo+zH1yzz/TF3W0tN7f6NSQZfDHLJNmFf31Y
         k8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PWB5aRSrZHMAONfRLA1KtL4U2e2sgxLyPi3SklgNijE=;
        b=lniPnlo+zHjOSwdswTfz557z6g++fCgj6FsgSVu5yJY2b2Fu3mdo8lEJv5atuzRUv1
         uaWKkNHWHpOO7EcCwm59eEvOlkPj3/RRqzrTyJcQbc/IS3sNYs1HyYYxHQLkwcsfRTaJ
         LZ+IcmauKshUNTyNE5lPb44ra2DU17sP2m57Q69cDVwN+LoNqwSzpEN107CtocfjR9z5
         Kzi0L4i6YLGtYQZK3Tl1AVG+oAq6j0rUHxs9NGiyXWqw8r3ZsOzpDuGAr5SQ8kkvwJrM
         /Jnyd2nymIfbAaiCFa41LMlmVqC7Tpo47GT8yqxijeijoXssdD682zaGpVoCtRAgq0GO
         spCQ==
X-Gm-Message-State: AOAM5317tmwgnkS4pNLte2WNdduHctAw46StxNVIL6iT2+Y/r4MnsLMV
	2ESBm1ad8A2KO2Z7YjGz4g8=
X-Google-Smtp-Source: ABdhPJyivuTqlIxMN8hKbD70aizSFPqUDB6m1/LNRYt6UNQCPr9kkRmkxpX3g57VUNws+5dIz34onA==
X-Received: by 2002:aa7:94ac:0:b0:3e0:f21a:e6ff with SMTP id a12-20020aa794ac000000b003e0f21ae6ffmr15162419pfl.76.1629394602147;
        Thu, 19 Aug 2021 10:36:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:18c3:56ba:32c4:2fdd? ([2601:646:9200:a0f0:18c3:56ba:32c4:2fdd])
        by smtp.gmail.com with UTF8SMTPSA id p30sm4262297pfh.116.2021.08.19.10.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 10:36:41 -0700 (PDT)
Message-ID: <0622c343-1883-2900-ba7f-546ac2f9f161@gmail.com>
Date: Thu, 19 Aug 2021 10:36:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [oe] [PATCH 1/5] fltk/CMake: Do not export executable 'fluid'
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210819110248.3505349-1-schnitzeltony@gmail.com>
 <CAMKF1srH-YoTsww_ZjNgY11U6CwG+cycvAMWmU8EZvbNAs+E4g@mail.gmail.com>
 <CALbNGRQXVLjRLO6NRtEoeEAvm4hV0GZaNF_8V_4iCwTz73MixA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <CALbNGRQXVLjRLO6NRtEoeEAvm4hV0GZaNF_8V_4iCwTz73MixA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/19/21 10:28 AM, Andreas Müller wrote:
> On Thu, Aug 19, 2021 at 4:12 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Thu, Aug 19, 2021 at 4:02 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>>
>>> It does not work for us: The executable 'fluid' is not installed in
>>> receipe-sysroot. So fltk cmake config contains an invalid reference.
>>> Consumers of fltk using cmake will fail during configure for this invalid
>>> reference with something like:
>>>
>>> | CMake Error at <...>/recipe-sysroot/usr/share/fltk/FLTK-Targets.cmake:129 (message):
>>> |   The imported target "fluid" references the file
>>> |
>>> |      "<...>/recipe-sysroot/usr/bin/fluid"
>>> |
>>> |   but this file does not exist.
>>
>>
>> Do we get it from native sysroot then ? Or is it not required at all for cross compiles
> Hi Khem,
> 
> Native fluid is supplied by flk-native (and I have recipes in
> meta-musicians using it). This patch just fixes invalid cmake config
> and leaves flk-native untouched. In my opinion this export does not
> make sense anyway because fluid does not export re-usable libraries
> and just calling 'fluid' will work because it is installed in standard
> bindir folder.
> 
> Hope that helps.

yes it does thanks.

> 
> Andreas
> 
