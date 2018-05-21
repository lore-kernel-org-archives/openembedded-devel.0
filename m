Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 745B37480F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 22:33:57 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id f22-v6so10996384uam.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 15:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ZNENq4SBpQsWaUR4Fq5q3y9vfU5jL9/50y9XNW5yNRo=;
	b=uNpI7+L+XJmn0SqwShlb9BLUPcx/xbslDVNKzhLoKNkn6h9xbhzRhtR7V47Dg7JPEX
	BkoddsCE3FhrzE1zs1BHw0Q2BnVz85FeAUD/5M2HF7oW2ljhQkHFiIwVOuKA00dB7swg
	fo8XCf3nBgN1AZ7oFAUASStt+kZC24jCxLbWn2jdzKfqsJ5w0yjM916TGDshfFW6NZla
	GngJZcM7UZNhpGWKoGfl8wy1OyEuyV4KrqQcirkfu555zVdq6HkLq0CnJWr3m8oOl0Ow
	3SkzOmxW8RB0jR7L+P75yKrai+5PbgdGtF5g9luovhLWa1Y4uaPPBcM0ARmiyREXyxxf
	FziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ZNENq4SBpQsWaUR4Fq5q3y9vfU5jL9/50y9XNW5yNRo=;
	b=L7pZNkWMqsATSL85f++4VYbT2jHGmDbM/ZldSwH0f7+FyxjkSUo0vzLzLm2T115D4Y
	wnas3BZRhyP/XLVRGcQUCiDO17qeKnW/lhDvycAY693+xm2p6BVFNJ95gQIYDQwpwNCB
	To2bFLscOb9fEM9Du9R2kJH5mQYgJX4yO+GWMXgS6yGWQeylBqEHnn0x2GDc4hVp6LI0
	UAOKEzAZUh6zGAQsNE3Wcwjo+N021BcbxsBZLoKHLUuHbXM4C0XxCneMDiz7gv4oZ6lO
	QH6oKXWk9/jT/2qSrlAfFaOxbPR/bWOdo4aN8U9eVMV7Wyacr0BwY0Na3AGY3jmtfKn7
	n72Q==
X-Gm-Message-State: ALKqPwceJU4m1pGHm+c0VDxydiqGmcUFCcd4CAPrPnSyBCuaKmx2vqkr
	vEyg2/bhHIXP32kZq0uNquxsGF9TFvxQ1zZwTOI=
X-Google-Smtp-Source: AB8JxZpmmGlGgpnXKcfPzsfEG7YE25HHxoq+PlfzUHYchI94ixAzbAiaJLtIRsVAUirI5Gi+D44MUkFiY+EnbgjVQW0=
X-Received: by 2002:a9f:336c:: with SMTP id
	a44-v6mr16285143uac.38.1526942038068; 
	Mon, 21 May 2018 15:33:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Mon, 21 May 2018 15:33:57
	-0700 (PDT)
In-Reply-To: <2d676743-0f4f-a079-96b0-c352546ed892@igalia.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
	<20180512030758.31409-5-raj.khem@gmail.com>
	<8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
	<b55b0545-7867-a168-a853-903313da12de@gmail.com>
	<5e41dd1d-0a05-39a4-888c-948be3cc8714@igalia.com>
	<CAJ86T=VXbwsL=2gUqin0-2jdBB1tbbxgwP7+76AToZdO16Jtiw@mail.gmail.com>
	<2d676743-0f4f-a079-96b0-c352546ed892@igalia.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 21 May 2018 15:33:57 -0700
Message-ID: <CAJ86T=UvTG5f-OjpG-X_k15wqGMSk1RoAh+3=nZFvt69ZJnWQg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when compiling host binaries
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
X-List-Received-Date: Mon, 21 May 2018 22:33:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 20, 2018 at 12:02 PM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> On 18/05/18 20:46, Andre McCurdy wrote:
>> On Fri, May 18, 2018 at 6:27 AM, Carlos Alberto Lopez Perez
>> <clopez@igalia.com> wrote:
>>> On 18/05/18 06:44, Khem Raj wrote:
>>>>> I suggest adding something like this:
>>>>>
>>>>> EXTRA_OEMAKE_remove_class-target = "'HOST_LDFLAGS=${BUILD_LDFLAGS}'"
>>
>> This idea looks right, but be aware that ${BUILD_LDFLAGS} will be
>> expanded before being processed by _remove. Therefore any individual
>> string within ${BUILD_LDFLAGS} will be removed from the final value of
>> EXTRA_OEMAKE, even if it occurs somewhere other than in the value of
>> HOST_LDFLAGS. For example:
>>
>>   BUILD_CFLAGS = "one two three"
>>   BUILD_LDFLAGS = "one two three"
>>
>>   FOO = " \
>>     'HOST_CFLAGS=${BUILD_CFLAGS}' \
>>     'HOST_LDFLAGS=${BUILD_LDFLAGS}' \
>>   "
>>
>>   FOO_remove_class-target = "'HOST_LDFLAGS=${BUILD_LDFLAGS}'"
>>
>>   $ bitbake recipe -e | grep ^FOO=
>>
>>   FOO="'HOST_CFLAGS=one three'"
>>
>> Notice how "two" has been removed from the final value of HOST_CFLAGS
>> set within FOO.
>
> Interesting.. didn't knew this.
>
> Is there any way to tell _remove to only remove a string if it matches
> as a whole instead of removing the individual words separated by spaces?
> I tried escaping the quotes but didn't worked :?

I don't think there's a way to do that.

