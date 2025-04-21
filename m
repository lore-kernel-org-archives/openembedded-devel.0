Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79625C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 10:02:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12224.1745229717561702042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 03:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NvBm52mS;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso25151705e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745229716; x=1745834516; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sypEUrlfh0fT0BFDZ3EW0BnA+f3YuD2jsgS9ex0f3K8=;
        b=NvBm52mSLtC8FpZqBhVIRhv7xinVciYQiACSofTLInjanVDnOH8XlK7ziSdBZv1PZx
         xMumVfCQjJwvBKwCO2SXt6omigg/fSBdg697zdsq3mSW8f0qJ7FUB2bc9T7yu1RtIxzX
         i5BkKUGSTWzNUdvjyp6uHRZ76bO/iD3zXcEXW9L9E1ovy+AUfdVq15db/F9SoqheGSTX
         hj9bQSs+ueOzV3JPMe4M8ygUEJsCoMoMyS+o4VxnIZKry+tyurkvSL04bIo6UHGNk/Bj
         vURyhnQIB2erhERwERXlCvb9sthEpBYZmuQnOpZ+NgJRwweQ4QzXGRNRmSDzi6U6KWD0
         ouYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745229716; x=1745834516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sypEUrlfh0fT0BFDZ3EW0BnA+f3YuD2jsgS9ex0f3K8=;
        b=DouzHXHT6EwZQ3CMEBwh69ZCduEI7kuWa2AUYc9PIXksFaulQOoRQwPY4KAaa0ttbI
         vyEyT1GPPxw3gcTRWfYc5IxhN8w41KLk6I5Wv2/VQwXo0yIp+/fBS3QWl2PqevySr/86
         51xNtIEKKYDEVcKEYbZABiqphKNjVPca8XoJk42FZSJWqrulQ2lNUCWAjTBUbuXOoOD1
         iWNPsosQzf2mPEsUSp5ffnd71+xVKoZUfXSKr932l187N72hwrfo4Dy+ms8e1zzsozjR
         KvVb3RB6BHk2KhBCmJAcLuaSdDpxu6lsW62UkXJpfjFOzLxx+R1bL4dOcdxiW5p0poM6
         8CgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNKbj/EHY5W3Zl64b0BwkMNeExksJ9H5S1dGpHtQIfQ9yWov7HnoS4i1uqIX9omfYBwpynxTvV+R/Qh/fzwIoXbEs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzeBr0RMCzFDn75RiZPbQNyfH1eGeqUll4LyGNjBY9J4I7K9kZv
	ZivKqQAtLXJvL1tvjvlfkXl42CjcSRya5zDNq2Z2F7+7JDy1VVLV
X-Gm-Gg: ASbGncuqldsQiYivMejMhLt6b1TUg83ByhHt90XXCD30S/wwLY4Oe7wnybb+xfhKK/v
	OXRtMLojLfG30wKdyJDHoO7PTcCPtMLtqpP81B6z7l7GshVkWoZyQHnY43Gyx++jrpALTJN401L
	cj96v8eW+/VIQ+AviRSbMhWpNWXZbyDTYXwj1ZIWrjh6WRfKToo030pSlSUA+v7N0+tUoitnl1/
	L/nFVSQHcA4Sq1KzKe/aMuXd4KJELD1KuBwJyt3SVVkh35krcq64JwhxNcWyWY2Ymmp4AEcAVDB
	on2+g3yGRgbEY4xZZyngD8YGlEo2kCycbzDPklGBW2sE0uhP
X-Google-Smtp-Source: AGHT+IGozdh9SA/dK8ZB/1onQi11AWphxDSqsrVUMEWEh1K9UgM65PNU8lTXq484FEnWHOWbWJ2/5Q==
X-Received: by 2002:a05:600c:54f0:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-4406d84755emr65072705e9.8.1745229715686;
        Mon, 21 Apr 2025 03:01:55 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbc07sm129962165e9.17.2025.04.21.03.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 03:01:54 -0700 (PDT)
Message-ID: <d6ec3752-cf25-4851-83c1-631de9c4ea15@gmail.com>
Date: Mon, 21 Apr 2025 12:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/9] libxmp: add recipe
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250421094832.67450-1-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 10:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117000


On 4/21/25 11:48, Markus Volk via lists.openembedded.org wrote:
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8"
Is that correct as it is? That README;beginline=59 seems to be a
standard MIT license.

