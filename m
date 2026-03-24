Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57336F532DA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 05:31:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13535.1774330274972850199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 22:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d6FdvXGL;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fe655187so45555405e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 22:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774330273; x=1774935073; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suYAkSo5L55ML/i3Qeinw44/S8RgkGlOdmPs5FkaNKg=;
        b=d6FdvXGLThQHvxIrF0mF6RXJkJJc0cA7ROsj8rr47EEMdbDr4klM8jp2TrteoSmI8k
         wDWYaNCRwK8/fVSAIBeSGOQKzi44VwFTcbra0At8wppna97S0kW6JxwKggNN3jX5V1lb
         1gnNpix5InJjMT+NlJxqvGxFr7xRt+RoN/uU4qNyvIEmUketirwRQBskFs58sH1yOv2m
         2FObzip1/+DfrJM8Zky4fkRYessvyF4K5mXeXYjCSunt4RTCIRvz81pZuewSYSF7zjQA
         BsmKQTskLCQ4mN83sM3nK0RRuAdNQmjagbeSfyEKDaRBG5EQZtfpRttMZi7YAzh9wUR2
         YBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330273; x=1774935073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suYAkSo5L55ML/i3Qeinw44/S8RgkGlOdmPs5FkaNKg=;
        b=ZYMIaiLWR3QDbsb1spw12N4i6eTf65OM7U0NbQQhC7VQsgJ/xAeKyNpvibn4DedLW8
         83NMq8l4vpONOig1egrn1D5OlTZs48ZNOA6QqDItC++8bl4Y7dHexKhrWLlZL0zlcArS
         zCrco/XzIDSh6Kab8V2PrFoGL8ec1qIl4/xclLNvRfOOxPDPZm4IWRPu6L/YQE5yVLI2
         T6UO++gq8ItwraSsAjrEHjIAJkr5VgmE0Hccn6GbL7qZ8dpP7hTItsy+RnhuYgGQhX9V
         FXoVK3xMLQeEm/qpLmMTXqe0R9rUY+LR9vqUMp40n0DgZTZObAqCLaXakoleJ9aZDgCg
         NqRA==
X-Gm-Message-State: AOJu0YwQsa+nEqmNikR03reYTFDt11i/dOmYGICOtyB/inapD9uJyC6d
	L8QWgSPqCqJqdAEq5Q7461HVv/bMWh2Vu+DZ9AU0qIXFZhYRuJ/TPoUU
X-Gm-Gg: ATEYQzyO7cml/6u+5TeHas1oiNekCcsubmSJ9vxmWRm7eLBb9RFBaeoXDXtsxGXOKnG
	TUEkNcgUUI7ppPqM3MwG0J/LwMxqrjzMYCqVtRuLzNMFrWhOBWCc1chiSrCJtQVn6oIjV92ojUJ
	tUWp+dcDr67j3hKiFkOuq78ua+Ybhzjswju4fhCHspgwK5WTa3SBHqch7mZVMRhxWarlGnIJdDU
	JWmPfi7ONeH5aMjqXTLqLFwTZsqJBjiqBfMUIO7qJQAAY4VjcQgjaBUoSkXTpXWBcvkNXNzUQri
	DzmWUVEcOjgNwQCT0wNJTfng9rrpABuLtmNcy28g8rwy/fYDg5tBKgOsUbDmY+gXiczB7ywTYJZ
	aDbJp4BUfoG58Sfo9BrcdSII0HJ7WsJk4mIrVLjf2ZC3CkwAOKGnw0NH6fJwVoyFVidgpQWqz/t
	BOY+U/diogfBiFXUb0XfN2+7NDEr9UDyUTBCmilfTzwg==
X-Received: by 2002:a05:600c:4fc8:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-486febb5cf5mr218462615e9.3.1774330272887;
        Mon, 23 Mar 2026 22:31:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871107ed33sm9820515e9.22.2026.03.23.22.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:31:12 -0700 (PDT)
Message-ID: <cd1d6c12-bc9c-4a54-bb60-51566aab074d@gmail.com>
Date: Tue, 24 Mar 2026 06:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][scarthgap][PATCH 6/7] gimp: ignore
 CVE-2026-2047
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260305110713.2893128-1-skandigraun@gmail.com>
 <20260305110713.2893128-6-skandigraun@gmail.com>
 <CA+s=J=x5dC+BgPFGhnr2nqFt-i9ETEgx0HK4yS3aEXe1gGONAg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+s=J=x5dC+BgPFGhnr2nqFt-i9ETEgx0HK4yS3aEXe1gGONAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 05:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125536



On 3/24/26 04:22, Anuj Mittal wrote:
> On Thu, Mar 5, 2026 at 7:07 PM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>>
>> Details: https://nvd.nist.gov/vuln/detail/CVE-2026-2047
>>
>> The vulnerability exists in ICNS importer, which was first introduced in
>> version 3.0 [1], and the code is not present in the recipe version.
>>
>> Due to this, ignore this CVE.
>>
>> [1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/00232e17875d4676a2c797a429db23b1a9815db8
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>> index d38160a864..8b3dd4aa5f 100644
>> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>> @@ -86,3 +86,4 @@ CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mand
>>  CVE_STATUS[CVE-2025-48796] = "cpe-incorrect: The current version (2.10.38) is not affected."
>>  CVE_STATUS[CVE-2025-14423] = "cpe-incorrect: The vulnerability was introduced in v3.0"
>>  CVE_STATUS[CVE-2025-14424] = "cpe-incorrect: The vulnerability was introduced in v3.0"
>> +CVE_STATUS[CVE-2025-2047] = "cpe-incorrect: The vulnerability was introduced in v3.0"
> 
> You probably meant CVE-2026-2047 here? I have fixed it in my branch.

Yeah, that's a typo, thanks for fixing it.

