Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E8FC4708E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:27:42 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.80076.1669998454301126404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k77RkqNg;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id r11so106411oie.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 08:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qGvDXiSWsXXz3QxfxWxNZ25I3CnnRjrw5Nlv3guaNsQ=;
        b=k77RkqNgfrjy8/TIgUY/vBkBtE4T+o+DDPZz1s1YzN8dvIK7PZIq3jEnqkJDZqykQX
         T23bgmTSiUMqmNeQwv6gaN2UHjejbXlaHIWcZyKgtMGqQ5TgJ6SlkgBgbYDIjrKdQSiF
         yZlZq3SkGqUB5ujS499Bw+yGDhtdsALfi0Ymv7GhXfDDWr2tYldGEupQtWMZENdojd+9
         zde8m+5hkqdE8vowsHU5IoiLSuyd5knXtVAqggFDo6S2lU1nVLCHXcc8RrjzIG8Bc4ed
         rn2U0H7680UPsnwsI6PFf0Rmbi7oUVLhkZQmx53S405eU7A0CW+sjLfXFe/Hm5TaaDQt
         hNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGvDXiSWsXXz3QxfxWxNZ25I3CnnRjrw5Nlv3guaNsQ=;
        b=ZBScBt/8YD0mb1cMDCIVeLTY11zG9XzVK6C22ULaj/V5Iko0i2hfcVZ14uec6eRL2B
         GUCGJZk9FIzJVe2gN1tVCuYTaSTlYY+xktXjdNnqxqnGLPoAJSSB3daFzmRDBn6IVH9X
         061I1yfkRY/7Ap0Z9caTYIlsZVoNKnlqHqwa8t0QyWIhNA94nV6BG2TXf3TGJys2X9mw
         jAbK8a4WKdAevGsyrV2jOHO0U5A1YjvMZObWbblJXeO1iktRpVql3AxJuBo4Py9LWmHt
         FAz4LbdcTQI6qMX321/lJnrPzfAlrOYp0+FCTN6WNTVouvVPLHfCpIRTVajDi57SkC3y
         gfVg==
X-Gm-Message-State: ANoB5pnHGTwBTTG+8N83RLMvyRLZQ3EIL3x8e6Iwx05fI9DI3ULBATp1
	VAvMeYlZy8JEF6jCFyJoO7Maivvz3BvPeEhOq6A=
X-Google-Smtp-Source: AA0mqf45sFJptfclv4YvhuAXm5wy9dZZo4Y9kmz1FVoKlFBASnMcoI1QuVuJmWZzbsisOKrEZ2hx1crZDpxdlujHb7Q=
X-Received: by 2002:a54:4491:0:b0:359:d852:616d with SMTP id
 v17-20020a544491000000b00359d852616dmr25747873oiv.55.1669998453490; Fri, 02
 Dec 2022 08:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20221201174129.1218999-1-f_l_k@t-online.de>
In-Reply-To: <20221201174129.1218999-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Dec 2022 08:27:07 -0800
Message-ID: <CAMKF1sqosArSoCM6uxVaPo3+mUz19jPux5r_AxDsr9mj8n=yfw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] perfetto: update 27.1 -> 28.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99915

Hi Markus

Seeing build errors
https://errors.yoctoproject.org/Errors/Details/681762/
https://errors.yoctoproject.org/Errors/Details/681809/

On Thu, Dec 1, 2022 at 9:41 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../files/0001-meson-add-pc-file-for-lib_perfetto.patch       | 2 +-
>  meta-oe/recipes-devtools/perfetto/perfetto.inc                | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
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
> View/Reply Online (#99895): https://lists.openembedded.org/g/openembedded-devel/message/99895
> Mute This Topic: https://lists.openembedded.org/mt/95388111/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

