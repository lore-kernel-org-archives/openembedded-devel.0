Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AABD3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:39:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1311.1765211934104899566
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 08:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoAAva++;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so32935875e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 08:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765211932; x=1765816732; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fIQYcBp+YASsNDX4YgJRhFtxBXKp5rNzgpuivPjUvBE=;
        b=FoAAva++AC/rNfyhKgGx5rdzj0+umFAg7SMMCOgx5T/53emFdCbKyQeWeSIeiCwY2u
         0Dp5IkscVMdwMtFET0k0Tv8xWnj+crty9zZhQ/ocVXNOGrUdf97EbEmlEcSTHP/gqiVj
         v3EQsNZn7VWJlnQhGy1IyeZP1p8dVtpAz7yvF6F4xKdtz99VHRokBE+EwHoTpL8f8LQW
         6ijwIt1SFqeW1iHk+TZTh8xmVXAURuzKyy7l7Mob34CpWid0QAewfpeNfc5DFaRjkYSh
         ZX+qx9w+w8BBlgb0VXynuJIiOBNsnmvdLmMsWwuNcn4udFWRTxgYSxi8B7ad9EFT/tdb
         8hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211932; x=1765816732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIQYcBp+YASsNDX4YgJRhFtxBXKp5rNzgpuivPjUvBE=;
        b=QZdY/qrr+Dc1HXdGkgT6H1yzlu/ptofXe0lAR4S0Yo2xvt82oxRU/Pn6Vt/zAlmEDT
         WRs405829guegn4oINgdMA6LCTpZIcTnYXsBElDbqLcz+xJliYqR2UMsD/a6w1tOhYUy
         UEfOXEXKwg7qEsB1xMg9usosAfhDYIIBEbpk4APPKz6IYAE6ESXZBlJYx5PRbTC8Ia4G
         eLruzsrA9T4DQlv/NEkchAN0LPxinHRGt6YW2udH8/EPdLQaiAK6+CGKmu1t9/5z/9pF
         cM1RUCTobmONW9bOElDc/ggNSw0DzHxQrMSW3Ta8y+4lnKRm6ljHrapzEM6Eiytx7qZQ
         IPWQ==
X-Gm-Message-State: AOJu0YzQsa8Z3//mLuf43ZRxGJE2qgGZVGcaOBXbflFEWc1NUIXuM/vJ
	aI2mVdLX0CGX35fQ9nuXFYSr4sxokGcbva53BQI3IBYq4ANXj5KL3YkuzUXhYQ==
X-Gm-Gg: ASbGncspRLN3VuVfPkMhsOi0yixAQcWFwguI5xNfegDiE1h7xsMBzEbCh1MkelagnC4
	Kbf4Pa2D7A6i1GjBgLhzfzqRc6/GgON+A807xIYyDbQwxanl8b3yLjkcHY5PtvMPu6f/7GhNICT
	QiQzN/YQe9DP+Q9WbSxyq4H9EVLCDCSAW+MoLo19WJcHAXDzVRaJ8We7/GxUdV2hQwwVVX8jNfm
	7bdRSmGzfRjdT43f+AGtm6/FjMpZtyZbGtzKiz3sUhnMZctN7xe5fLsubMx/R95FbDfskHDqrZl
	XuVJepvU7leokOCuFze01sqeY1dBCXuVoIFf/c4y/kLHU8Br/HKct2FnSIIKv5U0z6E0A29e4U9
	Q8HxWPEAPDHbXrCHpf11PjoP8NWzz2a/5qdPSlMZEH1Droj9VThchg+i1bgN3AxI0cjgys8r4e/
	ASGcoqeRRylypm7qFBSgQ=
X-Google-Smtp-Source: AGHT+IFrvMhJCLPKdm5nemGCDrOjPLTScrjpDOI+t62FfsJVK2fxDox0njeh3ji0q+fWZWExY07AJQ==
X-Received: by 2002:a05:600c:6305:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47939e27b90mr72513905e9.21.1765211932256;
        Mon, 08 Dec 2025 08:38:52 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b0d06ecsm156598915e9.1.2025.12.08.08.38.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:38:51 -0800 (PST)
Message-ID: <fdea005a-f9df-4e73-8ccc-b4afc41fe2f0@gmail.com>
Date: Mon, 8 Dec 2025 17:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - master - 2025-12-08
To: openembedded-devel@lists.openembedded.org
References: <187F4A52F172F6DB.785918@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <187F4A52F172F6DB.785918@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 16:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122383

On 12/8/25 17:28, Gyorgy Sarvari via lists.openembedded.org wrote:
> List of all open CVEs (73, out of which new this week: 34):
>
>

There is a fairly high number of new CVEs this week, in all branches.
This has two reasons:

1. As it was pointed out last week, I was using a too restrictive config
on almost all branches. Now I run the cve-check with multiple configs,
to cover 100% of meta-oe (except the recipe with an explicit SKIP_RECIPE
tag).
2. I used an LLM to guess the CPE where it was missing for post-2020
CVEs. This added a sizable amount. (The emails supposed to have very low
slop-content, I spent time to filter that out. If you find any, pls let
me know.)

