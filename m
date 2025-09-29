Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFECCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:12:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.47328.1759126364140827290
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 23:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEdo4Bu4;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-634c01ca9dcso4123274a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 23:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759126362; x=1759731162; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=btLbyeQp+5a2X6OqsHey/f69pKggAL/djOGTihwBPoA=;
        b=PEdo4Bu4Gu9T99r+9TWKrhK02+rT+/JwGZDWpJOJZMHgYFPhpoKmPtDvIgP5eonX+m
         lbrZ02toESYctcwp9wm+uJvZglH/roOVcbewDnbzUJm8+YGDNMF+JhkTBNXwPCvm/qPw
         bhxKF+kqLxJFA8zsOAUM/CjE96ou8ZkcqBTY5ThszP8NVvgWjmCPxqnvm5WGX02L9tRO
         z6vgJ17rbqMHM1IzTJU1y37yC2YwLG5B81hr2ujc2Zw2kbV+Dxo0wzf2mn2lsVYZrHHJ
         QbHU3FBkkmIs1KDJw36D3MtW16yWxMU1AFr0oilsc+Cpcm7Ps1yQm2IQHfPuCbQ1sf31
         BLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759126362; x=1759731162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btLbyeQp+5a2X6OqsHey/f69pKggAL/djOGTihwBPoA=;
        b=gMB+3kTRuJpjSqTyPklnDYKG0EGiLTwohV4+RIza52TLhF6uiO95RHizp6c7bxOv35
         4aMbuje0YtJNv0Xf250kpevrkw7aEAfNYSKDLwVZ7HF5Fy3LHhttsXOdNsla3WJwgUw2
         oaExYeBw2IboKEsov1wUQyYLY4JYP6GhZoM+F0VOOcz76zJWQjtvIub77HFgnxT6U+3G
         y9EvsBNnm4Dnj74wuhUuGd+6ibzqnLU4xdQjT8V+qHzF7IsxcV4ZZpIISBnPI3OiC5SI
         LuQDnyXrkZ89M2BMyLtkeJxOP8nv3XD/sPsiDxgeWznJABt0gB6lxjwUWHRgEgTR3ddS
         eo5g==
X-Forwarded-Encrypted: i=1; AJvYcCUbuq8/pUbupstz74RD4cr1Focr/FuB+sFw/n1Vi/QIuOCOa3fdfUKNKqySVg5axnbtYNkQleIRVh7utKbwv5MYN8o=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwS/bZhDgCLc5ftLU0R09HidcFzZL22YHAzeELtzXStFra9/lmm
	b2HOUVLmxGfxSzF7rnn1CUApCCSDzu07pQJT3VC6fBL+uqlcAjfGKrz8
X-Gm-Gg: ASbGnctHkhEu0vwC0X6sYJdoCgqYngV/UxHaQBUIwfSGkY5bAw83gFh5qLKbxLnw3X0
	qidR4Ns0G66hvNByK1UgRXEtgm960ilApxXBPe2G26SMjmiHeBzWNmgB84WlpfoW2pZbEM4mVjP
	zD8SkHtwYQHSql3lR+Fm7bb2vge6mP2yVi2TGXoorzTmAkho8JT4ldgx8YIKRoPi362h8xMcsRw
	jaiDZktVsunvAbKhFZTZZWRxhGHFszuC9JXw9oTJjMyocdW8wLCQXFrmB3t8EoHXyy2aqGQmaos
	JX7wlaPIgWUkOYwWS4PlKxp0/CEt/Gn3zfZGw+ivh5Yv19bw1pIDYRVMqjig1rzVDU+GOpO0Ar7
	RJ6bvgCibxTWU/UKNNAr9TrSLBWR77fc=
X-Google-Smtp-Source: AGHT+IGkRrLm+ORFEJu93aA2RJ2O4c0oK/ow0ru0hgVkBXw3HDkP9hEcBKwtebVZ9ngzZi23oQONbw==
X-Received: by 2002:a17:907:3d4c:b0:b0d:ee43:d762 with SMTP id a640c23a62f3a-b34b9f5b4c4mr1692250166b.4.1759126362026;
        Sun, 28 Sep 2025 23:12:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3b7a8045acsm355260966b.107.2025.09.28.23.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:12:41 -0700 (PDT)
Message-ID: <033e8b0a-73a1-40b5-993e-d65ea4935af4@gmail.com>
Date: Mon, 29 Sep 2025 08:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][PATCH] 3/3] image_types_sparse: backport
 optionally remove RAW image
To: emailaddress.ashish@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250925172931.64046-3-emailaddress.ashish@gmail.com>
 <12545.1759121256328337971@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <12545.1759121256328337971@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120011

Your patches are not forgotten, but stable branches are not
rolling-branches.

As a non-official reference, you can check this repository:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut
This is where I stage the patches for testing for the next kirkstone
pull request - though it is a fluid branch and changes relatively often,
it is the best indicator I can offer you at this moment about what can
be expected. Most probably this will be merged into the final branch.

This repo/branch is not canonical. I use it now, but might change in the
future.

On 9/29/25 06:47, Ashish Mishra via lists.openembedded.org wrote:
> @ Gyorgy Sarvari  :
>
> Good Morning .
> Please do consider this patch for merge in Kirkstone 
> If any suggestion / feedback on this , feel free to share .
> Will work on it accordingly
> Have shared the 3 patch changes for same 
>  
> Thanks ,
> Ashish 
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120007): https://lists.openembedded.org/g/openembedded-devel/message/120007
> Mute This Topic: https://lists.openembedded.org/mt/115434756/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


