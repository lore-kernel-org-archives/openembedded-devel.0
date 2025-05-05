Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C38C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:13:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.52762.1746458026726141878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OuUF2ejG;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so63423796d6.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746458025; x=1747062825; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AWljfPhtMYrkd89xaYtnEyCoQqmK0M89aA+XrWKYOCU=;
        b=OuUF2ejGF92jwm+fnKN2EiFTXzZHCd0WklJYrNPkNVW5tR7ORL1TJrF/dU0VH8tWpT
         3nbDB+r9WIRYg/DJeAFXoNGCw9v5YOJn6DFy81q9rMhv26/gbIykZVo4BVgI5CDU/He1
         Dw9WPvYyOsbhGLf/v727OI28CCBvwkRtsRm1KZQjNR4DLspVpXXlcG8Kt2SMhARh75sx
         JGo81h43tUERIxgGT/Dj+FDUnRT4WoKa+B1RmhiUCPPc/G/g0bjqREJ2xXRCkBTBa6/N
         ipf8D1B3eWAACI8NsY8RW5seymyrW5wxJgW0pUKVuTVpNc404gLz+5rQxRrW1aEsNuVg
         1YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458025; x=1747062825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWljfPhtMYrkd89xaYtnEyCoQqmK0M89aA+XrWKYOCU=;
        b=GWxm134quNxEpvOIcsj2y51XfyaFkgkjIUfAXUVKAOuvfSE5P7V8W9+cGZut57118C
         IINujYdn/bPSWc1gguR2SMZxjDvDzJoHO+oITIehWeHxPh3TfPNIWmLvPaKezjwH180Y
         Z4YZRma44cwyAXkVZgHOOiztHHfA0RzvNEeLW+UmMPV3vtWIiwAweJIzvmRWTslO6OFP
         Q9dymmRZ0tlCJ6+ZTDb6TgmJaTzVSqXBPTAOvW7s8XnZhNvPWPEmMn59JQfMzj4KGYGa
         vtLRvEr9kRdiAnYKdz4FiVKaI2TCSri8lQCRZc5136sLaHZ5rAiuMJDTMdHjTojFw1vs
         j+pg==
X-Forwarded-Encrypted: i=1; AJvYcCXp05C370kVbLsYYyewSK6QN7w6GHARZPfTst9cVNbDmx0qLGO3HUtlyavgSKJ8nqWrb/ThOsQzKMiM2JpKQDvthvU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzV4b98Xm/IZAyjnYnBifBo4pQZYeCeJQrAdGFSMlqM17DE9nO
	lPcQwuks0I7SBH8rPrOoCoLZxoUhb73sxCBpGkrwpa060tJPjj9l349qvQNYHxE3GFZ4c9coKjY
	InxI=
X-Gm-Gg: ASbGnctA6rqmTO+iOgIqtRZJPr7Fgb5F6PS7JCITe17fC52q/X/CywzvPPHnnvKwi94
	sBQokxB1miD1c8s2asOfWIxyacqQ3aRkcNgLTmS7/Fz4SogZe7Jszz3cOr5ASXbdYp2RnJMKF+b
	Qhrmx8GIn0nLY3eHUwvPl+eUUC8/NlKsXYXG/xdkCFWGH5ruddk+/YI7ex8XbeaaSdRwJE2oWq+
	dIiiS1IQNvezVCx/7wpsVUHeqrE0Ic9qPgM15g9JKE+qbt8Mz4UianDuBW3rdDR3426lMmuwb0v
	BPU8KsEGfneAXwCbAezGKyn42CYLjp7XOlnM+OA8X0KScE99cKEJnSHn2VYGlPKj5UsCXFVVRHm
	N/EGL7qUx
X-Google-Smtp-Source: AGHT+IE9Dgh7zXmIfTPSlG1y0Tcfx08dRP7U4ZpVAhSU1Sd4HadxL/7CTTYQFVnVqG4K7PH6cest5Q==
X-Received: by 2002:ad4:5c41:0:b0:6e8:8d76:f38c with SMTP id 6a1803df08f44-6f528d2708fmr114631486d6.40.1746458025352;
        Mon, 05 May 2025 08:13:45 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f44f42fsm56983646d6.76.2025.05.05.08.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:13:44 -0700 (PDT)
Message-ID: <f79a78f5-0b9a-4f17-9ce8-9e48945db579@baylibre.com>
Date: Mon, 5 May 2025 11:13:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 to scarthgap
To: f.pflug@pengutronix.de, openembedded-devel@lists.openembedded.org
References: <20250505150451.2675990-1-f.pflug@pengutronix.de>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250505150451.2675990-1-f.pflug@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 15:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117321


On 2025-05-05 11:04, Fabian Pflug via lists.openembedded.org wrote:
> Layer is compatible with all version up till scarthgap.

Do we really want to be making Python 2 recipes compatible with Scarthgap?

It's been EOL since 2020.

>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
>   conf/layer.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 38ef579..b1d9820 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 = "1"
>   
>   LAYERDEPENDS_meta-python2 = "core openembedded-layer"
>   
> -LAYERSERIES_COMPAT_meta-python2 = "kirkstone"
> +LAYERSERIES_COMPAT_meta-python2 = "kirkstone langdale mickledore nanbield scarthgap"
>   
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117319): https://lists.openembedded.org/g/openembedded-devel/message/117319
> Mute This Topic: https://lists.openembedded.org/mt/112631225/7611679
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

