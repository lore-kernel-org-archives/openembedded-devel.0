Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A57AC7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 05:58:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.12967.1750658281009425336
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 22:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h1kvcFiZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade48b24c97so662018866b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 22:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750658279; x=1751263079; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4LgqCckofEQ3lKZeIFmjEti4/9+ZjV6p5+JuCxdH34=;
        b=h1kvcFiZuOXttoz8ZgUPIkoMyk3ijxfiLCcOl8xXfLxUPoZfzR+73WhDtoNQmv6+Zt
         p900PA+e31/utM7KC+M6V8rFnrEe3yqSUycR0fW/gf0tLfM/Gv4/PIYJFP2qQw6LuFK1
         o5LZ0Qld64KCQKxg7/wdw2fN0yo/klpQstcxqGixRIfZM7jhcthUDVHgrbxKrPXO0e1E
         W9v1BQe+eNHnc8LuJziBR6NKdKHRyjvQfPCBerjerN2dUNnRqqa47AW9fF9IgiUFC20a
         al+dE69m7ifWMfpUrGBX/ys9/EOW9BmHntfGZehSXx4+ofBkbi2RdXMsKqiV1zpiAKEP
         zjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750658279; x=1751263079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4LgqCckofEQ3lKZeIFmjEti4/9+ZjV6p5+JuCxdH34=;
        b=qk6O4uVJ2pL1qQFVM6se76x4dw0YTcs5gh7Ad5Y4Yw/YgGw9Viimygz1M7RzDtIbSD
         IhsI23tqMYsHEfJIoB78r3F+tpYrD9/0TAYZ9oJJO3Vwe3Bny8StBXNsIhANPpoCLVkI
         gZtD7uO5qnt2S09J7yYAELakUFKNs3eMHDFq2MRL1p8TI9zjqw8WF/aRlhHceAvsIC+k
         PWdoa38ntmqHQ8VlaNthyG1hxMkU9SKhdmZu9K+0TW6qJyQ/Zz3vVKtX7k+X/NkbKoFp
         r9CWuWBlu3KNM6UzkAVWlVvJsePasCd7jhYdnuiGWnK6e+U2Pt7JxQwbJ8MVn6LFMvX8
         ptyQ==
X-Gm-Message-State: AOJu0Yw1TL9gdomuow5N2I3LLz/SBIESza9VnhiovqxBr6hlCe9RA99D
	KbX1CBaizWU1VWK4nZL1mOx8e0/ZxnL6MUxi73qOQVzpHg2e9Esm7J0l
X-Gm-Gg: ASbGncscKxLcnDf1cgap9xsaDGpe6engJIc16FtqHfJyquH2q3RdQ4/t/jAt+Q0J7A3
	lat2sKwIsSlH1hU/VLz8kKeqTOKyvmFfm4t/A22JJCMoj5I9+P2479i6EEQ+jUQVJzgOkXI5ZEB
	ULqGsxc/+NNC4ws5hW7TKYdlD0tBW1bNPHvRj6JBRlZfpXe7ORvDeCMHBbTqd2sBjnUvO3EaV9Q
	jM9dlLeWXX6HxRkxUhwrus46ji/28qHKDcP6+E+LI//hETMSAXQhmIAIIGd1X5CyNG8m/yKalTY
	FEml/X8rEWkpig2AZGABhkSHa+yEKlNkSMAPvEFuDqnI96Kyx8WhutZhqP8KlVnpvGaPLujdh+G
	XXPSD
X-Google-Smtp-Source: AGHT+IFLLshTfmEbNVj4sWNTfzwoEeWmAezfxTuemdXrpSkeToEwsq6fZ8VPlckm7odhnbzu2yqp/g==
X-Received: by 2002:a17:907:3f18:b0:ade:4339:9367 with SMTP id a640c23a62f3a-ae057a222b4mr1079454266b.26.1750658279048;
        Sun, 22 Jun 2025 22:57:59 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408301fsm656319866b.96.2025.06.22.22.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:57:58 -0700 (PDT)
Message-ID: <ea56cb45-7553-4918-9ae3-55b6fd8e1fa8@gmail.com>
Date: Mon, 23 Jun 2025 07:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: ignore QEMU_OPTIONS for native
 signature generation
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250621194009.350944-1-skandigraun@gmail.com>
 <CANNYZj97Dh6m=PzMcdoQK-Om4T18VC+ubw_6hQrVd=_0JDQHLg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj97Dh6m=PzMcdoQK-Om4T18VC+ubw_6hQrVd=_0JDQHLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 05:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118029

On 6/23/25 07:35, Alexander Kanavin wrote:
> This looks like a better fix possible. Why is qemu a dependency for
> native variant to begin with, if it's not used? Shouldn't that
> dependency be eliminated?
>
> Otherwise, this is prone to regressions if some other qemu-related
> variable starts invalidating sstate.

Unfortunately you are right - that was the reason for withdrawing this
patch, I started to run into new variables. Since this patch was a
failure, currently I'm testing a patch with conditional qemu class
inheritance, which should only pull it in when needed. So far it hasn't
blown up - if it stays like this, will give this submission another go
later today.

> Alex
>

