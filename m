Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C93F3ED79
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 06:20:39 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.265415.1776061232651022861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2026 23:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S5PEsX9/;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4131531eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2026 23:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776061232; x=1776666032; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UzNgS9nrJQu1H2S3vJ13BS6Kv/643p7dxTkwjha14EA=;
        b=S5PEsX9/fy6BbRu0iTBx4HO2UlTXLijefx8oionp1MG8rmbe5KFtjxsNAUyefxKOx9
         H/9J8aiMVv3zRgZSYKg1cPTKi+ehiObwWtQFb5cxKzN1wqBYDSS6l1I8ikFFQa2OhZXi
         UvjZ8ztOliHmseFRHiFCCIV6pvU9jvvvZDscCCZm641idb7YvQMruTK57/lkhFLVKCed
         LDH3mHT2RWQ+Wgfd2B24d4ZzeZbNzerpZiVO9CObVFmS2ref65zao/7YudffwD/VCorG
         tkrXp3/xoHeVvewEUA8UpIZw3LdvBrgC0N9aBmL3BLRF39f9uHIHkhZWVe5baGe5Fc/y
         TabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061232; x=1776666032;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzNgS9nrJQu1H2S3vJ13BS6Kv/643p7dxTkwjha14EA=;
        b=XWLXoRUnCaVOFU5jrDUf+zeGK8WldGkz2Xe41t15VjeFyuFBYCjfQUQLDXE350zdaN
         9gpuEb63dwGFwyN8FMWQvTOo5lN2jgYqZ1GtjJp7Rz3t7Ja4HEdO+7JI3JrJJQeMz3+u
         49vnR4IUlgG5p8fu+dlFbV2ebA8yZIUPQbOKnnBBVl16T4jXaxIFlcgYHYtpTZ71Bfo8
         3LM3yhjkdB5T2jclox/yX8W+ef3ngc0oPAAgMf0xq7BHl/YuRx0Kd6nRDM8O7rN5AX+L
         TgUhZWmmjuwI3rc2xAfqw+q7HWeC/rzmEu9GYjW7qP6J7dWFgUedY+qxqHi31fMVcO2d
         IKYA==
X-Forwarded-Encrypted: i=1; AFNElJ8OnrMWGkOQUfqFiz/t1iLmnpkzgaaDiZ/ogi6XYiwahPE7sJI3SZ00vUuALf22wPkeMmMiCJdyfBt5Pzwz6KxxnnM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVaRXy3NZ90LpFlULEwuBQUZWQ7DBaxv4TCd60ATzrVXzpvbmx
	JFTXT+IgPc46UFnkjcQbUwNPkT9OKDroP0lAo293VzVj+qROSzXMdIHR
X-Gm-Gg: AeBDiesIIY+I/K1TJZ7b/fhBpayM/KulVrFSyYyuq91+mEpZKtFcBnzOGMIxeoAeGSM
	qaNtTlehMzEnM7dCzTUcSbQtw7ccmGmPVJyFWCywQS4FK9TFFgMPYmS5O0CKowbsIAHcbQnhrtU
	eiYpJve2e6hKUE9JiLUd4aaBPB0yYeavO5MfCuVZmJ62IPduJLzh6qDwjJuJVH/lmjCJEOy1ErY
	kL1CGWbi28pxp2IZjesOx/wXleEF8UjKhiZjtXNhWmvxL/Wu0wlBqEPIQIPTsmro4/VtfXL8z+5
	ERwEn2iOOZai34126vgpNq25ulFTeSjsxy66KOPat6ElOtyFVmKGa9ZI2TsreOqSZELid194HGR
	gfWx1GBdCzcuesXPyFYu9vF/dlyf9ZAvf5KH6Pdbmadax/oHytOihJworFl0NcyEas33alyehMk
	+/HgS83OWzZ3XO+PwB7sXICcxNILn2ZgjzIRdir0yTh8EOMRBqrhCf3TNuBOyxHkitJsh0ITuvZ
	08zYapE0V86xajiM6rWZ2mpwnF80MJELNwRv8JXjUP9CRfpMeaC4nxkMrMsPFsIQrvRjIJacqMQ
	zJFZGWde2vzS07ydZDEs4Q==
