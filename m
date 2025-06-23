Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9534BC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:42:18 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15875.1750671729267884768
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TX4888va;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad1b94382b8so753861766b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750671728; x=1751276528; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XKmf1RnVUf1wSqKc2xDfynz76A1z5D3vpfR5h+3JPOk=;
        b=TX4888va0X4KfXI4wKXHvgUvY2m41KrVht7mrQDHhVj/JWn2p0+icF4Um+ppDL3AtI
         UucE/xgkISGsjzaP/sFm/Qo/wozJZtDT12EJXfRSmYBk+XfXQCs30uofsbHA8VLwW1c+
         Bmof6/B0ImlJBDz1EwkxYAszUdxRGpuvjtJeDGoSb+nARRYIuvIJ4V3KdQ4eA98QJ6Et
         nrth4GpbTWYLOIzCc6DOjZIAef1rOcqgDOaTNXRI9WKY9QCEzJFj2amg+I880/7QST1O
         QDv2hPPCLeZaL6aJCGai6gTe0GAjF9H0hOaFsGUBWb/7RW1tGauUtGPG6uXRDEpA3Rnn
         3VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671728; x=1751276528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKmf1RnVUf1wSqKc2xDfynz76A1z5D3vpfR5h+3JPOk=;
        b=DEL1OY1DmPPfFSgN9SJkMER4GUmjQuLR4riE7ap1sllhcmIOhieITfqiSsnDZ1CCoE
         g/7NrY3UsN0htA3QE8tJI61B8sjttmjqcxy6n08wN8kt8iYuBZNE7Qf5ZUtt+LTBgDBj
         CVpif6kaOPuh2iuVPKKgMYxdt+gj44q9hnijz38ehMjN8GNaLVSWyfB3xhtwhD8P/CIb
         SCkABn6p2DCRyc1nVyZN08pYGtkpja/i7WFCRToeoBvySZITmZjjxuD51itBFICZYu5a
         Xte/FxooQNY1Dd/rAKyLOZ+teMB59aXXz2mS/8jq9lbR8WEpZqR1wcZRVdN6ffDtm4FW
         Hz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAB3dqWUsOsggej9O9gyRyrfzEO4jLvjtdBGmJcOlmLpVLjGgKfk1mX1P+dHcjJUVGCWa9Lrz32XG7THS64dbCV6M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxMW1Os+3IecpWwP1yCYQO1XqxhYYAO5P5E8Iu6wm+rP/bAnpv6
	mDP5ynAjfw5r3zwvtOm2WJxH9Nkl9ny3zpvsJFBLBiR/P8dVMlGbB5ef
X-Gm-Gg: ASbGncsEMqWBemfimD4nQ0ZCOYNE1ZqSR9+rsHSq9JTpA3e0QF9qSxIKuJ9SwRQ4+QD
	c0uvDAHg33ZwRgeiBnQmtPrZBKxGKy73SwIpc0gjaevGtcet60UKYvTG2EEDmtOcdHbE5uz/57E
	YZZRU0n6zhXqCgPa9bxds/c+L21JL0yPITPHs0LbOC7INzPItKrQnPLUWOQoheHwiIjG0NEe6d/
	LRwHAo4EU7DrsBGfXmBVRzu2Q9Cw++g4wRUWOf4X4XqNyda8uH5ccDipScYCadIVTwi3LpIdAlc
	q2mlPOV+ooCJ3VwCqPR+vZrm4gJ2dm3AmjVrbqDzxHl2lD7Da1z9gzWBY7n+9/2M5i4QUA==
X-Google-Smtp-Source: AGHT+IHjC3GeChMOSchoQB8vXkB91Ovmo9OQLHYmTX/8txJOhaM8lNrfq9IA1jyD33fJ4vNIoDdkww==
X-Received: by 2002:a17:906:7305:b0:ade:865f:481 with SMTP id a640c23a62f3a-ae0579382camr1068091066b.12.1750671727238;
        Mon, 23 Jun 2025 02:42:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7f534sm675887566b.9.2025.06.23.02.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:42:06 -0700 (PDT)
Message-ID: <3d81ce8c-9a2f-4e7a-96b5-a9eb5f0ca45d@gmail.com>
Date: Mon, 23 Jun 2025 11:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] influxdb: Do not skip it anymore
To: christian.lindeberg@axis.com, openembedded-devel@lists.openembedded.org
References: <20250623092156.2261942-1-christli@axis.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250623092156.2261942-1-christli@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118071

On 6/23/25 11:21, Christian Lindeberg via lists.openembedded.org wrote:
> The network access during compile task has been resolved now.
>
> Change-Id: Id7a8510ae1095a2430d26015bdd6cc54b633781f
> ---
>
Signoff is missing here also - could you please resend this?

