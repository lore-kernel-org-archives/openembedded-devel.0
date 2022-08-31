Return-Path: <jandryuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F7FECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 13:31:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.25585.1661952687630027944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 06:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rk//8HNS;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jandryuk@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id cu2so28463942ejb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=d/cO5Pk5tDJ4fQif4TuqX2844Ol8EVy+w43kvOlLMB0=;
        b=Rk//8HNSWAo9rztlidsR/YL6BeSK3C5NZy8GLaTyyb1a30Pt0vim9BvEBlmE+iVGJt
         6cr6eb81fLeZTfA7P1j7LRP9lo6i+aXKhp0rCo9zkH77WVSCiB1G+h9ylbpkXnLez85l
         rOGNAeT06TUv14NoeMGRQ0eWDloWH0mjFQxwQ9kyqSZWfe7W71ZwT/I0Jb72APR3EoAB
         pQytHNhUtJQSWilmEs5y4PgHmYNG3XeqTVc6HZ0Ot8xTTO4SpuIdUGlnFeZvQjBCZLdW
         BKPW09HyxIE+1e8MqVObMcdXEiel1WoT6IZ/b/Jnx3zU+Wc486o8adfZNC4l/jCtuNOO
         XC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=d/cO5Pk5tDJ4fQif4TuqX2844Ol8EVy+w43kvOlLMB0=;
        b=UtCpClIpmTG8VoD4xZOEmqp2C0I6BHq3UYMKFgboiki1dKMLEU/dM14MZQv2qW0+aI
         1OvJ2TyQBR3Mk2jgqf4UfzYmb1M37SrEg68eYvrDTroAJIDWz5KZ8+TkuABITtAVn9D5
         m0Fn/Hp9+8RgaJJq3VOEdyMWHZ0sRKrmQOcJFPWAReyZBTnkTk41VB1SQWyt1vMDphul
         Uwm7pZeu2jTSBip1AOjcplGgubHX3yd0SFHZUU2Lbgez0bvuOUT3ZTE3mcjBbZ+YgI0W
         +Bgq1ascc0xfrJzUMu4TzMSfzcA1YAD/Z1KzvXq+C8z6lPTH0rJze5ZzpFXjmY4E1dbj
         ACyg==
X-Gm-Message-State: ACgBeo3MX7KId5mdypWid/Ha7NkkfGzd3yojonoqI5vHglcpooU7Ic87
	+yKQwMqyXfE0G+oGXMLP0vGU7A/WLJcBiOYalOC5EJY1
X-Google-Smtp-Source: 
 AA6agR5zNq0dWNplXuw70Dpi/XvOtWS0aiQVCxEglsct/s0z+7c14kmCt22jrFPm5hCzKGMshmaHbi0l158Mp6uDZIQ=
X-Received: by 2002:a17:906:3c4a:b0:741:6b91:867e with SMTP id
 i10-20020a1709063c4a00b007416b91867emr12027158ejg.297.1661952685611; Wed, 31
 Aug 2022 06:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220819140057.12010-1-jandryuk@gmail.com>
In-Reply-To: <20220819140057.12010-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 31 Aug 2022 09:31:14 -0400
Message-ID: 
 <CAKf6xptpZGoKTfoEtLPnwGjgL0G5jea6J-_jK+2ANo7-pYPt8Q@mail.gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH] cryptsetup: upgrade 2.3.2 -> 2.3.7
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>, Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 13:31:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98577

Hi,

Is the patch acceptable for dunfell, or is a change needed?

Thanks,
Jason


On Fri, Aug 19, 2022 at 10:02 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> From: Yi Zhao <yi.zhao@windriver.com>
>
> Stable security bug-fix release that fixes CVE-2021-4122.
>
> ReleaseNotes:
> https://kernel.org/pub/linux/utils/cryptsetup/v2.3/v2.3.7-ReleaseNotes
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> (cherry picked from commit 5dca16b451abf80b1bfacfc533daf447ff4dad7c)
> This is just the rename and SRC_URI hash updates made to apply
> to dunfell.
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  .../cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.7.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.7.bb} (96%)
>
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
> similarity index 96%
> rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
> rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
> index 3c1c8b0be..d303f27eb 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
> @@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
>  "
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
> -SRC_URI[md5sum] = "6e4ffb6d35a73f7539a5d0c1354654cd"
> -SRC_URI[sha256sum] = "a89e13dff0798fd0280e801d5f0cc8cfdb2aa5b1929bec1b7322e13d3eca95fb"
> +SRC_URI[md5sum] = "9c5952cebb836ee783b0b76c5380a964"
> +SRC_URI[sha256sum] = "61835132a5986217af17b8943013aa3fe6d47bdc1a07386343526765e2ce27a9"
>
>  inherit autotools gettext pkgconfig
>
> --
> 2.20.1
>

