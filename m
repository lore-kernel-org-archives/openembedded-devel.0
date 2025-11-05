Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA339CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 08:07:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4615.1762330012766727814
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 00:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I7bCe94e;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42421b1514fso3711524f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 00:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762330011; x=1762934811; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6euQ7uLiqhqqUE7VRUuRpOe5ODIFw+kpw1jMY1E44hE=;
        b=I7bCe94eCSRLX9GJzW2kz+QIa/Wiqi+EssjfG+mOfkutq0MOCrJbrGJUswBM0ez4mZ
         o9/FLsKDWBPxDTxdeVIVqdmWHwRvoNfJfeK2jY8rTcEmDZxf6URHVfD8OuE8zLt7AyMy
         +FcTFAN/x3Cc9ml9PkBlmUQINeZklzOjgS2xgtXzs7GZ/dvqSIrGoG91Oj23rFrsSP+U
         JsONTr26aIzVh4zjxbty2KJ7XrFGzLmsSke83HI4XBncRDOLxsXPFbyjhHGAVRFA4sXc
         8oN8b43aWq06Dtp7oFcrtUukn3hpZZ5jph+Vggx32UPN46NhE9M3Z6qjGgdsW3I5rs40
         0auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762330011; x=1762934811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6euQ7uLiqhqqUE7VRUuRpOe5ODIFw+kpw1jMY1E44hE=;
        b=ZqPAA8aeQWNzuFlzm212nFW+ipVcTPJKuoojTuExKJG3JBc8R3pHWwTCVbWGmH9eYZ
         Koubr8qy3l4EXDZLq+6lXB/q1Ts1VvsW2htktOrctMR059kl1CrYW766oNZkqBEmJQG+
         BQRjCquho96ARjug/4ItOJO0kmWJzxs+fqVsbQJSOcqedtrJLWZR57FLiHed8WqKhJiV
         gX59sezDJ6To+3Rf/QiGFjBYw7uuRTbwzvFfajJTQYYEJaWRigBhb7ijRlmdxOXGFQwI
         cFA0SrArQ8HlEBl+flT5jRXGAtCrDAqFvXDAEvP2Qgd0DzGUu6zuQSGYvImhzLKLQvx9
         f/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzjRUjuSgIGnTpYlteXxvYhrgnza/hpiN6Vw+4rhE2+Ae3OnWGn4djDAptqFiNdZoZzwFHLfjvobQac1KqtxNgeR0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQ8vHgtMCfvtmGO8Gx2YdLC0Ym73sLY8zxjTbgX9HOjZea4W9Y
	IvVxMPB6wo5AT8uAHdPwolZ7cFXc30oaBU6ypXyMFaVw9QBzi5S2oN/ERLG6gcvH
X-Gm-Gg: ASbGnct2OC6VQHdKxxxDn+2wdXwUq0W4pVv/qpC6qwoVSzuY2qFkfo7+QcUpvkfvVvm
	odYGvvoMVPXq2jbg+1xJftRjFcBhLd4hWj+mJbGCTo9dFqlmVDRquNVDQssbgQJFj+LgY7L3UrV
	IDXozoSFLraJtIiU/drzP5LnO23i4Jm/7Ng4gXq4ld1iaDzLAFHIEfl0vHRG7UzyIEZK1rtsf0U
	ZmB2fAtMEaTCOnwBbIIsrUGqJJN06QSFbs+0UdkpHeJZD6z1J74fKT3b+JHOpyfnyoxqcp4ItlB
	W986k0sVTn+FIM+kuNVPwcNGQkwumR86307LXPogvZXR08h2hWHEpzcZlE7MsmH/8B5FRLd7JTD
	XeQuvK+HW16kFQMDjnTPodkxUqVdOcUj9PI1vU8t5EGKpk6yp8JuFd8lJetOAaeGmbZpfo88fF9
	T1QOEBjkCD
X-Google-Smtp-Source: AGHT+IEgtFPITy3szUBjWKISw2lb1egzAFPkghGovX1q3pBhYu/5ckzwrRt+9IW27KD12auOuz7elw==
X-Received: by 2002:a5d:64c7:0:b0:429:a7f1:bdf2 with SMTP id ffacd0b85a97d-429e333622bmr1774245f8f.60.1762330010534;
        Wed, 05 Nov 2025 00:06:50 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc192ac4sm9187502f8f.17.2025.11.05.00.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:06:50 -0800 (PST)
Message-ID: <82a158ea-f3bd-4c86-afbe-481762bd768d@gmail.com>
Date: Wed, 5 Nov 2025 09:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][krikstone][PATCH v2] mbedtls: upgrade 2.28.9 ->
 2.28.10
To: Haixiao.Yan.CN@windriver.com, openembedded-devel@lists.openembedded.org
References: <20251105073938.3187663-1-haixiao.yan.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251105073938.3187663-1-haixiao.yan.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 08:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121323

On 11/5/25 08:39, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> From: Yi Zhao <yi.zhao@windriver.com>
>
> ChangeLog
> https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit ca08c742230b758f6ebb428901d51169f1e6044a)
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
> v2: Regenerate the patch based on commit 33eb562e382d0c90fc6574c3de2fff3e79a414cf.
> fix fetch failure due to branch name mismatch.
>
>  .../mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb}       | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb} (94%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> similarity index 94%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> index d935cb233122..61e740389cea 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> @@ -23,8 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>  SECTION = "libs"
>  
>  S = "${WORKDIR}/git"
> -SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
> -SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28"
> +SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
> +SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28 \
> +           file://run-ptest \

I think this run-ptest script slipped in accidentally. Could you please
remove it and submit a new version?

> +          "
>  
>  inherit cmake update-alternatives
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121322): https://lists.openembedded.org/g/openembedded-devel/message/121322
> Mute This Topic: https://lists.openembedded.org/mt/116131413/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


