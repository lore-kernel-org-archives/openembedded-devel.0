Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2BCC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:17:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.73778.1746530228162151399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 04:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4IEtINb;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so12050028a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746530226; x=1747135026; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3OlvRorCdpTl6Wba0ensqrLchbJUaOpY4RAqFPINWU=;
        b=l4IEtINbIOGb6iRT9rdnvvtvKOxLCjEEH4c7dS6qPKnIilEe9L81zSSxUImHwxFG+G
         g15dtrpiSvcXsVHZ+FfO4BDnuILIEu9yiLI41PgGhwNS0gCnFyFCs39AXFEmSXLpkLeG
         Ls6JR1rIkFRNd8XkZVt4tA49GM+CcmLtFZBtzekAPfVvQxp6gZQ07lkR9rMlP7cvzozt
         GwqiP6QPDh8uQGaEkxiWVSsxop8/TK464YPL6wt8ooWASCG5za8hLYi0eCXx4GflAOQU
         js2lLNC1/HAduEECMfSvcFKSFpy1AZAuZLsDOY3KWYz8+6rRDdoV+ZPj+YLyjRpkKQnu
         Y/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530226; x=1747135026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3OlvRorCdpTl6Wba0ensqrLchbJUaOpY4RAqFPINWU=;
        b=AiZMxxGcg+PlOOAIoOrY2zUjEbEJG4iaT854mNs4pAspkA4sRGCt07akheLvRkadMp
         Ujiobjn0p7ka2fwlWpg9Rlav9id+MkQ1IYbHPcrxv9qm6lx+RPOLUjbvGTW1B+Yt1nFH
         Hh/Bi6ItJWim02GCVOqN+SFTasZViskvkyJNZV2Ep56wXZ/19RoeI/CoD2baesD6U5sp
         +GHpCqH6C01/wpn4Ud2FjRYfkNLf57ME0rcMiUmUDM5YcW8k3O4JcVi6zK8qn7kx1qwY
         RorMzUoya2u8umT1Oncd3XybjgUz/nGYCNn/sSOQSZE3qlvKvhBcRV/tybwXET7jqFCE
         Z72w==
X-Forwarded-Encrypted: i=1; AJvYcCUhJr2apcwfJXWoHlC2V8s254fKVY6zWK/P8o/zRhO0DeotANCNCnCnGyVQXVQtauvuuET5vMwUoWIfzsDl+qMTrg8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPhx7n3KZ787KPUy0A5BuVw7qTJ9Kh04MxTypcnwjN3wbBYuSm
	7w4iYRGhKNZR53hq5DUKLcZk0+vnGQBlR9DPTxbkXj+DiqfYFdKw
X-Gm-Gg: ASbGncuauCBYOOFgw8HaQx22ranFA2lwg6KxerYAH5XuO5PwUE4blK58wMBIU6X+3L0
	gxxAk6293kkcHFIgVb87pseSLdZ72dzeDWE1ulso+rSmgfnd5PSooOjMAIi8zFk7mhomqDSkNpK
	naftatP27qFnHV56qxe+8nZI/3udWslujey+SfTxZbqI/WybcdynoA8JiycfZMUSTr9V25ItuF+
	cuK1K0C+Ww/n0d1RU08zhVMa52x4Wb5G1zdG8Niskg7NDutv8c/hqFDdF2DFt4J4PGIqTveCgMI
	V4+9by7krvtUtT5KlEZdaHuqDQjTiUkr/VGJcds/xSF7oNrT
X-Google-Smtp-Source: AGHT+IGFC7nhP89ksqjT2QdZ/8H3l0B2QMg75wmVxwKsHOU2RwaOh0L+GMQd8+iIgK9MlyZfJMOCLg==
X-Received: by 2002:a17:906:9f84:b0:acf:877c:ccc7 with SMTP id a640c23a62f3a-ad1d2edaf46mr287289866b.13.1746530226078;
        Tue, 06 May 2025 04:17:06 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a733csm684541066b.73.2025.05.06.04.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 04:17:05 -0700 (PDT)
Message-ID: <7c39f1e3-7f53-461e-be59-711a72292b5a@gmail.com>
Date: Tue, 6 May 2025 13:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
To: jasper@fancydomain.eu, openembedded-devel@lists.openembedded.org
References: <AS1PR10MB569738A15FBFD3B281F3C14DFD832@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <7063.1746529801979084877@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <7063.1746529801979084877@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 11:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117345


On 5/6/25 13:10, Jasper Orschulko via lists.openembedded.org wrote:
> > And add tag to SRC_URI.
>  
> AFAIK this is not possible / bad practise, unless there were some
> recent changes to OE that I am unaware of.
There were some recent developments[1] in this front. Now tags and the
SRCREV are matched to each other, so you can be sure that the SRCREV is
correlated to PV, and they are not randomly set.

[1]: e.g.
https://git.openembedded.org/bitbake/commit/?id=d591d7633fe8d739ec00395920e44910b0b77e27

> You can either specify "rev" directly in the SRC_URI or SRCREV, not
> both. So if you set rev to a git tag in SRC_URI, you cannot set a git
> commit hash within SRCREV, thus you lose reproducibility since you are
> now only referencing a floating rev. See also:
> https://stackoverflow.com/questions/78127309/how-to-set-srcrev-for-git-tag-in-yocto/78127354#78127354.
>  
> So setting the git commit hash in SRC_URI as rev or directly in SRCREV
> is the way to go.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117344): https://lists.openembedded.org/g/openembedded-devel/message/117344
> Mute This Topic: https://lists.openembedded.org/mt/112537365/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


