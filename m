Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DFEC636D4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 02:35:02 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.29289.1676326506040605390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Feb 2023 14:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HzsETaOv;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: fntoth@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id dr8so35383656ejc.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 14:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/V8YB6PH0NMsqXrrImi/3rHBK/kd8vwJvIz0VdNyM8=;
        b=HzsETaOvU1gnK+8/3yldk4UxR6ZSabFYMH9fPuk/MQOvoDWpDqzYGYp9iBiKQ5JHhW
         T+BViVIkEYJFz3vAU0Qykyc8efCSn6+n3AVP4zF4COO4PDSDw2qf2i1whPOJnk5uSr9t
         cCpMHTDcK/h6hQjO3D0Cq0UfSRtuDkBS8fGY6hLc6sAhj+Jakq9sBnTnY7M1hL3xw0iy
         GaOjMKbNKZk1eX8AgFhvdZvYdOc1ELMAtspfFqYPEVxBt7csfJ+R8gj6JlyZvPWeUtuK
         AA0g2t97VEX8nAan/HOxgdri5aldqKPCwDXlYsMZ6OObo86gSwe0twG5WkxZosl5tM84
         05Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/V8YB6PH0NMsqXrrImi/3rHBK/kd8vwJvIz0VdNyM8=;
        b=aNTMx2FAHIiaKW6VN0s/AyUEda7BOvt6UAD6FGTeLlV4Bv6y5CCJfzG40+mRqbgV6p
         gL1HzCAtxTItIVuVNkr1UgP3AD0f4hsY3Db4fRAUvMdbFwVApNwHpHJEUfse8+J3bQ11
         GARVmqh8KOKZ9v8Oslq320N1QoCwYwvoC3lnUpYZmneCEn/6yA28YBovgOA7XSTaByZK
         ALPCord33XwOX0cDhxjtYDYGBs7/MvwnH3Eqnf666TT9KELX1yzVp+zOIZet9kk5K2YH
         B/uAWX1EwkatXKRwrUQ9eqnNUAyA3aCINr902o4kuANSz9Roi9IyU0ZrlUpAldKYQeCu
         Vvaw==
X-Gm-Message-State: AO0yUKUiE80hRSLI+c+B54iiJN9OMLPqZhqPO71RIeZSgqR0/Mw8LZBy
	wzS79kJYD/3eWWjJOyBzcmg=
X-Google-Smtp-Source: AK7set+bGx5UNDQDaFqnFHppQpwBDLsEnf+cYIdj+6XPW5ZkqiEsjEMxgnIWE04Vt4Vn/Df3128Crg==
X-Received: by 2002:a17:907:76b6:b0:8b1:2c2d:3f09 with SMTP id jw22-20020a17090776b600b008b12c2d3f09mr255154ejc.47.1676326504470;
        Mon, 13 Feb 2023 14:15:04 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:d4a4:86d5:dc4e:5fcf? (2a02-a466-68ed-1-d4a4-86d5-dc4e-5fcf.fixed6.kpn.net. [2a02:a466:68ed:1:d4a4:86d5:dc4e:5fcf])
        by smtp.gmail.com with ESMTPSA id d26-20020a17090694da00b0088550a1ce74sm7280311ejy.120.2023.02.13.14.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 14:15:03 -0800 (PST)
Message-ID: <5e17e6d3-da7b-7222-bcf3-feef6c6fc776@gmail.com>
Date: Mon, 13 Feb 2023 23:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230208152541.136848-1-brgl@bgdev.pl>
 <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
 <CAMRc=McjbMaNk=DRYvq8deBUWtiHZQEs-8CTvGOSDSYQdBZojA@mail.gmail.com>
From: "Ferry Toth" <fntoth@gmail.com>
In-Reply-To: <CAMRc=McjbMaNk=DRYvq8deBUWtiHZQEs-8CTvGOSDSYQdBZojA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 02:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101070

Op 09-02-2023 om 20:57 schreef Bartosz Golaszewski:
> On Thu, Feb 9, 2023 at 8:26 PM Ferry Toth <fntoth@gmail.com> wrote:
>>
>> Hi,
>>
>> Op 08-02-2023 om 16:25 schreef Bartosz Golaszewski:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> We've just tagged the release candidate for libgpiod v2. This is a major
>>> release entirely overhauling the API in a backward incompatible way.
>>
>> Thanks for creating this!
>>
>>> While this is not the final release yet, it's not likely to change much so
>>> I'd like to make it available in meta-openembedded to give it exposure to
>>> some testing. When we do release v2.0, it'll be just a matter of bumping the
>>> version.
>>>
>>> Currently no other package depends on libgpiod in meta-openembedded, so I'd
>>> like to avoid having two packages (libgpiod and libgpiod2). Instead let's
>>> provide recipes for both versions but keep them under the common libgpiod name
>>> as it's unlikely anyone would need both versions in a single system. This is
>>> after all a medium-sized project that shouldn't require too much work in order
>>> to port a user to the new major release.
>>
>> Nevertheless there may be packages in other layers using it (meta-acpi,
>> meta-intel-edison). I think there will be a period where both may need
>> to coexist.
>>
> 
> Can those layers just set the PREFERRED_VERSION?

Yes, but it doesn't the problem when one app needs v1 and the other 
needs v2.

> Bart
> 
> 
> 
> 
> 


