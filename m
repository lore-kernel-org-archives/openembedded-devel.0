Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92221C10DC1
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 12:28:17 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.30371.1701865689246161706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 04:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nmJm5cNP;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db5e692d4e0so5420401276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701865688; x=1702470488; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3NlVUcp0b60Wn2rFt92SR37dCpMQvpbU0P5cMf1y7s=;
        b=nmJm5cNP14SXCBkvu/T8OeJKezEYZEGj1GElKzUuuNT1xhQ7Htr+0PY52k53OR92/n
         hHIy6BD8TGKkScrXWXDxtaA8TpA1JbJ1ubPPkSFUHO8gYwFZFtLxZoODSZ43Y5O+gM0n
         RPeipObySfA9S6Q7jnGQttZ8E70hVNZIudK0CP2xWsv75ZDgEXLDmg0QaCHdoVqqxJVG
         jEH64gbSSLZSSinr2dSR4iypm2rHcT0qR72Q1WAj1wNaDsxzbKghmSqH29zsiV/h+FpF
         dPD2xMAmixknnzdwNmA/fw3umobMv3SFd689LgWOX2M3nZq6PlbZ8kJPIWVa8/iTakNb
         Vtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865688; x=1702470488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3NlVUcp0b60Wn2rFt92SR37dCpMQvpbU0P5cMf1y7s=;
        b=S0GgCczOK0dwBWnUGRDp8dMaG2QQVWt8NDSZRYArr2fwNqer779XtxK6roHkP2DVXi
         2kHzNJk+/HtzTp5nOIsaFXMlICAL6vhE8GtjT1CwPIc5qXuxTYQfRSMAxUmAm6ybAuSA
         utK6ZfvsG/V0bJ22poSsgtjqgrEthBfbogkv/r6IQZbjUov6U2qcqsYIK9nxBOveYe32
         p44e4K/7BZun8jn1PRXNtyV0JQGk9zDYBhQWCa+P/nLOXfhTxJGEdnhre4CKZ2vYzn2k
         Sx/gei8/XY4hG2notgPosOhDCPHO18qcbLq/maVeTk29xnUV1C5axFVe7BKxdL09psyU
         1WuQ==
X-Gm-Message-State: AOJu0YyTJ2YUZGLVGvtl7yPA+11lWHM6TH/yPP2/Dv4D2ThQeWjWIDKt
	uESCE2Kptmj67S10x73Yb4E=
X-Google-Smtp-Source: AGHT+IHwsYf5YUp7+gwy1uMbXCW5alyhQJmNN8xW/KrUHHL9yY1sZYyl89ZG+yE7dh6aZHcPa0zd/A==
X-Received: by 2002:a25:8685:0:b0:db7:dad0:60de with SMTP id z5-20020a258685000000b00db7dad060demr573078ybk.107.1701865688331;
        Wed, 06 Dec 2023 04:28:08 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:91d5:56c0:ddbb:b1bc? ([2600:1700:9190:ba10:91d5:56c0:ddbb:b1bc])
        by smtp.gmail.com with ESMTPSA id k18-20020a258c12000000b00d9a4aad7f40sm3714199ybl.24.2023.12.06.04.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:28:07 -0800 (PST)
Message-ID: <707795c1-b2e3-4dcb-a47b-f832f80fd100@gmail.com>
Date: Wed, 6 Dec 2023 07:28:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3
Content-Language: en-US
To: rob.woolley@windriver.com, openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, alex.kanavin@gmail.com
References: <20231202030950.3357721-1-rob.woolley@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20231202030950.3357721-1-rob.woolley@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107243



On 12/1/23 10:09 PM, Rob Woolley via lists.openembedded.org wrote:
> Some packages in meta-ros, like qt-gui-cpp, need sipconfig.py to be
> present in python3-sip3.  Changes are required to ensure that the
> sip tools execute successfully and that paths from the host machine
> don't get included in the SIP configuration file.

Do similar changes need to go into Master?

>
> Rob Woolley (2):
>    sip3: Add sipconfig.py
>    sip3: Add py_ssize_t_clean argument
>
>   ...ean-argument-to-the-module-directive.patch | 17679 ++++++++++++++++
>   meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  |    21 +-
>   2 files changed, 17699 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-devtools/sip/sip3/added-the-py_ssize_t_clean-argument-to-the-module-directive.patch
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107194): https://lists.openembedded.org/g/openembedded-devel/message/107194
> Mute This Topic: https://lists.openembedded.org/mt/102930497/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


