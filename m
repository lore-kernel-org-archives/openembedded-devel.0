Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id A6B4E78213
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:16:25 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id a204so809230lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zK29j29BhfNQyFIb46o2aIx/xcqsu9By3CWqRqKzs1E=;
	b=Kt7tAZVXb+M7oersOr96e6JpaX8JIWKZkFEyFHYk9U03Hc040i9tozlo0Iu6V5e937
	P8xzic6f8h/0JepiumZiV+pi0KkRjV0ZIUEVkSBJuc0E5NQQ4Q5rhK9pq5quaRfAS2zu
	Kzm3i+lS81b9xDak/dYoZ4BED+UVxvsz1tF7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zK29j29BhfNQyFIb46o2aIx/xcqsu9By3CWqRqKzs1E=;
	b=m32mFcz07IqaNy66DH2F6J6qULK0+SE9mPWld9RE21Quqk5EpQFSpwpJlIwc1tZc24
	geVS3kshfoIRWcVbAQ6HKjuK3/kB7qAZ2NPs8UlnYppqPZNoI2BcfhqbPb2oP/ThEcLH
	NHB3DvhLQy4csa8l1y7sL923u4tl/ktV47ICs+cAPcufhWeiTFn1bVAfCz2GzluXr4VW
	3Cj93TM0XFBcfin9aQyBdrfp+0S5qerw7cnOrPbuhhCqGYsX8clxNZEfEmEs79wosiL8
	0i/Qj7frmRMU59qpyDtB+FrvCF91YMfV+AxXYnE/lVlNXS0/IzgKS+6pCUZoFveKxcFQ
	0a7A==
X-Gm-Message-State: AKwxytfXht+3k/njji3EZW9BcKD+FAEpPPrAqn6bxSX69s7g27ZhIxKy
	U6V6HRmOxtdzhhe+u9/BUZ1JlA==
X-Google-Smtp-Source: AH8x224QxG3zjRfZh9IkyU86NnmbduFg/7P0qvu0O8/RgGVcv5QDn+PjezSIH0jVwH5Y/IF+XkoPow==
X-Received: by 10.25.32.131 with SMTP id g125mr1264305lfg.101.1516716986449;
	Tue, 23 Jan 2018 06:16:26 -0800 (PST)
Received: from [10.5.20.18] ([62.117.114.130])
	by smtp.googlemail.com with ESMTPSA id
	l136sm68338lfb.59.2018.01.23.06.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 06:16:25 -0800 (PST)
To: Maksim Sisov <msisov@igalia.com>
References: <63d85ca3-162a-84de-65af-dde8e02403ab@linaro.org>
	<1832058a2acf7502847a3daf14d6012d@igalia.com>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <00cd549b-e261-6569-4117-a436467dba98@linaro.org>
Date: Tue, 23 Jan 2018 17:16:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1832058a2acf7502847a3daf14d6012d@igalia.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser] RFC: updating chromium-ozone-wayland to 65.0.xxxx.0.rxxxxxx.igalia.1
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
X-List-Received-Date: Tue, 23 Jan 2018 14:16:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hello Maksim,

On 23.01.2018 15:52, Maksim Sisov wrote:
> Hello Andrey,
> 
> Yes, it makes sense to update the recipe, which I'm going to do in the
> end of this or in the beginning of the next week,

That's great news!

Thanks,
Andrey

> as long as the work is
> based on chromium ToT, and the code base is always changing.
> 
> On 22.01.2018 21:54, Andrey Konovalov wrote:
>> Hello,
>>
>> chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb from current
>> meta-browser [1] didn't
>> quite worked for me: e.g. I was getting the "Aw Snap" after filling in
>> the search text box and pressing <Enter>
>> at youtube.com; sometimes when moving the mouse pointer over the
>> screen the mouse cursor became the arrow
>> and was not changing for quite a while when moving over the chromium
>> window (looks similar to the issue [2]
>> though it should have been fixed in r517731 if I got it correct).
>>
>> But when I tried updating chromium-ozone-wayland to version 65 using
>> [3] as the basis,
>> those two issues were gone, and chromium became much more usable for
>> me. Then I did the following:
>>    * from [3] took only the changes relevant to the version update,
>>    * rebased on the current OSSystems/meta-browser,
>>    * replaced the patches added to SRC_URI with the upstream versions
>> where applicable,
>>    * updated to the latest tarball at [4] (though I don't see a
>> difference in how 65.0.3298.0.r524623
>>      and 65.0.3315.0.r527534 behave, any of these are OK for me)
>> - thus ending up with [5] (the 3 topmost commits).
>> (If we go with r524623, the topmost commit is to be dropped. Or if we
>> go with r527534, the two topmost commits
>> are to be squashed into one.)
>> Basically this is still the subset of Maxim's work [3] with minor changes.
>>
>> Does it make sense to update chromium-ozone-wayland to version 65 now?
>> One of my concerns is that it was only tested on an aarch64 target
>> (dragonboard-410c) in rocko, and build-only-tested
>> for an armv7 machine (am57xx-evm, rocko as well).
>>
>>
>> Thanks,
>> Andrey
>>
>>
>> [1]
>> https://github.com/OSSystems/meta-browser/tree/master/recipes-browser/chromium
>> [2] https://github.com/Igalia/chromium/issues/317
>> [3]
>> https://github.com/Igalia/meta-browser/commits/ozone/wayland/65.0.3298.0.r524623
>> [4] https://tmp.igalia.com/chromium-tarballs/
>> [5] https://github.com/andrey-konovalov/meta-browser/commits/my.master
> 
> -Maksim
> 


