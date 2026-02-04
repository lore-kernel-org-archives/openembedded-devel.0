Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D1CE9D3F1
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:56:18 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22216.1770216976462135948
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDaCLGBC;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43615d9c5d0so937428f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770216975; x=1770821775; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWbkRxFBKpWDr4b1UzghdG5XekCQDe1FyhDuqxJDpzc=;
        b=nDaCLGBCMrRK4sV1ALunSkYE6Ojx9e9fSSfWqTrsAG9UTp5fldJl2SfxaLm3Tix+ZL
         9kgjtnRJ5wHMw2NLFXquAumMAwoD+qllfjODm/724A+WvE++H5TDkA0A+EBXUDTRzPBl
         H0iypKus+wG3XAa1ATcuEBBg2vtgMIBHG5BN99yiEB9xyIJMPZ6J+C2BZkhRISe2XoLO
         m07rQM2eWmG+yz0PmtJyAehL96uECKyTgS0ybRGse7NQDPTzQLrDi+aGcCtGm7CRKEjM
         nfDk51B1uQBjY2wuLZoueJUpsr2i3+rWjgWbGNYQyxciqaFivd9PJCD2AFnZ7a+RWWVL
         XMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770216975; x=1770821775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWbkRxFBKpWDr4b1UzghdG5XekCQDe1FyhDuqxJDpzc=;
        b=BarsQOtzFKuB33zqk6RSOPlDziyZOYvWIPJsdf/AhF0QEtsoZ6XWygCR1/3jNq5o9g
         8d+AH9ICX6hz4QjTHykTgGIKdLHTAhsEbbHVVI/TIL+CcOzOHiu5r5c0Q2RsIyN+++TN
         /QppLw5RGbEQS3QYskxZBhEAKKbk620okN+aWwl/yuoYHUq/x/gTx8hev893yYtJn0q8
         2PGBpcoAJoswufxlorXfoCMuK9pv/Fvog0jGd8BetDY+K+Rp+m8B/rK7lH/dc56EWJAM
         CWYDDU4U26V1aMM6wT5p0acBaK/wqg6W/2zUQHZc5Q/jpuowdWLM2BdYPTWIDzYZiAxS
         WfFw==
X-Forwarded-Encrypted: i=1; AJvYcCULA75gHkWDmiTUdGlqZfD3zeijp/TiZ51KbrDcaPiooFL2Dp5RsTIpX5Ggq1CsbcGTglZYMVboNc+yN0GZiZFrfMc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPO+lH+GCsP6jUpxWEnJobNkyL2lynBDMR2I1zFlB+1HN37aCt
	9r/H5RyQ+GD+kmpYSzykaw1Y4UrEefx7Uo7xfi/bpcmGa7uR7bmAKt4R
X-Gm-Gg: AZuq6aKDG/xMmXmP4mrzTb2eO3LYLdPS2aO/ycFQJwv66fB7OqJ2pFtxuv2pWO0RV19
	CyH71G9em/7R4WsrurcCna3n59Zwzfbn+VccL9Hm/IcEYM4hronlbO7pMAkSvQac4u28hPLrRuG
	rWKi6JWEXaI47U1qh0vKwujcIWXiIzz4+yldbWr92TDa63qje8APUxINSEvbvjyD8ZkACN5DwcL
	o5kyESAUxx26vhQXHFKQQDRLpgx8G68Q5RUC/22SBIFocHyUZfl93qQywe/hCmrGvpRbZ6DmUww
	XrBTb9NavLzxeknOUXxSOmwRoET06FkxLddaZeTkN8wzLR6uBR7XKmezSmDF1gREFv9IId5J5np
	Gnf0s3jEOvWlINYIQHIwCM4dwWqfWLcvHE22beambTi0CT+rSoSIhhy0lZctQXUY7ZTUbLsU2y/
	WjAQvRpdonCGb+86/Mk0I=
X-Received: by 2002:a5d:5f85:0:b0:435:ad52:31d8 with SMTP id ffacd0b85a97d-43618059372mr4344889f8f.44.1770216974635;
        Wed, 04 Feb 2026 06:56:14 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805f8c1sm5817727f8f.37.2026.02.04.06.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 06:56:14 -0800 (PST)
Message-ID: <18f4441a-a838-4897-94bf-510e0e305865@gmail.com>
Date: Wed, 4 Feb 2026 15:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2 1/2] libtsm: upgrade 4.4.0 -> 4.4.2
To: adam.duskett@amarulasolutions.com,
 openembedded-devel@lists.openembedded.org
References: <20260204144942.2166411-1-adam.duskett@amarulasolutions.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260204144942.2166411-1-adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124133


On 2/4/26 15:49, Adam Duskett via lists.openembedded.org wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .../libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb}               | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb} (92%)
>
> diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
> similarity index 92%
> rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
> rename to meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
> index 074302bed7..8249826ce2 100644
> --- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
> +++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
> @@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
>  DEPENDS = "xkeyboard-config"
>  
>  SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
> -SRCREV = "0d33498a6de3619628f7802a0c76fc98c8773d5b"
> +SRCREV = "b052e48cc776be1cdb940be2dcc1603457c01c96"
>  
>  inherit meson pkgconfig
>  
> @@ -31,3 +31,5 @@ EXTRA_OEMESON:append = " \
>      -Dtests=false \
>      -Dgtktsm=false \
>  "
> +
> +BBCLASSEXTEND = "native nativesdk"
>

This BBCLASSEXTEND was dropped[1] not so long ago... did it sneak back
in accidentally? Or is it working now?

[1]: https://lists.openembedded.org/g/openembedded-devel/message/123782

