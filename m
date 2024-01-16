Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E648C47DA7
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 17:13:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.22202.1705425198984361961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 09:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ng9PwbYP;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so16746635e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 09:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705425197; x=1706029997; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u4Kf3xtB9fjK/1u6EKWZzVcbP9Emhxhqn+CDn0Xptdk=;
        b=ng9PwbYPHB6+hAheM0nGhKkBto4Qu4jsaq1kUqDlbJ4xl/0G2Pn1LSQVuLbLf3J8Gu
         v/kiwd0rYdkmmgNce00oSWblvTE7qY7WiqMIe+xmb6euCFlOF9+p2YFoHRPFwxANMG9r
         818wGucPmzkyNdaCUxzm37r/zl5UA7DxPiRDrZgXlmCCopm/oENC4bcOzLRww5NWhx6h
         G9JVARYXfuV1/7XRtuzMSDXgujmWP2utQ22fV3+tPeXPLtE5v3/7e94rV3deKlMqO+x6
         nya+7lOVv67BLCvzpQRd7kgzMo4iL90MWQIPy7xuFa2LXbhpvgHsfloIZM1mB6WuRat8
         wTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705425197; x=1706029997;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4Kf3xtB9fjK/1u6EKWZzVcbP9Emhxhqn+CDn0Xptdk=;
        b=sxgY1U3oP8k6M34xY472mj0siYoM1ECJmjqMCWogTK1Iv0sXrx5CGQgVGguMR29OcU
         8G/qvCQyyRuOUauwgNvFqFohel05eGst4Qi+v0/lhXuC+RNwyuwCWi/dtmVQ1HOo+LTY
         zBQPemC8qeDVMy2br5bGP/k4jZSrRp+z1unOHt3EsikBYBVaeKVxHO3XTWnT5qPH2Jup
         9Qz9s6LWFV8z/fc2I+OnelIqzHVvGT/ojkiCSN5HxiACUsgnZZk0dTCrgD8mReHznJOL
         HAY3LTatJAgF2hqgo1tEgvFC9lMF2aRR0zqCQRG+qap2J0srvfPgtnkmDuwFnphsBUwN
         b8dQ==
X-Gm-Message-State: AOJu0Yzg1//Qu+F0alLwcJzCRpIdJS3ay7ZEHdilOfnL4rR2TP1KE+FD
	VFQ+VT/X7fPAAe6zuBv+xFqI3/ovEMCOYA==
X-Google-Smtp-Source: AGHT+IGpdwY8VRWbhIvvygByzIg0/GWSJnM2tOIjYxaMt33nvGxm1M3shLEW2onYKjaF2SAcH6P/vQ==
X-Received: by 2002:a05:600c:3c89:b0:40e:61a6:c639 with SMTP id bg9-20020a05600c3c8900b0040e61a6c639mr4350671wmb.94.1705425197387;
        Tue, 16 Jan 2024 09:13:17 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m26-20020a7bca5a000000b0040e54381a85sm19278329wml.26.2024.01.16.09.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 09:13:17 -0800 (PST)
Message-ID: <4abd75ec-e214-4176-9b73-530d54213680@smile.fr>
Date: Tue, 16 Jan 2024 18:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH 18/23] mongodb: skip until python 3.12 fixes are
 available.
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: openembedded-devel@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, raj.khem@gmail.com
References: <20231231122329.405225-1-alex@linutronix.de>
 <20231231122329.405225-18-alex@linutronix.de>
 <e056ee1f-78b3-4f94-947a-c8b159717097@bootlin.com>
 <CANNYZj-Q+GSw7VWkOu=mMCNCFZ4vO18Q9cztOtv8qowT0rQE-g@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CANNYZj-Q+GSw7VWkOu=mMCNCFZ4vO18Q9cztOtv8qowT0rQE-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108307

Hello,

Le 16/01/2024 à 10:30, Alexander Kanavin a écrit :
> On Tue, 16 Jan 2024 at 10:24, Joao Marcos Costa
> <joaomarcos.costa@bootlin.com> wrote:
>> Would you have any updates on this porting?
> 
> I wouldn't and I don't plan to fix it. Mongodb is under a proprietary
> license that OSI rejected and thus in my opinion doesn't belong in
> meta-oe at all.
> 
> If it's important to you, then you need to do the work.

FYI, I've sent a patch removing mongodb from the packagegroup:
https://lists.openembedded.org/g/openembedded-devel/message/108306

Regards,

-- 
Yoann Congal
Smile ECS - Tech Expert

