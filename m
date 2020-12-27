Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.29677.1609049504317914220
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Dec 2020 22:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dWOdjCgw;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id z20so5136648qtq.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Dec 2020 22:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIm26ehD9MpQsSCQC5bjiPJnibUl83LvDjOx37KvW6Y=;
        b=dWOdjCgwPBQJ7JCZcdaFPe130k9plsK9hItJYok48pEWI+jANwJ+tBBkzn+MWuvSvr
         1w4VOqYV02MmkPhGR5x+5m9fou6u7N3ZGzX61cdmZL3gO3qcQLwoDOhFLt16UbGSGE70
         yukvbyiWgYPbihxx7JgMDrKSl8APqsfM0HWTl+MjU6HNvd0ySgZZqeB4elVIYIOGyiu/
         pwUjy0em/rZJVv2ugfcjtluXhe+SSHP00n91RXhYqyMcNvi3puVbmwQB/eEGALcS9kdt
         9funZfOkVi0qw88mjukgWgtNdDR6FJdWet2QlK7CBmBrHU7UuXqIUb2Z+MwU0StPcAHZ
         1jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIm26ehD9MpQsSCQC5bjiPJnibUl83LvDjOx37KvW6Y=;
        b=VbUJ+tGIRAN8P5pEBKxPyqN9P3Lkrlwo1Rt0k7IYGckrkGl0tMKv3Z41LTidbJ36tk
         zqs2gpZp28Jx8gklKxTePNXjuBSCddSIOYDy/3pJnkfBhKDjs//KWGh7oU0WqjqQceyi
         DKb8cUfDUYB+NyS58pnzTkhi3vcem7yku+0ieRg8kC/Lv34vOzwGdS+TSctyrSfV1hkm
         Y2nnn9cirJgDx6obolNyAA7SIuYOs+sCq5jWoFx5lRPyx9En5qcosGP1VgkhzPrWo1S/
         sQLEkUHjggZyfm5zNsxGmvHSMwVohDeTEiRx8RPO7p0+KnjVOYb3FsaDxijLJtxasYyU
         ZShQ==
X-Gm-Message-State: AOAM532Jw4TpQoeayUT4c0A28q462uvQPbr31OMvJaWYLAOXUiTALQ/s
	X/XCAtGbMQjObE3xRYZM8ePWp4JWlnxJgp4gYtE=
X-Google-Smtp-Source: ABdhPJwkxHI8bItmteTLZ18X16gzLW38oCB9JYy23vlpfHWUyhyvFCuewJkTbWu5me2qgF2gwxnJb+28uFPenIGjozk=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr39083202qtb.80.1609049503388;
 Sat, 26 Dec 2020 22:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20201226015013.3809622-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201226015013.3809622-1-dmitry.baryshkov@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 26 Dec 2020 22:11:17 -0800
Message-ID: <CAMKF1sr-15KBSqgEFk90V+oTM5sbY2Yzu8NeJXLhK0mex9Kygw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] packagegroup-meta-oe: add new packages
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

see some rdep errors

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/831/steps/12/logs/errors

On Fri, Dec 25, 2020 at 5:50 PM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> Add several new packages to packagegroup-meta-oe:
>  - feh
>  - imlib2
>  - obconf
>  - openbox-xdgmenu
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 5023e495102d..88669625d9a7 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -448,11 +448,13 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
>      ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnfdragora", "", d)} \
>      fontforge \
>      fbida \
> +    feh \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut", "", d)} \
>      ftgl \
>      fvwm \
>      gtkperf \
>      gphoto2 \
> +    imlib2 \
>      libgphoto2 \
>      graphviz \
>      gtkwave \
> @@ -460,7 +462,9 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
>      libforms \
>      lxdm \
>      numlockx \
> +    obconf \
>      openbox \
> +    openbox-xdgmenu \
>      packagegroup-fonts-truetype \
>      qrencode \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
> --
> 2.29.2
>
>
> 
>
