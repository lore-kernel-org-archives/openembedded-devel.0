Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30647C71155
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 06:57:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.12502.1750143438948120353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jun 2025 23:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TToQC569;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4038656f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 23:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143437; x=1750748237; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwemJo7Oj4/Qll7xqLVinPF/Zj4nDcRp5qySeq7XOUs=;
        b=TToQC5694GN0qvThjR2e0BRN2FYmPoCwYbBNY4uSh1h0HMC43eLlBQMcAZ9P4GUizz
         gbt60vpPIbepat7wig6wiiEfsXUW+UsVCBBRLwucV1fi/wwB04xxncEhQ1qpeBMIdfOn
         L+kx5k+xKq85uTongki3ScLb6DyMZKcGN8d6F0XASOWPoKa2KdG9Mc8OM+bnlN80Aby+
         riGGwYkp63cO963Mzb5Zy1qlIHVUT9vFyGPwKJqW36J1HfSLJp/TAaFwKFYAcfsa9rX2
         VhkWptxBhy7Z+oRG91jeIUG93kALXqa4DUwTFOSKO/+6PY0Dzx6mR0RxKUodUyKNiRjA
         Yhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143437; x=1750748237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwemJo7Oj4/Qll7xqLVinPF/Zj4nDcRp5qySeq7XOUs=;
        b=UA7roviJ2qBqmgh9P59BpUQaOVrmFIMkqrtnJkMTwxaxw4mx8erwIZDQqh9m4ybKUT
         3J/rdjrI+r35YpqSqpEz5JgvqOOzMEcBHugHGM9SzOCz6H0hBdSP80XCfLwOYE5wwobZ
         DeSpAOf+HQ3zR88U3YDAHSCMC7cXyEG7fAqhAvgzqt0c4Rn6INfwbZTxwlgdmA7j1jGX
         jmtOHxANKWmhyzdBUiRjfTVRDbY7xbowP6VvUM5zkG6z4vq3oZ7fXbm9msjLttxlAVXX
         gwiDo96HUQabz65auebVZYbo/H8hQ/zpIxRs1KvuL8hi8MT6HCRgF6nOTYQBKpTGZqg0
         /tqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSsSHuiTMO40UQfLbheEXZI8FcwdWsKj/gbgRXA2j+QJilYKFJ/UomKr+itXUeqRErFO/DBtAx1s8ec3/BwX1yAHc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxJPLT5x/m3Vijbry9K4LhZLE22IV6CboHZGA/MdbjJz4mqHjq
	rxG5yjQOpAWGt5dJeTcgSkJnWx+J9vCn7EFLrJVmm2tYFfHIgYD/kas60ho/uw==
X-Gm-Gg: ASbGnctdPC7xpGzbHCgUAMUvWONxN5JDX6Kx3rDGQ1p/X4pVeWIpOd+ODCATAta2WTM
	e9COMZS6bMwlW4PnEsYgP0Jgb1wLqwH0IvHianmzkVkmN05sLOrOsGRVLHRTYrZEjb/zAw57Vhp
	/vr7rBKedYQ2QEe/GX6S/kE86vIDyxhiUiKl/BEHm5Jgp1NJVtDyf1R/Zwifp0uPAAjxSqMkeWY
	9zmi0/SZ/MmfU3Xt8jSqnkPbI6ZCVpmmtCIWFkfuuxBBtvF21lHwDLy6FG45kjKB7ogzr6T2yTQ
	QAwdhdWz6j8fKucNo48YTUw8gcT/12KdMU6iH82EvWxZP+MyjSfFu3a2tgWdj78+p7Y1aA==
X-Google-Smtp-Source: AGHT+IGTIXP74NTL1McwrjmziZLNAnhmEwYhwbGBoPIAjhPZZzxMsVSbmzdHS/C6MGxPFS3aASRprQ==
X-Received: by 2002:a05:6000:4304:b0:3a4:dc42:a0c3 with SMTP id ffacd0b85a97d-3a572e9e438mr9318763f8f.56.1750143436937;
        Mon, 16 Jun 2025 23:57:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5896455adsm805511f8f.61.2025.06.16.23.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 23:57:16 -0700 (PDT)
Message-ID: <2a08db91-f139-4bd7-ac0f-14c89a0dc784@gmail.com>
Date: Tue, 17 Jun 2025 08:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] smarty: Drop allarch
To: chris.paterson2@renesas.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <18415ACCB9C1FC11.11990@lists.openembedded.org>
 <OS7PR01MB151309CB28F4D907420E19720B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <OS7PR01MB151309CB28F4D907420E19720B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 06:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117920

On 6/17/25 08:50, Chris Paterson via lists.openembedded.org wrote:
> Does anyone have any opinions on this patch?
> Have I missed a step in the bug reporting/fixing process for meta-oe?
>
> I also sent some related patches on the 22/05 but I won't spam the ML by pining them all right now.

This has been part of master branch since a while:
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/smarty/smarty_5.4.5.bb?id=1e571fdddee552d6a54a72f5a6926ec65a3d392e

In case there is no problem with a patch and there is nothing to
discuss, usually it is just accepted and applied in a day or two after
submission without any feedback.

> Thanks, Chris
>

