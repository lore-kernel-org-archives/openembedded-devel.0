Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A77D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 15:29:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24125.1764602930882372559
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 07:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cBnyxaVR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so36038905e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 07:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764602929; x=1765207729; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fi0xKFinWTkO0pAXuhmzvl8kfHmMuQocqn9vMO6M+R8=;
        b=cBnyxaVRkc5U7u6VWjVP0lysIGx0//a1yFIbqxxHw9dHIKJTs3g4rn8qHBXCjQyWUw
         AeQhnn5A5njbfHRHuySyH/qDrhQVjAktGL/fE1YR5IMX/DVs5f5itqhZAFOyvnEvUcyc
         xVjCP3zYLySXgfE8j606/tvOWzLe+DUvfa5beNPUT4pkW1UxeF2wSTffddSGtbcOTSoV
         ZxXueGVedb7R4dd0d0GUwJRVFOGw1hWuGSeo9wndxNow1iBy/sHN0+CrAJ2nalRWVykv
         n6eDlqWhpS/KxNKbVTZFX1yxbczjSsmn+HjAISY5Y9dugi8JiZrZ/HAG/OkW9brJ6I4r
         tPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764602929; x=1765207729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi0xKFinWTkO0pAXuhmzvl8kfHmMuQocqn9vMO6M+R8=;
        b=L7MIDxNTA7wzDqoHgoM4ZHBoL9j3bywGpNMlSsuM5lrhygPdMVdUl6APat3D3HEmcW
         f031FsEiHqEHTss45Q6Na+15ANhyVqWRn9A3LnmsOOIhl8t+dTrdAk47IB5qqG3dSOfc
         xBXRWf26lua3jaFr10/PEsxrfJDyHL64JMcUc4/r3JWDoIG5dCC4C1QypH9EyOrzVttC
         JB/5IaP4MXzFGMV8jEySlGWGIljPRb5Fo5jbITZC22xCYwJY5JGolxajWUuACtcMqb61
         lo/Fp41zVw/hu0mwMi8b9He3/EAid+TdZisI+zBHoYESAVYSZGz6J5y9WuBZ/LbGb5Zx
         WuLw==
X-Forwarded-Encrypted: i=1; AJvYcCUANcKX9uGUwzBRBDTxU0OdbbnRLNPqMt/Ea58sKLtBQVFkG7JFfMxRRTArPWX88o14u3I6BSQZ1Nuushus8d5xhsc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/97EnJd7VnKcZo4K/+U+QpysNmp5Sadffb5CZRQDYCdFjx4Uw
	LJXMPyA6NZ8JUJKHCy5GYlsOA+q2w7vSg7s2ILt6gV9E65PNGyg5AfFv
X-Gm-Gg: ASbGncsb+tlParvIEXgmurwSZCWjvCGYHsEl7lh9CewFGf2TQ4w6VLsVLrD1HDqPriw
	4Mimn9WXHKuw8Lf3yi0pgTz8YIm5WODccHsdrcDEkgIiCn3ZMmHYTmA+15XLoZavA5OcJyIZpMU
	85I3UqZ3HNa4eVpqqhn5AccpfavQtnaw+lJiYKYxSiQ6Yik/V57Cx+vxTxi2TyylA3keI3lfHLA
	Cw/I+1aV5NxqdN6UcltmrcXsnAHoyVGKm2cjUcFW34yYdBoZL66MnW5ANEreQvHogNjbM1OTVYh
	OvjWDBtPmwGNe1l6GCIx8VBKYMUtvKVGcEpW2j9ppqWZSYxJhtuOslcGHyrJg0eiOXcsHCfwRCy
	n/Zyf5w+bO+v6ZgmpW1XoyoLL+N+MWFINwd/JFL9lbhFVa6lK8oobr6lmVcxcs/A9zFxzCGMj8a
	7LXSuHHgKTwxV3g0YN1mU=
X-Google-Smtp-Source: AGHT+IHV9ewLGWcHKmTfIplp862cku0xTwHy1W4bCKxT6IITir9MXoYJooDVgL803pchqs8OLEVyrA==
X-Received: by 2002:a05:600c:3b97:b0:477:9e8f:dae8 with SMTP id 5b1f17b1804b1-47904a685c0mr295496025e9.0.1764602929089;
        Mon, 01 Dec 2025 07:28:49 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm25998082f8f.33.2025.12.01.07.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:28:48 -0800 (PST)
