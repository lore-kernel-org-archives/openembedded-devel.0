Return-Path: <tvgamblin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE0FC43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 13:06:57 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.27775.1658754411935829901
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 06:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cs8ix/DB;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: tvgamblin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id g1so8516704qki.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CDVb/m1oOoSnMF0FC3CzVydvZ7mTdrHdOel8yn0rtuU=;
        b=cs8ix/DBnyXI9k9PyGL44lzPJzp+QXrEbHQdyA/P5F/kpnk1BlENDZHnqaxNQymR69
         P+3a8haFgDOUHJvPHYoYvs4U4B5rq2K7qSdRhrGhLzq4F/o/jkZ3TaiudGYGUeHuZls4
         yr6peOi4XNrBkqC6a3hoPE1KCM7lZT1KlxJG2379eoK6Ra+sIXHHpNyA66sq/X8ckrFX
         tt10a1IqvVv9WvVjF6prYo8YgDePhMhBqDV3XzH+6E7iL0O5JICjUKvjFAp6vbNakvzf
         ipGZnVm/W7pWBXbLnAIc0p306mVfjLOPMhzVzTLzhdTFCzv2+YLG5Vc6G14DrPNoK54K
         WTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CDVb/m1oOoSnMF0FC3CzVydvZ7mTdrHdOel8yn0rtuU=;
        b=ssa5ap2pHZdCyz59/JXy6CK52L84ZkdnM8dXbpB3BHI79ORhNZ5ZbBkIJHO6pMFe65
         1bYCn8nRl8VClV89QGr5EXT4KrRXO2T/XqLVoE5zZE9P+IKoFviipNYoDkklF+kkyI/T
         W/24+cHq4Mf2QCdjhc6p0KxT4F2kbsOfnPisMoPuy4cWt3PCvZa7fluVuq9rWN4PRdVI
         LTFWgNrDi5oFUbcGOOzqjrqkkKbIY7Z8gtJ8HWpwrE0QVbZ73cYTbb1Ia2pcy65lq0KI
         xumG81PNVaoR1NNqhx6o/VAVd1pagsjR0qM+sjnqTVC294Uy8LPg+egkB1Wc5HtzsZ7Q
         vkrg==
X-Gm-Message-State: AJIora/M+ttNCR1J3H7bD8FSRRdvQLQkh8SuJppk70i1E88J87QPhx0i
	8az38yMeCt5hhNIjMbnN3+9d23f97rM=
X-Google-Smtp-Source: 
 AGRyM1teL790B8bWlw/c0CowFDS1yC4Td3inlmBHekROZpZFRED6snincE+JblVWEp3OOyjZ83exIQ==
X-Received: by 2002:ae9:d884:0:b0:6b6:3aad:a7d8 with SMTP id
 u126-20020ae9d884000000b006b63aada7d8mr8933377qkf.419.1658754410796;
        Mon, 25 Jul 2022 06:06:50 -0700 (PDT)
Received: from [192.168.0.153]
 (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id
 br39-20020a05620a462700b006b648d016f3sm4487170qkb.126.2022.07.25.06.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 06:06:49 -0700 (PDT)
Message-ID: <4518f88e-f970-f639-5341-4fb06a07cfbd@gmail.com>
Date: Mon, 25 Jul 2022 09:06:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-python][PATCH] README: Remove maintainer info for
 tvgamblin
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220724194800.189798-1-tvgamblin@gmail.com>
 <CAMKF1sr-VXXh=315dtjqzi7_DMzQZGjLfeaSwS0rq0onw_e2=g@mail.gmail.com>
From: Trevor Gamblin <tvgamblin@gmail.com>
In-Reply-To: 
 <CAMKF1sr-VXXh=315dtjqzi7_DMzQZGjLfeaSwS0rq0onw_e2=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Jul 2022 13:06:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97970


On 2022-07-24 21:57, Khem Raj wrote:
> On Sun, Jul 24, 2022 at 3:48 PM Trevor Gamblin <tvgamblin@gmail.com> wrote:
>> Signed-off-by: Trevor Gamblin <tvgamblin@gmail.com>
>> ---
>>   meta-python/README | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta-python/README b/meta-python/README
>> index 8b62ad32b..01c51dc88 100644
>> --- a/meta-python/README
>> +++ b/meta-python/README
>> @@ -44,4 +44,3 @@ Maintenance
>>   Layer maintainers:
>>           Tim "moto-timo" Orling <TicoTimo@gmail.com>
>>           Derek Straka <derek@asterius.io>
>> -        Trevor Gamblin <trevor.gamblin@windriver.com>
> Thanks for your work on maintaining meta-python Trevor, really appreciate it

No worries Khem, wish I could've continued. Thank you and good luck.

Trevor

>
>> --
>> 2.37.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#97964): https://lists.openembedded.org/g/openembedded-devel/message/97964
>> Mute This Topic: https://lists.openembedded.org/mt/92591366/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

