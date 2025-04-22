Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7EEC369CB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:35:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.35225.1745310923825761831
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fE5UVdMa;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so33518675e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745310922; x=1745915722; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=auB6yarCgYcpxcYUBoUKWMdyiPmshUjjstKFXSvMb98=;
        b=fE5UVdMaX0U0hkJpk9Of5im7OnMzdOVYsaijWnT7ua9PMDMnVxt0YCLqSyrejqnB2p
         +y/bqxW6KnjyxI7EaACbgtIpsXl8w/HD1aPI8j8+HPstUEiz1Y18H04tE7+1d9+NMsmw
         EbBPCPXI+IcCRFhb258+Alv59VO2UPZLVtHB5rISVs1aR0XokH/mdg7vYWnYbRvDY8qQ
         njJ2eHHkxwjFBT37G2tpzlYA+3cxIRSwQ4CEZK8SvaPvpt2Xtgb4i49VxPJ1KOrMsBI3
         mQ5Y9pmYL1wj2Qii+0KV6f/AEdeOIbjAMEvUBsbL05jbu6Ne+rDTitIDzluDuZdy68WP
         IYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310922; x=1745915722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=auB6yarCgYcpxcYUBoUKWMdyiPmshUjjstKFXSvMb98=;
        b=UMxK1aQXSIwoCa5h2nvrvnzJ1BLoQ+B9KSH4v/7a+phXsoNkXsl4rH8riKBGj0V3VK
         qRdabNlk0XC7qu9F+z6RhGRcFCCjIrlA/xdSkh6eSp4p+z4DVTyiTyaBORovuHrMolUD
         tovVVyxiGlWmLXmF+UD6Nhrlyq4HxLfAkBCPkICy5vNW0FKOuq9OeMSPVqylx5vBsMLD
         WDr9GOOS9v5+RSOnf02m4ZQcwI6q4FVCrZksU9Q9P1P5Q8wXxeQmVgtLu5ofRnwq2iOy
         CBbz6V87Pji+8joh2/PrI+psJmi/0nsqwyH0UjcdBJgpKxBxViOXWkxCYyTFVu4zyd18
         bSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs8Y/2GoFH0rASbhqji7pWCKGIbXwgXGL2pVsBYAQ/7LuLEgqVN+OttuC4z8zLIAJH7wiax4ENA2klt5YPvHeeiLE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcP3L3YMx/5S+bOUG84AxAx+OtWWBmU0+iSVmSIQFCCaW0piWl
	UzEnVBFX7cx1noCNVTCMbjKJ+HOqnc8w1utBBTTkyMh5izMAsDgk
X-Gm-Gg: ASbGncuKteKl0VFpV2yIjRlB46Z+SgSWjSylBjmgBMim707sKhPaSY7bKGjdkXv+55w
	nvqe7KK9klcMMkr77sV2XmpWlGyVfZr4bQuYLHRPNZBzT1HgsKmc1l6D+jVaPrUEb7/b6DeRX5f
	WuNSRk5CwpkR5ntCQZIxaZb1M9DhmUCLFkUJwHjVuZuR8xXoCJ6kNFWLPKY+qNItnhMn5Ct+gJJ
	kQT+PISgjaMqH5tYsNrtFo2Swc61xhbo0dkA9UWbOo8jONnUAadKqpPzd5rPCi58RaDlGkcdkWB
	ayVL3x1L96Ikn+3VQNEBsDMPQfopXOKZwR3rWpwciO9Tibcs
X-Google-Smtp-Source: AGHT+IEVAeCk9IddnER5l1Rx6ewqStY8jay6q25jxKX0OFWcfBUVT9HCzYzXIvLgsJdcnv7JA2gFlQ==
X-Received: by 2002:a05:600c:4c96:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-440697e1215mr91068925e9.16.1745310921834;
        Tue, 22 Apr 2025 01:35:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4b68sm14397953f8f.87.2025.04.22.01.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:35:21 -0700 (PDT)
Message-ID: <24d1fec7-7c32-494d-ba9f-cbe0ea6eca70@gmail.com>
Date: Tue, 22 Apr 2025 10:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia] pipewire: Install missing ALSA config
 files
To: ariel.dalessandro@collabora.com,
 openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Cc: raj.khem@gmail.com, schnitzeltony@gmail.com
References: <1831E745EF300249.1841@lists.openembedded.org>
 <ad394b95-4f2d-46e9-9a09-fd8837f2fefc@collabora.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <ad394b95-4f2d-46e9-9a09-fd8837f2fefc@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117021


On 4/21/25 16:21, Ariel D'Alessandro via lists.openembedded.org wrote:
> Armin,
>
> Could you take a look at this?

I'm not Armin - but I think there is some misunderstanding about the
backporting process.

Backports are normally not requested, rather they are made when someone
cares enough about the issue to make it happen: if you'd like a change
from master to be present in a stable release, then you need to prepare
the backported patch, and send it to this list.

> Thanks,
>
> On 3/31/25 10:46 AM, Ariel D'Alessandro via lists.openembedded.org wrote:
>> Hi,
>>
>> This is a request to backport commit [0] to previous releases, mainly to 
>> scarthgap.
>>
>> Details can be found in the related commit log and pull request [1]. 
>> This fixes issue [2].
>>
>> Thanks in advance!
>>
>> [0] https://github.com/openembedded/meta-openembedded/ 
>> commit/134978803ec5f4e4ae5c1d3311896ccd52827851
>> [1] https://github.com/openembedded/meta-openembedded/pull/949
>> [2] https://github.com/openembedded/meta-openembedded/issues/704
>>
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117007): https://lists.openembedded.org/g/openembedded-devel/message/117007
> Mute This Topic: https://lists.openembedded.org/mt/112004143/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


