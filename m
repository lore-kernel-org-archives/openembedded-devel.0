Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB2BC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:40:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.22340.1670434804107710066
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 09:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hyGA7jv4;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id a9so17687190pld.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oClQI3MCszKH685uF/LWxsrmQmib624BNyRh9vx6p64=;
        b=hyGA7jv4E4mrl6WeuEtxIlUC1WZDqseUixji2hIkJWoqD0gspxkz7FHYdEcr8I4PkU
         VcIQ+gXykhsQFWvqwzv+ouAwR2rUrTV65iNZCct2qCbmuOWE1+dfgoksradmOB9+f2TZ
         O0cbBqaOfAVlU6RqXgAm27RAR0//FDsGQ75/7HDgNpGCH8nBcttB+1/CMrvsNuGVMLuk
         RSx+DsxAjYT2e+iY3xvn2Amb1RXePyHcQMuZBQrfoFU4DWtF3ZdUHW+vkR7Etp211xMO
         R2RPGryxbUQKNtfOzOCFD81RsdK0T4+1+uNjVpXxvWJOVGSDmEllI4OGcajufsz17/m7
         7AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oClQI3MCszKH685uF/LWxsrmQmib624BNyRh9vx6p64=;
        b=5EgN3JWnAuEfno8j4/mBSqGv8igraYqmjaldQ0cNuAqs7MRJ49YPJZeTfq1A/cVcL3
         ychXT7VEeTv0gDv0SkfXA6txua2dzsY0S9vl2zfwG3j0ukrfXcq21KE1Kgl9K5B6nZ6b
         OgeksS9gMsDJU0JchV0bc/ipKCcpnuK1Dilq6cbBcEG7I77snIIcHVSo6XkC3fU243d3
         pdOFX4KwL1A7zlrlNwkjfyKlz5zfzFiJeQreiu9YoO9DvNQ6o5XrEJGu1EYozTrbajzj
         6e2enr4r1oo1YwRgLT+xPjgvHmYIV5z0dMhbl4iocQYL/gZEtkwvxW9mMuMYMWvIZL+g
         XJDA==
X-Gm-Message-State: ANoB5pkON5E+/+tpHbSr8nZuApSzyWj6wDXISEcbTPvXowXRb6EsPXIf
	0r0abQ3Ij5bMsw2+elRbPN6NkG7YcWVxDsKcG10=
X-Google-Smtp-Source: AA0mqf4kYDedf9wU+3KYPlw/hbYa1TFJrSoJvaqotceNVquREqYALi6v1/mIRYMj+RGL0+1UQ5SOk4aKbo9EScBm6bI=
X-Received: by 2002:a17:90b:60a:b0:219:c691:9933 with SMTP id
 gb10-20020a17090b060a00b00219c6919933mr18197307pjb.195.1670434803325; Wed, 07
 Dec 2022 09:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20221031065035.2308617-1-f_l_k@t-online.de>
In-Reply-To: <20221031065035.2308617-1-f_l_k@t-online.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 Dec 2022 14:39:47 -0300
Message-ID: <CAOMZO5ARR3N=H=q-fZSLgQXGhcqOJDQU_UczqCdBPWhC5cfGTA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCHv2] spice-gtk: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 17:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99977

Hi Markus,

On Mon, Oct 31, 2022 at 3:50 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-support/spice/spice-gtk_0.4.1.bb  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
>
> diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb b/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
> new file mode 100644
> index 000000000..58089c0a2
> --- /dev/null
> +++ b/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "A Gtk client and libraries for SPICE remote desktop servers."
> +HOMEPAGE = "https://spice-space.org"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"

spice-gtk uses two subprojects: keycodemapdb and spice-common.

keycodemapdb has the following licenses:

 - GNU General Public License (version 2 or later)
- 3-clause BSD License

Shouldn't this be reflected in the LICENSE line?

