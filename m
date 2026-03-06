Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76E4FCB613
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:13:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71428.1772809988606226577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NhdF5pA6;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439afc58ac7so6389113f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809987; x=1773414787; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7vJoSBlb9SkuCKp/a6O0axCFM9o+P73M8WxwMsdbyQ=;
        b=NhdF5pA610FG+p13+jX0+5LgFHeR/QCOOMUKO6G2Wg/in2BZU6w0vNbURUt/WLH5Y+
         B9+LA5jkg/ugwTZswONvh5WuOreuIHYCjQ9zS4EVfSIPIggrR8MYAoYZlitqX4U8Jr4p
         K7F3pTfv1Di2oOBTKfDdAXyjGfN219q2sraNn2fJnZrCHXd6sRSNcrpHpYXzGNV1G1Ul
         frtsgLFHuXT0WH9miAYHi5edEhGFu5zfScR08EGSZePsEbD+J3wzrP7R6gSOn/Bjn1q7
         8Kwq7iVoK+4vWWNjnS9mi9ZiuQae6LYvaSu0RKSto039GoIWhX7gQ0HSNKLyvesFPtvR
         Qc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809987; x=1773414787;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7vJoSBlb9SkuCKp/a6O0axCFM9o+P73M8WxwMsdbyQ=;
        b=e1id2mbUakZzNSEEEO/OvoyQWbppcZgOHAsF80f3sSdwzJKIBtVWzp4PMUEnezTEta
         29WxyAiEgHz463vovdVfLrzsYYbDaPMSsSdZEYtETv/4EfT5LJrSXp49He1QqUNeyKQD
         Dp5iCU5PygP2qDLIQdBHGXr/4LRX1OZBayuM9a7mWnYHLoLXaykTWFBnTXX9ReTOkTyF
         JuvdsDYysOe7HC7pgukjjxymS837pmoV1SAbxGTmDa+fXlaL5+i4C3C0FTAS9bWfeG1Y
         hc0Oq12AVxY2wv9z16W5IRdt7s9kbxbbvprpUbHVOwcCsr9Weuc0JFI2ZX8r+yin0Z0H
         JcPw==
X-Gm-Message-State: AOJu0Yyq3NquPdwXgzRzs0KhB/vp4BZEZ1kc10Xcq4O/7L1ChhaEjwWW
	3uFSpGCk8dFS6JP1zoi5xVrIth8bN/HFglBlb5Pcb1LsTdSxReDYEwcDQra9Dw==
X-Gm-Gg: ATEYQzy7NARUu6E8/5Lw4Edpeu5nIFBd4NdAsC5S8PcLcywj04ZHAaT5YrFAlAQUrBr
	n+GvKsshBmV+VsTi7N3PudWbZZk92B3GKDsetIhqekuXBAS149tSCM8VweJd8ObctbmovHrsfT+
	9RpAYI12lygRjbhBzMDpQoPT0HXEzJlVoPogS3DxUpKzy2G8YcuwIlPKKXFUJ7F91qxWmNFH5EO
	E0HFwWjUl946lVlom98gkYmQlL4kw3qGYQFH9j6wCB7bxVRVN28B6QknYD5sPzK1f+k42/viaNf
	q+dra5+OCPF9Xl21RNackun0jeezVVoRQ5+JV9O2C72Bw2l+HR8jeguqe1mHzLPnX8X1oWX6xbo
	fdjc27HM3k23Zygvx8mFI9juIimMg1IQnF+lhI5tnkHcA4O+1bzaf1IhapTYzy5FcUHI/PP7CkZ
	P7V4CtB6w6EWYhGKaKyyllVgy54FBGjaE=
X-Received: by 2002:a05:6000:144c:b0:439:c4ea:41a0 with SMTP id ffacd0b85a97d-439da8a0402mr3781781f8f.59.1772809986812;
        Fri, 06 Mar 2026 07:13:06 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm5059139f8f.30.2026.03.06.07.13.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:13:06 -0800 (PST)
Message-ID: <322eed79-db9a-414b-a09f-d6beb0478232@gmail.com>
Date: Fri, 6 Mar 2026 16:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][whinlatter][PATCH 01/11] imagemagick: patch
 CVE-2026-24481
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <20260306150602.616834-1-skandigraun@gmail.com>
Content-Language: en-US
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124916

Grrrrr, drop this whole series... I just noticed that Whinlatter is
using ImageMagick 7.1.2, and can be just updated... For some reason I
was under the impression that it's using the previous version.
Sorry for the noise.

On 3/6/26 16:05, Gyorgy Sarvari wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24481
>
> Backport the patch that references the related Github advisory[1]
> in its description explicitly.
>
> [1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-96pc-27rx-pr36
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../imagemagick/CVE-2026-24481.patch          | 25 +++++++++++++++++++
>  .../imagemagick/imagemagick_7.1.2-13.bb       |  3 ++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
> new file mode 100644
> index 0000000000..3d35a3f1d6
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
> @@ -0,0 +1,25 @@
> +From 6778a890f95971c61a16593abc2cd15376d22cdd Mon Sep 17 00:00:00 2001
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 23 Jan 2026 13:19:06 +0100
> +Subject: [PATCH] Initialize the pixels with empty values to prevent possible
> + heap information disclosure (GHSA-96pc-27rx-pr36)
> +
> +CVE: CVE-2026-24481
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/51c9d33f4770cdcfa1a029199375d570af801c97]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + coders/psd.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/coders/psd.c b/coders/psd.c
> +index 28495c6d5..bb4ceecd6 100644
> +--- a/coders/psd.c
> ++++ b/coders/psd.c
> +@@ -1334,6 +1334,7 @@ static MagickBooleanType ReadPSDChannelZip(Image *image,
> +       ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
> +         image->filename);
> +     }
> ++  memset(pixels,0,count*sizeof(*pixels));
> +   if (ReadBlob(image,compact_size,compact_pixels) != (ssize_t) compact_size)
> +     {
> +       pixels=(unsigned char *) RelinquishMagickMemory(pixels);
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
> index e3f4a96d6f..adf65880b6 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
> @@ -15,7 +15,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
>  SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https;tag=${PV} \
>             file://run-ptest \
>             file://imagemagick-ptest.sh \
> -"
> +           file://CVE-2026-24481.patch \
> +           "
>  
>  SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"
>  


