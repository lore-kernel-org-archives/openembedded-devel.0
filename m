Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.26586.1599946927319540024
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 14:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tnstb+aL;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id d16so2602499pll.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 14:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b4C8vorwKpAIbS6WRL3zAobwZqqreQkGKaDuG5DIiV4=;
        b=tnstb+aLzGHo+dK5V3/Fe7B7UiTlsCFcZqlS6Edm5EsMLbeF6EVLKdJMBQSzDOXAXJ
         mskWuI8z5RQxXY2E0RcShGI/ItyQWW8DXbZscmr75vANeVYhs8dP9yIECyU755KF48Sa
         CUso6bLNVzWmcTclEnxk2P9HOq+J+D0bkCBHNChIGxShAztzrb4Hni7GW4QZoYjrIdgu
         VOjzA+4cCM/0ucuNfjopzHPJTamvaFS3j3jdWV6c6s17EBcfMWvuAYWgC9d0RDLHorGH
         Ml+S+wC75i0kCJyCQQLhpKM7uraR4bZR/Xz4BZkdh5PuJUbdNzFwerVl8vq6gP+RP3Yy
         1ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b4C8vorwKpAIbS6WRL3zAobwZqqreQkGKaDuG5DIiV4=;
        b=W/dW+ggtPfgt2owuT9NWo/T3v7Q2gB5m7wdnAD0/VLUl472Kja8mIgX8Ry8G6oIgMV
         0oK8GwXMLXPZFNZKivuOCymQsEN+xozvtEgx1tCXhRF03jP7IaYae8AIeceTVFMnYDjM
         N2iEGeYLD5f2Ajld+3q6MFwqp5oysBwBdNwRQnPV/Akm/WUmCysXc5AfYNPfRjcO2SZs
         0Q12MmTqAZL2paEoqXI/YrpcCNA/eJX8R+p8RL+3uiJB35X+eaTJ5/GDnU1Mwe2PbsVH
         mXXzUenpF2b1Yu2PV6EqNaYAXmH557uBoBuL6DeMHKCG9W3H07/y3gr1BPQZG1yS79sL
         +7uQ==
X-Gm-Message-State: AOAM533uyteh+RBDElOjDlwPkym+ESKCU2EmAnxChZ8X0Y3LgTnnmnFf
	+IcTN6OcafrIYBrHVFe+umflRAQpgvnKeqFbG7Q=
X-Google-Smtp-Source: ABdhPJxbeMLjAoBsFwnXlnoWgt3mU72UOUhhrdIJu8G/4uGK7WuFp2tNLuzgyw9/oxXP7dJa7Fp9UeYV6qsPUWrlyGA=
X-Received: by 2002:a17:902:8209:: with SMTP id x9mr8144171pln.55.1599946926772;
 Sat, 12 Sep 2020 14:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200912204002.3316979-1-raj.khem@gmail.com>
In-Reply-To: <20200912204002.3316979-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 12 Sep 2020 23:41:55 +0200
Message-ID: <CALbNGRRMqMDCxWGsm0fqCxR7fwsYybJc_zp6nxPvvkYw+KW-MQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] packagegroup-meta-oe: Add source-code-pro-fonts
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2020 at 10:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Make st conditional on x11
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 2e84576ca9..53532772a1 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -454,7 +454,7 @@ RDEPENDS_packagegroup-meta-oe-graphics =3D"\
>      openbox \
>      packagegroup-fonts-truetype \
>      qrencode \
> -    st \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
>      takao-fonts \
>      leptonica \
>      libvncserver \
> @@ -476,6 +476,7 @@ RDEPENDS_packagegroup-meta-oe-graphics =3D"\
>      source-han-sans-jp-fonts \
>      source-han-sans-kr-fonts \
>      source-han-sans-tw-fonts \
> +    source-code-pro-fonts \
>      ttf-dejavu-sans \
>      ttf-dejavu-sans-condensed \
>      ttf-dejavu-sans-mono \
> --
> 2.28.0
>
Ehm - I don't use packagegroup-meta-oe - but looks good (both
source-code-pro-fonts / conditional st)

Off-topic: Gathered more experience with source-code-pro-fonts: It
makes so many applications look as they should:
Text-editors/Terminals/Projects I am working on...

Have a nice weekend

Andreas
