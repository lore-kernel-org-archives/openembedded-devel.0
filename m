Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BE9ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:54:54 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.67807.1661756084889712913
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EU/acYfF;
 spf=pass (domain: gmail.com, ip: 209.85.128.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-33dce2d4bc8so172873027b3.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DCARQFYwOrUwiwwF5SgP/HX9a9dmnbwsZcFDq2t10+U=;
        b=EU/acYfF+BphrYNsM9q4NTwqUL2o7bbyL2aQ0ONTFrXS0QL4ukxVoUFX8uQIlishzb
         Z+D5sWo888x/UdpgclZH98xeAonknKj7teMEUj54IUzsYkUb5XIDS/zkWyDzeBsb0JTP
         43nLVd75U8SA8U0oej4XX/rdJJ9geGex3J325HdiNu/OmiLAVBwkzXZ45FYwFY8cHLfe
         Dud3jmoNTAYDPTbDiyLdbU/EEQs5AOQRy6fR/68W2GglXozCBlRRPPdlacHrcGtxq3FG
         kWJL2FV4w2Ms7+qoY8FlNfN+ahYFP5njg4ivjyxNaK78bwr1hEx5jWAb/iYrWfMKTtCx
         o50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DCARQFYwOrUwiwwF5SgP/HX9a9dmnbwsZcFDq2t10+U=;
        b=HyC6whdMUDZi/vJHsJryMi4pqGvsZBwngnTB8DA049lnt2/QJi6P2YM8TnyH1D/ntc
         aoeWOotcByHCZssITLYSE9aCUEmxS7Lg5SHeaGR0P5m1SykSZUda4EIrpd1neD8Xe/Tg
         jXuoMfn1zUeafKEQ77OyYLxmbGP5kOUF0CW2fMeTojKPwGQHtAH9E7Cn0CdL4iXWSiPE
         LDkl+4NPjNgfMmIy/0ZXkdj3OjXCHe8hMlNElsKiI2DQCjoe7pVPiW7grUWPPwX4XMOY
         BRuO9cnnJsERkK2QLUhPDPmpDT68dLfbR2rdlr1pameWT99j8Rb0Qow8l2YIszwd1wQg
         0PxA==
X-Gm-Message-State: ACgBeo06HAX4nE5CC0cvf9/WkCMf7aAu4awUHMaLhI0WiTnSL0w+31ba
	+qVcSMbjbtyO5P3Gu+bRkwORzw1kZmZ5YL3dCt8=
X-Google-Smtp-Source: 
 AA6agR6RmtjRTVCgWwLrc6RA1QHOsbVW5YdzB4T6eF0lKhg+Wb398hLYtitqnwskYfKPco9JO+6zPMxRERylZ3RwGXY=
X-Received: by 2002:a5b:98b:0:b0:695:8398:9f1e with SMTP id
 c11-20020a5b098b000000b0069583989f1emr7365864ybq.620.1661756082618; Sun, 28
 Aug 2022 23:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 Aug 2022 23:54:16 -0700
Message-ID: 
 <CAMKF1sokksupdh0vag6jP_CnnjzxUDwHuSLJxv45jV-bmCXpVA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.94 -> 0.1.96
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:54:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98511

On Sun, Aug 28, 2022 at 11:37 PM wangmy <wangmy@fujitsu.com> wrote:
>
> 0001-meson-Do-not-run-git-rev-parse-during-configure.patch
> removed since it's not available in 0.1.96
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-gimp/babl/{babl_0.1.94.bb => babl_0.1.96.bb}    | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-gnome/recipes-gimp/babl/{babl_0.1.94.bb => babl_0.1.96.bb} (76%)
>
> diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
> similarity index 76%
> rename from meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
> rename to meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
> index 7161356c11..85cc7793cc 100644
> --- a/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
> +++ b/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
> @@ -14,9 +14,7 @@ DEPENDS += "lcms"
>  CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
>  CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
>
> -SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz \
> -           file://0001-meson-Do-not-run-git-rev-parse-during-configure.patch \
> -           "

If we do not need this patch then please delete the patch file as well
and send v2

> -SRC_URI[sha256sum] = "b6a8b28f55e0c17f5031fb7959e72ffe0fbf8196d1968ad6efc98d1b492c3bbe"
> +SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
> +SRC_URI[sha256sum] = "33673fe459a983f411245a49f81fd7f1966af1ea8eca9b095a940c542b8545f6"
>
>  BBCLASSEXTEND = "native"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98505): https://lists.openembedded.org/g/openembedded-devel/message/98505
> Mute This Topic: https://lists.openembedded.org/mt/93321364/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

