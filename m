Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7F6C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 02:48:03 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.6703.1646275682584504828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 18:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBYt2Y1t;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id t21so2955445qkg.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 18:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TpPWzuIU7qt5Kd00TOomvlbwl/SdYSlWHVvz5MJMv3I=;
        b=kBYt2Y1tEhdA+YdUjuDRfpPcb9T1L+gIH/5HsjPpmb8tZHq+TGETM2Jh9k1o0zkV3O
         WRuZc/KluDZzlbh1rJDy38MFm90XefzvqdLSRwmvrBB6oGZJ85e0TuUG8Y1o6+D36cXw
         T+86B7a/vLTZBIJjQwPs6SaEGdwWK2D09Fmp5kY4v8QtowtBCAUuh51waBFGmKnErV6B
         DWNMPbTUk1dAsD0TKgaC+6kwt23mhVF9JcvShh/GNOIMwPpeML/6j8xhWtfrRkvkvb4V
         YZzuZmUm2vyh5S5TWK2NyjCEhA7T/9U5N135898jotxBclkqFEz1aFw9A2GDlW2F9r5J
         prHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TpPWzuIU7qt5Kd00TOomvlbwl/SdYSlWHVvz5MJMv3I=;
        b=j5I/4fWhlYm0ua3A0EoCZST0rzNxqCeJj0dxyqVmZAAtsk851VBJZEwqUS6s6z3TTg
         qg9m5+KqO4i3nKfa/uGCJuKJfga2KBvgKwNII510pcxcdsALVTXizO8SfN1lFotgWC35
         upz6nR+8G16ShH6UK9KDL9H6sjf/JzQt7ADOJIAmlEDWMsRus8qlqdRKC3A2yO6TPAIF
         UNqhnocbcv8K0gJTaYwW6fCNQNF71HsVDC548k9VDKECm/BVl4S9EwK8PGWARVpe3Syx
         wFrzxVEIv2QYoIpSKdYTLbc56Iy7Dm384V6pk/F28fYXcv32Bt0HXFLxrUoH080ULVbm
         Shyw==
X-Gm-Message-State: AOAM530iReV2TqtBJvk4K1yV4TDlQhY+udRaNZqFj/Pmmkzj2Cdz9MHF
	FgZPBr+xNckME5DwB/jIyxBNm7/SKWF2+s9YqcM=
X-Google-Smtp-Source: 
 ABdhPJwWJB6dEIektwjlEwW7uyfFJjDivHLtYIhNUEIhEmZIZfG/nyFKUhdQb0TXFBiHpIORBP+4B2FRFSnAUtZHNR4=
X-Received: by 2002:a05:620a:817:b0:648:d856:3fdc with SMTP id
 s23-20020a05620a081700b00648d8563fdcmr17626923qks.180.1646275681507; Wed, 02
 Mar 2022 18:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20220228155714.7894-1-jsbronder@cold-front.org>
In-Reply-To: <20220228155714.7894-1-jsbronder@cold-front.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 18:47:35 -0800
Message-ID: 
 <CAMKF1spdXVvNtLfq=-GBRROe+-=D0jZ+9Pg=EfaoK55A7uqtuw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-crc32c: add 2.2.post0
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 02:48:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95722

I am seeing a failure with clang on non x86 host. See

https://errors.yoctoproject.org/Errors/Details/650724/

On Mon, Feb 28, 2022 at 7:57 AM Justin Bronder <jsbronder@cold-front.org> wrote:
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta-python/licenses/CRC32C-ADLER                | 15 +++++++++++++++
>  .../python/python3-crc32c_2.2.post0.bb           | 16 ++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-python/licenses/CRC32C-ADLER
>  create mode 100644 meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
>
> diff --git a/meta-python/licenses/CRC32C-ADLER b/meta-python/licenses/CRC32C-ADLER
> new file mode 100644
> index 0000000000..f1f0e94ee0
> --- /dev/null
> +++ b/meta-python/licenses/CRC32C-ADLER
> @@ -0,0 +1,15 @@
> +This software is provided 'as-is', without any express or implied
> +warranty.  In no event will the author be held liable for any damages
> +arising from the use of this software.
> +
> +Permission is granted to anyone to use this software for any purpose,
> +including commercial applications, and to alter it and redistribute it
> +freely, subject to the following restrictions:
> +
> +1. The origin of this software must not be misrepresented; you must not
> +   claim that you wrote the original software. If you use this software
> +   in a product, an acknowledgment in the product documentation would be
> +   appreciated but is not required.
> +2. Altered source versions must be plainly marked as such, and must not be
> +   misrepresented as being the original software.
> +3. This notice may not be removed or altered from any source distribution.
> diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> new file mode 100644
> index 0000000000..0d51420939
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
> +HOMEPAGE = "https://github.com/ICRAR/crc32c"
> +
> +LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0+"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
> +    file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
> +    file://LICENSE.slice-by-8;md5=6b3bc7709d6b2db6646ec2467310ff6b \
> +    file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
> +"
> +
> +SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} += "python3-core"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95585): https://lists.openembedded.org/g/openembedded-devel/message/95585
> Mute This Topic: https://lists.openembedded.org/mt/89453390/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

