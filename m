Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6836FC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 18:06:41 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.2140.1645466800784592821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 10:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hp/yUFPV;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id ba20so3069121qvb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 10:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJcneyajmYvKaW3+xrKNBGGKjEcDDzIbhGFbMb29QtI=;
        b=hp/yUFPVXTc8luagOUscinQsA0Q8JtuJYDQxcz/X0aGEh3jyZhF5RNZ/wmBW8GRU0C
         96NBz254aMcAwI7vNu5vbaisrT9nPuc30+pUJHzn34cjrQuNkq57G1VJBiouLFDWstr0
         yEDEUhzIBGG8KwkEm33O+YehUGf0fGF6lkbpKjxdAt9161YCLAVg9SfJrB5j27Wy5/gM
         MOyWm2MpFNCvuRwv7d6MIB+6S4j6f1Q0v8C53yydHZwaLfiGkySQiE17KEp9BJGulN9Y
         H5AsAgnxhVzCI+jc+am8Lq+NxchACmsYc4XN8KlggtocHGLArXkstJFPu/Lpz7QRJJKZ
         JEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJcneyajmYvKaW3+xrKNBGGKjEcDDzIbhGFbMb29QtI=;
        b=Zdfvb7uRjrsCNeMO98LWmnBNz7INo4Ap1k4qGL0Jxr/9g5/XNbd9a/mafqbrGbGuRy
         6+eH8qiVwZNgtWA4s5zvlkAR93HpxP7IQ4S3zZp19fysUi8Y1G+AtkRs/yTcNOoMHxF6
         sP/ghm4W1JiJChxxu7ztkpKWrmQ81VnSkPlxG56svARxB4bf8e0JOut0YM0sg9U0/Z+G
         uy2egAI8I9lWWcx+fCDazBb3hts3Tlt7rFSWXEzk1qqzYYuXGpsr+9phJnJyTRBLUmOu
         BAasK9iA98ZgLqTujM29UfGPwpvKfac9+H2UkWFkkvWj4h2DyHLPOAfwO//ZcwFyf0C9
         hbFA==
X-Gm-Message-State: AOAM532zDmRClX5IhC7TivXDNfQOZDvW69IsR3Evco5ztjHdi5KlfS5m
	HCnTiTR+iWsdrmRYyWdvyJVZBviTMEo9qNtZdfY=
X-Google-Smtp-Source: 
 ABdhPJzL+d4Gp53ovi6eo9ZDzv8WGNKqBmHwDDFZRjYf9ec3PUD+UpemamrlYIqahxCBfCTuILScjY7tCqBv7/Mggso=
X-Received: by 2002:ad4:4ee4:0:b0:421:8ab5:5780 with SMTP id
 dv4-20020ad44ee4000000b004218ab55780mr16656179qvb.63.1645466799791; Mon, 21
 Feb 2022 10:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20220221172947.17173-1-ceggers@arri.de>
In-Reply-To: <20220221172947.17173-1-ceggers@arri.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Feb 2022 10:06:13 -0800
Message-ID: 
 <CAMKF1sqWoy==SqVa6T5kXZ6Uk7ReJoDoSpO=yP67natbGw-XWg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] graphviz: added PACKAGECONFIG for librsvg
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 18:06:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95422

this patch is corrupt somehow can not be applied from mbox.

On Mon, Feb 21, 2022 at 9:30 AM Christian Eggers <ceggers@arri.de> wrote:
>
> nativesdk-librsvg is not available anymore ([2], transition to Rust).
> According to [2], graphviz can be used fine (even with svg images)
> without librsvg.
>
> [1] oe-core: 67dd505c42 ("librsvg: do not enable nativesdk")
> [2] https://www.linuxfromscratch.org/blfs/view/cvs/general/graphviz.html
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
> index 203e0206fbfe..ff9939ebd02a 100644
> --- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
> @@ -9,7 +9,6 @@ DEPENDS = " \
>      groff-native \
>      libtool \
>      gdk-pixbuf \
> -    librsvg \
>      cairo \
>      pango \
>      expat \
> @@ -34,6 +33,10 @@ SRC_URI:append:class-nativesdk = "\
>  "
>  SRC_URI[sha256sum] = "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f255e6418b8ea313"
>
> +PACKAGECONFIG ??= "librsvg"
> +PACKAGECONFIG:class-nativesdk ??= ""
> +PACKAGECONFIG[librsvg] = "--with-librsvg,--without-librsvg,librsvg"
> +
>  EXTRA_OECONF:append = " PS2PDF=/bin/echo"
>
>  EXTRA_OECONF:class-target = "\
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95420): https://lists.openembedded.org/g/openembedded-devel/message/95420
> Mute This Topic: https://lists.openembedded.org/mt/89298975/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

