Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A060CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 08:25:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web01.2467.1761726316131653763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 01:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UN63rFrM;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710665e7deso36525485e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761726314; x=1762331114; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=abJohH7Ano2icC4VQSuY1LGU+gTc0ZzGsehmFJzPhyk=;
        b=UN63rFrMXqPPDRIitC51EOBUXuJvb803NBpugXCOMLSETFkAtLOeiMGyxmQaXeYm3J
         gcC5x+R4NuGhtyd4COROoafjHGPEMxbEPCAMawfE8GZBQE8wZJgr8mTuKrRhN2JekoG+
         6STbLZKnfsqg9mUDpYqJFh2mYibO46dXXE6WBP2vGyejX8LBM+O3iDTyzTQh6sZkjDS1
         F3BwNAl2mB6THn+EqWeQyK5bJ2aYKDlm8m5r5Xq+PpZRT7REV22w6D7CaJGh9wNaY1Wl
         ntANL4GVGmrSMbfLwBPd8HuXIyhkiqqlWOYRjLYLcgZmwBBZlhQjF80lehSbr3B6kY8f
         IvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726314; x=1762331114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abJohH7Ano2icC4VQSuY1LGU+gTc0ZzGsehmFJzPhyk=;
        b=DSr8UUVZ6XG6l7j0rf4WGroMDkeb+8MkXQktoFZZdT+qdJvLB3mZdON7a7JdsFT1DI
         4kJ59Z9z8N3jd0fq/03+V2//kbdjHF9GaJleAMeiYoth6k67rNph9DwC3WRauwq1+a/e
         Piygwv3Bb7h4nV1idgBWkMK+q0srdH3yMDM8VPSF+mphgWPFoW+BRwzvRtWRwIko5oZp
         KoVn8zLsOU1q3A0f9hEe7F40iSIQTfeysDOzoxbvV/iJQ96piRCuF/u++p7t3wi6gpH+
         4Q5nQg4MTT29UwP67Vy39WIZHNaGhub5mgJcsH9TxnDRVxPvPKsyZA3WONBBpztujshD
         ECBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhvJRkROXJzMQoHFlh1xva4unVL3ubW68bDO/VAwqOV3mUXSEPCUaj0yB5UKokxQDlCSk+CeAD2AvH3LdejUCsHzU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdBzURhk8u18UrrZtTo+b/crL7SoOn8P7px6VPHxivB367XOp8
	2jY9xQgCPmlm1xVkVwTDAOUy7O6bsUL6c5UkTlaHE+vyoXyNqyFRFzYP
X-Gm-Gg: ASbGncvabG71v40nzJkQbE69d6blQ8G2RMgJKClsqdQKyY+mtPNIOVIaaW+B0XoJ+fi
	EbIJ31I/7sXHdIdP+7ddLoW5UgcNtkx0PMRiRceEOK1G0IM84gL15Z8vb6qx6zkVRiJA1+0NAUP
	xenOyKsXLaM8L9WTnDIL1pXP27bwgeCH0nViYooHV0ozII//mxpUuvR/hR9rvgR/96uTuglhimp
	1bNGzinyW1rLlMfmShgO3xwI4aj2ii3q/iP2LOCHp0QR+9e+9Hkwzo3bag5AHJVkZT6zNBN4Ijf
	Pa2KHUcl26naS7GPuKCTX+dcOOyrl3mB6p+tVYUl7k1niq+zhNrfifEaVZBWaGsgSIA1elkJTTu
	69+VUnm+m3RyJgkwkS8Qb9ni+f6xhmOANQ/8UvyQ16D46PJkVmQ22jrf5N4eKBoBSZitbu/UJ93
	5QU1Ar+hB9
X-Google-Smtp-Source: AGHT+IHIs/U+FelsAXX5qBL998a59O3wfNLfAPKSmwdzNKlKeJR6nt7yBj0g22yHqSdZYLnBkQyqDw==
X-Received: by 2002:a05:600c:154c:b0:475:df91:ddf2 with SMTP id 5b1f17b1804b1-4771e18a983mr20241585e9.17.1761726314266;
        Wed, 29 Oct 2025 01:25:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e18bd9dsm35587345e9.3.2025.10.29.01.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 01:25:13 -0700 (PDT)
Message-ID: <e6122055-c186-4d79-91c7-f1fba7c68250@gmail.com>
Date: Wed, 29 Oct 2025 09:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH 18/32] python3-grpcio: upgrade 1.75.1
 -> 1.76.0
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20251029001505.528-1-wangmy@fujitsu.com>
 <20251029001505.528-18-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251029001505.528-18-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 08:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121141

I wonder, aren't these python3-grpc* packages supposed to be updated in
lockstep with the grpc recipe, at least regarding the major version? Or
are these backwards compatible?

On 10/29/25 01:14, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-grpcio_1.75.1.bb => python3-grpcio_1.76.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-grpcio_1.75.1.bb => python3-grpcio_1.76.0.bb} (94%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
> rename to meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
> index ef0bf126d5..c4282502e1 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
> @@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
>  SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
>             file://abseil-ppc-fixes.patch \
>             "
> -SRC_URI[sha256sum] = "3e81d89ece99b9ace23a6916880baca613c03a799925afb2857887efa8b1b3d2"
> +SRC_URI[sha256sum] = "7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73"
>  
>  RDEPENDS:${PN} = "python3-protobuf"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121124): https://lists.openembedded.org/g/openembedded-devel/message/121124
> Mute This Topic: https://lists.openembedded.org/mt/116004761/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


