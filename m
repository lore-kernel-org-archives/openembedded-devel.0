Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF92AC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 18:41:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.17885.1647196873702976577
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Mar 2022 11:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kCNyIXOy;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id v4so12590500pjh.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Mar 2022 11:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=10PbJ0Jh/fqMePxKRNdthvjkkXVzHeAcCdB+f7//nqg=;
        b=kCNyIXOy11Lvjv+PR1sbjWYXLhy8zXtFpcO7ijb+k0SpW54FELq90ZGv85OsGwGugS
         OlFIkXPR0f15hFiongN7sNWLdvvYFyfsyeaOKvHrt4juBKXDFzjPs5XdCFAYUNlTt1+1
         nAVsToxoqE0RcivpWGI0atnXk51x1M2XbBch6240mTVKvX6sleamWOeJFMD49FR23OQB
         iZNNSseX6CohCTfApwRrC7LUhA2WK1Eq/WGgAE+02M9tKLbTd4RSlmo6frjsnJZjQ5Gn
         cbc9U2RPs+iB5mDrBmOs6jtIcYaNw2M+F+zsiibMjJmU6p/1NDu/QTA1SMvH+y6BsdpX
         0oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=10PbJ0Jh/fqMePxKRNdthvjkkXVzHeAcCdB+f7//nqg=;
        b=U7O69aBZvFoiP9gfdZNjuCGX8zxJ0zWv5kmRhj7L0NzyHiC8H75ETR6xqZWidDbyg0
         tJmgiZ0aCWIznTXb4hw+Im0W7qsW2WvyEK7bE3dfi3xpwkQRX476UQhsy97DDge8FgT0
         Th4tY1i6GBU1FOUqhW7/+GOpvSNt/WjJzoYMDoUFvXEP7ZTV5+KGqsqW0Yb67rFpNt3/
         8oEbN+GgNuvP8lm2jb+pZ775S17Dauk4Xyw6Co3MPnjzjg2Jf4JjKgturcOPyE787YGd
         9+VSCwPQax2ShOZ5WE2Qakm9+xHyRBOhzx00ivtDWQFdrbD8a8git3hmYE/Hw3Z6Whr/
         jZsQ==
X-Gm-Message-State: AOAM531Z0GHuInVi/uj1oi7XGxI1LCTW+MvdoYbdIATrmWAcJQOs9Vaz
	NUu2hn/TCnxXOg6pr20+GuE=
X-Google-Smtp-Source: 
 ABdhPJwoLjPMSfSXDzpGKbPEvdZQY5hlZPY1h2PQfbwx74tV12wVN6iF2B9r9YQDC2gKDGXSFITDJw==
X-Received: by 2002:a17:902:da8d:b0:151:dcb7:46a6 with SMTP id
 j13-20020a170902da8d00b00151dcb746a6mr20026803plx.133.1647196873068;
        Sun, 13 Mar 2022 11:41:13 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:feea:a2bc:fc4:e2a?
 ([2601:202:4180:a5c0:feea:a2bc:fc4:e2a])
        by smtp.gmail.com with ESMTPSA id
 v7-20020a056a00148700b004f7a46275fdsm6218951pfu.40.2022.03.13.11.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Mar 2022 11:41:12 -0700 (PDT)
Message-ID: <9762ba31-ebb9-ea97-d0aa-7dacc6f67d92@gmail.com>
Date: Sun, 13 Mar 2022 11:41:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [PATCH] poetry_core: update for renamed class
 pip_install_wheel to python_pep517
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220312200609.382925-1-ross.burton@arm.com>
 <CAMKF1soaoBRh1PuF2+ixAAkRTpX7GzOkf5TheQYMq2KgZ2JmHg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: 
 <CAMKF1soaoBRh1PuF2+ixAAkRTpX7GzOkf5TheQYMq2KgZ2JmHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Mar 2022 18:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95967



On 3/12/22 15:16, Khem Raj wrote:
> thanks, I also came to same patch huffing and puffing, I have taken
> this one now.

thanks you both. I just hit this in my builds

-armin
>
> On Sat, Mar 12, 2022 at 12:06 PM Ross Burton <ross@burtonini.com> wrote:
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>   meta-python/classes/poetry_core.bbclass | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classes/poetry_core.bbclass
>> index fb37c78c78..b2b80efa4f 100644
>> --- a/meta-python/classes/poetry_core.bbclass
>> +++ b/meta-python/classes/poetry_core.bbclass
>> @@ -1,4 +1,4 @@
>> -inherit pip_install_wheel python3native setuptools3-base
>> +inherit python_pep517 python3native setuptools3-base
>>
>>   DEPENDS += "python3-poetry-core-native"
>>
>> @@ -8,8 +8,8 @@ poetry_core_do_configure () {
>>
>>   # TODO: ideally this uses pypa/build
>>   poetry_core_do_compile () {
>> -    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
>> +    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PEP517_WHEEL_PATH}')"
>>   }
>> -do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
>> +do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
>>
>>   EXPORT_FUNCTIONS do_configure do_compile
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95966): https://lists.openembedded.org/g/openembedded-devel/message/95966
>> Mute This Topic: https://lists.openembedded.org/mt/89739125/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


