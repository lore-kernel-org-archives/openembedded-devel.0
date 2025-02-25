Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8213AC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 09:45:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.4534.1740476694731498745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 01:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KLWkg8D/;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab78e6edb99so755832166b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 01:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740476693; x=1741081493; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4a3K/QHdouo3Ta+QWURJORpRje7ZwLKxJmU9eIyhshA=;
        b=KLWkg8D/CUWJEwpN7/SiJfCGp56+/wpOeMRhKnqMtre/dXQZB4XJXa7DDgwSocHdDh
         wR802gyg2itDuHglp2pIPkR/6X+8jKOYA/dxvlR+g+rNSKH0eptGHT5uE9adZAn/Rpa2
         vWpTJXnKflcCfLZqQLmzRXUfOlj2SCDHcdSx7qV/izwUL+59OxYnwzdvrTM0Qhr+vIny
         mwB8kgcFzFCDOU+xZGxTwZChDwIygayThlExSroOE2LQPLBqTujPHusnscaR4ZF5wydp
         cAbw/tqby1eQ1wSAaq8iMrcOIV7Bmez2Q8HajOiO2ImQjAQ0USIVChQMeDHpWC7Ym9Wj
         547w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740476693; x=1741081493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4a3K/QHdouo3Ta+QWURJORpRje7ZwLKxJmU9eIyhshA=;
        b=WL+1Pfx3a1xlYAGsBPhcoBUQkmscU0HqBDtiFgi57o10Wx3caS9MnwwlDXi7NBQzyO
         ZLp3Yqp4oPkMirPMhe0lsN5zGfcK128+brvVjwmSAmMB/PwYrnw8oaFuV5CJafDv6qpJ
         pYrUUswM+kpC0+mCDlFV4MbSgGKXxOl2yRwsKjCpnABzsz5VfoGdci2gCjqC6STTl+hN
         W/tWmmaIxIBBIkdKl9k7YcMXjE9KeWvyTpWqRm2mWIhhXN/+ek7Hu/qVunTiJPnwyNd3
         WaIM9srg/JREByTuLzKFjy78fdF2xqn7/UPd67ikgb+vdtW9Eyen67di9Eh0UamHFckI
         e5EA==
X-Forwarded-Encrypted: i=1; AJvYcCV+OquKy4jRF5HwM/hZZWjuQwMNcb89Lad/pI3JXeOgh5IubD58fIXEBR4sip/3QYZfHusPC9T5SgbajbRfMGBF5nY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvMjkOuaiiSszUsQvDph+QUYdqkz5urx6sr0b0iX/NutNDDmc4
	c2UCW4hArGuoX8kghR1U0lihj0HBMlXfPNYVcNi5VY9e3TNNh/PT
X-Gm-Gg: ASbGnctE3H0ZAi1h4C0/uDBA103FcIN/3uoOX7oocxAxq+5JCJAxsEE0kVP/bS0dEVh
	A6CjIqDMBHJG3bPwvwi0N/i2VsEpBh1hzNmmvSTz/XGJmGyoX3tK4NRyXoU3IXK9tf6TfnjVmDJ
	6D5/UiMa1tLG9dNbR//j4/R9Plye4ymundaD58zB4sUmKCZkfRryfy/929Mg60WX97K82D1y9eG
	49NCTf7HbJ+HAW0Lnkr6XJcN4SmtbhhGQZ+3e7ls9TGu6r0vWwmKl6Pgb9GIEnSmyE4dpVD1ysR
	Le7rEucW905aWLDuZxh+G9QiYrfSapQdhA==
X-Google-Smtp-Source: AGHT+IHQ05G9+oAMbjeXgisbFd1wl/QfYrID71WHh54iV1ya8qGkI9hXiIQ5Vy3Av10chBYKrPFEIg==
X-Received: by 2002:a17:907:2d08:b0:ab7:def3:ca1d with SMTP id a640c23a62f3a-abc09e44f67mr1863250566b.49.1740476692800;
        Tue, 25 Feb 2025 01:44:52 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdc56bsm111970366b.37.2025.02.25.01.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:44:52 -0800 (PST)
Message-ID: <8c1f9454-f0f1-4d4c-a3a9-3757694b8c4c@gmail.com>
Date: Tue, 25 Feb 2025 10:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] capnproto: remove binaries from
 target-build, add bbclass
To: Thomas Schlien <ts@ferncast.de>, openembedded-devel@lists.openembedded.org
References: <1820B183AA0ABC96.15786@lists.openembedded.org>
 <b74c1960-4f13-4758-8a80-22f025577c79@gmail.com>
 <7258a928-31f9-43ec-af76-26af4e331bd5@ferncast.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <7258a928-31f9-43ec-af76-26af4e331bd5@ferncast.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 09:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115566

Hmmm, the native part wasn't supposed to be touched... but now that you
mention, I think I see where my error is. 

Thanks for the feedback, will try to look into this later today (unless
someone else is faster). Not sure about the class-target part, but will
try to check on that too, if I can find a more graceful solution.


On 25.02.25 10:24, Thomas Schlien wrote:
> Hi,
>
> we actually stumbled upon this issue because the patch also removes the 
> binaries from the native package. As a result, our software—which 
> requires the native binaries for compilation—no longer builds. I had to add
>
> SRC_URI:remove = "file://0001-Don-t-check-usr-bin-content-from-cmake.patch"
>
> to a capnproto_%.bbappend in our layer to get it working again.
>
> One could also imagine use cases where having the capnp tools available 
> on the target system would be beneficial. Therefore, I believe that not 
> installing the binaries in the target package should be configurable.
>
> Best regards,
> Thomas
>
> On 03.02.25 13:11, Gyorgy Sarvari via lists.openembedded.org wrote:
>> While looking into Ross' feedback about the first version, I realized 
>> that my
>> sed regex didn't only have superficial problems (namely being an 
>> eyesore, and
>> likely brittle), but it also only solved a part of the problem - it 
>> allowed to
>> link to the cross-compiled libs, but code-generation during class-target
>> compilation from capnproto definitions was still broken.
>>
>> This patch supposed to remediate this too.
>>
>> If you think that having a new class is overcomplicating the issue, I 
>> can be easily
>> convinced about it (but please leave an alternative suggestion also).
>>
>> There is 1 known caveat however: if someone would want to install the 
>> binaries
>> from ${bindir} on the target machine, that won't work after this 
>> change. (Can't
>> really think of any reasons however, why would one do that - this is 
>> not a user-application.)
>>
>> Let me know if there's anything you'd like to change in this patch.
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115239): https://lists.openembedded.org/g/openembedded-devel/message/115239
>> Mute This Topic: https://lists.openembedded.org/mt/110969312/8357607
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ts@ferncast.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

