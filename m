Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819D9CD4F35
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:26:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3641.1778664384117924235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 02:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kk15uzip;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso45637865e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778664382; x=1779269182; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fX2roNjcBjIiugLkCvTmanb9dw3Xf9A89L2ivaSyPoA=;
        b=Kk15uzipELmO9AFKc5OAKJPKOqBnVkC+VFDWJz2P9O1AQV2AJBS1r4idKtRSO/YUsx
         vLk1iIOWoJkCqnGDuZFk2UecVGTgshol1bSurvk5feKOAo7fq8tujIDvYZ4GIZfrM1Hd
         N2r2vduE6Ecfg4V77C7CSrAOOrctkBjOgAT8golSdimeEqu1KBh+yAL+QtHVrl1Cn+F5
         mu6wHh7pO8K+ZMJIaZgAD+cjn0DDf5KWqkCR8K9rd7h6/H5Pu0kiIt+bhcHoaa9EjaSE
         ueKQm6WCYudcbpVpE19WFUPsbXceIqcgZGXXVO9So6segvrtafbh2TrcCPiMh1/b/pkI
         KAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778664382; x=1779269182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fX2roNjcBjIiugLkCvTmanb9dw3Xf9A89L2ivaSyPoA=;
        b=ljMC1M+QUuRf6aIAe3pERMBUKRaWM+Znn+4bLxlyUIoX+0DKxrwaf0K5Q6FJOfGVkS
         ZYncGvNQkMe3O+osVRENe6N+r16tYTJ/XZ7PJ1vMMw3pD6nhR1E37BEILXGECsC3swZn
         5NWjwFn/ZfRiYsoFOS5JBJYxp42qGzv2OJFGmj1GuKq1nV/aYovUCEwWmwgjrf/wGFFk
         dIEVkO6bzoYZDsFBaPU0kyYTENBkmsSD1qxT3C1G3MZJmAvAFTTAYEsC2h5EJ7nicpDh
         Ks9RIipx44o9IHuR3jvrP0Cd563zMf4gH3DdalhePvkGGt+HetfNqOE3LKZd7xHJ5Ei5
         B2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+3sI6hBR6FHOzwx+V2/ERJAUHS6o9L21iqkKOuRYzb5vZ9J1E5XAfMOR0HmjD+g94LDdBYzUQ/GocXKFleK0gPPDA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEki1jfb4uQiP2yrD9W3RCobP/rszVPHOB5VFIGy6g+gdTpsqm
	3gxvoX5MOa+mLgKYGHakS3JN1yEL6PlJmfm4sHWmumZRl1o0YXfWAZCc
X-Gm-Gg: Acq92OFZ0PAe6/OqL+1e/D+knJZZYHJwqYSCvt5ef/XbhlBgDvAjW+dcmAn6W7076Y6
	r/A+FTSio4xBBNGaWqIzv3SUS6FYCz/nEKJCQGsZVm6SJwcKoSoI+N5MJGQZrX37MOnRW2Zy/XS
	bSNBR1pPrzaJhcado4BzHO8y+qZMgtdtn1gXVKxHs+eLwI8HGa9G/WNUDNaCQcL70xp9T6oAZ1u
	4+Ba+3Fc1MG3LF3qOlXx0akwhp733DeC2hAg2Upknw46WMM1xUQ/AX2F+dDPL/yVI5pxulXV4R8
	RIrpQxFr/PaicsxK13DJR4R+QMIFJSB/ALiMazwiTaX0JPafZR6bocUPAE2yuE5aX4B2PkLUxDD
	/mBYAjyeDSaRuT48WA2rVkgB74+p/NrVQA3enDVsuSKVcQaYlNjxudaJzuyt7vkeESuEScQ/nRC
	UHwTqUSiN475AGPR8pRfqRfB6WLCBnIqY=
X-Received: by 2002:a05:600c:3ba2:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48fc9a0dd8cmr38272305e9.7.1778664382231;
        Wed, 13 May 2026 02:26:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm34817465e9.14.2026.05.13.02.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:26:21 -0700 (PDT)
Message-ID: <ddb38a8c-25dd-4dca-bb8b-950413f091c1@gmail.com>
Date: Wed, 13 May 2026 11:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [kirkstone] [PATCH] fmt: fix SRC_URI
To: matthias.p@variscite.com, openembedded-devel@lists.openembedded.org
References: <20260509230006.8337-2-matthias.p@variscite.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260509230006.8337-2-matthias.p@variscite.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 09:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126961

On 5/10/26 01:00, Matthias Proske via lists.openembedded.org wrote:
> The source branch was renamed from master to main.
> 
> Signed-off-by: Matthias Proske <matthias.p@variscite.com>
> ---
>  meta-oe/recipes-support/fmt/fmt_8.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> index 54b8fd3d9e..6655d1311a 100644
> --- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://fmt.dev"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
>  
> -SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
> +SRC_URI = "git://github.com/fmtlib/fmt;branch=main;protocol=https \
>             file://run-ptest"


Thanks for this patch - I have received this fix via Github also, and
picked that one[1], only because it came earlier.

[1]:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=6a7d58fb5b5100e855e48b4bfe32622afb141acd



>  SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126832): https://lists.openembedded.org/g/openembedded-devel/message/126832
> Mute This Topic: https://lists.openembedded.org/mt/119236067/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