X-Received: by 2002:a05:7301:4586:b0:2cb:da49:7e54 with SMTP id 5a478bee46e88-2d58638114cmr5531813eec.3.1776061231927;
        Sun, 12 Apr 2026 23:20:31 -0700 (PDT)
Received: from [10.0.0.45] ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15246697eec.14.2026.04.12.23.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 23:20:31 -0700 (PDT)
Message-ID: <4025d0c1-6cf3-4e2a-8e32-23de10a61043@gmail.com>
Date: Sun, 12 Apr 2026 23:20:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking] [PATCH] dovecot: rename downloaded file
 name
To: Martin Jansa <martin.jansa@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260413024804.1678-1-wangmy@fujitsu.com>
 <CA+chaQcEYDO5-jNRVZajTm2mvbnkbParUAXndNGFn-PE72-+OQ@mail.gmail.com>
 <CAMKF1soGuWJji_72+O=7gF7Bg2n+2O4+cXnRB+r6-i6wDxguhw@mail.gmail.com>
 <CA+chaQeczqty-QeThizmr8+uLvoQkfaJOpsPZ1CnSWyZwtpz7w@mail.gmail.com>
Content-Language: en-US-large
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <CA+chaQeczqty-QeThizmr8+uLvoQkfaJOpsPZ1CnSWyZwtpz7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 06:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126272



On 4/12/26 11:15 PM, Martin Jansa wrote:
> On Mon, Apr 13, 2026 at 7:56 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Sun, Apr 12, 2026 at 10:44 PM Martin Jansa via lists.openembedded.org <martin.jansa=gmail.com@lists.openembedded.org> wrote:
>>>
>>> On Mon, Apr 13, 2026 at 4:48 AM wangmy via lists.openembedded.org
>>> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
>>>>
>>>> From: Wang Mingyu <wangmy@fujitsu.com>
>>>>
>>>> Add downloadfilename to SRC_URI to ensure the downloaded file has
>>>> a consistent local name, avoiding potential future filename conflicts.
>>>>
>>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>>> ---
>>>>   meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
>>>> index a6b78ea781..9b3666863c 100644
>>>> --- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
>>>> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
>>>> @@ -9,7 +9,7 @@ SECTION = "mail"
>>>>   LICENSE = "LGPL-2.1-only & MIT & Unicode-3.0 & BSD-3-Clause & PD"
>>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=cb805cc6bdb95ba8fc2398a55fd50877"
>>>>
>>>> -SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
>>>> +SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
>>>
>>> dovecot-${PV}.tar.gz is ${BP}.tar.gz, isn't it?
>>>
>>> To avoid the issue with modified tarball I was assuming something like:
>>>
>>> # 2.4.3 tarball was recreated, see
>>> # https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/V37BEIZTNQODMWIHMTQK5DSOM5RDJ7NF/
>>> SRC_URI = "https://dovecot.org/releases/2.4/${BP}.tar.gz;downloadfilename=${BP}-recreated.tar.gz
>>> \
>>
>>
>> I think the problem is that we might have to  purge the old tarball since upstream has regenerated it with same name+version
> 
> That's why I've asked Wagmy to add downloadfilename so that it uses
> different filename then the original tarball with not matching
> checksum. Then we don't need to manually purge anything, even allows
> to re-build the older metadata still using the old checksum, right?
> 

yeah I guess thats reasonable.

> Cheers,
> 
>>>
>>>
>>>
>>>>              file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
>>>>              file://dovecot.service \
>>>>              file://dovecot.socket \
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>>>
>>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#126269): https://lists.openembedded.org/g/openembedded-devel/message/126269
>>> Mute This Topic: https://lists.openembedded.org/mt/118798933/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


