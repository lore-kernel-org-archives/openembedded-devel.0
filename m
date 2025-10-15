Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A8BCCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:05:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.13314.1760526307315062724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 04:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cuf5a/oJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46fc5e54cceso20634835e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 04:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760526305; x=1761131105; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kI8a7S6AA71RQIpdeBTlJd2LtpU9CuOy4dYUr9ghe6U=;
        b=cuf5a/oJqCAYOZS+W6oHL9IwYW5p1kWlNs9naJtzDDXoLHd8h4/ok+arlCeQUG+45T
         vuwoyi/kqb8w/3LrrUotWWId2T3yQ0kkoyO6+7hiqXPM9M9HGSoH4eqUrYihRvMNFIyT
         LMBeCuhvcnySRF+VNV6ucTF43u5JU9lx9Rp5APrCMDdH9Ki/YUpXnlG/pe9nCgc7QsVz
         wQn1EnG2uS0WXb8pMlmGuC7cCGKDR5KEVHkVamUskf4z8Ss666EZ+/1FqhlGRWVgdujb
         Lt5vxlf3Emk/034dvL/epQKJka30jKavLB/T8Ktj8jsqnMk0U5w2tFUNanYZ7FfQiOWU
         pahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760526305; x=1761131105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kI8a7S6AA71RQIpdeBTlJd2LtpU9CuOy4dYUr9ghe6U=;
        b=Kihs1mG15WfWoa0RWGbZOWL8vxmrxrfL1xXxAFzNpUmE8iJ3mlpt2ab9IwrKM25oEY
         8OCJPbrqeVcL82Xek3sv9DxDFy1iVbRwCdzgrZENrDqdAxvuSIRlwbAVFwVI2/cP4z+T
         ixBGOhDl/4BDlIB1bV/e4a7o2fRgbNELqcM0TKYNLWQZyjASOTJezbbWhH940pd4/hFC
         C9YwB7IPJUumdZsXOus7S3CqltummMAjlC8o8aMiYRPb01PU6re2fWKLuZm/pkX8nws0
         hicAaKUBzKO5Y5Cuq0oyLt7HaxuRHXu71aQh6M6SRL2qwBjyC/9dOefOq2F8D1TQobrq
         D1jA==
X-Forwarded-Encrypted: i=1; AJvYcCVTgBDFDpPdD3/qufJ4X703gWczZqUbXzptoQqu0CfglvHpphv77Hb8ZJ6VOH4ahJpXULJaydtq1aBMlHtBFwr7XH0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YztZVN5UO8ZOHteGPW/5oqMIUdSTbrFkMD/CuEUd7KvxSVZUlKq
	q0pYXVvDtuwTheaNVuTIvDiiVdAQNS50LtpY03S4nf86xZAIht7WdUhI
X-Gm-Gg: ASbGncvkqoX1HFshzUjB1WVpudGDaJDm8FIzXTb8CIqpmF4Ynbb5RAKFlt40pm+F+Q/
	V2QDYy5797J5BLcPPwDTL6GuEr8uBrzBpfDIhZ+T9Rlet1ke9peG6fAR7rF4TZ26zkPxdEe2yZJ
	7B+KBSlLsmjSQHpp385gR6R19kFVx6gxiUGl6bpkUmicFvUEk+OSp9ZmuCdwwmNC5xfXD+sg24k
	1mF0V6jECN7LgWtekyGTdHLRMN6WPumAhfP6nSovQIDkrC8xc7xqnGHvbnEWPucPk/hU6rdTYnx
	uvjgEf7h9CjDXpQtaVOoTEEgX79FXhxG9U/rE6fPRlxU4IisEu8eI4PHtrrEAYt+tayjTV1Ljjr
	46LwsD2fspS02NSQLyW2xjLYKOtdvslwz+LGQR06QRk3JgRuNjs2s/wgMRwKV
X-Google-Smtp-Source: AGHT+IHEJS9spVqKzKvsGl5ToAZEHhRqcpwXevFJAl39wA6Cg3uud8f0tkOIx50BDM5Ykn4HZazjsA==
X-Received: by 2002:a05:600c:1395:b0:46e:27fb:17f0 with SMTP id 5b1f17b1804b1-46fa9aa204cmr190789705e9.9.1760526304989;
        Wed, 15 Oct 2025 04:05:04 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c03644sm26273545e9.8.2025.10.15.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 04:05:04 -0700 (PDT)
Message-ID: <b8cb9be1-eb6b-4587-8c74-b376e04fe5b9@gmail.com>
Date: Wed, 15 Oct 2025 13:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 1/1] poppler: upgrade 25.08.0 ->
 25.10.0
To: Yogita.Urade@windriver.com, openembedded-devel@lists.openembedded.org
References: <20251015105224.3330995-1-yogita.urade@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251015105224.3330995-1-yogita.urade@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 11:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120706

Thank you for this patch, but I'd recommend not to send changes for
walnascar - at this time there are no further merges planned for that
branch (except for the one that's in progress).

On 10/15/25 12:52, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> This upgrade includes fix for CVE-2025-52885
>
> Poppler 25.10.0 Changelog:
> =========================
> core:
> * Fix image signature getting lost
> * Don't embed substitutions for base14 fonts
> * Form font improvements
> * Handle signatures padded with random data
> * Add feature to Ink annotation to render with multiply blend mode
> * Internal code improvements
> * Fix crashes in malformed documents
>
> glib:
> * Fix signature text
> * Add feature to Ink annotation to render with multiply blend mode
>
> cpp:
> * Added embedded_file::unicodeName function
>
> Poppler 25.09.1 Changelog:
> ==========================
> core:
> * Internal code improvements
>
> build system:
> * Fix generated .pc files when using old gpgme
>
> Poppler 25.09.0 Changelog:
> =========================
> core:
> * Speed improvements when reusing the same document with different output devices
> * Speed improvements when reading from network file systems
> * Internal code improvements
> * Fix crashes in malformed documents
>
> glib:
> * fix ODR issue with enum
>
> utils:
> * pdftohtml: Fix text positioning. (Regressed in 25.07.0)
>
> build system:
> * Better pkgconfig support for static builds
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../poppler/{poppler_25.08.0.bb => poppler_25.10.0.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/poppler/{poppler_25.08.0.bb => poppler_25.10.0.bb} (96%)
>
> diff --git a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb b/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
> similarity index 96%
> rename from meta-oe/recipes-support/poppler/poppler_25.08.0.bb
> rename to meta-oe/recipes-support/poppler/poppler_25.10.0.bb
> index 45f94b0ae7..29a5f33e81 100644
> --- a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
> @@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
>             file://basename-include.patch \
>             file://0001-cmake-Do-not-use-isystem.patch \
>             "
> -SRC_URI[sha256sum] = "425ed4d4515a093bdcdbbaac6876f20617451edc710df6a4fd6c45dd67eb418d"
> +SRC_URI[sha256sum] = "6b5e9bb64dabb15787a14db1675291c7afaf9387438cc93a4fb7f6aec4ee6fe0"
>  
>  DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120705): https://lists.openembedded.org/g/openembedded-devel/message/120705
> Mute This Topic: https://lists.openembedded.org/mt/115768675/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