Message-ID: <c91152c5-f375-4175-a5bd-73f0664cb862@gmail.com>
Date: Mon, 1 Dec 2025 16:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - master - 2025-12-01
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251201144820.2687367-1-skandigraun@gmail.com>
 <AS1PR10MB5697229B54C0A0BFE4F906D0FDDBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AS1PR10MB5697229B54C0A0BFE4F906D0FDDBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 15:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122216

On 12/1/25 16:05, Marko, Peter wrote:
> Any idea why this report does not list libde265 (CVE-2024-38949, CVE-2024-38950) which are present at
> https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/ ?

Apparently the reason is that I didn't have the "commercial" in
LICENSE_FLAGS_ACCEPTED, only for kirkstone, grr

Thanks for the heads up, I really need to look into a "bitbake
real-universe" target or alternative - but until then will pay attention
to this.

(If anyone wants me to re-run these reports with this config, then let
me know.)

>
> Peter
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Gyorgy Sarvari via
>> lists.openembedded.org
>> Sent: Monday, December 1, 2025 15:48
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] CVE report - master - 2025-12-01
>>
>> List of all open CVEs (56, out of which new this week: 0):
>>
>>  - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
>>  - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
>>  - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
>>  - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
>>  - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
>>  - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
>>  - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
>>  - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
>>  - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
>>  - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
>>  - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
>>  - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
>>  - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
>>  - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
>>  - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
>>  - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
>>  - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
>>  - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
>>  - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
>>  - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
>>  - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
>>  - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
>>  - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
>>  - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
>>  - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
>>  - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
>>  - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
>>  - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
>>  - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
>>  - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
>>  - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
>>  - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
>>  - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
>>  - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
>>  - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
>>  - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
>>  - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
>>  - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
>>  - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
>>  - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
>>  - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
>>  - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
>>  - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
>>  - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
>>  - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
>>  - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
>>  - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
>>  - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
>>  - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
>>  - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
>>  - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
>>  - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
>>  - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
>>  - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
>>  - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
>>  - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
>>
>> ====================
>>
>> Removed this week (20):
>>
>>  - cockpit: CVE-2018-15538: https://nvd.nist.gov/vuln/detail/CVE-2018-15538
>>  - cockpit: CVE-2018-15539: https://nvd.nist.gov/vuln/detail/CVE-2018-15539
>>  - cockpit: CVE-2018-15540: https://nvd.nist.gov/vuln/detail/CVE-2018-15540
>>  - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
>>  - python3-django: CVE-2025-64458: https://nvd.nist.gov/vuln/detail/CVE-2025-
>> 64458
>>  - python3-django: CVE-2025-64459: https://nvd.nist.gov/vuln/detail/CVE-2025-
>> 64459
>>  - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
>>  - xrdp: CVE-2022-23468: https://nvd.nist.gov/vuln/detail/CVE-2022-23468
>>  - xrdp: CVE-2022-23477: https://nvd.nist.gov/vuln/detail/CVE-2022-23477
>>  - xrdp: CVE-2022-23478: https://nvd.nist.gov/vuln/detail/CVE-2022-23478
>>  - xrdp: CVE-2022-23479: https://nvd.nist.gov/vuln/detail/CVE-2022-23479
>>  - xrdp: CVE-2022-23480: https://nvd.nist.gov/vuln/detail/CVE-2022-23480
>>  - xrdp: CVE-2022-23481: https://nvd.nist.gov/vuln/detail/CVE-2022-23481
>>  - xrdp: CVE-2022-23482: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
>>  - xrdp: CVE-2022-23483: https://nvd.nist.gov/vuln/detail/CVE-2022-23483
>>  - xrdp: CVE-2022-23484: https://nvd.nist.gov/vuln/detail/CVE-2022-23484
>>  - xrdp: CVE-2022-23493: https://nvd.nist.gov/vuln/detail/CVE-2022-23493
>>  - xrdp: CVE-2023-40184: https://nvd.nist.gov/vuln/detail/CVE-2023-40184
>>  - xrdp: CVE-2023-42822: https://nvd.nist.gov/vuln/detail/CVE-2023-42822
>>  - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917


