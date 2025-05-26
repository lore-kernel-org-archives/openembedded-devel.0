Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85711C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 14:06:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.29407.1748268365179207441
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 07:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H9EYmLoP;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0ac853894so2405100f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748268363; x=1748873163; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgNJNG9S5Ryta4TcHi13gSlHWD13VmC5X9LXWh1Lq/I=;
        b=H9EYmLoPTwhOI005PB98zEp/LyrqQJAVKbpObP9yqPB0EDBZ8nGYOSqOsjz+bBoClR
         XNSipqqBSj5uOAmJ0Xrt8Wq9yTi38WTUi/rPxBIiXCrasaKdiLw9MwMn+dofd7USzczG
         Wu/MpKBeC8mlB6OM3smZZ7TDU25VspYvj+Onr1NNwjd9yt6hcvXn1IDV+cWkxBdiY9At
         Re1tkzmqswxlRo6WLzXCg1ExzL73v8usUEuq6gxhJvKM6FS30BbX+sWi/hlPbEZ+hX/w
         Pd7mFYLRaAOa7hmNCdg+r3AsGBew95K1hYN62NvuOV9bSlNQmSZ/lykrOrZ4oEUV/ChL
         zUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268363; x=1748873163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgNJNG9S5Ryta4TcHi13gSlHWD13VmC5X9LXWh1Lq/I=;
        b=dnjwydvxrGHioIH5Vl7B4y5fyhqc2U9aqs/rOUd9j3Gt8jM8wZU7BhzXS9Nlp5fUkP
         43v8D37nwb+N23maxBtaE4ETxb24tcJHvjjOsrPco7O5WZwPJFpKWYVF+LhXLBWW61DM
         DqUPDykIZzu8VIm6rF3gDC02hnLLX7N3/JKInEx8E28enpp/TdgOS2qEsUbKgO4ZmJZz
         bj+e1yEaIxPgy49dgbDjrP0iv+2S8ZvWSiYnoDXdoMT1pnVuz9zt9yBvWHLv05Lg4NHA
         W1HV3lfY3zO0+NqAWCvoQghJHodcJI3uHEeyV0hsQ6NAPJsMVB25MM5UPWdJFrVKjxlj
         m2/A==
X-Forwarded-Encrypted: i=1; AJvYcCX0jqYJykUYAOZvYEh5gF/Dcs0Jt21d1tbYAQeSSYRmscv+iDr/jeXINSNpYkfTze7/eBaXA5TQPwxV9VqE5d2gI8E=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoE+mFpkV5f9/VAXs5vmDWNviTq5u63sZgyc4M73lpQas8koA6
	s0FY6/icD/mmf70kzWAwTucgv3tcTOet9tRp2SAdVcZ5xh13ybKqdJBN
X-Gm-Gg: ASbGncvTcdPebGIvIoOW7cpjNFZgC/fNnWp479uOHROCndYBLEErL8btGGs7sXyO0mD
	T6usr5YH+yOocK73XObbu3ippKMe8GYvx0Sy1jaSJATutLB5xv+7zriKXVn4uHny7Lyv+/SP50H
	bmwizmRa9n02iNsWBC9YsGbkeasvaBOXrd2iY8LIlTdaaHl1eXk3IbPcziRUZydovF19MaRIbud
	kB0wf0mjiV1aDgqQOxdVI6TjmPQMB984CF5XzVFrZtH9yl7nP7loJZjJItS481drqCt/2vrvJD6
	GqxF06alinyQBdeUy1vizcef1xJqPb6b1vqcilh+xaYfYK7Jl4FaZPkoE1M=
X-Google-Smtp-Source: AGHT+IE0dzfCs7Kq3u4//OC4LjN1RsxdoiblNiehS2visNMxrMEfzREEqTviVM9tVgDhdn9YETmTuA==
X-Received: by 2002:a05:6000:1ac6:b0:3a3:70ec:e1fb with SMTP id ffacd0b85a97d-3a4cb463a52mr6686685f8f.29.1748268363252;
        Mon, 26 May 2025 07:06:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3814262sm237877745e9.25.2025.05.26.07.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:06:01 -0700 (PDT)
Message-ID: <239717a1-2723-44d8-9105-63b87236f4eb@gmail.com>
Date: Mon, 26 May 2025 16:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-canmatrix: Add recipe
To: san@skov.dk,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <AM6PR0402MB34293F0DE182D6F5B7A8F999A665A@AM6PR0402MB3429.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AM6PR0402MB34293F0DE182D6F5B7A8F999A665A@AM6PR0402MB3429.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 14:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117629

On 5/26/25 15:51, Søren Andersen via lists.openembedded.org wrote:
> python3-canmatrix is needed for python3-canopen
>
> Signed-off-by: Søren Andersen <san@skov.dk>
> ---
>  .../recipes-devtools/python/python3-canmatrix_1.2.bb   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb b/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb
> new file mode 100644
> index 0000000000..e78606a142
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Canmatrix is a python package to read and write several CAN (Controller Area Network) database formats."
> +HOMEPAGE = "https://github.com/Phynix/yamlloader"
Could you pls update the homepage to
https://github.com/ebroecker/canmatrix ?
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bb3bdbe015537f08812c87d93670ea1b"
> +
> +SRC_URI[sha256sum] = "19d5ba3fd69974bd41985b90198503bfde6ae3639dfc8ce6a2f7a0338787dbf7"
> +
> +PYPI_PACKAGE = "canmatrix"
> +
> +inherit pypi python_setuptools_build_meta
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117628): https://lists.openembedded.org/g/openembedded-devel/message/117628
> Mute This Topic: https://lists.openembedded.org/mt/113309047/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


