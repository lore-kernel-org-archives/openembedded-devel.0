Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640B3C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 15:13:35 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.28873.1653318810760809607
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 08:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dcd3wj03;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id ej7so12279030qvb.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IiYm8Z6pszLRfg/mddCk+doFhtd+sF4xDVikQxsQbRc=;
        b=dcd3wj03JywcfoVY5AjNPT3fHo2CjJaaoLQiZ6EWQmpEDn8PBtWsRMkZ1+oJISdr1M
         o4MzlfQu1VxS8KEOP6G3nWMXhlF8Lf6Q13Q74nYyyq0F2/aJpyFompJ3mwMdmB7m4Y0G
         BDuekZfGPb1cL96/o7wbIfASwocGX+FNtfPgSqHneQRVfED4kfqIN+TiZtx9xbtOo1Yj
         +omhQuiQ4OD+R7ngy+bxSKOj2cETtWmnld/Cjd1T+BplwlJrniFs2QZ9gxvnCYlwmBV1
         nmSyOA2y030Xzlp1H0ob4GQxFfHZin6shla1Yb+yWqemjs4nZ4btuxSZFbv2SvOY2/3o
         Hu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IiYm8Z6pszLRfg/mddCk+doFhtd+sF4xDVikQxsQbRc=;
        b=JtGZJa6gTACZI/qlRI8s+UX2PzbBWh5U3HOOdM8YzPgBRVlb6noZE5O7o3eKQs4zxn
         C5McaWxA4s55mjUX/EbFIHx67z2afB4TZe6R5DKgbOLZSm8otjQy0y5bN7fztHbD9EdK
         yapKJXanz7mODgUFwK0N+DYXr0V7NaugsWXUBOauKYIhXmF1bJ/TuHpcMxh8R+F/attO
         iIbe67seRHaVEyPijSQ70uFW5PaJINhcMLHWVdm7N1tHG9Pk16W8jbdl1/r62jDZielD
         yqOGsdLSMDS92vILR/t1/hmdFXJdhD5xoAbiAf5gyayTeX4WXQ7hgWQhjwq9T/9RdV9R
         AckQ==
X-Gm-Message-State: AOAM532suTQQXC6C3g1fAt0f5Q1UsSfgYvWqWN9Y8Hr+GJFBsq4GFDP3
	GI/mbiZUXJyocbaNXys+mYVhhxlIlZ52t61tVFA=
X-Google-Smtp-Source: 
 ABdhPJwXHbzrj1szduyPEzW9SDtevtbnd/J6csxafeepfugqzbKd76msNEpH96sN3Bcc/5hb9Y0ZuD0U9axQxL8oliE=
X-Received: by 2002:a05:6214:500b:b0:461:e282:181 with SMTP id
 jo11-20020a056214500b00b00461e2820181mr17547409qvb.24.1653318809722; Mon, 23
 May 2022 08:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220522204440.2323651-1-uvv.mail@gmail.com>
In-Reply-To: <20220522204440.2323651-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2022 08:13:03 -0700
Message-ID: 
 <CAMKF1spzX4n4RoSYVgw78d52v+xkn4kvDYXtUqgDgKCYBoNPqw@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] overlayfs-progs: add new recipe
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 15:13:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97233

Fails to build on musl

https://errors.yoctoproject.org/Errors/Details/657139/

On Sun, May 22, 2022 at 1:45 PM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> overlayfs-progs contains fsck.overlay, which is used to check and optionally
> repair underlying directories of overlay-filesystem.
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  .../overlayfs/overlayfs-progs_git.bb          | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
>
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
> new file mode 100644
> index 000000000..2f173b259
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "File system check utility for OverlayFS"
> +HOMEPAGE = "https://github.com/hisilicon/overlayfs-progs"
> +LICENSE = "PD"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +
> +SRC_URI = "git://github.com/hisilicon/overlayfs-progs.git;protocol=https;branch=master"
> +
> +PV = "1.0+git${SRCPV}"
> +SRCREV = "e10ef686570d9c7eff42f52461593a5c15da56bd"
> +
> +S = "${WORKDIR}/git"
> +B = "${S}"
> +
> +EXTRA_OEMAKE += "'CC=${CC} -O2'"
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97221): https://lists.openembedded.org/g/openembedded-devel/message/97221
> Mute This Topic: https://lists.openembedded.org/mt/91275909/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

