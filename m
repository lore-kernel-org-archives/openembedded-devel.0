Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E71ACA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:26:38 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.35629.1725272791963480184
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BGmut12V;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-42bb81e795bso32918005e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725272790; x=1725877590; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4gv3I0ffoCQ0efmUK9kjxwi9zLW81shryw7LFwpB+lg=;
        b=BGmut12VqsVlgmbZ16TYsWSUtt6hjAKr2KnjWG89Z9q/t5jsSOA17RY6+fAxoYMqFT
         S7T55ioeApU3Ai23eoJmomJ98ZpixfcELJuR3aiT6a1JPbXH0jHp9ttZMHocpPpmVYs1
         /MHJG8hdifRWGdK6IroN9ATauxs4lBkXkIafE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272790; x=1725877590;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gv3I0ffoCQ0efmUK9kjxwi9zLW81shryw7LFwpB+lg=;
        b=gFFIdS6GPufNZ6uAKepJ1PyScHgiMnnfBEMmS7Ft/beT4mlNoGaf4xmIZhMMBKDmEJ
         4d2kQ3WvJNkgaY1uubO5uyX8qhzZWiUOuv8sET2fm7U+hGgD+TrgnoP6nE5fCuiOXH0V
         iHYDOe8yUo1x+uDt8C5DHM+kOVNG9Uhm1hHFADbNf8H4RYQXJK9v1hCO1280Nq6zAZ5b
         ym6Q/8SVdKAJWeH1iC3by0ca3CuXJ+BlX3ld8M5FaY9QOI7h3sfZG6nKQUmgAziBYUTE
         MtTZoZpYH72ibDw6n60PI9oqo7ppTAh9rGuzeWlsoXWz4bwn0Q5nqk7+hbhRHQFYiU6v
         PFPA==
X-Gm-Message-State: AOJu0YymYegddoSedFkAzXMyy/179NHUJp5uh/uQD3jIQ6N3kIaceMP1
	Cfhiyz7OQ2nJA+kboCQ/Gdk4pOa6aQeBmvuwYA3arRXVcIXt1eChbgfVp+z5nvo=
X-Google-Smtp-Source: AGHT+IH2F1w071hb/NYodKBhZRebADTPMW80A4hdT0trwMH1YiuHGCmGpf48gv9hkcYaaaizzvi43A==
X-Received: by 2002:a05:600c:3c9e:b0:426:627e:37af with SMTP id 5b1f17b1804b1-42bbb10d2d5mr68205305e9.3.1725272789784;
        Mon, 02 Sep 2024 03:26:29 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374d1dd1e76sm142713f8f.113.2024.09.02.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:26:29 -0700 (PDT)
Message-ID: <2dd43258-eaeb-4193-9d67-23b5d9bf5457@smile.fr>
Date: Mon, 2 Sep 2024 12:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] README.md: discourage use of GitHub pull
 request system
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240902093432.2865221-1-dmitry.baryshkov@linaro.org>
 <2cd0f5f1-a7d6-45f1-8edf-46d03dab6657@smile.fr>
 <CALT56yMHxXuKXbDsszok3wh=cW7ooN0VPMb+nc4qQG7dG3g-oQ@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CALT56yMHxXuKXbDsszok3wh=cW7ooN0VPMb+nc4qQG7dG3g-oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 10:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112072



Le 02/09/2024 à 12:15, Dmitry Baryshkov a écrit :
> On Mon, 2 Sept 2024 at 13:13, Yoann Congal <yoann.congal@smile.fr> wrote:
>>
>> Hi,
>>
>> Le 02/09/2024 à 11:34, Dmitry Baryshkov via lists.openembedded.org a écrit :
>>> Sending patches via GH results in the reviews of a lesser quality.
>>> Discourage its usage and point out that developers should use emails
>>> only.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  meta-oe/README.md | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta-oe/README.md b/meta-oe/README.md
>>> index 676a2c89252a..0e9d43c10f91 100644
>>> --- a/meta-oe/README.md
>>> +++ b/meta-oe/README.md
>>> @@ -24,6 +24,10 @@ When sending single patches, please use something like:
>>>  You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
>>>  to share your patches, this is preferred for patch sets consisting of more than one patch.
>>>
>>> +Note, it is discouraged to send patches via GitHub pull request system. Such
>>> +patches get less attention from developers and can be mishandled or not
>>> +reviewed properly. Please use emails instead.
>>> +
>>
>> Doesn't that contradict the paragraph just above? For context, it says:
>>> You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
>>> to share your patches, this is preferred for patch sets consisting of more than one patch.
>>
>> For example, I actually felt encouraged to use the Github PR system for some contributions (with more than one patch). But maybe that was wrong... :/
> 
> And the next paragraph mentions GitLab and repo.or.cz. After several
> discussions on GH I think that it was meant as 'use these services to
> push you patches and then send a pull request by email using git
> request-pull'.

Oh, right! I forgot this method.
I guess a hint at "git request-pull" would help make clear what is expected when using those services.

Thanks!

>> Regards,
>>
>>
>>>  Other services like GitLab, repo.or.cz or self-hosted setups are of course accepted as well,
>>>  'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
>>>  to use, has been proven to be reliable and has a really good web GUI.
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#112069): https://lists.openembedded.org/g/openembedded-devel/message/112069
>>> Mute This Topic: https://lists.openembedded.org/mt/108223947/4316185
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yoann.congal@smile.fr]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>
>> --
>> Yoann Congal
>> Smile ECS - Tech Expert
> 
> 
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

