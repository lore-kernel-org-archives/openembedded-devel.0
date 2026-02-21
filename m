Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA582C61DC2
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 07:49:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16180.1771660137071997830
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Feb 2026 23:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZzljcyG;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43767807cf3so2044424f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 23:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771660135; x=1772264935; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DAjJJUJrd1ew6tw+/RjW40hVKhmdCgtHw93R8ylwA0=;
        b=bZzljcyGXkQPKxiC7btGC9olxraxdEbliPYMnFXdJBdgXiE9iGpAJ0/UopVvsvHyCb
         AbaF/Eyu3MisAF386boyuFryY9826OpNhNScjIiRaOqvvs2KnLldhPjSVofGTawBXlzz
         uvesOso2VEhWkOlr6n8wTzYHB0fCMTzat8wu87rXZZ5GDYyVlfLB8azedQ06JlRocDDo
         5UBq0OixGtSLWwJoQG/7ptaQ+3QbV1mBrl9zSIYMmOVYQczVFOX2PCEn8sLXIYLmLc5p
         ttdr1qt4QB7e5qb/yTDBxeU1uhCjyX9KG0v25JXzAFE81Y1LVQZFn0keRClAll8xbknE
         +mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771660135; x=1772264935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DAjJJUJrd1ew6tw+/RjW40hVKhmdCgtHw93R8ylwA0=;
        b=LMiz+fcddfE2kBt5LVUJLjVAqQqxbfLA4DUO7PKArvowZAUL+dmP40RHbiFEJp2GvX
         uKzyAPExjSH4JbYMO5bbZKH7qlFfFuEZt+uncTGFLWDG+kb2esJ3/HWFGIakpbVtp4/t
         f/ld7siWRGXixezgcvqegqe+BfSbhX6wMxGad6RNRQSzZZRGJShL/0vyLZd3+nTYYCL/
         SEbXXUt6pzinEuR6IebKoXDLkgBjYW7GHH8NSHKIOc/58c2uQ28Secpn8xSHGajPoU1k
         qmYM3/xTPjjSsnI5L/eW3qElHNES7iDAWyJclrh6P08oj8z6D/vMmkMTtJ6Txwh5ofyH
         SVVw==
X-Forwarded-Encrypted: i=1; AJvYcCWZBThe9MJ+YEX7W1Fa9IflyTJS+cRPoqQd3W3/dcHTajWJj74i3Bcl8YJJ7VVvVzpLMEtHdID53zztJBjwkCMcnhY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywqr9hkPoDO5/IG1hgrKbqEZBVqvr4mtvUnY2/D1yxSlV4yO1in
	tgOFiaRkikqDXYmtwGyzNaqLLtpnwXobRiwqGgkwJ252vSl4pThZuwfC
X-Gm-Gg: AZuq6aLghB8GCayAH8C6ETXwT0E0qemhk0oeuDuDDKyeYC7rQGriRRiG1Fz2TjRq1lD
	7ER2eo2u4fugYIHNiT7NI38iD0KeG/iUV3ZD2j7xV+3lSaWAVciNRyK9deQDSf+So1/SCvKD/rs
	7d6F0T8TAvrwO3pKKq2ck5JJoK3GmmuO9gGtmNtUDBiYq6L1P9rH9J2ioBhDw+sEdbQXeFcS+9s
	rSPcRzzYNqvfiQjWCOcTNGxf51rfVW7ZhugUUm0kM5/PWrPN/DXIIZExDETe5mE/GwIKDgPtR+Y
	vYivjSxIFjEnspdV2z75V5xmPVbU386TYX1vqcmklx1GYZ4mARJq+SrL2khFxhJx0kcsxYdiSO/
	zzOKVqBF/GXzXXmQ16+v1IyfRzf2EsbGvpod1prFbGXFToKeqw1BwC9BKQtnnmBxxp2PS6IgPax
	Snn3x7h+tPLWZ479erJTnRoeEbp9nFuSA=
