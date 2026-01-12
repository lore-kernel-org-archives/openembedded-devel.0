Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B65AD2505D
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:20:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29414.1768209632025140079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 01:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+6eD3/E;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775895d69cso30100695e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768209630; x=1768814430; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFGEWXExGzI9s570negK7LId6IxZy+1f7Rtd0nVpuPs=;
        b=f+6eD3/ENCX9sAxcnqvW9uWzGhNphamYHqCnyzQTzhMxPEmjTZodouCzl52C5lJ7KH
         N7drfwyq08yzwFrn6sWqIThiDE1gcijShPfO7FBDFp9rJumJlSFyOyLwZWy8eGiT5yuV
         wKMAeVQ7OHD8UPwX1osxorl87nXtDpBrooLcgRSkReIZbSwk//bias87tMAwoyY0iU0U
         /kCuhs/TE2z6LR0qmJdWZLMV6f4uJ09iRMm35ZfIeDvJHf2wf74YmrQdcFM8QUCCm9T6
         idda8rwjmJ3ofcbQcA0onvZrTe6HDmaQyEVAPAaxC6QQVLzwyp085gs8lgjIjHV80z9H
         4dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209630; x=1768814430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFGEWXExGzI9s570negK7LId6IxZy+1f7Rtd0nVpuPs=;
        b=nri0ONuIf6tIjUX/rcPEzet9lD0rpvjOWdfVqzJ39GLiGHhhMGNYJpfIcQZGc8TDSW
         4WXiWkA1AA6x0CbGWq0G6ZUc8hQBAuVdgExyLiB9TE+X2y6xmvcD8vsf374h0vXczJ5D
         1gYvQyf3/Adt1D22KQQZPCaunnSndDyrv3XOmUw5VNMVGKGMgYV3Digy86zDmDUvNsKC
         +YtrzJMGD2rdM1QZLphegGsHOvJQb4XX3zZ9u1W8Z0HJ/Mif2CoWZULcZyP8jbb8nLK7
         q6Y0yybykc+FuedmSCY2SO3D4EsF1jYp/toFc83pmAgISRY+tAORzGxsO9NlkM9D2flq
         OQqA==
X-Forwarded-Encrypted: i=1; AJvYcCVw/GXZ7FhDfXzEKVugPFcjtPJb0MhKKPZMcWWNHko3+AFlUslIVT0j5qgMGzmv8W8nEgTZryKNLtzV5utEkbbLCGg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdNfAdcEwZOevNxOHaDC4CpVSYdJZQCXYw/Fl2w3yyd6bwdUNr
	y1nyoxpvitXWgs0ZxXwVS8AvCVywdRxD8I9Gu8KJdl5zTmzRojzPWAjG
X-Gm-Gg: AY/fxX6gB+mmkd4UKki6Yo9ydby9Ms3KwPYaIu11OAPxjWiTwCf76c0TPYGlCu+icsd
	4/jbg/jTLH3Ga8Dp720EuqM8gQAoEqH0Au7LeZ2EBrSKSH0be1zCymjRMGB5busXCxZS1HnXuij
	e3mS6hWZj8SeKaQO8RJPXn2l1Rz/UKs43T+RTwgA2b7I/sKdFMzWDvrowC/lvFju9xcdWQxWCtk
	mDzYdAfXAMF47UypZ3E7yfXKQATyJMu6ILCCWXtoywtiVUoA76ahNQGXV24I7++5c3Q4Yl6VGyH
	cX3qnEDGHmsZt+EpHBF0EetasP/9WQu/iG6CmpYwYDN9zLcg066buoJp799EqdvIly4US8fovXe
	US/HjmLzuLsWPEVS9oEB3gQwDB0a6eCUGmUILviV7tG+gY58iEdJbOmnBCx+FHyOtTjHGxjJJQ7
	vitIgTmfwrEvMOpsqikzk=
X-Google-Smtp-Source: AGHT+IFz3Aek0sj9sOAQiV0BjLU4Bw+E01Z/uxfRg4DaMurwRu0MngOybaxgmcGUIYvBNRDtHgFmog==
X-Received: by 2002:a05:600c:4f0e:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47d84b1a3dfmr193374045e9.5.1768209630309;
        Mon, 12 Jan 2026 01:20:30 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm342528765e9.15.2026.01.12.01.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:20:27 -0800 (PST)
Message-ID: <13600bfa-1521-465d-9ccd-cba13912bfbf@gmail.com>
Date: Mon, 12 Jan 2026 10:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/5] freerdp3: ignore
 CVE-2025-68118
To: anuj.mittal@oss.qualcomm.com
Cc: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
 <7f535a1b-9fd8-4966-b521-d77790726916@gmail.com>
 <CA+s=J=xjuLwtCyaN6-psutjEUXzDMD3acqxcFaXDzaLj2kXueA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+s=J=xjuLwtCyaN6-psutjEUXzDMD3acqxcFaXDzaLj2kXueA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 09:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123372

On 1/12/26 10:13, Anuj Mittal via lists.openembedded.org wrote:
> On Mon, Jan 12, 2026 at 2:08 PM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> At this time this CVE is both ignored and patched[1] - I think the patch
>> could be dropped.
>>
>> [1]:
>> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=anujm/scarthgap&id=19d7eedf67ea1b8fe27790366d98a7e888cb839a
> Since this isn't merged yet, I will drop this ignore unless there are
> problems with the CVE patch because of which it needs to be reverted?

Personally I'm not a fan of that patch. I wanted to mention this, but I
noticed it after it was merged. Planned something like that, but
fortunately Ankur was faster.

My main issue is in the first hunk: a header is duplicated (which is
harmless), but there is also a macro redefinition, which doesn't look
intentional, and have no idea if it actually has any noticeable side-effect.

> Thanks,
>
> Anuj
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123371): https://lists.openembedded.org/g/openembedded-devel/message/123371
> Mute This Topic: https://lists.openembedded.org/mt/117189431/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


