Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BC2C53216
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 06:45:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33017.1771569933411717635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 22:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ByiLBHQw;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso12670895e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 22:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771569931; x=1772174731; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ti/dQf7fXgJeRoYitDgJ3a+Ap88f1hwORQVyjpx9SM=;
        b=ByiLBHQwj7XB+FANMLqiT10oo42UeZhrlNspcsHGVg9eTmYNixw3KiW9etu1crJIsU
         9Ph10HVhZ+rRbKuVmvo/IevfjHNC5L28OwUTj+TqkQb0j839bgDbG9lLg//0eCq2+zrZ
         l6+yipesUG5lH6Seu592UEjKtvOcXrZROufaiZSKw6ddt5mp6xN3QewtYb8i/p8wDYy2
         Y+thQw0YZcIa0F7GkLuEStfooLh2jlmKY8EpFjFHAlVqpwEN8N5u9x3hLmTP9xrk7yIj
         Fg8eUS5DRJan6W66BoqwmBYsYkpg0RZp1Swx7KgS10/6vwA9SWz92NDccllvjl4fqnqH
         TAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771569931; x=1772174731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ti/dQf7fXgJeRoYitDgJ3a+Ap88f1hwORQVyjpx9SM=;
        b=wkhBooMR6bfL0Hkh3PQUERP7qD93uUmVmQLVywO8DtBbe3vhoDwMCKf4i7YzX1128b
         3QSFgyV267M9mGLy3DbTvZ0xwzzJ88jkclh8GtcKMWo+mkmuOf93/OqSeBPGqbocktLr
         x3wGL3uyU4oXQPFp39fc4R1I+jvtrODdDWpxW8T9A1flbtidVc5wav0LC79EylyWpFi7
         Vvf79z0owskn02rOVF3/q1QYcRgvCZVGptr25RDONNypdnoVJAnsIKMga5EdiS9Uf70P
         Cy4skUdfZXO5eNmUxonrVTpIIu0dichxa4kXnnwWaCqzHjY4VBoAeb5DfuqaZ1JmWaai
         2tTw==
X-Forwarded-Encrypted: i=1; AJvYcCW10347fa3aRNVEevpO5JxY9zfKrrf4kn53BExyEVVnmJN+KXA2laoosuo5C+QlWGxMBvZhIo2oUIFp3wBli+RlWi4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1zXoCqN3bqp2OzWwT8aps62+23kqzgXExupEIzCV9R4o1XX57
	GR8jUgbnKnTqQrDMmAJZyTM6f5kdDxdhtb3EGoSbFYLcMMt5MTLKHE55
X-Gm-Gg: AZuq6aL4pAYviXiSrBA77BQnJxiEFBHN69dsXZ28rMJ0aTC4hMTzsf93TZuasA8JKR1
	PMU38sAjIQ8PC53qzpMfescUeXb5SJ7pRfPaFU4bOGMBuIOEii0PC1jTknECqK0R3ERQBILRyp5
	X51vDAXfVMqz81xKCFouUX9KqZZfoHi4gYVGdSrrQ/zpoW+/MclrnggRtRaSld/6ptakLJn2h1z
	y18AnT4eC5xbnYFGpodaNH22uFruijcJdyOISem/Oe/q/kLa35ZuesKK4HZookiCfVnLnvlCaKT
	B4NGfuVgDwn1vRK/mTWXlGnfrqLSJXyEInNKGDH7nEgLcU7w4NjW7egvc3jWgarDcu2b82jF8FS
	Vk3Z3+7johSWnPtCXSEYmt/HDlbCNYKo2RHxJrpJGnFJxYoqW7c86a3NUiU8DpbIs4Jb8cSL0nB
	MgbHSR4+jwtk08vLm7B/fNzID56/WZ7fs=
X-Received: by 2002:a05:600c:8211:b0:483:348a:d3f3 with SMTP id 5b1f17b1804b1-48398ad6e9cmr131494955e9.18.1771569931358;
        Thu, 19 Feb 2026 22:45:31 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b1712sm52881205e9.1.2026.02.19.22.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 22:45:30 -0800 (PST)
Message-ID: <cfd43b84-61a3-41ba-8931-42d2ca77c44d@gmail.com>
Date: Fri, 20 Feb 2026 07:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
To: ankur.tyagi85@gmail.com, Yoann Congal <yoann.congal@smile.fr>
Cc: anuj.mittal@oss.qualcomm.com, openembedded-devel@lists.openembedded.org
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com>
 <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
 <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr>
 <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 06:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124521


On 2/20/26 04:34, Ankur Tyagi via lists.openembedded.org wrote:
> On Thu, Feb 19, 2026 at 9:19 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>> On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembedded.org wrote:
>>> On Wed, Feb 11, 2026 at 8:01 PM Ankur Tyagi via lists.openembedded.org
>>> <ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:
>>>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>>
>>>> The previous one became inaccessible.
>>>>
>>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>> ---
>>>>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>>>> index f172168335..a90a33ada4 100644
>>>> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>>>> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>>>> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
>>>>  HOMEPAGE = "http://tomoyo.sourceforge.jp/"
>>>>  SECTION = "System Environment/Kernel"
>>>>
>>>> -SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.tar.gz"
>>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
>>> How do we know it's -20210910?
>> Also, please put add a downloadfilename containing "${PV}". If not, it
>> will break the mirroring test at the next upgrade.
>>
>> Thanks!
> Thanks Anuj, Yoann.
>
> Let's drop this patch for now as existing SRC_URI seems to be working again.

Is it working though? When I visit it, it offers me to buy the domain,
and the direct SRC_URI[1] gives me http 403. Is it geo-dependent?

That "-20210910" comes from the original filename. IMO the full BPN
should be tomoyo-tools-2.6.1 (this number refers to another software),
and the version is 20210910, but didn't want to start messing with the
versions with such an old recipe. 

[1]:
http://jaist.dl.sourceforge.jp/tomoyo/70710/tomoyo-tools-2.6.1-20210910.tar.gz

> I will monitor the situation and send a new patch if needed.
>
> cheers
> Ankur
>
>>>>  SRC_URI[sha256sum] = "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42fd311c4022b78010a"
>>>>
>>>> +PV .= "-20210910"
>>>>  S = "${UNPACKDIR}/${BPN}"
>>>>
>>>>  LICENSE = "GPL-2.0-only"
>>>>
>>>>
>>>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#124520): https://lists.openembedded.org/g/openembedded-devel/message/124520
>> Mute This Topic: https://lists.openembedded.org/mt/117754895/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


