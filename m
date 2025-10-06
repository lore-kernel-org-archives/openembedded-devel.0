Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4E1CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:10:08 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.32377.1759752606127823261
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fX87vJSY;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso8760102a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752604; x=1760357404; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28fK5ISU02J34Xoe8Ro3tCUj70WEd8lHG0euxFGk54M=;
        b=fX87vJSYW5GrzLiPeGzk2No08pCfGRnOGz3NYaqbMGEL1RkrZAF/kPXag/k4k1N5Qn
         nWtOMNIS9x5kuHfR3xLoBOMjZVZCOb1nR/07jwA3Zt9t8ZeQyg8gT6VKe8Dg9rWhZ5Qb
         efnF0ffeqQ2yMsS2sAU805wr8qT5YJ1PhXk0UkxRbX4pUo33LiwICKeohbZZfNql3Frc
         NoM9oOFqvFPf2opjr3OWcvGO9TUhUFxTlGUV05WSF1GnZ5bwsOmhjX/+M+A1zjruMaDZ
         ZbcZb0O40blkRxcFxRFZ5pfxnaGT67iLQjcrCR1RZTrRk/FHhXzfkjJEzb4Mjy8/1tYD
         ayfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752604; x=1760357404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28fK5ISU02J34Xoe8Ro3tCUj70WEd8lHG0euxFGk54M=;
        b=l6DYommy98eJqi4sVHa16J7ICKJaf4Rx0gzE4j3zR2CdymEHboNTC6UDb7TYotWrPi
         gO0UAV52BcDDaWkOIQFawnNpKXB3bXvQDRobg5uIIu1PIbhuA6nzNI4a8QW9S76nK5Tx
         ajhO+9Cvhf44y5t57eI1at/xifqQ5upMBJR1mqiSxb7ohKWNOyavZRJ3Xi2z/cJnBlF1
         /8ydLPqj6LzebBMthx9wnUC0d6LRUHemYN1QIrb5gpe+A9U+O3xoUlTZ8xMFYbUKgFFs
         wwdg0MNfrvMAw5QcUmAxTn8lO9fueO/gehF4Lj7ze4wx3FO1uKR6Tm/rBsTV2eifV+Fh
         6v4g==
X-Gm-Message-State: AOJu0YyUpSJBYOlAUuKp/dfRRCQcH8bMR3tRfxrds1xo8TmMqDkkN0OH
	rSd5aIQnZdy0EhbJx3S6OgTPYa3Iu4VI7ftIBC7X+KhhjDqqwbzWbKvFSUv/SQ==
X-Gm-Gg: ASbGncsIRTqvXirKZnIj8LSP6ND2qfPrKt+L623L4l44LplxM/tuvq1RC2TzThbcvw+
	IlY1HVaxiguiDOFm+oKe1jUff+aBeVAsJ6Ox0AabELemqCe8h6e6dQTam/UGJhelJN24yViQhmO
	SUUsyhl4Y+/qgipFx2BwIZXD5AwqQyxEcLyd5HFQ0X2tyNKaFjEmN9YfXwIQUjMCw9NS5AwFmFL
	nZ3DBiOv9JPNsBxND9zNQlmpGviulm193wO8Uot1GgfNSDDR3O8EWi4b9o0E70Llyal6S5uUxAI
	tHnG2X+Iic5ykj6FjxGuzmokLm4KN2h30BvrhrdTHwjtTq6eZEoPFmh1guo3+lrFyUf/Rzh7dDx
	/S1rmunKbOFH+cfd6V2dmepGZgnDlAnfnrSiD3RxWflKgRsFTN6RYNHD0R+mmEJuGUA==
X-Google-Smtp-Source: AGHT+IF16ue3KMjeT5cDzMdPUse02Gp+fGhVbbbNs09R8rdRym+XAsjM5WemeRZiWo0TjUqOe20rBg==
X-Received: by 2002:a17:906:9fc9:b0:b3f:f66b:268a with SMTP id a640c23a62f3a-b49c1a6baf3mr1360011666b.19.1759752604347;
        Mon, 06 Oct 2025 05:10:04 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b315sm1130522366b.64.2025.10.06.05.10.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:10:03 -0700 (PDT)
Message-ID: <8214d142-96e1-474f-9870-db65cf5ee7d6@gmail.com>
Date: Mon, 6 Oct 2025 14:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/5] audiofile: fix multiple CVEs
To: openembedded-devel@lists.openembedded.org
References: <186BE59DE8B74748.20111@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186BE59DE8B74748.20111@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120284

Sorry, this was already sent - this time it was fat finger mistake,
please ignore this.

On 10/6/25 14:08, Gyorgy Sarvari via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> CVE-2017-6827 / CVE-2017-6828 / CVE-2017-6832 / CVE-2017-6833 / CVE-2017-6835 / CVE-2017-6837
>
> Use patch from buildroot:
> https://github.com/buildroot/buildroot/commit/cc00bde57fc20d11f8fa4e8ec5f193c091714c55
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 634cbcb91c3ab7154e0cda707663a1e4aa500f4a)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../audiofile/audiofile_0.3.6.bb              |  1 +
>  ...ays-check-the-number-of-coefficients.patch | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
>
> diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> index a09f84381e..7654c073f4 100644
> --- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> +++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> @@ -13,6 +13,7 @@ SRC_URI = " \
>      file://0001-fix-negative-shift-constants.patch \
>      file://0002-fix-build-on-gcc6.patch \
>      file://0003-fix-CVE-2015-7747.patch \
> +    file://0004-Always-check-the-number-of-coefficients.patch \
>  "
>  SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
>  SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
> diff --git a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
> new file mode 100644
> index 0000000000..282f4c01b9
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
> @@ -0,0 +1,45 @@
> +From c48e4c6503f7dabd41f11d4c9c7b7f8960e7f2c0 Mon Sep 17 00:00:00 2001
> +From: Antonio Larrosa <larrosa@kde.org>
> +Date: Mon, 6 Mar 2017 12:51:22 +0100
> +Subject: [PATCH] Always check the number of coefficients
> +
> +When building the library with NDEBUG, asserts are eliminated
> +so it's better to always check that the number of coefficients
> +is inside the array range.
> +
> +This fixes the 00191-audiofile-indexoob issue in #41
> +
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +
> +CVE: CVE-2017-6827
> +CVE: CVE-2017-6828
> +CVE: CVE-2017-6832
> +CVE: CVE-2017-6833
> +CVE: CVE-2017-6835
> +CVE: CVE-2017-6837
> +Upstream-Status: Inactive-Upstream [lastrelease: 2013]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + libaudiofile/WAVE.cpp | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/libaudiofile/WAVE.cpp b/libaudiofile/WAVE.cpp
> +index 0e81cf7..61f9541 100644
> +--- a/libaudiofile/WAVE.cpp
> ++++ b/libaudiofile/WAVE.cpp
> +@@ -281,6 +281,12 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
> + 
> + 			/* numCoefficients should be at least 7. */
> + 			assert(numCoefficients >= 7 && numCoefficients <= 255);
> ++			if (numCoefficients < 7 || numCoefficients > 255)
> ++			{
> ++				_af_error(AF_BAD_HEADER,
> ++						"Bad number of coefficients");
> ++				return AF_FAIL;
> ++			}
> + 
> + 			m_msadpcmNumCoefficients = numCoefficients;
> + 
> +-- 
> +2.11.0
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120283): https://lists.openembedded.org/g/openembedded-devel/message/120283
> Mute This Topic: https://lists.openembedded.org/mt/115600757/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


