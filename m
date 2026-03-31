Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE4AFF60C6
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 04:30:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13122.1774931446516413401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 21:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sFniRSM4;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so1399885e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 21:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774931445; x=1775536245; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TDwAaMXMe1n3WKoD38Cr79wMlrxdVJIPea071XW8FpI=;
        b=sFniRSM41IewyaV4TctV4E8bxJCsLzeSjlC0EKUbwV3qtoISDrNJcwiOd+qjzAitSZ
         SrrK7x+QtPrZddR+vX2xfJ5w+UXWk8VxggCDsVb80dhiz0g+/dhXdKIp2jIb/yIXJmoj
         CfMPBBVo4IfW8P7H+NvVEZuNa1xdN4hdbvZ+nSZAUHbHEozOaUY/jdLXHcNQqSozfk1v
         TZWuRdxhBn4QpoqBItStUPFa2JHBGbMLUj2Hry9IAzE48GB1wpIKUZtOYkOTROAk6hN2
         lwHxylLwAKqAW58iVMCfxgG/HFaDpkoUL3N1gq4ltRvLlGeWOkTdkVWG6LA9KhQ3wYQE
         PvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774931445; x=1775536245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDwAaMXMe1n3WKoD38Cr79wMlrxdVJIPea071XW8FpI=;
        b=UmN7b3NWO+ZWClnj2DBpOZciAGFJcMUmJ/6syE5LGHZ3lKkI87ENQTok8KPoKAJpK4
         43rAb7+4DDbQP3Lq8BaYntEStR4G0q+iq+F2T/WH0iL3KyuM0xKriEoELvCNBy41k66w
         jYbLHd1/Cz6Idihb0EUlaR3mmIMM1LFKG7EByyswNhzWpxBZV2iZfpYFfi9A2hIuwvbr
         iTvut5QVe3wPs3HuvsyR//zzCRpTCgL3nlwHJan28+Ji0rEPwtkx90281wDwBPr7adux
         fPWgVE41+gb9VmvjBvc7R7z8Aa2lDrDILNvf0AZNqT0b5pzOBXV67K+oFrpeMzmpcbHX
         uhGg==
X-Forwarded-Encrypted: i=1; AJvYcCUrpFmUissLJev9b9SoIF6fgagp2M3CyPky+0Y3INrdrDMT0AxQ+hEHCWPhmnR77+Z7DOs4bgPcKZ5hCm0+ZK9q5Ds=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYlvZTecWd+yQytQSt/m5GGxg4S4WHhy4y2JuJBgj3thge1URR
	a17nHAyO0zAhVN7rZM2taSOTMff1FiU4sl3NhKsVyNCQBHADIIDLuRlN
X-Gm-Gg: ATEYQzzfTGHqeZl5ir6B93lOpRn4ANMc/qnXGkj1D8sC0hk8EoscWKYHpgLbkYnD/vK
	WX4cP9ZzXVAo/2g0TOIOJdgmZLoSN5DsY1Ug7Xw1zWlrRzmIp82vRmXRZGh1J4YMd0hz7SkRuKK
	dehQT0EVOYTwoUqrjenZog2TWaDztavweIuU9uJ93YNO9PsnJECW8WsbaAHzAD+ehSeYh3R6ovK
	3xxxmrMzSk/1t3PFOtvsLXBfNZZRjywAUTlzo6dM8e+J1N7ctlnh7Xaz7lkMG7HMmEZh+mNLR/R
	WuYDMoIom2lGDTVFhRbA7Pv0FE8Rssl4d8snNTdiz2A4TbM4CCodvKgtZQjyR3zO1curQjcS5kr
	GE0/KeDLAIfQP/pAQWduZDVlZrnGV5JSQrgozPstH8pWzYn/Y2aOnz81vPHXpwEtugGE8kYMl/G
	bBN2FmuZgKCuGfr+Ab46VUYDbRZnxIwSg=
X-Received: by 2002:a05:600c:b90:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-488781853dcmr29049635e9.3.1774931444526;
        Mon, 30 Mar 2026 21:30:44 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a6ebsm6317125e9.6.2026.03.30.21.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 21:30:44 -0700 (PDT)
Message-ID: <21d65c37-6a59-41c0-a79a-16052f0af169@gmail.com>
Date: Tue, 31 Mar 2026 06:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH] python3-protobuf: ignore
 CVE-2024-7254
To: nmjain23@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260330065150.2931505-1-naman.jain@partner.bmw.de>
 <5fd5bee4-3884-44f4-bfee-c7bb30ce5b7f@gmail.com>
 <173697.1774930293870342157@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <173697.1774930293870342157@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 04:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125871

On 3/31/26 06:11, Naman Jain via lists.openembedded.org wrote:
> Hello,
> Please note that protobuf_3.19.6 in kirkstone uses java implementation
> and already has a patch for CVE-2024-7254
> Ref: https://git.openembedded.org/meta-openembedded/commit/?
> h=kirkstone&id=f17b6e36fc2eef7f24d08885c50732d62f2754e5 <https://
> git.openembedded.org/meta-openembedded/commit/?
> h=kirkstone&id=f17b6e36fc2eef7f24d08885c50732d62f2754e5>

Thanks a lot for checking, indeed, I missed this patch in the recipe -
sorry for the noise.

> Thanks and Regards,
> Naman jain
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125870): https://lists.openembedded.org/g/openembedded-devel/message/125870
> Mute This Topic: https://lists.openembedded.org/mt/118575124/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


