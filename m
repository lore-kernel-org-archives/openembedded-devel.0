Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF07CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:44:32 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.11036.1755600269781470375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 03:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VRskfXAX;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61868d83059so9860604a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755600268; x=1756205068; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdbX4XOcsn6jxuPvJpFjMc/E+kLP3lUEj6osHUeACFE=;
        b=VRskfXAXycf/IDquzDunuGTCsc+R6QelnzEDxGGH5bZljkL33WuIn77r/SOWHqLlwq
         52WX+He9CI7cgNb5TlwmpH0XzMjK7M0ku0cJAePJwOHavPKNWsNZhiwxbVc3TvZAB0Fp
         hXjRBX5GYE/b7wuZPqAo8EKlLR4TOjncBhCpOfDBZ8N6ORN/njcrMj1ooi3krYerZucE
         YXJ9HGIMP4C8cYU5Tf8Eh+EWPKd1MvF89swtvKaLF2iYZfZcmSZ7M6TN0f0aUIqkrjAK
         El1OhfSAHA0ck3QXctQeYgWm0gCz30GLpsJNtLC1ONMx8mmrEZyiqYZPZ9gLtK1IUXXE
         WpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600268; x=1756205068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdbX4XOcsn6jxuPvJpFjMc/E+kLP3lUEj6osHUeACFE=;
        b=c3+bWU8v/SvxS2QYoDMVGVNQVyOBCQuzxeuFH50DZg6Fzp+I92gonxGkHasgTEoCUh
         k2+r8V1zJb7CcvNhaDihAqU3RPa1owwA+U3ZNhM5uSNwc7IyKY+gu3+tu9TxenhHQSE/
         yJYBQa9QBjMSPU/4AKVFT/quKxxebPTCnOfmB0cF5FfyRMqTeAzQWKXjd4oP7I9cjT4c
         kGM7ZaDua/uZZ2vNNUlfG+cpDUSp+7LgSVdnmsc6n4pTO/5JZWlxoFioVd/Bl2MqNuv1
         khlEmr6d5wn3MmQsxOHwxXXKgmmQwjMwx6wjkyx7MKV/2aCXxATrPBSmUQfx+EpD1gUM
         X62g==
X-Gm-Message-State: AOJu0YyME9kVYBp3wSw0BtrGc8qPZe8kSY8OzUZsO9RATfLSXo8JgRqC
	87ZEOKB1H+ujkUZXwHeA0stBpG0pTmjL5L9cp2xzveuFWxP3OOk8c67YWSP4PA==
X-Gm-Gg: ASbGnct0MHV/1lFA06XoVc0c6hkp5qnkIQlUJxwyem/ElMaOW+U3lYBDivT+Z2N98Eb
	ag6xzKdD//VfP6zbdfM+jfBJUJ1TVkspM5VX6Hin7A/Leoaj2RWnLTzQ3X6Fy+u8AVLsU9NqKK6
	TxAsvMVJI7sDp8sLivRZVrg8BhMZqTaf+GGxKI9K4jebvsieWOQKbPICGKiK2wW5cKGaXE+4F5j
	bkwtarjkvpjFnT4cR+B7cwo34Od/k5MD+OdqTibB+wc0KzGuQr2NqGnVtnpjKE6VY/KdBp6JP8W
	+7izgoRXXkbP5eym+CYsiNyPf2hZHGpW5HhvIKcKybA19eAzwQeaUsxmncL0UmbQpMAcqAjPoyC
	YzWnNHekNL3svjdmJmrTn63t2ihk4m6Q=
X-Google-Smtp-Source: AGHT+IEftx8ndaz3E1cqaueogup+pnVE2LMcJ2AaFExv7l/3yA3yw6etYUjWFkHJNVkFyL9vF754eQ==
X-Received: by 2002:a17:907:96a8:b0:ae6:d51a:4ca3 with SMTP id a640c23a62f3a-afddf155893mr159869866b.25.1755600267898;
        Tue, 19 Aug 2025 03:44:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01168csm973870266b.91.2025.08.19.03.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:44:27 -0700 (PDT)
Message-ID: <04cd09ff-cb1d-4948-a198-7b2b7a244f16@gmail.com>
Date: Tue, 19 Aug 2025 12:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: drop tag
 parameter from SRC_URI.
To: openembedded-devel@lists.openembedded.org,
 "akuster808@gmail.com" <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20250815105844.584334-1-karn.jye.lau@intel.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250815105844.584334-1-karn.jye.lau@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 10:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119000

Armin, Khem,

Would that be possible to prepare an unscheduled fix-release with this?
It keeps tripping people, I see reports on all channels.

On 8/15/25 12:58, Lau, Karn Jye via lists.openembedded.org wrote:
> From: kjlau0112 <karn.jye.lau@intel.com>
>
> Keep SRCREV and remove tag paramater to avoid
> Fix Fetcher failure: Conflicting revisions error
>
> Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
> ---
>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> index 88b50a406..91adf6f5a 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>  SECTION = "libs"
>  
>  S = "${WORKDIR}/git"
> -SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
> +SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;\
>             file://run-ptest \
>             "
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118974): https://lists.openembedded.org/g/openembedded-devel/message/118974
> Mute This Topic: https://lists.openembedded.org/mt/114715887/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


