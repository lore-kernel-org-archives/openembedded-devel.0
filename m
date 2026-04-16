Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DD4F8809D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 07:18:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7969.1776323914775256885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 00:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eYxe5WSE;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so100381995e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 00:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776323913; x=1776928713; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=08oHJyD8gPdPEwjEveC86JQUWnmWv48M6PLPnZ/0yWU=;
        b=eYxe5WSEGpvYpwrblr9ebQhsJK2eg4Z/hADeA9ajch083eeAkwj++mmKgKmJBpJ8bz
         0jy4AS8MuJK0NfJZm1r8MnG1dTH3ankWNDKWZUMbvbsvhDeuYps6ISmZa7y2C+Hq6u/c
         g9bPoHoHhlYYdj2PlTLP3VptTkOBdhgfdohYoSZ6aQA2jFmX51CgYrOPF+b51zk5AvJ/
         VC8gNaf6FT3WOk7mSgBrx72GOdUgssbQedSvVx/s1vb1uHWr0yJrAlYpdm7qALDR7ZAr
         WHMwGb0ch5PtZjv5uWNo7YSnL6taPOS3jtIo503c35+cZDrNuy1+p0/+uQIUlE0cr7Fe
         Vh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323913; x=1776928713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08oHJyD8gPdPEwjEveC86JQUWnmWv48M6PLPnZ/0yWU=;
        b=m1DaOX+kwhXuURQP7HzqNA7FSy6pQJCuKzSfFpYsJHw3Qj15DXWrt9QtVmplhYwTdY
         lDb1yv5nwcX1geCNjtGLZYipyI3ylcRoZ2KlPS6inXGSXsz7aIiklavhgxVg0qA4m4eA
         wUhD0jsYVXU+cFOoV416fDd2dHotlATmJRU6G87O8i5LrXQr6xw4fFbZNPWK2UYSIXTE
         WQZxlUgP+NHNkhTwww0dd6Fl0FS4u5YO+kBQMBYMaYpdbjWIL+zcaIjjsrHni/AxCA3J
         EtFX2rW3y5yhaIJlO41aSCdQTanLRJeld5a7aXXTiZq4XYgwUHXXIkSojMPrRv93kOwY
         VX5g==
X-Forwarded-Encrypted: i=1; AFNElJ+x3xnOlGwA4ZF1noWMykHjsG4v4HZ5cU7weHx/wBUzVpG/GUjt5/zW9EdEe4Nt5EP76FZ80m1aM9gIDdnoFItNlMg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRNzWHYj1ab6K+MSLM7QdgRAdpdT5Ldtb8GR6ThnUQPklK7Sgl
	7QrHPuRPKoz5R8btSRVpqyWAddBncRbA8fv9vgAIpeqwZFKoQwyM9g2V
X-Gm-Gg: AeBDies0yFF/5/shG1eL/yPFY5MsTkT7ZAUAylBrU4bJw2IWcN0OuCCnhO91axpZTLD
	fnufzCby8yKgYdjshbJX0jJFrHdx+hD2z9/bPoDDm8yf/zaEgVD5LWaM91RpKUrmPKLYcqLkEbE
	eA11N7Ee73VQ83TIxnqfu/LF5Kx5IbaAfMgERh4/Lg1hkWaoZOiruZdR4u7Ff8nhqj9hbmRPCHL
	UiSsIpAuiPQ44e0LYyQzY4mk96ntoQ6lpc1xvmSt1uLKGr9CPokFY6IEIVHbGFnoiCQHFaIHx3F
	cWUPCmRGC/by1sQql3d6fyAjF3aSmXIltnruBpy/5Xj45enS7Cn0w8dcZe8VcBZ+eCVq0YmkwDm
	VzhfClqVy4UmI/f8S4Yz2qIxRpUdclvGaIMLYqqYgPNBNCK3kZDl2IRKt5FM12NIwS32RMNMpJ6
	YwBASQPK6LZbPaWO9mEjJx5EiDlhqUhw5fuko2HLbB+A==
X-Received: by 2002:a05:600c:528f:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488d689d0b8mr327885585e9.26.1776323912764;
        Thu, 16 Apr 2026 00:18:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f585cefdsm30135275e9.14.2026.04.16.00.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 00:18:32 -0700 (PDT)
Message-ID: <6c6a6f90-f25c-4b85-9c00-665f0f4e21b4@gmail.com>
Date: Thu, 16 Apr 2026 09:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to release version 2.02
To: mail@michael-fitzmayer.de, openembedded-devel@lists.openembedded.org
References: <CAMKF1sqWpfSsFVSiBkiQCQkv0pjTSh1i9HJuX06E_EkBd4jmyQ@mail.gmail.com>
 <3323E3B7-6461-427C-9A02-0C108D4A139B@michael-fitzmayer.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <3323E3B7-6461-427C-9A02-0C108D4A139B@michael-fitzmayer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 07:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126401

On 4/16/26 08:35, Michael Fitzmayer via lists.openembedded.org wrote:
> 
>> On 16. Apr 2026, at 03:43, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Apr 15, 2026 at 6:14 PM Michael Fitzmayer via
>> lists.openembedded.org <http://lists.openembedded.org> <mail=michael-
>> fitzmayer.de@lists.openembedded.org <mailto:michael-
>> fitzmayer.de@lists.openembedded.org>> wrote:
>>
>>
>>     What can I do to resolve this problem?
>>
>>
>> bitbake recipe -ccleanall
>> bitbake recipe 
>>
>>
> 
> Thanks, I was able to reproduce the issue. I'm not sure what went wrong,
> and I'll try to be a little more careful in the future.
> 
> Sent a new/updated patch.
> 

As I can see these patches basically move the recipe to the tip of the
main branch. In the future, if there would be such cases, where there
are extra commits after a tag that need to be included in the recipe,
you can just set the SRCREV to the correct revision, if there are no
commits that need to be skipped. You can just add `PV .= "+git"` to the
recipe to indicate that there are some extra goodies included also after
the tag (and maybe add a quick note in the commit message about it).
That avoids messing with patches and makes the intent also clearer.

I wouldn't send a new version because of this, but it might be useful
for the next time.

