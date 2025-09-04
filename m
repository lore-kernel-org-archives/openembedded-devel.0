Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655AFCA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 20:58:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.5779.1757019497991062167
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 13:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ed50qUAe;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7ace3baso277426766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757019496; x=1757624296; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3OIFzatcwbYMkheSOCUk/D0zar6Rsb6K77AsL1saFo=;
        b=ed50qUAebmZepQgrqdNoCcZu3Ieo8GTmP5E5JRjc1ccJvSamx9Wh6/9adP+kJjNDCB
         rNxZ4bmAqOlDGaQ34JeceXgruRpJ7WJUobUpm8vlxeg2youfSN/7LMyjU/TPOeIEH3sS
         LlIjQUem86F80ooZQ2vnJ40g7XluIJD8Is/9U8NW94e7mh3jSV/P11aLOn16Or1CStue
         LJ1nwjIPuo1qOvKE/PZ5tVbER4fQaK2b7B0pNctYv8KTVKeAEKgIAarCpZKDwHqa2Rxf
         RLVY8PxfM1nvYT6XD9dL4jrYmiU9ERU7GdOg1gznaCz4cxAwhZ8CW2iNdghp97A0LJkY
         zHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757019496; x=1757624296;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3OIFzatcwbYMkheSOCUk/D0zar6Rsb6K77AsL1saFo=;
        b=E1crjcsTqbRegowvohtygXs7ewI7pn34DyuSrMnJd9q3GT5zcda6qkakcjABUCxEXE
         NwADyq63Voz1YkSsWUamc52lSMRGMNEat7+1veh45wmHZLDZNRnzUR0z5CsaleaXRa+R
         ZYVadLYfuVA035O8jiLHMI7QgZTqlSJqqsccNBZkFjuRU+OuFD7wuZbl5S/gchW8zxci
         ZZT+wgNzMb5iJIlm5IkmCxOXjaGPglSn2RAf6k6DIvtrtd9OzIUehHGZFl6K2l+RroU1
         s6UC4aIIcwOyGiOzbP6UZU2zJUE4GjHrfgVXmHTWuvrmVTvTa8nw8snB0qerigRpAQlX
         jSmw==
X-Forwarded-Encrypted: i=1; AJvYcCVguHk7uAelKt2hqqyrDJXFAFXctu1N65PVOW+9BCzoixKp7H+SS88H7ndhVN7zh3XcB/7mmLm2yYE4pF0RXxMCXg0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMACnSMjDeb4FVyJUa9YZC/hb/1Rqc2Gxg0zwemrZvoeHiSODB
	c1BZvB3UUDh7+vp/MRAEhWGPWi86TKMQGjep3ph5PMw+Jp52NIHsBRqXbQdaJShD
X-Gm-Gg: ASbGncuvhvmnFMApA8l/xCFlwNLSKIx4UDCVbG4XCcxSDXSZQmhdkbwCfP7jiYdXReE
	JPqq3or22u5qrq/dZU3upj0ZMzyhz35kBFfmMBjrsiKXTukOnr+9GmAEz9HAjqJ1eO2Vhk5lWft
	mmmm5esmZ91r9hCPC8uVhScmrT1yrmCqKOetDoHAp9m+uOUZUmIn9v0sAyHRh0raZaFbvcMyOoa
	rlphgs0BXgfGRKZDOi3UTDVZpXVcyK4pYFpju5tqJQL24H6KgEFsZ+lHI6s/TVrCXsQ3639Fosv
	UCujtaoktDMaRvVoMtnnKSFbwj6zZ7n2DCK5Jy9RJlNnEFvyq7PZFaUrPKYQ1NbUCbY5PNabvv1
	E9FjfgrTNjwAoY4tmf9c9B9cOOuuLkik=
X-Google-Smtp-Source: AGHT+IHkJPaEZojz1gZdlzHGCFvaU4y7AsskAN5dDGHKOtw0BvZtieitqL4VqaYDD9SumgzE8YP4cg==
X-Received: by 2002:a17:907:6d0b:b0:b04:7332:7929 with SMTP id a640c23a62f3a-b0473328085mr687240666b.11.1757019495895;
        Thu, 04 Sep 2025 13:58:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04241b2e7esm1113732166b.43.2025.09.04.13.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 13:58:15 -0700 (PDT)
Message-ID: <d835b6fe-2528-44ba-b7c0-f1994b0ebb5e@gmail.com>
Date: Thu, 4 Sep 2025 22:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] poppler: fix CVE-2025-52886
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: Yogita.Urade@windriver.com, openembedded-devel@lists.openembedded.org
References: <20250716144033.1780473-1-yogita.urade@windriver.com>
 <207b1ed3-4675-4196-8ee9-edba87cfb6f2@gmail.com>
Content-Language: en-US
In-Reply-To: <207b1ed3-4675-4196-8ee9-edba87cfb6f2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 20:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119297

On 9/4/25 19:29, Gyorgy Sarvari wrote:
> The Scarthgap version of this patch had some typos (in
> the qt5/src/poppler-annotation.cc file), which were only showing with qt
> PACKAGECONFIG enabled - it introduced some syntax errors, and fails the
> compilation. By any chance, have you tried to compile poppler with this
> patch, while including the meta-qt5 layer also and qt pkg-config
> enabled? (Asking only because this patch haven't found its way yet into
> the final repo, so if it needs amendment, it's still in time)

I just found some time to actually try it - it does fail to compile when
qt5 package config is enabled. Could you please check the backported
patch, and submit a new version?



