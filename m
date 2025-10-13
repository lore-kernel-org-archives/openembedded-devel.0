Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1B0CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:38:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.52581.1760380721966166096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4+VEpiF;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso46633455e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760380720; x=1760985520; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvM8CPdx1iUS9uAtg9bYp7izuqVtIkz6MBohtit63t8=;
        b=f4+VEpiFMtE61M7UlxJ0HwXtaDeV2BI7fBw1IsE4QVSv42a65EEXwBTI6QEqwPAC1b
         VZSa/eQv1KqzTyl7W+WVA1XmzB+e7EcZ/Daxp0wiXsj4XFsoyTqtQbPQILaYGzHlHyyx
         a0y2QdUG076s1ODY7m9FfXAXCZcX9kce/Lik5kN2O9/QgYpTs6KU1FZLTjsU8W+Fl57E
         Kao4rYbWJSGW1zm1eJirr3lLVNIKcNjxT+9F1Pr3P7nHgeIemaWMkJbKc+nc9DkCO2fY
         dfwG0jYueBJShmjR3WK/bJUoJHvTJ303NoM4AlPEitsp6nQRL501yZLgUTBFe3TwgJIO
         Uq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760380720; x=1760985520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvM8CPdx1iUS9uAtg9bYp7izuqVtIkz6MBohtit63t8=;
        b=q/W36qhdbGLWBsDFjS3ng0fptu4QBvFuIj491cbGkFjlJ1Ejrt9ERB+Xl19CRs3CtX
         kHoxVcjHUdaZytT2LwC0Z8wiyTD58SdAn054yPPw7qZR3hF5w/3HgqqvSvDFrLTU8DmY
         Enn9tR5mz8Gj3fLKGY4gFxQEqqMTxSEMq2bKi1lthzivp/nOeLRI6pSaTlysStyDll5g
         SD/RiYx0TRcbmW/urRP2wysp46Nw4HJXllRQ3jJitaQ/VRt4mJ0XH8pep4MUXYXK/LFq
         kgvFIx6zirkQ6DuEu5GIHa/n7FQO+63JlK9Joxz2+L0EuaCfIQ24qTdx5HnMLrx/PsqT
         Bj0w==
X-Forwarded-Encrypted: i=1; AJvYcCXXSfsVsMARUqhuVEHGpzpiiDgbz4LMP6vP6Ln/mmT78KfPTu6qAtMz7qMVB5ts3pJovKpG5UxMXadQeP2EzPqb9GU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxcUbvXtEQQR/qfQxkBS9okFJOs2ZPqlHB40089yzO7lPOkaCZ
	ZsmedrYnkUG10u5WTfJ2R1rbkio3qrt/+zVCi36jAcD/VDj/beFAd6MY
X-Gm-Gg: ASbGnctveO2wUzR1TEsGPSHbMEjRK13tvnIFVSv09yioBwJsadOQdnRv9FVui/4oC2O
	gNndTb5mjGYT+77Z3cQWdprpdG5vPWeWSJwebWRIz6dH4UEPzKzezmwmwU3ElENa3Ep0yuPVmbV
	qahvGKuS5GpIgXFJSQAr8+lL96FFmovsWrgeFoLUqMVpXMfuQP8CtPLkZXwnDNrCpFpO3c5v2ds
	xNL0DE2UwcnDJHmNy2DsJiceJsLEKqmycqcA4W5lF4goy6Tew5hjv2BbsO+onnqMhgmQIiVPHH/
	hqNPOsHwYNFhsNobCj4REfOchGsWdb/KvuNp3ILekIa4z8ca4oByQZ5kx7TwyzEtCMwGTEylVr/
	okjCV+syrgC7vkpwQvhPryaOkhnlD9ukSurju2TCi48zsKsQYPmQhvL+9Jz1D
X-Google-Smtp-Source: AGHT+IHGuadlbfjZKialw7k56+2PvYIkdQjYl92mHSurOI5Uh5k0EtrJ0wPQNtU+g4aC5UVP8nzWnQ==
X-Received: by 2002:a05:600c:628b:b0:46e:4814:4b6f with SMTP id 5b1f17b1804b1-46fa9a942b1mr163718935e9.2.1760380720208;
        Mon, 13 Oct 2025 11:38:40 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484c71csm204866885e9.8.2025.10.13.11.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 11:38:39 -0700 (PDT)
Message-ID: <b8673d51-38b6-4240-99cc-46f48db53893@gmail.com>
Date: Mon, 13 Oct 2025 20:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE reports for meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <0ac1058a-bdcd-4153-a39c-9a40e392c5fd@gmail.com>
 <8195C691-14FE-43C6-9C78-CA6677FB7887@arm.com>
 <0544c309-ec5e-4009-a960-07891926eb93@gmail.com>
 <CAMKF1so8MPVbNnzRJWiwSYhB19htoZuTzUVGT5YTHe3w_JFFoA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1so8MPVbNnzRJWiwSYhB19htoZuTzUVGT5YTHe3w_JFFoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 18:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120544

On 10/13/25 19:04, Khem Raj wrote:
> On Mon, Oct 13, 2025 at 6:47 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> On 10/13/25 15:40, Ross Burton wrote:
>>> Hi Gyorgy,
>>>
>>> On 13 Oct 2025, at 14:35, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>>>> For now this is kinda experimental to see if it is useful - I find it
>>>> useful for oe-core, and hope it will make sense for meta-oe layers too.
>>>> I plan to send them weekly until at least the end of November for all
>>>> non-EOL branches, and if it proves to be not spam, then will find a way
>>>> to make it happen indefinitely in an automated way.
>>> Are these generated with the cve-check tooling?  It’s interesting how they different slightly from the autobuilder-generated metrics:
>>>
>>> https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/
>>>
>>> (you can click on “master” at the top to see the breakdown)
>>>
>>> Ross
>> Yes, it comes from the standard cve-checker, with oe-core recipes
>> filtered out from the final result - also, didn't know that such a
>> report exists for meta-oe.
>> Indeed, it is interesting... e.g. I wonder why audiofile CVEs are not
>> showing up there.
> AB does not test all the layers under meta-openembedded,  only
> meta-oe
> meta-python
> meta-networking
> meta-filesystems
>
> are tested, due to compute requirements. thats why you do not see
> audiofile there perhaps.

Thanks, that, along with Peter's note seems to explain it to me.



