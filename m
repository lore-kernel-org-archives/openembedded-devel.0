Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F53C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 06:13:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8515.1741846387840514693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 23:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AyQGPV73;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912c09be7dso317583f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741846386; x=1742451186; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KSd7UkGioj8ceKtqBqKg6QlEkFi3tTziq9pcM+mFjhc=;
        b=AyQGPV73yh/fegOuVWumoifohJNDU4talxFiH9bMuG74eaQ21p3zmad+wIRV4Kr+zK
         vv/k0MG7Gbty99+NXDRySAV5jbY6BTqxMBEQZg5RvIS3S+H+MGH2OclPp9T5j13olIp3
         zcEc5OP1uS4NDA7lOVBvCdzPa8v9D8RXky4AucWFyD2pSJjhaJ4QBEtqyRtIGA8CVWaA
         Fw5tu+n/pwSMMkiBLfYokCqaiVHfbzX6s2iqOJyUDoZxG/QfiSeMTFfHzRilHy0QwRjD
         CghfaQSliXLlLcP2URZYh26KjiRv39wpCd0WbgSwksUxn9p6Dt0SfBloId7izCBAPj1Q
         l3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741846386; x=1742451186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSd7UkGioj8ceKtqBqKg6QlEkFi3tTziq9pcM+mFjhc=;
        b=dLPmBxncS39WB6jrApIURExPkSTLIy6wyoGMTonIWaI9tuhNPfJsU6Bz/gy0nkFy2F
         32BJnsXiBneNvgKgKyuW85iZWnJ7Vac4zZSjIysQVpzZqO+L5pwfUwDm8NPCBTESNJm6
         cDOuiZBIwp5l+Ye1oZJH4j6ncITW1YyluApclgreUdqG3PMQ+j4Iv6Ns96+bY3T5b6rA
         WB22sInr+b0CU/s3kKsz4cOYVJm6+kAul6NONXC6J1WsCyk0GxNkoSt4pjb5CadXP904
         uNxxDORNLzVP5rWGdf3EinKr9PJY/cUfO9yj/yUOFCv0/cj/rMhyQw9w9d20aUsVgW6Z
         NiNA==
X-Gm-Message-State: AOJu0YxQv5v1+HWxeo60LSItW0L703WOvDMfBBQ4kr1kfzysgN8xdcuF
	EG/ROa4xDgRF2qfeJklFkhL35YfmRLH4MO5TCywFcr0Z/puA2KBo
X-Gm-Gg: ASbGncuWfF6szq72z3+tljy6R8Zg2tPJKTE2Cy1AZ3pmJAMZELOQvTUgwwSSpcEl8EW
	x+I9L6sZSTWTNianlbOG1KSgg92bc7i7sTub/kevRe84gx1e6l4TxgwLGlpu9iY5D9r0eB6Vj6Q
	EEff7XKvIumZCuQ0BfnMEVXuwMbYdQ9FFCssJvzecoWNFXzy2QE6B5QU8p+LOw4TK6utDmiPZjJ
	0qQ6dFPBTS391/G59hBEg4BMFlkZQojxvQ6TyB9O5biO5iwgzSza1fulMy+9XMdG4hodRPYyMzC
	7qwIivj5n30jkKcVkXRiir5MbSS/dTm14BF5GU0e0uND/cAy1ZUJkd36sB7havcglPLQ9TMeedQ
	lHQ==
X-Google-Smtp-Source: AGHT+IGvCY+FcYu/4Ecmrx/Tin7zT3ybTn6KEHnV+H5Xj/23s5FYL4sC1K3Uhj4qeDQ+ZTetjNvaxQ==
X-Received: by 2002:a05:6000:1a87:b0:391:2391:2f79 with SMTP id ffacd0b85a97d-39132d98a8emr21748322f8f.43.1741846386000;
        Wed, 12 Mar 2025 23:13:06 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35f7sm968241f8f.13.2025.03.12.23.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:13:05 -0700 (PDT)
Message-ID: <4636a041-6325-4562-9585-29d4b7417ce1@gmail.com>
Date: Thu, 13 Mar 2025 07:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] python3-scipy
To: Rob Woolley <rob.woolleywr@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
 <c2743189-6b3d-4adc-b495-ff3d89ed4844@gmail.com>
 <CAGAhMBxWJL=P20pcc4LS=Hzd6pSumjYV3Ma_7-zeTRJSbY08vQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAGAhMBxWJL=P20pcc4LS=Hzd6pSumjYV3Ma_7-zeTRJSbY08vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 06:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115951

2025. 03. 12. 15:15 keltezéssel, Rob Woolley írta:
>
> That works for me.
>
> The meta-ros has an optional dependency on meta-scipy at the moment.  Would you be okay 
> with me changing it to point users to your layer instead?
>

Fine by me. More exposure leads to fewer bugs.

> Regards,
> Rob
>
>
> On Mon, Mar 10, 2025, 2:07 a.m. Böszörményi Zoltán <zboszor@gmail.com> wrote:
>
>     2025. 03. 06. 21:07 keltezéssel, Rob Woolley via lists.openembedded.org
>     <http://lists.openembedded.org> írta:
>     > The meta-scipy layer was archived on Nov 30, 2023
>     > (https://github.com/tuxable-ltd/meta-scipy)
>     >
>     > I need python3-scipy for some recipes in ROS 2 (notably pinocchio), so I patched
>     it up
>     > and got it building again: https://github.com/robwoolley/meta-scipy
>
>     I have merged meta-scipy and meta-scikit-learn which were both archived.
>     https://github.com/zboszor/meta-python-ai/
>
>     It has a newer scipy version than meta-scipy ever had.
>
>     The complete layer is not updated for walnascar yet
>     (I am postponing updating the pytorch recipe), but
>     python3-scipy and many others can be built from main.
>
>     The styhead branch may be usable.
>


