Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 05D4C772DB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 20:51:59 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id l126so11645541vkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 12:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PUKHhehrBXnnhjzV+FcrhundVxpq4+c9n1FUhRVm+WU=;
	b=K3DOLsdrAnt5X1cZB0A1ZBpNlNCbRjGdSTUJrM7duIedBH+dAg4A1NsPvrfi0rAGpM
	UM4yr7xsRFr75S7RAUI6jA5nLH4gxRhcIosfgzLd8eZxSqVgS0HNKjk/a/lf7N5tKhaE
	Ig9DqKiUi0690r4dylBTi5I2XLF03ayO7Q52VFbttzbDZZccs9MjLHPvxwM/tHPTtVx0
	vXlzlIOYJ34AlLFh0wZoVx/VU7RhX5QaNJ/ThQp+zs4obsVaxaqENiccPZDwlrhHpls2
	6K0PGcDMnH9HUyFcAl7LLgWJG2TjRdV86YI+OcO5T8JxbrCDyMsLjk6BobMUi7vDxUK8
	tBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PUKHhehrBXnnhjzV+FcrhundVxpq4+c9n1FUhRVm+WU=;
	b=Rjb2kEMJbv8Ab2OzXsdwzfRBlhZ4gPPlMqbti/90EeYEYzkJS7QjQc5G6D5KmdKzo3
	eH2PO68XjD77nfItBPk8F1CMRF6I9DTlx4K3UohtZrJXo//AGrKWi5CPcGPhnOxk3Zq/
	jDD/5LtEBJsREROO6XrWouSj8vwPWMToAmjrYgRELcChTBwLa31pD9gIq2tEWfODkwSb
	niR8UBZsGSDIKV53YGUArbgJiFLPcThmHqW2BjMcqi9haGGlE7Sp0yiw8w2NWuJWTWGz
	t3xA40vQutHcb532HXpHr31FHmYm+vzhlJbnXz8rgxAl8qUFQMY02ExDRMN1rnBlAHSX
	GxLA==
X-Gm-Message-State: AIkVDXK4tlRq08rm01o6VkwT9PHuR1ZbVBvOXKM+C7SSa1a8EpOUQ00q5JMx3LWxzCcdrDU8pWioZGizyJDl9A==
X-Received: by 10.31.108.144 with SMTP id j16mr3033751vki.93.1482007920761;
	Sat, 17 Dec 2016 12:52:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 17 Dec 2016 12:51:30 -0800 (PST)
In-Reply-To: <b6ae8d86-ec1e-64dc-e90a-7befdcd8406f@opendreambox.org>
References: <1480507543-21520-1-git-send-email-obi@opendreambox.org>
	<20161202083248.GC3721@jama>
	<ca559e68-43b4-312a-fee2-8ec8f2083d0b@opendreambox.org>
	<b6ae8d86-ec1e-64dc-e90a-7befdcd8406f@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Dec 2016 12:51:30 -0800
Message-ID: <CAMKF1sqFn7O_QG1UKp3bOccOM+DNE0A5dfekniYx23V8xqYaVg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: unblacklist and update to 4.8.0
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
X-List-Received-Date: Sat, 17 Dec 2016 20:52:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 17, 2016 at 7:24 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 07.12.2016 02:57, Andreas Oberritter wrote:
>> On 02.12.2016 09:32, Martin Jansa wrote:
>>> On Wed, Nov 30, 2016 at 01:05:43PM +0100, Andreas Oberritter wrote:
>>>> A patch similar to drop-configure-check-for-aio.patch was applied upstream.
>>>
>>> Khem already sent 4.8.0 earlier and I've merged his version today.
>>>
>>> Can you rebase on current master to see if we still need anything from
>>> this?
>>
>> Khem, your version fails to build for me (glibc; default PACKAGECONFIG):
>>
>> | .../xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_alloc.o): In function `platform_uuid_compare':
>> | /usr/src/debug/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/include/linux.h:89: undefined reference to `uuid_compare'
>>
>> The error disappears once I remove link_needed_libs.patch.
>
> Khem, did you have time to look into this? Would you accept a patch
> removing link_needed_libs.patch? This file contains no description about
> what it tries to fix and breaks my build.

This make use  of libtool to do all installing, helps fixing compiling
with clang
and also not using native tools. Its possible that it missed
something. Help me understand your environment, are you using gold
linker ?

