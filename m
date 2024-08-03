Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0869BC3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 16:19:53 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.11414.1722701989087076561
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Aug 2024 09:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e888NnuN;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-66108213e88so76130727b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722701988; x=1723306788; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8adtBfeCVtpl6PUs4ChhoUFEBrdm6tAc9/NK7Jh7UYg=;
        b=e888NnuNa+cJ6Vmu3ozapvupE0WiZTNZrvLSeFTwrAvoTzvc6OyH/N/BLNeQ+JSs/X
         d65SNW3zLut0l0d1gI0E5VgqXh7e21vZLjY4Dj31Wrdwpjv5inV2O/A3sGmMa51DYoWj
         73yRxoYACbsdd7fZ3gRipiT1keYC5zyubIIfon2zzbdj8KlTfrRmtVGxIgUU9L/MUes5
         m498CDCUwI8lbRJEaO5BDMixd6NhTfK10ePUY9a2F0e6ctLCvVG/C0jI4hGaD2fTPyJf
         QR7QhL+7UqqLl5G2KofWMd+f2LgYn7mpBDyLI4izVfiqP1yxrI+dZBiEc93pvOnmlX4E
         igPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722701988; x=1723306788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8adtBfeCVtpl6PUs4ChhoUFEBrdm6tAc9/NK7Jh7UYg=;
        b=D1igd4ZtfpKxDYbrV+Y/6oCjuwnx1rElXVxPeYR8xdg7Qc3TS/NaNGUjcqmAt23puf
         cndEQQzj92ydUsmMFcVBT+oDH4sZLZV1C+OKqx/9o7IbztxnymIXgUsxonQhIHPCVRNz
         DqkXesafCsK3pjcSJxAfSK6xWurar9f1kY/2weyJ+ZOd0lxgkJvxbxZnpTlR6WAWwwpX
         +Mgsx+qwzvJW3OPCWHpAM/w4WKi4bfizsDJY8NRMau6s6DD1sbcP2WKVODxMgIdE509w
         3WpsYWZ24XSwCH1v7k91wPPsk16rsGE+3+ZOQxH2mAM54srNT/TZ/+o/h86OvSvldpgv
         V8ag==
X-Forwarded-Encrypted: i=1; AJvYcCXJvhV1WvCGWbb0bjVjr4Z033xp6M1dkQusvWKc59SQZ1v4u5JBHAWJZ+pvxcL8+Jo6Kg/0GCKEGCDeTLZoHZ4t93Z91mGJzAniwsrWxjanRCUqBAR3XygAuQ==
X-Gm-Message-State: AOJu0YwmCBzWNy16B86OWLuT4lxxfgc8cRzjmRjea4BNjyKZCglHHcPU
	BoCO8JRrLVQvyw7ceO2e33mRHYklS/AnWdkuFhdrDsqmPUQ1xs8C
X-Google-Smtp-Source: AGHT+IE3CS1XXc90gh/fDLK/z5/aq0BDtdTX1d45ZgRqvykrxS0wXuvfwIBmusFHKxrizFmRkusnPw==
X-Received: by 2002:a0d:fd42:0:b0:64a:e7ec:f3d with SMTP id 00721157ae682-689601af310mr66264577b3.18.1722701988032;
        Sat, 03 Aug 2024 09:19:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:233c:fb4:252a:b2a5? ([2600:1700:45dd:7000:233c:fb4:252a:b2a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68a14156d13sm6180137b3.144.2024.08.03.09.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Aug 2024 09:19:47 -0700 (PDT)
Message-ID: <9cee10e7-5443-4a9f-b491-71209ae168e5@gmail.com>
Date: Sat, 3 Aug 2024 12:19:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/7] composefs: move from
 meta-filesystems to meta-oe layer
To: quaresma.jose@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>, Khem Raj <raj.khem@gmail.com>
References: <20240729170910.2670446-1-jose.quaresma@foundries.io>
 <20240729170910.2670446-2-jose.quaresma@foundries.io>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240729170910.2670446-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 16:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111503



On 7/29/24 1:09 PM, Jose Quaresma via lists.openembedded.org wrote:
> From: Jose Quaresma <quaresma.jose@gmail.com>
>
> We can make this more widely available as we don't
> depend anymore on fuse3.

Moving recipes between layers is outside the scope of a stable release.

- armin
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit dfae2972b4905bd9a423642641d4921334f844fb)
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   .../recipes-support/composefs/composefs_1.0.3.bb                  | 0
>   ...001-musl-basename-use-portable-implementation-for-basena.patch | 0
>   2 files changed, 0 insertions(+), 0 deletions(-)
>   rename {meta-filesystems => meta-oe}/recipes-support/composefs/composefs_1.0.3.bb (100%)
>   rename {meta-filesystems => meta-oe}/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch (100%)
>
> diff --git a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
> similarity index 100%
> rename from meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
> rename to meta-oe/recipes-support/composefs/composefs_1.0.3.bb
> diff --git a/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch b/meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
> similarity index 100%
> rename from meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
> rename to meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111466): https://lists.openembedded.org/g/openembedded-devel/message/111466
> Mute This Topic: https://lists.openembedded.org/mt/107612971/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


