Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45102CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 04:29:59 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.6268.1758169791022731508
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 21:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zp8fYwfn;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so752746a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 21:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758169789; x=1758774589; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DKJZjPGGA8X9ChWehenO9FlC0oT/8hOI7YO9+D6r/eo=;
        b=Zp8fYwfnkTTFp7OP5cclUfjqlKtZUEUZmfVU9nmwakKLcSBOWOHjbQoZzCOXwd88mb
         ry2VIy2lOHuHslGECWiZ6LxfQKkAcn18ZqrDR0eyqpxYYRWqqJVcty2QMMeQzAjXWCKS
         CPeVbOL85FpZ/crv66oQP56vyBjOhEq6DmgmlAeYgGPuHumeWTAAxBb/18K2j4RZYIgn
         tgEhDyrNVC7pv5O6rFqYGoWVKxANz9/vB/968rlJ97cFQrB0ZRbMx1a9A36OX2CBgk2x
         K4RpaElGu9A/heT0EEXaJwK4QF1zTvPnexLilTSoFhZspDXsmL7rbF+SiuzOzgwD18eB
         wVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758169789; x=1758774589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKJZjPGGA8X9ChWehenO9FlC0oT/8hOI7YO9+D6r/eo=;
        b=Kg0y0PWQg9edavfI0LWuvVuZOuoDp8eoM2szCbFz7hBiJlbJyr81gjYx4fmQZGLUo8
         HlCgCwik3ULYRaMKMs6N19Rwwc6zgxjbC4mCmEFa0Fh8JynHYs2AvMzHoh1zIs/KPFB0
         3kde/u/iVEQMCxpSb44A/hDMoePG5lPRC/7ifYqPNsHaAYjcJEMPglCuM1PSy0J1qlfy
         tFCdq9bYTEDW52FG5YKsxn+pgPLblMOFr5gpIm6tNOpikhrNazmaORrCObBjmzasl6qD
         kPoJl/ySqdV7gHNTMu3ZGjMPFLX1d/zuCCOdNriRJvHsDQiLH2KZke4T/WP73g+3kgOf
         fapg==
X-Forwarded-Encrypted: i=1; AJvYcCWRe+7mXL+UrKZW4K06oJ3tLFvMLpMPHHDBeir18P84qBKlJxlkZI2lWZUPeK6c8NKl8vwzLIYQm9ziAZKTBLHB/o8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwE5f75kUhh2/Qz8QIpVoMOllFZ7p0nmp3fTCnlOcT9EQ1oMLOY
	fREaHXtGz0c4VKS9MTdVmOSMspRVIE1NA2tuYaLsgE3CdhID51U4AEz0
X-Gm-Gg: ASbGncvNkCDrdh9OwT0+5dj2Mk4JYoWqtGEJCrs/PsKHFDauKhv/KXvHgKuzj5AXJXF
	m4qI4gnHh27NUHSgatVX+gBsV5BKSHqkY9ufln/rt6Z2I4te5zvj0CFEHhV/WQ9EVwJuG2VgZFz
	U8PlSN5ve4riODYFqjeM801k/WF6kSe+VxzpxQ0qaf+g2N5ai3xK+RJDx/4MtPPhnYuYy9PG+P7
	2ujsOc3KsP0PoKUcc+jwXAIXAUcOWB1YkJ+Y1O5GMsGfP1PinPI2iiLKQGbm9fX5zWKMH3v8evQ
	oNxncBQEDuevgfVuapHUiUycscPYDG2RlliCUmgUXQh2kK8frf967q7yy9tv84WrcL8DVkfA4aI
	696I4tGF1Uzn4NKfKZa+CNf+BLsNAcgG6lySMjTI06wyxBGmstg==
X-Google-Smtp-Source: AGHT+IFTFPOm87c1Xr9bzgKaXxYd1xobmgKHD8SKCy6PUdk/SBkIYdOID/w4wAJVDv0nNC4IU/ZDiQ==
X-Received: by 2002:a05:6402:50c8:b0:62d:f340:24b0 with SMTP id 4fb4d7f45d1cf-62f84029f16mr4285647a12.3.1758169789113;
        Wed, 17 Sep 2025 21:29:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5cfa6dcsm742696a12.10.2025.09.17.21.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 21:29:48 -0700 (PDT)
Message-ID: <9bc0177a-325b-4e15-bf4b-02eff47f3238@gmail.com>
Date: Thu, 18 Sep 2025 06:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build
 failure with DEBUG_BUILD enabled
To: Jiaying.Song.CN@windriver.com, ankur.tyagi85@gmail.com,
 openembedded-devel@lists.openembedded.org
References: <20250918034613.2714914-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250918034613.2714914-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119516

On 9/18/25 05:46, Song, Jiaying (CN) via lists.openembedded.org wrote:
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> index b03ed3cbb9..c3d2169102 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> @@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
>             file://fix-typo-denormaldisabler.patch \
>             file://fix-ftbfs-riscv64.patch \
> +           file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
>             "
>  SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
>  
> @@ -99,7 +100,8 @@ EXTRA_OECMAKE = " \
>  	-DUSE_GTK4=OFF \
>  	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>  	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> -	-DENABLE_MINIBROWSER=ON \
> +	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} \

This seems to have an extra F (OFFF). It seems to be present in the
patch for master branch aswell.

> +        -DENABLE_MINIBROWSER=ON \
>  	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
>  		"
>  # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119514): https://lists.openembedded.org/g/openembedded-devel/message/119514
> Mute This Topic: https://lists.openembedded.org/mt/115304633/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


