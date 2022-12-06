Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5AFC4708C
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 02:02:48 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.36491.1670292161155581191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Dec 2022 18:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UXXvMYm8;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso1967238ooi.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 18:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jjDbdZxSVGXWU5p5P0BGxuCmC0fLlS4lU07NmqpE0gA=;
        b=UXXvMYm8xsSJAEsJY7woP+gHZg7ONZ6xDjpazgqCZwiQeGPcgv5UOhy8VPhpnm6TWp
         7orqBLdr4L71gl3wGlHaLR49ld8OqBQH5Y3Lvzsg7B5vfVEwc9qkxgfdYVfF6jLmXzaB
         uZfE4U78+UdAr7/Y/QB5Bjx0+xVgJfnrm8UCijznzFOY30cgsgEkdikHFpjl7vA4crLc
         CgMag2Ut4vombxSXJTZKfD59Ur58KKcMbYN85AdGZCFJ5sn+SBf90WLCN4tJ5mpPEme9
         8YnFPwoN8VK6Nd49tj+4Om+9biJ/Z/DUW2H7YISAG/AlKgFfMzurRahXAlzDbOXhyzUf
         Gc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjDbdZxSVGXWU5p5P0BGxuCmC0fLlS4lU07NmqpE0gA=;
        b=HyaxP2uj7Th93x4yILndR9eSYE18OApdDtIxdtAIcJBCDvgwJnSoTdzJ5m6LJYzzme
         HKf5qG2xlXp14N/N435lroJMdFHhJpHQJDJoBV6XpSx/HfhlC68yFddeb66LmiJB50QX
         dRycLeOs64s+OWVEF/ReW/ju00Ir9JHEriEA9lNTl3VVzxJvXFBwDVJMBKI6fpApa8dM
         WXdhnj2m6ioGUOYPqggKZ638Dn9ECwmfl0hanKqbYq7kV4IdRVeugIK2UMYOs3ep/6V8
         MFUuOhVLqG9gib6AhMgsNIWM2gyKqlA/umGzuclxDd6QUMrkDkoSlfTqKQLAbQiQvw5g
         Cnjg==
X-Gm-Message-State: ANoB5pkwX9kfL2M++TVt2tTA2ccAKOHldSuhz7wS7GctZggviE4cZpam
	mKw3aF71DjNDUM7nEg9RR+YSnCBQtxq2q14UqSU=
X-Google-Smtp-Source: AA0mqf4rNWun6jYet1B+8x00oKQMEhQUqKLdt26kjJ2d6Itnsa3P3dZZwaUK1YqV6Kbm0AEKDy8VlcPyl2vZYYJi4RU=
X-Received: by 2002:a4a:97a9:0:b0:4a0:9169:d7c1 with SMTP id
 w38-20020a4a97a9000000b004a09169d7c1mr7030413ooi.73.1670292160210; Mon, 05
 Dec 2022 18:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20221204073426.53036-1-f_l_k@t-online.de>
In-Reply-To: <20221204073426.53036-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2022 18:02:14 -0800
Message-ID: <CAMKF1sru_cq_imRLX4s9xnLL0Aw84tZf7jmHe_XemONF7pQQdw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: update -> 27.1 -> 28.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 02:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99953

still fails
arm
https://errors.yoctoproject.org/Errors/Details/682104/
x86
https://errors.yoctoproject.org/Errors/Details/682060/

On Sat, Dec 3, 2022 at 11:34 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../files/0001-meson-add-pc-file-for-lib_perfetto.patch       | 2 +-
>  meta-oe/recipes-devtools/perfetto/perfetto.bb                 | 2 ++
>  meta-oe/recipes-devtools/perfetto/perfetto.inc                | 4 ++--
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
> index 70de44173..d6092afeb 100644
> --- a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
> +++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
> @@ -17,7 +17,7 @@ index 06015141c..752b4d928 100644
>       ['c','cpp'],
>  -    default_options: ['c_std=c99', 'cpp_std=c++11']
>  +    default_options: ['c_std=c99', 'cpp_std=c++11'],
> -+    version: '27.1'
> ++    version: '28.0'
>   )
>
>  +soversion = meson.project_version()
> diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
> index 86ab18cac..3b29bc389 100644
> --- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
> +++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
> @@ -54,6 +54,8 @@ do_configure () {
>      STRIP_BIN=`echo $STRIP | awk '{print $1}'`
>
>      ARGS="is_debug=false "  # Tell gn to use release mode
> +    ARGS=$ARGS" enable_perfetto_heapprofd=false"
> +    ARGS=$ARGS" enable_perfetto_traced_perf=false"
>
>      if [ -z `echo ${TOOLCHAIN} | grep clang` ]; then
>          ARGS=$ARGS" is_clang=false"
> diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
> index 5cb6f8bb3..a8e72af1a 100644
> --- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
> +++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/perfetto"
>
>  SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"
>
> -SRCREV_perfetto = "1c52b5e132312aeb007ed180d4ba1d8d66227923"
> -PV = "27.1"
> +SRCREV_perfetto = "99ead408d98eaa25b7819c7e059734bea42fa148"
> +PV = "28.0"
>
>  S = "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99944): https://lists.openembedded.org/g/openembedded-devel/message/99944
> Mute This Topic: https://lists.openembedded.org/mt/95442831/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

