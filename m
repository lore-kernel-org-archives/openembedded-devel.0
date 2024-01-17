Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A421C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 13:21:19 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.1840.1705497671822214881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 05:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rqq2mlQS;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a27733ae1dfso1270365266b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 05:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705497670; x=1706102470; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hZfBtU5IaOG0IObJ9Mhd2KnjOgkNNkDRYWD1zpFOWs=;
        b=Rqq2mlQSBv7FJ5BCJksyzlvcMoQjVCWvdWple86brotusXi3i2zVTCo5U/drsVh2hY
         j++WCQzeSQkSiDz7AYydYJJBFS3DiAWshQ45s1rC/HIur3JbfHpqF/gCgLiFXI9ThVva
         5OQ7qUr+SrAQVHgYPxcm6ypXLmR0HFHpriedbPLYpbbYOunFn11sj0OFHcElY6f6OmEk
         AG0x1ws0+2sBwx4TF231R3EyVphXOiW50dcehAz6wV2e7xgLU2yotmtEbuO+jjk2s0wJ
         ZsdeUdkQPYer1FHXlUV6Eba/iRzA0cXgKNs0bQhCBW/pK9nGVAXinnbeykEBZtVadU72
         x8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705497670; x=1706102470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hZfBtU5IaOG0IObJ9Mhd2KnjOgkNNkDRYWD1zpFOWs=;
        b=FH5SB/7WKZ26oZUpDel4sSlZlOBB30wDkPz0A1txd6xbFbTcOLXSpVgV8KLEBOCTLY
         6qS3QGhurCyVV8Y5cmsFOIP/Q/mgSsEWl8I7u/ZT1tlBwB9NzmSocQqeNv3JNZLEGiZw
         afyUFc+m5M/HV6h2a0KliFp7WMuxL+w7uoICuoX9XBJvjl0qZzTdpt/lK57dEol3ywlD
         rLMNUZl50FKVGienHf7surKEesaxswTi72od5G2jOrD/luwr3zgztTbEhYY9E1JhIb2l
         QIGx98M/M1wpEAJGBV0yPzu3qTT6YS/Gmv/bcPZVDN3g55k+O5T6P3SHMhLhMyLlfJ+B
         XJMw==
X-Gm-Message-State: AOJu0Yyd8pI3LmXDwe8WfdtYBT2vMEIuS0AbkZyvnnQd+hQ5fXV+dpYe
	kIE80UongCZp/sVqDkXuZk8=
X-Google-Smtp-Source: AGHT+IETDpdA7PuxCUOIuiDTSMwVIUMiP9vqDLRMe7rpcbOlEdGI/Rplx/wStm5QyT2oFNZOszNhnw==
X-Received: by 2002:a17:906:f90:b0:a1c:cd0d:67c with SMTP id q16-20020a1709060f9000b00a1ccd0d067cmr2415126ejj.25.1705497670094;
        Wed, 17 Jan 2024 05:21:10 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090626c100b00a26a63346ddsm7770827ejc.87.2024.01.17.05.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 05:21:09 -0800 (PST)
Message-ID: <59f016c0-2513-4a45-b3de-010648ab48b5@gmail.com>
Date: Wed, 17 Jan 2024 14:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [ANNOUNCEMENT] New layer for parallel installable PHP
 versions and misc modules
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <415ef717-ab15-4bcf-a8d2-2e8d8fb37a25@gmail.com>
 <F9845F01-2233-416E-B0A3-97EF5E48FB0A@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <F9845F01-2233-416E-B0A3-97EF5E48FB0A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 13:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108331

2024. 01. 17. 13:42 keltezéssel, Ross Burton írta:
> On 17 Jan 2024, at 09:40, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> These recipes are now public at https://github.com/zboszor/meta-parallel-php
> Can you submit the layer to the Layer Index at https://layers.openembedded.org/?

Done.

> Thanks,
> Ross


