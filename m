Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5719BC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 18:06:57 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.1226.1661278012003971791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cAV8K7Md;
 spf=pass (domain: gmail.com, ip: 209.85.128.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-33387bf0c4aso399949187b3.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WYYwUHlT1+elmuEtpPQ2+rxfeWD+qj8PbvG8sfx3yY8=;
        b=cAV8K7Md3YKVBNfSEjdJl2R6IHYL5LgJdaRJgYEpWuAmi2EMT4xt7SqXfRXZTK01Jm
         7vOuLSHjVdpQpPiteldKkU3bk8OQJQ/YQomnmz9Dke8VJV/29KzTG/OYtjDNeg7PSmdi
         xl5QVj+GpDAZ4Kg76yWQdIjZB5sSNK/UYZI6JzM6TdUZeGoDiHRaV6iKh11baqSZGKil
         S+j34hU5mzdfkeEjN2gu8dowMvWeOEBbTRqXpOL4wrVklSQeteOLKky2NJEoXSeXSHgH
         gC418Cf/lNPyAuV0lDJAuH529hRtX2zh3F1gRhEtKXK2vaBTJBfGYF7XFYFhSyebqYBT
         Yclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WYYwUHlT1+elmuEtpPQ2+rxfeWD+qj8PbvG8sfx3yY8=;
        b=LcuaktJMrp/6Ba+sykfgEwgRIsxxSeDQew8zvuw9VyQwyuri42yV6rpQQzwt7LJkLZ
         abPW3V51idGc6z32ktwIsxHoQsRPjTA9AAT7bvYQCLF7ZtnOp1hvYfRSXwr/Q/bCMUVC
         dd7Zsyo9IzNYVOPxb+ADWKN5DzESqAgGU3gapbv0LqXB/MjlVn7ScB4gdKhbXeZJrquo
         uR/VdY29GTRJZ5VqsVwfwJglEbszbfIOCfyus/AdxXTBnCcdMV9fI5aQtQoJRq8oU8Oe
         GihXMQj0qJSWXpjbF9ILY6LOABzJIQp+nYvTkc6SDIHEk8Jy2f5ixHphMoc/S3rQx+vr
         FyHg==
X-Gm-Message-State: ACgBeo0xbMCpPXG5S1kMjadRUe9aJSwQk1Rn31C4iLkVOkSDSbRESEL7
	QHIFTp1E1o3mzn/gZwcGKTHZEdVmRfIlDCjQGWg=
X-Google-Smtp-Source: 
 AA6agR6VBUDs5wv3uSEIgpoZoRBHC85reT5uLUaNpDxV1iAldNsP4CLT+6wiYeIiyOzqrMr87lW6Trx05ZZAjJHH7zc=
X-Received: by 2002:a81:b043:0:b0:333:df91:2483 with SMTP id
 x3-20020a81b043000000b00333df912483mr12889408ywk.296.1661278011093; Tue, 23
 Aug 2022 11:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220823175108.18584-1-f_l_k@t-online.de>
In-Reply-To: <20220823175108.18584-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Aug 2022 11:06:24 -0700
Message-ID: 
 <CAMKF1srCBp7mWz7+b7AKUH-dZo1RjGdgNirykQ7NUkTWwcc9fQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iwd: update to v1.29
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 18:06:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98401

there is a patch already for this in master
https://git.openembedded.org/meta-openembedded/commit/?id=4fa7d9ee9ad54f1f22a3a92410bbc474f0de8a10

On Tue, Aug 23, 2022 at 10:51 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb => iwd_1.29.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb => iwd_1.29.bb} (94%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
> similarity index 94%
> rename from meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
> index 40f35b15a..eada93b65 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
> @@ -8,7 +8,7 @@ DEPENDS = "ell"
>  SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
>             file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
>             "
> -SRC_URI[sha256sum] = "ee538c720ad15335ece81a52a4b8a11820236df9ed9a5a72a2e64d74c652f0b0"
> +SRC_URI[sha256sum] = "71533fe3b8f6381f24832198ba11d00f04a361454770c173b3b66bc3cdf272bd"
>
>  inherit autotools manpages pkgconfig python3native systemd
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98400): https://lists.openembedded.org/g/openembedded-devel/message/98400
> Mute This Topic: https://lists.openembedded.org/mt/93210019/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

