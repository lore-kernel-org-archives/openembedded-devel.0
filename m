Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E0CCAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:48:13 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.12020.1758196092119065229
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxF5aXTt;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b07c28f390eso152496566b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758196090; x=1758800890; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5cUpMoeGiev2AujAtt1VKLx0EkPsY+i8FXtwkVkIE84=;
        b=JxF5aXTt2ENLlKPuTCKUUh41McA+reTtHKfeqFTVc8bZ19p4jklbjCkYmuJEzfHl4r
         UvjWIP9DsyHQJkGNAHihI3g/rjovrn1iejzu9SZPk6R4i8pEKfyh7QOreQMtB3Jh8c5p
         kOGmvzFAZ70vweGDyDhZLtSRgkEdw1lODnC2M3M6t9OXl9db164t0q4HavHuNA5jNLij
         2bZaZ+n5IzkL8sn5QCd4uI9EfHcLpZxgrrR6M4C48+j/AGH5ghu8xxmOkhFO7EVFVf/U
         Z8GMf9B8pouXjSHMO0JeqNp0W2RFRMlaoyjwwjUr+jEVmAP8t1Dq6+LcPwTWP/qwT0tU
         74Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758196090; x=1758800890;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5cUpMoeGiev2AujAtt1VKLx0EkPsY+i8FXtwkVkIE84=;
        b=YfOgodibNbfZK6Veg0Bq4aCmA426D4E4ZJJ+YWbjy4Bpugc3K9XF8CIx1Yqt7aiCsY
         t7LNdUuo4DLziM07JHKJPgswYOnQT7TaWxJtHNplJX70znFMZIAnRskGL1HNNHpPSGJn
         5yW0A7XflWwnvn5sGe7Jyq40Yt6jyiB1/K6JBXqMl+iFMASdjSOmhKV7fStky4hc24JO
         I8EJMLvOJcPxzr9SviKKJCBOz0ClBUN434f0u67bJ78SjKTVdlpAE+SDsrnJQKjGwxRp
         YJIuw7A+A3t01ZlA+o/O+2p4B/RUax8pREyn5qiNts5sxPhcMTYXNAUB7tKXiEEGF+PB
         g6Rg==
X-Gm-Message-State: AOJu0YzTIZO0eTe2Js0gSJNl/QAQ+K5eM62Jbf3jjdH6kRzNIUuepl6y
	XaUJ3/HS9pSGQryNESXg4uDr4mNprxXCxp0pqnDv8IWGQ8yP+P6CRckp
X-Gm-Gg: ASbGncs8bi0sBFHGDme0K7kmnNvQDkdegvCozVCpKEfV09CfjBOhw35TW/BCvSch70f
	xLkePZvx6NU2n9mwHJ+sUclIbTqz+BAyNkooLWboPXOhdJnsx2U7+mR0B6cA4pm2OqlQ7npk8wM
	hN7uuudu0tcvFGTuxVnXTZ8BjXInFrY7f9DJnJSzdivZgDrlvXFokwWMnxOh+usRgQxqoqvtjol
	Qn1cj9tKWWMEHus0xfEd/dp6iZaV9LV3TVbBCjv2m8ieLgLDEeKnAStfzkvPr5xf4tC/m+VY2f/
	AOx3Ou1e7+KU//hGSO8WImxV6Fl+r/SqMXp7nD2F62JtRSYnGDXH0Bh1Xbf8iFrSudmFm4+Rpq2
	tItTbqFPJ0GUVDH7E9Obnd5kdYz2tLFppPjxQNBbr+jUK2pMlKA==
X-Google-Smtp-Source: AGHT+IEIjR0RRZjWmwo56I316Vv2sUL+sQjsbcfAPalMKJANOZQk554D4+jywX12wXHv2zygR3JF/Q==
X-Received: by 2002:a17:907:972a:b0:b04:84db:c5f with SMTP id a640c23a62f3a-b1bbe7e44f0mr598408066b.45.1758196090408;
        Thu, 18 Sep 2025 04:48:10 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272061fsm178103066b.98.2025.09.18.04.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 04:48:09 -0700 (PDT)
Message-ID: <097685f1-0fe1-44d9-adb3-a88197b09afd@gmail.com>
Date: Thu, 18 Sep 2025 13:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 02/10] pm-qa: fix build with
 gcc-15.0.1
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250918112347.1331393-1-skandigraun@gmail.com>
 <20250918112347.1331393-2-skandigraun@gmail.com>
 <CA+chaQcE=y-WZfEWH2whYpJF8_RXX8R3cizFZF1hxeQehU4uCg@mail.gmail.com>
 <810de34b-7ee1-4c35-b529-1f09325a2567@gmail.com>
Content-Language: en-US
In-Reply-To: <810de34b-7ee1-4c35-b529-1f09325a2567@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119572



On 9/18/25 13:42, Gyorgy Sarvari wrote:
> On 9/18/25 13:28, Martin Jansa wrote:
>> Do we need these fixed for gcc-15 in kirkstone? At least for target
>> recipes which will use gcc from OE not the native from host. I've sent
>> couple fixes for scarthgap and walnascar for components with native in
>> BBCLASSEXTEND (which were failing on my host with gcc-15), but for
>> target it isn't needed, right? Unless you did it just to more easily
>> cherry-pick some later fixes which are needed in kirkstone.
> Thanks for reviewing.
> Trying to bring some recipes gradually to be closer to master regarding
> fixes (within the frame of stable branch rules).
> Mostly I'm trying to cherry pick useful commits bugfixes and version
> bumps that look useful and I can also at least test build.
>
> This commit wasn't picked specifically to make later cherry-picking
> easier, it just looks like a generic fix, coming from upstream - but I
> can be convinced about this one if it should stay out of this branch.

Thinking a bit more, actually I agree with you. Kirkstone doesn't need
gcc15 class-target fixes, it doesn't make much sense. I will drop this,
and the one I picked for avro-c too.

Thanks for noting!


