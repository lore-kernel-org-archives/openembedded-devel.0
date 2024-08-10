Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C69C3DA7F
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:07:19 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.7436.1723302434323154344
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eks8+Lo7;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6a4778dad26so595197b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723302433; x=1723907233; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3E/83DzRUH1JzoUNVj3CoXISpgGI/L13i+g29v5t6+g=;
        b=eks8+Lo7XzawQnaRWYlLRuoAyHDWAkYWT5dX7jgmoAk8aM7uLpZsYkizEFfxGjmyeb
         g4ViYbfmOqmDgybGV/FEiRloS7IvQMroMI5GGTmtE0KN1heOs6VWFb3eJXleQmljpd9B
         6deVrx3eEY8j10DjY+AxQbpHUiM3McDyQga27wbpcNTBmzWbZUiLweoeTUs1Bwy3epPD
         t0vQDQPHoFxMjmViO55Gi1tKLeKsvTumkDS0eaLuYKIwxoyLAFkyIEKa3AeCQMVccoVv
         ea+9JbfjxpmXVfRFN+4JXpP6dGPEjWwilBTOJtdyn4AGi0d10nyw9/PK/li/tbm/Kb3/
         p37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723302433; x=1723907233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E/83DzRUH1JzoUNVj3CoXISpgGI/L13i+g29v5t6+g=;
        b=OTBJBexU7DRHDPqX0mzNuRSzfT6LQRokTmOJR+OtYJyyLuf7RV1UJKsSFzmxeL0ehp
         2Qa4UBOTPRZhy5umU9LbLvdSZumYo06unWExncxZdm54c4/sBewvvffkfOR69tosYsrs
         OC5ANrDt/zALFuHF1QoTdV4asMf6ijPNPWXa5hHaTUPqb+YBVVzpQED7CG/JtcHp05Vj
         Ki7P9hcVLOAgN8I+swDDzJ5sALTilHuPRn1gdosYTtb1tbrPnQ3Cklb6uAbeA0WX1YZT
         IW9Y/6TMdqw2NGX9QT4t0Sx/jxfTsrU09WYb00tyCis+B62n0xsMwSQ9AXTqOtwWr87j
         j2bA==
X-Forwarded-Encrypted: i=1; AJvYcCVoJGc52is6nmDvYAF2DLKzEMIHv4OikQ1St9OGXLINNPh/S0YCfEj11PBt2hjqW6GqqSPlJXXysej47Gzl6XislwxC1vJnXYQKJUFWwHc2v8+LhjizuoKhrQ==
X-Gm-Message-State: AOJu0YzMpw2d7MkeQQg/oNPl5H7NTFwca1QOEBszAgOvwyNWf7XAqPwH
	BWp0uMexJvjka1+BwXA7pP8Zsz12GVzrh5DCvYdzfmfP00+uFajz
X-Google-Smtp-Source: AGHT+IGdiHnW0aQ3llzaE/EHAqEk/ObDhDuXlCxsohQkhKrwO6xGAxdfJ90fjpxCdbI7q0+ORKGD+g==
X-Received: by 2002:a05:690c:fcf:b0:64a:5ff5:73ef with SMTP id 00721157ae682-69ebf27e74bmr66907127b3.0.1723302433408;
        Sat, 10 Aug 2024 08:07:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:ad:eb2b:7538:7504? ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068ba99sm2759167b3.39.2024.08.10.08.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Aug 2024 08:07:12 -0700 (PDT)
Message-ID: <e1585a38-36cf-4b3e-8ebb-ab669432ee0b@gmail.com>
Date: Sat, 10 Aug 2024 11:07:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Khem Raj <raj.khem@gmail.com>, debrabander@gmail.com
Cc: dev@g0hl1n.net, openembedded-devel@lists.openembedded.org,
 tim.orling@konsulko.com
References: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
 <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com>
 <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111736



On 8/6/24 4:09 PM, Khem Raj wrote:
> On Mon, Aug 5, 2024 at 12:08 AM Frank de Brabander via
> lists.openembedded.org <debrabander=gmail.com@lists.openembedded.org>
> wrote:
>>
>>
>>> Op 3 aug 2024 om 18:51 heeft akuster808 <akuster808@gmail.com> het volgende geschreven:
>>>
>>> ﻿
>>>
>>>> On 7/31/24 4:07 AM, Frank de Brabander wrote:
>>>> I was unaware of this discussion when I created the fix for master.
>>>> Note that I've silenced the TMPDIR QA message, this still needs a
>>>> proper fix in master as well.
>>>>
>>>> This indeed needs to be fixed in scarthgap as well, since the
>>>> incompatible versions do break some code. My two cents for the available
>>>> options:
>>>>
>>>>   - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
>>>>   - Update pydantic-core to 2.18.1
>>>>   - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
>>>>
>>>> Would only downgrade if this is the *only* allowed option according to
>>>> the LTS branch policy. Version 2.7.x includes new features compared to
>>>> 2.6.4. Removing these with a downgrade would violate the LTS patch policy
>>>> of not merging "ABI/API breakage".
>>> We have had this type of situation with a pkg (A) update in master and then new lts was branched. We found out other later additional pkgs needed to updated to work with pkg (A). pydantic update was in Master before scarthgap was branched.
>>>> Option 2 or 3 are my preferred choices and they fall within the
>>>> "fixes for bugs" category of the LTS patch policy. Option 2 is the smallest
>>>> change to fix the problem, but option 3 includes some additional upstream
>>>> fixes with the update from 2.7.0 to 2.7.3.
>>> Master should be failing so if Master gets a revert of pydantic back to 2.6.4, then Scarthgap will follow. Is this an option? - Armin
>> As far as I know master works now, so a revert would make no sense in that case.
> Hi Armin
>
> scarthgap is relatively new and I think I would be in favor of making
> an exception for this one case.

Well since scarthgap got the pydantic update before release, updating 
pydantic-core is reasonable. I see Tim is working on the update and will 
wait for him to request a merge. BR, Armin
>
>>>>
>>>> Regards,
>>>> Frank
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111509): https://lists.openembedded.org/g/openembedded-devel/message/111509
>> Mute This Topic: https://lists.openembedded.org/mt/107073841/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


