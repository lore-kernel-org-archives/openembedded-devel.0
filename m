Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A28E6F080
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:24:14 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.1277.1730485453848050117
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 11:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=blBqlkla;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5ebbfcab9f4so1193951eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 11:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730485453; x=1731090253; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6X1gCMjbHdFsCiWP/iLzFh14+1AGRyT2O5sssFORyI=;
        b=blBqlkla6OG/gqNMEP3v3+JpQxvBpzXkOxP9PIek97cnsPrZwERq4YXtp80tV0mTk2
         5qpE/R4pMk8FP6XyxNOTReCG3y4wDedymBMpLXY9IC9QLCOj83WSwRa8itG3sQXHfyA6
         TQ4k0YQ754V/IQqVCIhFq0QQRZWrL/giOSp3lz1MivnA9KzxoAAvlzsjn/MzZ3tmvBd9
         0E+dvUwHa4jRYysG6C2Vzds9/ozKZic+28QsCYsm1cmHdZiTW7hmcHuUI6Jhz9JLthz4
         8SaZz5nLN/v5yHSXPX2U8mcqwuvOZCYmfvkgI2eNP0oTrMbErCBuu73hfYzw/j2HiRMZ
         oNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730485453; x=1731090253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6X1gCMjbHdFsCiWP/iLzFh14+1AGRyT2O5sssFORyI=;
        b=wD78ngsuQ6dn0374zGfc3ppLt2kJyNf13FpfAZkQ8uhP3UQsUYNBEPy+Cde30mw3k+
         7JjMxVMUHNgLBLHO/hUQmaHzVuPiLdrsSTSnFUO+aWDAp9bemwxRvl7pnnO+/mDw+lNl
         CYexicK5COUZK+WmMczp4Wksq/6jM0MADby3YRNfMB3WRZTSymI4Cj6FQbwS+HfD9lI6
         X9pw9QdpnvhhTmMafWUoNWxNdsUWKMTKPSg+v3vF4yFfFQ2mKATvRHgHbfc4EO5+8hJ6
         vE2EvZK/agZV7Zr5dMYwAIUh1UqSS3VvQbPzIJbpTxjeASr66bQQVlyeLguKPPTMybH5
         gFRw==
X-Gm-Message-State: AOJu0Ywn5EVCA1s8hMp7ZXCCPjnbvbJMOEg4myMIF3fruik1BtTbTxWU
	YdoEFCTYEONlu6c8XP+KAGRNBI+tySMENFpVdvAKdINFLn6uCiYV3Xl4jv1EGObz//saHPQ/DAu
	zx0/xtKosXD1MaUrjMBkCnij58DQ=
X-Google-Smtp-Source: AGHT+IEis4X6CUIYrR18FN3V+sFgWCB9CJtM4V/KkzAUn6XkoQx7Y1jL/Z+VMrxhDEYYqAwp/qNsY5VEHIHvoqhf+Kc=
X-Received: by 2002:a05:6820:617:b0:5e7:cb2e:e01c with SMTP id
 006d021491bc7-5ec6db74a13mr4637052eaf.7.1730485453109; Fri, 01 Nov 2024
 11:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241101180709.395252-1-erick.shepherd@ni.com>
In-Reply-To: <20241101180709.395252-1-erick.shepherd@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2024 11:23:46 -0700
Message-ID: <CAMKF1spYHAwbJV7vGSp+ERYU7Jkpx6yCqJg+Y6ZYrK3aJpgeOA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ttf-pt-sans_1.1: Install fonts after target boots
To: erick.shepherd@ni.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 18:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113389

On Fri, Nov 1, 2024 at 11:07=E2=80=AFAM Erick Shepherd via
lists.openembedded.org <erick.shepherd=3Dni.com@lists.openembedded.org>
wrote:
>
> Access to the font cache on the target is required to
> get rid of the "configuration required on target" font
> warnings that appear during rootfs builds.
>

That would make it behave differently on read-only rootfs, best would
be to see if it
can be run offline somehow

> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
> ---
>  meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> index fce76418f..5789f90c7 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> @@ -27,7 +27,7 @@ do_install () {
>
>  FILES:${PN} +=3D "${datadir}"
>
> -pkg_postinst:${PN} () {
> +pkg_postinst_ontarget:${PN} () {
>      set -x
>      for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
>          mkfontdir $fontdir
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113387): https://lists.openembedded.org/g/openembedde=
d-devel/message/113387
> Mute This Topic: https://lists.openembedded.org/mt/109339423/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

