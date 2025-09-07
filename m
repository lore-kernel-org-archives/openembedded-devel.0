Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B79DCA1017
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 04:46:36 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.12786.1757220391150196892
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Sep 2025 21:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bRzWoIN0;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b047f28a83dso542480766b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 21:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757220389; x=1757825189; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKF2BtfdgGwdHu9/LrXquMBY6Yd5is/6PeQxRV7JuTM=;
        b=bRzWoIN0Xfzv1DTiuG6Gmco/2r9IXfyXkNrUsiqmphThYH1f/z7MgvUaNOuHZMns87
         149pofyoQEwurVXx+69ufyTpEKiahPi+jks1L1P43EW3CiKrMV2UN7ex9YBM5hWmBOh9
         MMjtgxvCfcH6kROMXOQ3DTZ7H0xkicC0Vz+bb0/+nUnCId5SycZ6lEz4kwvAbDLF8kk2
         LXNGwdsGysR8aKBiVcQ2RXWozEAMPveHAujWTkPtpb1w7GcZB2a93GN/Xjw47/jQxQIa
         iBoD5FYqCw/+k3zqGl9jK2V0MSVRTCgu4U3sXWbdpduCwWNi65eNz2Hk5imEqiwf306r
         LnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757220389; x=1757825189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKF2BtfdgGwdHu9/LrXquMBY6Yd5is/6PeQxRV7JuTM=;
        b=P+vHXQw2xccNh1pmLtdTzPpckAIR9HEdCU567Myw+YfJk4CUf4N6Et9aws0dq6WZmx
         uBDuUc/nC8Dne7xsu8U5k5MtYp9en1thS+tNYMSJFK49obVmqmpuJZj62D8cT2U3GJxN
         LBw1PMF5uPyzVpjOfqTqH33fySH7CP36bMz04Nv/cDhKFyqtQX1cwwPRgacX+uu33wHb
         xD3yb5q79QPV99jLE/YX6uOVNJSJRMW3H8wFf5aPUxH0UXwQRwv7XzFmrt/jtenoQgR7
         hljQzIBdk5gfsCA/At+cI+X3QGvBvLgoZDWlqNxGA+c2VvBrFPdlvCBwXhMB9zGkUhOX
         MPVg==
X-Forwarded-Encrypted: i=1; AJvYcCXsXzN8V7mmH7zx9tBWJa/KkkxaNXFpXXmikRJlOcqmL4ShiUjwJtGWk2bqM1vzE2lYulp4B6reZUmEgDdQweCgL4g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwmWvMSBj7oOK3khMkAYOb1B1HytDdsKDT8BDshe9hf7VUZiUhl
	eVMZZfXltl7/4cNMKJbITZDLyZ8VP+HHLt/huL9jt2pzNpSBkPDIucCW
X-Gm-Gg: ASbGncunoI4+DLohxB1W8ikiZrddQb++Un1W5eT0PhaqMVkhBfOHOgybFWOdX8DQiRg
	66jCgnIiuAhxYPCWFMIUX+SKgSiwgcDU748Ej3mz5oph+GqMWy0xfHcV3OYR2pDWUFsqN8SWK3c
	l+F021pHWIJ6ALeCuG1hBXJQ5qJ0zgPIY8HoXexx8ANNUj3Id6U5Vgh7jsaz+ujuuASy12LePI1
	FltaX0kQgPAt+x33XwrsqrkKv0okagEadceTRRcmAQU4jztJGfrjVGtmi8pnUtYIKXNAPNOysq9
	X/EU7YrxjyuZY/XZzsKVyZMtR9hdoY7Un68YR0vhu/QX5A0UYOshjEi44XlAYssnz3UDbiCYOvU
	MOmMraK+HgqbW6KU65FJzR9euzQGe/TI=
X-Google-Smtp-Source: AGHT+IGg7qJMB64R5Zhq+jwZjTKjtcZ8V5CbeV1rFluY+qUr3enb8rE6L3vW+++Nws6tJdDvAMFRMQ==
X-Received: by 2002:a17:907:3da1:b0:b04:9acf:46cd with SMTP id a640c23a62f3a-b04b1663f51mr313704466b.42.1757220389119;
        Sat, 06 Sep 2025 21:46:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04a4ad4e5asm435347666b.6.2025.09.06.21.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 21:46:28 -0700 (PDT)
Message-ID: <5200e9c7-a019-4ba1-aa2b-5810918ff266@gmail.com>
Date: Sun, 7 Sep 2025 06:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-webserver][walnascar][PATCH 1/1] apache2: upgrade
 2.4.64 -> 2.4.65
To: archana.polampalli@windriver.com,
 openembedded-devel@lists.openembedded.org
References: <20250812110222.402009-1-archana.polampalli@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250812110222.402009-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Sep 2025 04:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119328

This patch is missing a checksum change

On 8/12/25 13:02, Polampalli, Archana via lists.openembedded.org wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> This upgrade incorporates the fix for:
> CVE-2024-54090
>
> Changelog:
> https://www.apachelounge.com/Changelog-2.4.html
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb}              | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb} (100%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> similarity index 100%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118915): https://lists.openembedded.org/g/openembedded-devel/message/118915
> Mute This Topic: https://lists.openembedded.org/mt/114663624/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