X-Received: by 2002:a05:6000:2381:b0:437:7168:af52 with SMTP id ffacd0b85a97d-4396f153b9emr4417306f8f.11.1771660135255;
        Fri, 20 Feb 2026 23:48:55 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm3673898f8f.11.2026.02.20.23.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 23:48:54 -0800 (PST)
Message-ID: <8f30d396-53c0-4aa0-af90-914b9e7eb1aa@gmail.com>
Date: Sat, 21 Feb 2026 08:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, anuj.mittal@oss.qualcomm.com,
 openembedded-devel@lists.openembedded.org
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com>
 <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
 <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr>
 <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
 <cfd43b84-61a3-41ba-8931-42d2ca77c44d@gmail.com>
 <CADySD0HMEs5e9aQq7fKwtjhSFrc4orJ0r46vWAaDt6Hpk+8kmw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0HMEs5e9aQq7fKwtjhSFrc4orJ0r46vWAaDt6Hpk+8kmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Feb 2026 07:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124529



On 2/21/26 02:38, Ankur Tyagi wrote:
> On Fri, Feb 20, 2026 at 7:45 PM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>>
>> On 2/20/26 04:34, Ankur Tyagi via lists.openembedded.org wrote:
>>> On Thu, Feb 19, 2026 at 9:19 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>>>> On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembedded.org wrote:
>>>>> On Wed, Feb 11, 2026 at 8:01 PM Ankur Tyagi via lists.openembedded.org
>>>>> <ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:
>>>>>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>>>>
>>>>>> The previous one became inaccessible.
>>>>>>
>>>>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>>>> ---
>>>>>>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>>>>>> index f172168335..a90a33ada4 100644
>>>>>> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>>>>>> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>>>>>> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
>>>>>>  HOMEPAGE = "http://tomoyo.sourceforge.jp/"
>>>>>>  SECTION = "System Environment/Kernel"
>>>>>>
>>>>>> -SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.tar.gz"
>>>>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
>>>>> How do we know it's -20210910?
>>>> Also, please put add a downloadfilename containing "${PV}". If not, it
>>>> will break the mirroring test at the next upgrade.
>>>>
>>>> Thanks!
>>> Thanks Anuj, Yoann.
>>>
>>> Let's drop this patch for now as existing SRC_URI seems to be working again.
>> Is it working though? When I visit it, it offers me to buy the domain,
>> and the direct SRC_URI[1] gives me http 403. Is it geo-dependent?
>>
> hmm, maybe it is.
>
>> That "-20210910" comes from the original filename. IMO the full BPN
>> should be tomoyo-tools-2.6.1 (this number refers to another software),
>> and the version is 20210910, but didn't want to start messing with the
>> versions with such an old recipe.
>>
>> [1]:
>> http://jaist.dl.sourceforge.jp/tomoyo/70710/tomoyo-tools-2.6.1-20210910.tar.gz
>>
> I tested with following SRC_URI which addresses all comments
>
> SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/${BPN}-${PV}.tar.gz"
> PV .= "-20210910"
>
> If ok then I will send v2.

I'm a bit confused about this too... BP already contains PV, it's
definition is:

BP = "${BPN}-${PV}"

Does this patch really need change?


>
> cheers
> Ankur
>
>>> I will monitor the situation and send a new patch if needed.
>>>
>>> cheers
>>> Ankur
>>>
>>>>>>  SRC_URI[sha256sum] = "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42fd311c4022b78010a"
>>>>>>
>>>>>> +PV .= "-20210910"
>>>>>>  S = "${UNPACKDIR}/${BPN}"
>>>>>>
>>>>>>  LICENSE = "GPL-2.0-only"
>>>>>>
>>>>>>
>>>>>>
>>>> --
>>>> Yoann Congal
>>>> Smile ECS
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#124520): https://lists.openembedded.org/g/openembedded-devel/message/124520
>>>> Mute This Topic: https://lists.openembedded.org/mt/117754895/6084445
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


