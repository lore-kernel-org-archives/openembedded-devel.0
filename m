Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0574EC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 20:15:35 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.86431.1747167329743450937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 13:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQltlydi;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7082ce1e47cso58981907b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747167329; x=1747772129; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JrPtllEXtrapLdcauuneC39IHGJGvoJkjmeiAg/pD/s=;
        b=EQltlydi/CbchiV6kJizTiDcknk219hOO0Stnk3a/UUqYvlw795z++CGXjEAUrkWpa
         NnrXCZXJJyAs4pJq/JJACHA+B3Gk5Tn7BWAoBWbdbr0wQB5oiBao1/3qQF7gBfKLUfgK
         JtFRWOb7ew15OGxKV3CX+5sAHN08XPUtnKFwoEBQ2eUjlNqbPvVG6QGqNt7QA3D+UpRM
         miC1RR61uziUB2tFROaxFRZw1xs+/dQ7H6+xoiArnLBmk/EgHklFX4rokJF5x5Nl1TXO
         xxTDdfCY88ZD8GsGNj3/blVzUaMovNRs4XJFziNhhtUBvmQ1jpug1boJhc7L6rjRuibE
         UHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747167329; x=1747772129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrPtllEXtrapLdcauuneC39IHGJGvoJkjmeiAg/pD/s=;
        b=TV3vYBXnLazI5uuupxOXSc5+tsXrohVBgDj/edkJuDH/2q+dSvgL2OHhGwAR3lGvNd
         xBMA8EEaxtejnJEnqOHqwC4a0x8Q80fIK5auWj3NPCc1PbSEvvF8A6/iFqzkK4ETni4w
         ZN7k0NWbFqs5K/niNZyf4N+EEh71rWfDF87KvzByGLKJjlQhsgdOWwg2EbdXWtvifKkV
         LXl8iABFyh/KYmOYU3tBRTtul/MasVSPyGO7grDz73V25TsMIbaPLOHCsMfb3pfbKWfh
         gATeUmEr8Z7+tI2zl5+TPRwnodRVu3UqRKb3hu+VUdw0ApV6BMqTUh0nVKnuCTJDjxfC
         afTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2vrS5GPxdYQaMkgEOy7zUPJFX1HjYIC78MilNFVTyFJhcaOcQsQjN9ww4PsIy3c1tEbNtnB53MOE3Lv7F8TpVKT0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz41MswpgwR9VoQcRcX3/WTphat47D1lkzAtpDXy7yGEZeeqE9y
	iPAWBUtM7vlsWvlTRfWbpYCnJxA1mF0ipuD/KSyObetjiJ1xFfc+XsJwiTfU
X-Gm-Gg: ASbGncsNZ9tfQG6YEpG9EF/7Pi05oH17uRzzI37sIp81ZUjaya+EGJE+IpMgFQ8/hCE
	GSdZtNuZpCvZTuEiNssTYC3JEzPgiva+aOp5c3vHXzT3nEOFqNRxkFMNgpADjAJqZ/Dx3okP5U8
	mo+/dXSEpZ3hHxDQu+nvdrihQ3IvmUVZunGinbBAB6JrxTM4wqZcIVVKfYnSlRgapDt7c0g+w7u
	xBGKtZlbeAZrPtcEHSftTM1BsaVo9gIsAIqZ0WOaSo2ALiLEHbzPoG/NA9AxCv8MxY239F2BceF
	JgYaevUl/JTTSVbDchBTAbWKJ98O5bFMhgRE7MtjmoyYyB0dZEhp6LxhMUUEV7h8BYXXGbDjSxv
	s1L2YA6OfUL+NsPmYvYE8pOU/vto=
X-Google-Smtp-Source: AGHT+IFa9EcNn+AtXXZtICrmqY+CRvbWKPGEQ3q8/ROtk7Da3RdaV9COHu8Q1LCwtqiHWsyPRBx0uw==
X-Received: by 2002:a05:690c:3581:b0:6ee:8363:96d3 with SMTP id 00721157ae682-70c7f272bfamr14320957b3.27.1747167328897;
        Tue, 13 May 2025 13:15:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:6ade:98e4:ba03:461d? ([2600:1700:45dd:7000:6ade:98e4:ba03:461d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70a3d8b5f67sm25896877b3.45.2025.05.13.13.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 13:15:28 -0700 (PDT)
Message-ID: <9b96d9da-7756-4aba-b1c2-b75c90532687@gmail.com>
Date: Tue, 13 May 2025 14:15:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [master][walnascar][meta-python][PATCH] python3-rich: Add
 native and nativesdk target to the build
To: luca.fancellu@arm.com, openembedded-devel@lists.openembedded.org
References: <20250513182201.4114176-1-luca.fancellu@arm.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20250513182201.4114176-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 20:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117406



On 5/13/25 12:22 PM, luca fancellu via lists.openembedded.org wrote:
> Add the native and nativesdk target to the recipe.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

This needs to land in master first.

- armin
> ---
>   meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> index 95c0fd8a7546..8a4d6b843e7a 100644
> --- a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> +++ b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> @@ -17,3 +17,5 @@ RDEPENDS:${PN} = "python3-html \
>                     python3-pygments \
>                     python3-unixadmin \
>                     "
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117400): https://lists.openembedded.org/g/openembedded-devel/message/117400
> Mute This Topic: https://lists.openembedded.org/mt/113095336/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


