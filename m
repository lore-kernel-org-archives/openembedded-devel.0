Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EEEC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 18:47:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.10962.1665773239953582822
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 11:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UqALTAj0;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id y1so5715729pfr.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH1R4pRBnyfL+HzC6+GnHLAxa3nAqBnNAZc33wtke4M=;
        b=UqALTAj0KQ9Hp+YwM3/BqeqZiWrp0GcgBlVWDDLYUx4gLYnMW0ZtzPgodt+EtVOHoM
         xrbfO2AQA/xUJyzEpFtdYDQfbZG7JrPWXL/n20N1+kZWg3YAAWZjZ9EwtbTBrqOAH/iQ
         5MKdCzzq7USVqgnAmQEmvhqVK22AE4te+QE+JVuoV11iga0OAGUjwPGwi4LDu6aTmzEU
         s837i4LLtT1/EtfnHQBtliD+yeXb/W22dVlEOP+EOenHh6Ucwvpl6w/dLmqy8mFXwO/S
         IWKgkPW6kxl+rIcD16Gqn6kU1Hr/HvV2H+jVOIsSO04qj5TFQnPSDzf78HZtQd8uzBUq
         9/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH1R4pRBnyfL+HzC6+GnHLAxa3nAqBnNAZc33wtke4M=;
        b=zZb3RT8Un8gHMN0c7TYxjXRkaqjqNrbAXizLQJnYBLY78jF2Rt5fOjDlpyg8ZOqB+x
         i5yOG0W+2B/G2vAIm2qV3PS+Jde8WK8C35IJEtTNlBw+gLjVoXCB0LAR0JW6L9ibsPI5
         fHf6gkdtze+geXrtgmXg/yr+rKuW0nOgMApluW2QAyNkn21PSaKERl4cN/XUdohjZ4Ju
         PO5sIWQroYXhOuGA8Pk7JUg7E0rH70vpwPM9/glExVaT7ArH1BJyKDh2tQc2IS7oLAYx
         cRlMA/Ix0+TCMx7/OYjExPrzsJW/hiVViv1/QleieH3iIApVLtGpzxLqBFBabVYm+S+2
         NICQ==
X-Gm-Message-State: ACrzQf2xYlQQE4Z6JiHqiBgtgM61zITtWhGhecAPqLRk0sHmz0vkYWrb
	6pfMFTotXm/6eEgtCmLeYoDJ94iRnvM0V8kn35dTRdFunxo=
X-Google-Smtp-Source: AMsMyM7dLZIbpUWLoe+V+E5VEmSI3NZX66VqSOq0xxcLjlv9Qgph69irySACKmoPS41OpSSwgfTvmDlgnsEwTjH74lw=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5733061pgi.192.1665773239257; Fri, 14
 Oct 2022 11:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221014183013.30601-1-schnitzeltony@gmail.com>
In-Reply-To: <20221014183013.30601-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 14 Oct 2022 20:47:06 +0200
Message-ID: <CALbNGRR35ujDbsCSPUgYKMjPYhf5PqaXnEdgf+ARhTo4VOZMBg@mail.gmail.com>
Subject: Re: [PATCH] Revert "onboard: Inherit setuptools3-base instead of setuptools3"
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 18:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99171

Looked into that more: onboard has not seen notable activity since 5
years so it should better go.

Any compaints?

P.S
Think it was me who introduced it here and never thought it is that
useful - so complaints from my side :)

Andreas

On Fri, Oct 14, 2022 at 8:30 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Nothing is build/installed
>
> This reverts commit 9c0cbd1d8f2f4d7370dfd2be747efd5014f539fa.
> ---
>  meta-gnome/recipes-support/onboard/onboard_1.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-g=
nome/recipes-support/onboard/onboard_1.4.1.bb
> index 9325ef9c2..0388fc69b 100644
> --- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> +++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "https://launchpad.net/onboard/1.4/${PV}/+d=
ownload/${BPN}-${PV}.tar.gz
>  SRC_URI[md5sum] =3D "1a2fbe82e934f5b37841d17ff51e80e8"
>  SRC_URI[sha256sum] =3D "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1b=
b191e43a231a3865"
>
> -inherit features_check setuptools3-base pkgconfig gtk-icon-cache gsettin=
gs mime-xdg
> +inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mi=
me-xdg
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> --
> 2.35.3
>

