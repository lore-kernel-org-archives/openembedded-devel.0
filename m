Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F176AC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 10:53:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.9716.1639392825580861562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 02:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=AljkNUKY;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso10670959wmh.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 02:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzn4wt55q0C471I5Ctk839ZYjTfyFRGY4XjBRRpqUvo=;
        b=AljkNUKY+d+bu0frfmTP8K73Pem9YrhxNu1ChrspWOB9IJYQB6tGvejxlRzkRfMSHU
         AfGI5Tl3n3wMvwGTtyPoWjV9yjdDGCkFCtj/bz09mcWKNUcbmp0KOAkzgkfS0BqfKxhZ
         08f64G5pnt8dVUrQmhppqSCIZp1gvtsnU3Dljad0mP26bGeJrkkSJU4sdAoSfgC2JpMs
         KAYs1jfI3Kpi5WTd9IYKDylGKOHS9ljF/uImDoqfcgKhsw0/Pi5uVOoZ7uy7YuoJySps
         +koj0PoZe/h8P9irdCNq89d3KXh8DXsSzwFUknWQ66oIfPORL6lUt9NQlFw5rUB45yj9
         fbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzn4wt55q0C471I5Ctk839ZYjTfyFRGY4XjBRRpqUvo=;
        b=Eh0gw4BkmX9+ObdU4XGl8D4RXdrdENWxL/UnuMSSHCGSu93z7XX0QcFwY2jts+Gk3f
         UFCuTFzXdmSVK5tCqM7PrVSQHm/T1LFwIpiLhHNo6hcJhvB5sp+x0OBKjOdAkQEIuhgM
         2YWeB8rq3x2UUYzmBGCRx8584Rz5kc5+HgQlIV+U0ELRlm9+qa2Z31ga+PIK8BnZ1dVO
         mICZ1auCa+/q4uoMjKJzmYqTSlPs4Ri2EgdVZGmKixkm5/Vw0qZw5i5k6vYbXTEshAdQ
         Jh2x+Fc8JviUmWPQPl/iCsLY+DeTc0nBj5GDsK+NrXld+J2HPcWePSqM9Qg6jg4vax7Y
         dEvg==
X-Gm-Message-State: AOAM533xBKNP4/38K/H/WJFsAWrV5entL+Rk+jp0Fkbz9HFVp9oiepyV
	rFWdRUB0eV2T045Is3J+uXT1ia+mOZk63Anq9LxQoA==
X-Google-Smtp-Source: 
 ABdhPJxATRLTzBPPZ1CzfHzLwa4PLVXIyTUIYijtlx+2lTUtK6d4uRBSB/mwwJmiXR2bWqEu3HYyN8u183YAbdC03vo=
X-Received: by 2002:a1c:488:: with SMTP id 130mr36857685wme.157.1639392823727;
 Mon, 13 Dec 2021 02:53:43 -0800 (PST)
MIME-Version: 1.0
References: <1639418477-129618-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1639418477-129618-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 13 Dec 2021 10:53:33 +0000
Message-ID: 
 <CAAnfSTsKQrGeJMv2fS4CH5XEcOODhJ7fkFGbpure=seh8B=mMg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] php: Fix bug when configure php-native.
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 10:53:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94314

There's another 10 or so recipes that fail, I have a branch for all of
them and will be posting it shortly.

Ross

On Mon, 13 Dec 2021 at 09:01, zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:
>
> Fix error caused by modify of libtool from poky.
>  libtool: don't prefix the installed binary
>  -       install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
>  +       install -m 0755 libtool ${D}${bindir}/libtool
>
> When executing do_configure of php-native, the folloing error occured:
> sed: can't read x86_64-linux-libtool: No such file or directory
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/php/php_8.0.12.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.0.12.bb
> index 4f484179cc..38771948f1 100644
> --- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.0.12.bb
> @@ -141,8 +141,8 @@ EOF
>
>  do_configure:append() {
>      # No, libtool, we really don't want rpath set...
> -    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
> -    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
> +    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
> +    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
>  }
>
>  do_install:append:class-native() {
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94313): https://lists.openembedded.org/g/openembedded-devel/message/94313
> Mute This Topic: https://lists.openembedded.org/mt/87693930/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

