Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD74F4BB83
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:56:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29325.1771962990134797219
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KdypZQQb;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43987b97701so699472f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771962988; x=1772567788; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HNMo+VcaBTVjIVrT8UJsz8jfkX26HUk0Z+qInudJLgA=;
        b=KdypZQQbSG1VyOl8v4BsyTajuZilYnMgLeXdHfGBWeM0zb1Uk7GVqsvj0Baa+X1e2G
         dibjZxQjMztruyBuqwG2WE4ugWKEaOV3TrpRxex5DwREDm9XSfQaRG64yt8zJx66cMoF
         D0Mt+pkqOrETlr8KtN7BpSEGPUihVBuJTBl9BUcnA58SsUmGWq06tnCOjTxomObqcUbz
         LaNwV0S4nRiRRZJYrasJCJSG1tfHFxw/RVwY/zKMogmVqgM9rNrRqNO4fjz2xnIgNt9c
         PRCQNKy5oTa03aXMSSv7eUJkxnNbGYhKV2Q7knkiiovSBx/b+gOWazFJ8HcCNc5cbcsD
         67iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771962988; x=1772567788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNMo+VcaBTVjIVrT8UJsz8jfkX26HUk0Z+qInudJLgA=;
        b=l4yRd7N4zrBfqhIznUy3kKP0WYkathR7atntuUfY7vSy/wpC3NbKyv90C+CcrX0MaJ
         7fZX7E2ocYxzHNLeR+M6NbTxmvg0YwObNsjvd9FfBOpMRwaUtaDlSCZ3kwVFkAkoKV4l
         OeViajJmTQy4S16PNkVXRYLJNSEKWBV+vA+h0xQSO6S2Tru1fwPbGr1W51oBVsE1/MKl
         iH+4tvGyKvTZvnzsdj4Q32LTiII8D9zUJWUdxLsyTmlSj+nJRY2ZtVx/xLK2K4wD4fX2
         R1ZOABjrvxb3Ku+Q6V2UDgBSYXt5M/IB95OQago3B3KOhf2Vf5MEBZybx89xYTRYubz8
         z2iA==
X-Forwarded-Encrypted: i=1; AJvYcCX8XaX2qROUSdEPmm3A9u3PhhM9pga9wnQP42DHhuCpindMZVpqzN3V82MadBz09mYU2oLcSmZJQ+cltdepJTbMGWc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJ/LbxYz29fmIEljJQXGIGddqBV+zcv0NHU0s6MtaWMUS3Byh8
	LRSNc6zf8quj2zkxIEo433tRouwKk2uWEvK2qA0QS75BIEWcZWtGdZdhzzKSGg==
X-Gm-Gg: ATEYQzyPdvavCN4AO/iItAX63AYrbOJOKPDcFY1ibG2Z7+8vIya81IYSnveZdf1JTP6
	hWSKk/yG8A63xCI3ml2Zbr6YcdnRkArz/FZ4686gxC0gYmWBL9veG2xB2fFVl1CC2dEpZzGVcbF
	uAGwfuyl7fSaezxWZc1XdhvuUdpc5JgnUzhO7VT7WxWnoO29fM71RARm9O8SLGcrykYUj02fbRq
	OJmUU0mfYCZ2d1XUsgnTUjra+WUZBmVsbhs7ne/snApfwG1pqScCyaZ1SJhQRU06OH0xl5MBgTr
	9qMfCTRPYKiR5NUxX64geBmUlu+k4/Bg1MRI7t7IxIA86qo+Tg0YY38cU+AtICJQ9B1QxLqOBfe
	1Fe8zRBvjokV5I4RGd25AnWRqL8qhpjY0x50E+Vu27HzHQGroZb+Nd0F+jpA3wIY4m7BJ4wkSq/
	ZHvm1bnkrk9BhMKvvkfW+gw1Bp2jJgg60=
X-Received: by 2002:a05:6000:1883:b0:435:8aa1:ff4d with SMTP id ffacd0b85a97d-4396f15bd8fmr23006522f8f.22.1771962988429;
        Tue, 24 Feb 2026 11:56:28 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439899da8dbsm4984873f8f.18.2026.02.24.11.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 11:56:27 -0800 (PST)
Message-ID: <e69dc03d-1e36-4726-9a20-43ace1cde523@gmail.com>
Date: Tue, 24 Feb 2026 20:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] libsdl3-image: update 3.2.6 -> 3.4.0
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20260218113450.32876-1-f_l_k@t-online.de>
 <20260218113450.32876-2-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260218113450.32876-2-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124598

On 2/18/26 12:34, Markus Volk via lists.openembedded.org wrote:
> - Fix license checksum: Copyright year has been changed
> - Add support for av1 and jxl
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libsdl3/libsdl3-image_3.2.6.bb               | 15 ---------------
>  .../libsdl3/libsdl3-image_3.4.0.bb               | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 15 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
>  create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
> deleted file mode 100644
> index 7c2f4026f2..0000000000
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Simple DirectMedia Layer image library v2"
> -SECTION = "libs"
> -
> -LICENSE = "Zlib"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
> -
> -DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp"
> -
> -SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.2.x"
> -SRCREV = "d78dd65454f442bfdbc373201165f1ef579484ab"
> -
> -
> -inherit cmake pkgconfig
> -
> -FILES:${PN} += "${datadir}/licenses"
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
> new file mode 100644
> index 0000000000..5d6c1cf21b
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Simple DirectMedia Layer image library v2"
> +SECTION = "libs"
> +
> +LICENSE = "Zlib"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=df8f4d887d3997f6e9cf81bb7f43dbf7"
> +
> +DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp libjxl libavif"

libavif is in meta-multimedia, and it would make meta-oe depend on it
unconditionally. This most likely will need some shuffling around.

> +
> +SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.4.x"
> +SRCREV = "ad58ecfc27a1bd09e510ceff8bbbdb1094806476"
> +
> +EXTRA_OECMAKE += "-DSDLIMAGE_JXL=ON"
> +
> +inherit cmake pkgconfig
> +
> +FILES:${PN} += "${datadir}/licenses"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124474): https://lists.openembedded.org/g/openembedded-devel/message/124474
> Mute This Topic: https://lists.openembedded.org/mt/117873036/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


