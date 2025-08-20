Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FBDCA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:28:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.15096.1755678510922867280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOxSzkGC;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b690517so9341078a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755678509; x=1756283309; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jh3qv1pudUdcX1A0QgJbwLQUyshRFY8Nmnmu4ybwD8=;
        b=TOxSzkGCJWkfk8BKBVFsucTBVP1mPeFBTqY8I3edEytT7lYV+4S7ftjBM1LRwmxVro
         eWlynDx+qcLBPlY31WqgvAEUeMaj6XdbwH1VkF6y40jeUFaWRht5roho3Ph1TZ7/9hXi
         vZ3ejp2feX9itB34MuyqZ25VjVgD5uwaIgXNX83Lh01OsXMOZejd0qk++KQrnfpbzDZK
         ooV+Y5B8zACPU5lv8THARCkbm1fEw/pYtvGA9PxXK/0U+ypPX9AATejuJqf3rS7CR3Ia
         gfI3W/DdO3IEWNaFjrtzaNrTfLgPIo4+P7t5oawgJg8/ar8Mp54jdMkWvvq1kYPPgbyx
         iPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678509; x=1756283309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jh3qv1pudUdcX1A0QgJbwLQUyshRFY8Nmnmu4ybwD8=;
        b=NsxleEbKRrkzFw24QDM/BBdivl0gO1ihV+nGpm44igPYQVmjXgAYi/gaKA5+9OfUbd
         YPnQQ/lj19wAr1kUKw/kPDtxslQc3IPSuh68Jr6nfffPs0mU8cqHWK++X1ann8+hRbER
         AokU8X8vGWExt3rwKGl7JPyNavBSL6WrJwJzhOrx8MU5L3N8Fo/nZlnUO/uGEpyKRyFP
         Z8tlPEHPzoVjC7jXR3gKIjlb8toRpJPUE6WCoAo0Ro+tSdTw11+xcs0h9Q5N+QYdLp8U
         UtUok+5A7FHK3/B/FNN2cFr1adERrBFNMLxVMJ/BLkY5LjFG/7myYT4TFLs89IjGgvfO
         emMw==
X-Gm-Message-State: AOJu0Yys7KbBVjdNUtm09lQFL2jOKCj6j+5Z+Nz8mmyOzmG0O3l7qRkB
	LQJUIPiHQ0hrgZefPiVK2+x0yIk+nAcjKPYxojvjQKhav70Ybaw8jOnP
X-Gm-Gg: ASbGnctkPVjDEaz6YP3xfNXRhIo6O+DZdyLPiuyGZvkHMs61gJrDTrU+EAlfm+odK1+
	tjkaloUv9PWqOOxkICfhMPb4JRvqYIR3QHeMD6ssI2nIOODcG4S2MPUSqMZPb8ypDgv9g0gFgb2
	nqav9C+pzrjJONEFaFr/JRSltUnTYmoGos1IUtChEcFQnAgLBI5ECDyAmNXu7ayQ073VIX7XFl2
	sBaqlDVuNYeBxH2aJB42ULk416je/sJdloznai25VvRpT/widX0jCeHkCAT0JsPV5GLCLWkQ9JH
	GbfT83M4lxxEoyJfU443sY30xMb2s1Pl3TszClyJ7ivke4Oywe+kdS1TjeY6s/j6wzBiRfQXYo+
	MzOUoXw0mX/qz4o0P9CgGbP9UAp2L3nhk+R/laIAqXQ==
X-Google-Smtp-Source: AGHT+IHdUD3jx9YIXRZ0m3KMJ0Zg9V8C4XoKmisg3iIGWiyztt1jKGMY9NpYI39MEcDnVopnXliJzQ==
X-Received: by 2002:a17:907:3f25:b0:ae6:eff6:165b with SMTP id a640c23a62f3a-afdf022b8eemr149393866b.60.1755678508834;
        Wed, 20 Aug 2025 01:28:28 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded478d5esm140332166b.72.2025.08.20.01.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 01:28:28 -0700 (PDT)
Message-ID: <698ff4df-4420-4f7d-a07c-bc022083ec5f@gmail.com>
Date: Wed, 20 Aug 2025 10:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] kernel-hardening-checker:
 backport recipe
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250819203929.1272607-1-michael.opdenacker@rootcommit.com>
 <1d47e8eb-0753-47e3-9339-b469f2f141f1@gmail.com>
 <e37ef122-48fa-4422-890b-22f9ad8e9d33@rootcommit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <e37ef122-48fa-4422-890b-22f9ad8e9d33@rootcommit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119013

On 8/20/25 10:04, Michael Opdenacker wrote:
> Hi Gyorgy
>
> Thanks for your reply!
>
> On 8/20/25 09:44, Gyorgy Sarvari wrote:
>> On 8/19/25 22:39, Michael Opdenacker via lists.openembedded.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>>
>>> This recipe is a Scarthgap backport of kernel-hardening-checker_0.6.10.2.bb
>>> in the master branch as of August 19, 2025.
>>>
>>> Tested on qemux86-64 and on beaglebone-yocto
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>> ---
>>>   ...ject.toml-fix-up-license-information.patch | 31 ++++++++++++++
>>>   ...-relax-setuptool-version-requirement.patch | 29 +++++++++++++
>>>   .../kernel-hardening-checker_0.6.10.2.bb      | 41 +++++++++++++++++++
>>>   3 files changed, 101 insertions(+)
>>>   create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0001-pyproject.toml-fix-up-license-information.patch
>>>   create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0002-pyproject.toml-relax-setuptool-version-requirement.patch
>>>   create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
>> Note that new recipes are only accepted in master branch, not in stable
>> branches.
> However, this has already been accepted in master 
> (https://git.openembedded.org/meta-openembedded/commit/?id=5ae3536204ba3764b03647ab75169ee65ca43531)
> It's true that meta-oe didn't originally have this recipe, but what's 
> the harm in sharing with LTS users that could have the same need as 
> mine? The risk of breaking tests again meta-oe?

At the end of the day it's of course the branch maintainer's call if he
accepts the extra recipe and the testing and maintenance tasks that come
with it, but I don't recall it happening in recent years. 

I think it would make precedent - if this recipe is accepted, why
wouldn't others be accepted? When does a small addition become an
unacceptably risky or big one? Stability is boring - and that's the
point. This of course is just the personal opinion of an internet rando
(me), and not official in any shape or form.

> I'm reading https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS 
> ... I guess such a backport qualifies as a "new feature". But does this 
> really apply to meta-openembedded which is not officially part of the LTS?
>
> On the other hand, mixin layers are supposed to be for "potentially 
> invasive changes", which is not the case here.
> So, where are such (new) backports supposed to be shared?

Such backports usually live in product specific layers (sometimes in
other community layers that take up the task of acting like a mixin
layer) until the project updates to a release that contains that recipe.

> Thanks
> Michael.
>


