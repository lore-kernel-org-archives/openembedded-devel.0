Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A37C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 20:14:58 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.6962.1751400897722353501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 13:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bw+EHzMp;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso6446696a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751400896; x=1752005696; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fybzT87uDqLb9TSeIC6Z96S3qMJTzvVfQc3NGu6Fymw=;
        b=Bw+EHzMpeG6wPZak07pIaJkx34jqqK1xQxXFacbVwzN6DaVutuK/x4Jx2OVMKzJsBs
         /UJ9IBlODgXPIsuBWMfE6f8AY3dtfsPC6YQC1NeFXuPbDisIEz4932eK6YipG0gvY7MG
         AUcIq3siTUh2/QwTbJMIrEt2lpSUpL/MD/ithYffWXOcn3rapQPXKXBUjI02xz5n995h
         GCf1JUFj/4TmCS336ZaDXjOgfzvLjuyiUBFJtDlZp5C0+BGA9fRSgblUSG+Re85cIW/H
         98k7YYqMdkpIDCryjpITLXPNrtgDakYNIaH7I8yo2+D44Wbk4di/eD+bbUFywpLnlhCw
         tXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751400896; x=1752005696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fybzT87uDqLb9TSeIC6Z96S3qMJTzvVfQc3NGu6Fymw=;
        b=FYzFysmk4SqNp8UHdayEH3FkAGoW55oTNbxr6PU3DAH0ys+gCKzUwo1U6PmHlldUJV
         UBF/8fb/aMovYnEg3kPwykwGba9Dwt5XUqQi9ykzY3LrowGMuBkChbGA4Qm/5Kxxpjlg
         VelJfBvz4AkGoKaAhSDHuN8PQ1gO+6QZZwAkHby6yrGmXKl0uYq+KMpbEp6G5A+X5N85
         zum0rZs6p5Aky0nncDh63TOj4ujB7s+eBuLFOwt8LG+BVsLnILOdm6s0Q+B+HLINc+21
         IWK0qK4Si1sSHp1JvE0wL4kaDubSZwLvj9NA4OnBGkoWYPC2aBqgAxdzdK3Nn/4oyFE3
         cvqA==
X-Gm-Message-State: AOJu0YzmYiIY4zY8ZmGj8QSuJuoKU7CBQsKfq8FiTl/dshJht2r+ioIQ
	qqya5sl0fSrFJAGJF4RuowIujThf4jiwStZveZKzA2NuYeCvSyzqDgyf
X-Gm-Gg: ASbGnctFDTgQ9Gy9ApiMMVCSNr5AghXHUDnqK0MeQ5oXgxwDwHZz6S+tun86ncsU3wn
	ix2lM4b1yCHmNEMn1Fu9vgKk/3eLK42wj1tvQk2Kc82YXwaZSrpa2Og9S1st+Jq+TmlwcIpFGZ4
	oXpPMhPcutaKJaNvVDV+GquPGpK7+rnv6YyYsSnUpiL09AvHSv+etC+3a+HW69EfV3oumF41P6L
	PsWUfJxOOhLJ0k9q442N2hCmfcOANgy87wxtjvrpD4F9uUf1aEDs0OHMgVvzyIUBoMeppx2iEt3
	SB5THsr4ihj513IzUhTZ1gYEV7+BMmfA6Y4A6AT/v5a+/E/R1iWjGjqh+SnfKPe0xVlp5Q==
X-Google-Smtp-Source: AGHT+IGqq2ttWnhuK7E6QCdHZuxGyhMh5OrhcOc30oVHrKK2srw1VMwcMQegTAw2Ayw1WAziqocyKQ==
X-Received: by 2002:a17:907:7f2a:b0:ad8:9a86:cf52 with SMTP id a640c23a62f3a-ae3c2bf316dmr16285466b.11.1751400895554;
        Tue, 01 Jul 2025 13:14:55 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b0e6sm928935866b.20.2025.07.01.13.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 13:14:54 -0700 (PDT)
Message-ID: <483e12f7-cfaa-41de-9ec8-cbed16223203@gmail.com>
Date: Tue, 1 Jul 2025 22:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: inherit qemu class conditionally
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250627140633.354460-1-skandigraun@gmail.com>
 <CANNYZj_K1AT8nov3Wz30bUVdReE=c=DNvgKEQ5tKAygVb1MshQ@mail.gmail.com>
 <bd09d601-b551-4621-aa6d-ca9d05473280@gmail.com>
 <CANNYZj9cDCB6Y5yi18p_+MfTtfeokgrqniwdKRhFi=rTXVtu=g@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj9cDCB6Y5yi18p_+MfTtfeokgrqniwdKRhFi=rTXVtu=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 20:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118195



On 6/30/25 11:49, Alexander Kanavin wrote:
> On Mon, 30 Jun 2025 at 11:46, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> Though I thought I do, apparently I don't have a step-by-step
>> reproduction (yet?) unfortunately. I keep looking at diffsigs and then
>> bitbake -e, and hope to catch it (which usually point to QEMU_OPTIONS &
>> co, but yeah. there seems to be more to this).
>> Until now I thought that it happens just by simply building
>> nodejs-native for different targets, but now that I tried to observe it
>> in a targeted way, it doesn't seem to be the case. Keep building images
>> that have nodejs-native as their build dependency :S
> If you're unable to reproduce on demand, you can't confirm that this
> patch is indeed fixing the issue either :-/
>
> I can try to help you, but only if the starting point is specific
> instructions on how to see the problem, otherwise I'd only get
> frustrated at wasting time trying to get there first.
>
> Alex
Apparently somehow my clean setup broke yesterday - and that caused my
surprise that the issue doesn't happen as I described in the commit
message. It was building garbage. After deleting it, and starting new,
the issue does happen again, 100% - just "MACHINE=foo1 bitbake
nodejs-native". New target machine comes with new rebuild. Inheriting
rm_work globally makes it very visible. Even after deleting the env and
starting it from scratch, the behavior is consistent.

Python recipe doesn't use qemu by default, and doesn't use it at all for
the native build (it even errors out due to circular dependency if one
tries to force it with pgo packageconfig). When I modify the recipe to
use it without pgo (comment out  'write_pgo_wrapper:class-native =
":"'), then it has the same issue: when target machine changes,
TUNE_PKGARCH changes also, and it kicks off a new python-native rebuild.

Now the issue seems to happen if the qemu_wrapper_cmdline function from
qemu class is actually part of the recipe. Inheriting qemu class in any
recipe, and adding e.g. "echo ${@qemu_wrapper_cmdline(d, 'foo',
['bar'])}" to any task that's running during native build will trigger
the issue.
Don't know if it's some optimization to only include variables that are
actually used, or something else, but today I can't spend time on this,
and at the end of the day it looks like I'm the only one building images
for multiple targets with nodejs dependency, so whatever.

As a closing thought, I want to reject all kind of suggestions and
insinuations that I have asked for your help, I am frustrating you or
that I am wasting your time.
If you ignore or spend time on any information I share anywhere, that's
only your choice. I have never asked any help from you - if you do it on
your own, that's ok, but if not, that's just as equally ok. If you feel
that I am pressuring you to do anything, ever, call me out on that.
Otherwise if you are getting frustrated, that's your own doing, and
don't put the blame on me nor on anyone else.

The first email was a response to a question, not an demand/ask for help
or any other action. This email is a curtesy followup, in the hope that
it will be of interest for some - but not any request nor suggestion for
you (or anyone else) to do anything whatsoever.

