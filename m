Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id B790871A5E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jan 2018 07:21:44 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id j192so2610004vkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 23:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4DF34ms9SGjSrHbDWe+Naj9jG8dfiwXFNgwGRj7CbWw=;
	b=sEFB7T9PDeh819+0Bd5i36Ds5jDnZpzHeVVrke757eXqj+f0g10HoxporQi2+0mUUj
	AY+FMQTJRxCB1f2AI/dE8aMecq6pI80M7feEk37giR65VCWTQIclj3fcZUWOFDhlYMpi
	33Ogx/60DsUYCu5LMKjJ1kfOsuyg+zHmavrnLTCPZJ7XjFZfDyl4raGp24tQ82mqCnOp
	PtjeAUzvk6s/py6bc6RN6vD7x1t/dG/wm36ur5KGW1CqobvdVQOSoLOCoSU3nfj2XbrX
	drD+ediYRlBkT2qHxQ12q9ZdOP67187fBBdgjYe9dha/+4bc4L4Z3mZFDJ91aebcpCBP
	rDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4DF34ms9SGjSrHbDWe+Naj9jG8dfiwXFNgwGRj7CbWw=;
	b=f/Gj0axjapUsefJg/kefd8saEIp1ie9K1Go8o2tKSqPvj9vl0wRjKT8qCZYrGe4asK
	aNNKoXRmNsYza9OKQ3waRpuQTMVLvZKmTAVE5bAf9ctPMc51ALk/CqsaQPw8itz8Yiyp
	OSuWWi1f/emOq2uSOtFnBfmYOJM0nW/hb67nOIGTLJkX+Rs2lkbOtEXpIjfPgIR9cxnS
	4O34AYcEbpmRw04Li4Cd26KmHTI5NoYWg8TEzjzsyTCe4VUOKLMO2l8YgX91ljIwIxRR
	25VZiPUUL9/qtHhnjGTXNOkHfD1mR31w/BUeM46kbjhsaolBF8I//4Khel/je4s7C3Zm
	WGoQ==
X-Gm-Message-State: AKwxytfU2T0bevCRZrcYt7o8ULDidL9yxQ8VIAxM9ZpLqkkpzvyJ1htz
	qILjsJSOgMT7dmw2bf+YZjTBkBTE9kHIorPtUT8=
X-Google-Smtp-Source: ACJfBosq/swBY0TakgDvHk+52aUQC4s7GVOX+WeuvcM8v+yKFEC8/tXjO8IfM8cjoLnL3WiypFglJTSHNLsofefUEyI=
X-Received: by 10.159.33.167 with SMTP id 36mr1145612uac.3.1515136906012; Thu,
	04 Jan 2018 23:21:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.130.211 with HTTP; Thu, 4 Jan 2018 23:21:45 -0800 (PST)
In-Reply-To: <CACrLJgB3TDPRuehnJ8xg8nqF_XjEVQyuVjL=NdQAWoWTwKxrgA@mail.gmail.com>
References: <CACrLJgAyV=KOputf8o8O9=Acqu=V7gSUyY6hhBBFPBVECTFhVQ@mail.gmail.com>
	<CAMKF1srBOJ9_E4sDx5iH8-r9b0NayX0-Wh-d4yWi9Ahjps2MNQ@mail.gmail.com>
	<CACrLJgB3TDPRuehnJ8xg8nqF_XjEVQyuVjL=NdQAWoWTwKxrgA@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Fri, 5 Jan 2018 16:21:45 +0900
Message-ID: <CACrLJgDBdxV8pf=8fvpuphb1+aFupQZojzR+xPHzeOWyQ1Vmng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: How to use two toolchains
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
X-List-Received-Date: Fri, 05 Jan 2018 07:21:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem, All

Now i'm trying to use multilib to support 64bit kernel and 32bit userspace.
Most of components are working but I got a problem when I use
IMAGE_FEATURES.
Do you have any idea to use IMAGE_FEATURES for multilib?

Thanks
Changhyeok

2017-09-23 9:15 GMT+09:00 Changhyeok Bae <changhyeok.bae@gmail.com>:

> Hi Khem, Randy
>
> Thanks for your comment and I'll try using multilib.
>
> I found another option in https://www.openembedded.org/
> wiki/Adding_a_secondary_toolchain
>
> Thanks
> Changhyeok
>
> 2017-09-23 0:55 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>
>> On Fri, Sep 22, 2017 at 7:22 AM, Changhyeok Bae
>> <changhyeok.bae@gmail.com> wrote:
>> > Hi
>> >
>> > I would like to use 64 bit for kernel and 32 bit for userspace(rootfs).
>> > Toolchain is created by OE (Not prebuilt toolchain)
>> > Could you recommend good way to use different toolchains to achieve my
>> goal?
>>
>> I think you can look into multilib where, 64bit is default but then you
>> constuct
>> an image where rootfs is virtually just 32bit packages
>>
>> > If you have good examples, it's very helpful to me.
>> >
>> > Thanks
>> > Changhyeok
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Thanks
> Changhyeok
>



-- 
Thanks
Changhyeok

