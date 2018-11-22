Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7837660557
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:43:24 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id b5so15054030iti.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 10:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=wp4sPrXp0QHTB+5cg3REAoIZc4+itqIj3y5aYvBR2ac=;
	b=R19ELbE5VqQJvYWZ2mfj/BizLCR1Ii2n0oLUNkEnrybKozyY+pSSwyHKCAUyXJhfSq
	3PJ8BRwFjgslSgqM7w1HP2ykl6u37x3BpfLGvbKRtMrGP0trQitd/hUwg6aSWXC2dSAS
	gOjWwB/13N21TJp1gmgeIGgAp+4GbU2tXFhbSflW4EEuGfuBXfRQEYGyQspsEMiVIKAo
	wAoEbBpAjvLdlXuLRHUpnlQ/ECduuJEr6XEClaNWcO4LjyAnUUeOkxHSLXmbVmZSRqbh
	NFimPPIUJ9WZBudNLHyy6QBu1utR28+uKPX1Cuy7dr+nTRsrt5Huzyudj8eU7b27qBEi
	K9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=wp4sPrXp0QHTB+5cg3REAoIZc4+itqIj3y5aYvBR2ac=;
	b=UuZlfkvaG2B5HkbtWoeEyKJkuRKu0WXpnumGxqUfpk6ULt/JCsxXwy5vEzUMkhUIQ3
	dpFCLAfOpa4r8kTbc2ViM9BaVaGG3qCUhOJawCdc7ZB413QtFgf1wgIv5I2byIE1g+i2
	k4L3sS2dwZIHkKAWgIswIvHLLMZYYtSisLKhBbMGr9Vo8hZPwEz1OeA5D8CgIb1Ia3nM
	8eAmeZVkkQu1D1tQxGyLpVB/1Z3NdJNMVHAe/Kl8iZB6UepGdqCvWYInc1lmX8fV2OiT
	PEnjEMeEChSwQ0f35GpZ68qutnCpov3YSsT1NuGKtmqblxb7zT669IAnlGgcqQpmwsiR
	tZAQ==
X-Gm-Message-State: AGRZ1gIT7Vro9bTxG1uBY2GFIabs8Ag67b61q+cQ2cyj4EtEzKxTbnoe
	r7nqkoEUCVLgVV/Yd0xii/RKFCuG
X-Google-Smtp-Source: AJdET5f4J7swZq0yrq/vaU0mcQidHTkM6H7HX2NCQiaLyoLroZioajoDTWOB5yV9UuTceEhzFrTIvw==
X-Received: by 2002:a24:458c:: with SMTP id c12mr10292620itd.27.1542912205187; 
	Thu, 22 Nov 2018 10:43:25 -0800 (PST)
Received: from [192.168.0.33] (97-121-174-158.clsp.qwest.net. [97.121.174.158])
	by smtp.gmail.com with ESMTPSA id
	h139sm2057747ith.24.2018.11.22.10.43.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 10:43:24 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	martin@geanix.com
References: <20181112143259.11488-1-schnitzeltony@gmail.com>
	<8a63135c-70eb-6744-fa5c-88092b63bfaf@geanix.com>
	<CALbNGRSz-nvzdtkivON5dZqRojng+MD8WYRU54ohjvUmH8FZYw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e32a4819-0c20-f8d9-ba2a-ca00ae899ffb@gmail.com>
Date: Thu, 22 Nov 2018 11:43:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRSz-nvzdtkivON5dZqRojng+MD8WYRU54ohjvUmH8FZYw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [thud][PATCH 1/2] lvm2: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 18:43:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/22/18 8:03 AM, Andreas Müller wrote:
> On Thu, Nov 22, 2018 at 3:02 PM Martin Hundebøll <martin@geanix.com> wrote:
>> Hi Andreas,
>>
>> On 12/11/2018 15.32, Andreas Müller wrote:
>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>
>>> Update SRC_URI for lvm2 as the previous
>>> one is invalid.
>>>
>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> Tested-by: Stefan Agner <stefan.agner@toradex.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>   meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
>>> index 75f4d89a0..5728d83ea 100644
>>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
>>>
>>>   DEPENDS += "util-linux libaio"
>>>
>>> -SRC_URI = "ftp://sources.redhat.com/pub/lvm2/LVM2.${PV}.tgz \
>>> +SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
>> Why not use
>>    ftp://sources.redhat.com/pub/lvm2/releases/
>> or
>>    https://www.sourceware.org/pub/lvm2/releases/
>>
>> ?
>>
>>>              file://lvm.conf \
>>>              file://0001-implement-libc-specific-reopen_stream.patch \
>>>              file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
>>>
>> --
>> Kind regards,
>> Martin Hundebøll
>> Embedded Linux Consultant
>>
>> +45 61 65 54 61
>> martin@geanix.com
>>
>> Geanix IVS
>> https://geanix.com
>> DK39600706
> Just forwarded a patch from master to thud.
This is in stable/thud-nmut in contrib.

- armin
>
> Andreas


