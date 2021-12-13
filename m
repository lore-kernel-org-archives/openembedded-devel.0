Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E77C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:45:52 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.13546.1639413951654197296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QWD+SD52;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id np3so12254551pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PjtJoczCaq+CiJQ+ELs5eHpiUXn9zNcHj86UB7dKJkw=;
        b=QWD+SD52p+et2a8PQLchIsuNg2hA5Ly6qjO88B/UHnbIujK/vJYvWkYmyKuNoczmq2
         /jx1ZgRY7+hF/NexPJyTVkt16EDJDBgRMXHuSuOTVNhhXb0DLqRPOTk1e75H49sMDiO0
         InHOk4yTGrYEFJ9IdXtovVPoEYc1ECwQ0rz+AULbCajtyPZa/t0AUbfeed+TUbv3tWuW
         aL6iwptGoednMRWe8VOvQUePR1gZMXQJY5WTaxk7Oger0ua+2/GzyFU7Q4rvRjv3l8e/
         ACCSOv8fV03CrfnORprosaY5TjBU6DTlvLLxm9KdA4c7NBs8Q6MUJcTnEkwU6AG6UoO1
         ddhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PjtJoczCaq+CiJQ+ELs5eHpiUXn9zNcHj86UB7dKJkw=;
        b=n1FcE1BgrN16ANbdW/xCK5GLrEON6xquRCGv4JsrWhTUEHdmZ8nW6Qgg2gBt5EomvF
         uAipXw8QpxwXqYl1N85Pzo4a09tUmVJEd1Ca/EDgaxEt3ZvUwwjlmJCTfy6IVpS13bg8
         IdpGDudSY8cbjyJY3JeXhia6mfkAPH8ihn9GLwc+TKfdOT3potgeCXPOcDLAFO9MDYRF
         3gSxVVbjXmblRWKLfJzQapQ8d8h9opHfVwYtvRfSDWIZEc9NNbKPuQfQsIJiqovzna9G
         lfxHLGt5alAH55Xb3AlBTqkbZs0bndRk6TjQOSvBYKu7+fIpmyRrWfW6PmvC+llCHQHO
         UH3g==
X-Gm-Message-State: AOAM531mcLJRMnlnyYbZROfo/gqa8lHOx4FtsbksMG/Bk1QHzlDBQfjb
	ze3YVINfg65ahUG7N9SDGSy5Nq+G2n1DDg==
X-Google-Smtp-Source: 
 ABdhPJyW7sY+iv+QWUlIVMiAW6/k0FAXKe1jd2o/hOLugxL02s91N6bpqJZqfaT0L6H3ydNr4j8tcw==
X-Received: by 2002:a17:902:c947:b0:142:13f9:3444 with SMTP id
 i7-20020a170902c94700b0014213f93444mr97475017pla.82.1639413951157;
        Mon, 13 Dec 2021 08:45:51 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:7457:5f16:e18a:42e0?
 ([2601:646:9200:a0f0:7457:5f16:e18a:42e0])
        by smtp.gmail.com with ESMTPSA id
 h18sm14067233pfh.176.2021.12.13.08.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:45:50 -0800 (PST)
Message-ID: <6b91255a-4a09-019e-2875-8f5406872455@gmail.com>
Date: Mon, 13 Dec 2021 08:45:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [oe] [meta-oe] [PATCH] php: Fix bug when configure php-native.
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
References: <1639418477-129618-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <CAAnfSTsKQrGeJMv2fS4CH5XEcOODhJ7fkFGbpure=seh8B=mMg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CAAnfSTsKQrGeJMv2fS4CH5XEcOODhJ7fkFGbpure=seh8B=mMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 16:45:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94338



On 12/13/21 2:53 AM, Ross Burton wrote:
> There's another 10 or so recipes that fail, I have a branch for all of
> them and will be posting it shortly.
> 

right its already in master-next

> Ross
> 
> On Mon, 13 Dec 2021 at 09:01, zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:
>>
>> Fix error caused by modify of libtool from poky.
>>   libtool: don't prefix the installed binary
>>   -       install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
>>   +       install -m 0755 libtool ${D}${bindir}/libtool
>>
>> When executing do_configure of php-native, the folloing error occured:
>> sed: can't read x86_64-linux-libtool: No such file or directory
>>
>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
>> ---
>>   meta-oe/recipes-devtools/php/php_8.0.12.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.0.12.bb
>> index 4f484179cc..38771948f1 100644
>> --- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
>> +++ b/meta-oe/recipes-devtools/php/php_8.0.12.bb
>> @@ -141,8 +141,8 @@ EOF
>>
>>   do_configure:append() {
>>       # No, libtool, we really don't want rpath set...
>> -    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
>> -    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
>> +    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
>> +    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
>>   }
>>
>>   do_install:append:class-native() {
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94314): https://lists.openembedded.org/g/openembedded-devel/message/94314
>> Mute This Topic: https://lists.openembedded.org/mt/87693930/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

