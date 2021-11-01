Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74946C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 20:39:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.58.1635799188616026642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 13:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oA7DjRFH;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id v20so12536339plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UNaKVGmyiZUwCvpb53Du4/AfaXRkMviD6A8RIt8FN98=;
        b=oA7DjRFH3MNR4l/xhbKK3a+7iuj9dmRac03MAbZEJj59Ijp3mOB43wmquzeqP52uwz
         kriDkFQ0rZtWUQ475oSQGEnRCarXkIR/u55r1pEv7UAkg5uI3jr5g31fMuO9VG9YamEz
         abVnAA96R922+KUWAsLHVjgx6OfKXtcKfewKqfPnJHAeLSYCWJNqlc/Gva6Qaeb9HKXR
         3Lm9AjRxBsE1aFsBbRtHf8fvTfXWCMuxaXRazBTcy9zfknpCKGHCj+LV+p2mmcvGFeqc
         /HaVdkmPy1ULiyP07Wgp2sBpZ5Npuib9X+gh+x5IFYlfFCWGqUXyawa7rP8LMaSOX9pU
         l6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UNaKVGmyiZUwCvpb53Du4/AfaXRkMviD6A8RIt8FN98=;
        b=BLG7UTvENGLNgFtT8ocgdRFA9rVY+PSPKXYANiWbMM/wf+1UjqdWFOs19NzvLzU/sv
         EMGLV7d1TXC0R82dLPRqk4wDJWjh7x/efu0FEUKgwZ45NS8b6IFQpuw29K32JtmTf0C0
         +rsHrgz6sRO45TlT6WZNXoLI9OuTmZuhtOjrqzxTdqQcn1TJ4KE1x5ztBizjl6OgrMVo
         mvkXUFQni85JxU7pfmZcePJoCVV/ZUYfLHtVxkZgAuHKL/QEqvmqJbjUxKSlpY8BLRVL
         qD+CCTyThoFvluEEsTjycPvWlihxPVpBurePFzDBM6htLg0CQ6v+KXp3GiPbHeCHPCtv
         7nrw==
X-Gm-Message-State: AOAM531NkVpZZEhABNiooJScUSqKFvTq4bLh1Wf0ws8FRwamPq6lXOdk
	wkChifOEMUWxcsp8A7jNqMVMLLdU+YEvlt3+D2Q=
X-Google-Smtp-Source: 
 ABdhPJxhUtMN1JzxgydC5mfEFmW0+b+qjHRuFoygJjQRF0A+hHVdAd59zhQSd6zWJA4Xmvw60LsLsTwz2b2VtF28+e8=
X-Received: by 2002:a17:903:1252:b0:13d:f3f6:2e1c with SMTP id
 u18-20020a170903125200b0013df3f62e1cmr27287445plh.73.1635799188023; Mon, 01
 Nov 2021 13:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211101202944.1999541-1-raj.khem@gmail.com>
In-Reply-To: <20211101202944.1999541-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Nov 2021 21:39:36 +0100
Message-ID: 
 <CALbNGRSiFSXHrqJXwUEF-a9LX_Rm_A5OV72eteawWLBqcHEdpw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] mozjs-78: Check for big-endian icu data
 file existence before creating it
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 20:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93757

On Mon, Nov 1, 2021 at 9:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
> index f4a6872b62..56d8054800 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
> @@ -106,7 +106,7 @@ do_configure() {
>      # inspired by what fedora [1] does: for big endian rebuild icu dat
>      # this avoids gjs qemu crash on mips at gir creation
>      # [1] https://src.fedoraproject.org/rpms/mozjs78/blob/rawhide/f/mozjs78.spec
> -    if [ ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} = "big" ]; then
> +    if [ ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} = "big" -a ! -e ${S}/config/external/icu/data/icudt67b.dat ]; then
>          echo "Do big endian icu dat-convert..."
>          icupkg -tb ${S}/config/external/icu/data/icudt67l.dat ${S}/config/external/icu/data/icudt67b.dat
>          rm -f ${S}/config/external/icu/data/icudt*l.dat
> --
> 2.33.1
Sure on re-configure - Thanks

Andreas

