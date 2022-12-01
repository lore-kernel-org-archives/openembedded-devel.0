Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D200EC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:43:05 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.52921.1669920184163763827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QiXnz+n+;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id m204so2966789oib.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3gi7uAPERbJXB0ecZN6AKtVF/voFlMcdNKzcPRsv14=;
        b=QiXnz+n+arHudhzWkltxxz9iV6Y1ZVyCdZ2VKA1UPKZUEc+1rGGbW7f+7D622F6wVS
         Xl3/kjerqeGEJUR3uvGrwd/8qJkcxTPA2JHxR1BUKy5En7L3ishBVayca01QLTpRtvx6
         qcQIbO4479+XZ3rV9hOF9uhS66tWWG+kUVVwK6hQ73jfa0pfBfuFR1Z9QuVFbRU9RLa7
         MCpWI8m4K7hhEUvj5EEchu7MhEaMbbJAk+BX2nL72Be8k+6+LiuKWeIrWfTtJMRN0AoQ
         xOiR8EttM5sIJLDhmSypPIBmG3ADUAgJdOaNBl0ufEd2JjjEA9xigHWatpAqvU2C1XPQ
         KT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3gi7uAPERbJXB0ecZN6AKtVF/voFlMcdNKzcPRsv14=;
        b=yLRSwdITZ4QNa9iMdKQGgbgAkb5twaIlZ0lLSUpV4KkP9aWi/niX3BLzDF9BGJMG3t
         OGDqr7kNtyjmXclfWgX9V0sMKB6Ah7ukjFhZfBK7enVBFOhmRrBmIHseXRuSqcfC+khA
         Mpj+gEiwRsb/jicmOdQ/+JT99bWapLCXiZXsKTiPpsEdoNmTHmmZX0WJX0EUqjOlyDGG
         dpxfDUddV1JdjOb4sYnZD7tSj3XoziR0JhQ/7MJ7Z6FE1YGwSG3TrEIU2GLuVKCUBKyR
         tZMQ1WAEg/0ccdPd+AGsSHWxwCyZIFYHbU4SxJctzQEVtnKcoAGZyMd+sYLkhjA4xs6U
         b/BQ==
X-Gm-Message-State: ANoB5pkfyuUMQ+SsUFj6XpXj8ruK4kxQNjDSBAch6UZwJbuzYIBm8OeO
	MSV/13as0zsHEzqSalzvsaeC/JF+01qlPJzZrgWKnb4l
X-Google-Smtp-Source: AA0mqf6bKDPOlseHmZlfk48Ldrn6qK8gJKgqie+YncSPD9uxHCrXTz0YcMgCxDBQQmIOzzNnfKvMKufKvR+2wc/8ET0=
X-Received: by 2002:a05:6808:1c1:b0:34f:d32d:cad5 with SMTP id
 x1-20020a05680801c100b0034fd32dcad5mr34320444oic.262.1669920183270; Thu, 01
 Dec 2022 10:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20221201083456.1573628-1-tomasz.zyjewski@3mdeb.com>
In-Reply-To: <20221201083456.1573628-1-tomasz.zyjewski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2022 10:42:37 -0800
Message-ID: <CAMKF1srPUdH=DigZ_4c-jFYjAcfzJEw2jTMMdQVfKkYvSSgxwA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH V3 1/2] python3-binwalk: add recipe for
 version 2.3.3
To: tomzy <tomasz.zyjewski@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, michal.kotyla@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 18:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99896

Can you rebase these patches on top of master or master-next and
resend v3 please ?

On Thu, Dec 1, 2022 at 12:35 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>
> Install binwalk utility.
>
> Binwalk is a fast, easy to use tool for analyzing, reverse engineering,
> and extracting firmware images.
>
> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
> ---
>  .../python/python3-binwalk_2.3.3.bb             | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-binwalk_2=
.3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb=
 b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
> new file mode 100644
> index 000000000000..362efa275148
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Firmware analysis tool"
> +DESCRIPTION =3D "This package contains Python Binwalk tool. Binwalk is a=
 fast, \
> +easy to use tool for analyzing, reverse engineering, and extracting firm=
ware \
> +images."
> +HOMEPAGE =3D "https://github.com/ReFirmLabs/binwalk"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4d=
e64"
> +
> +SRC_URI =3D "git://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} +=3D "python3-core"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99882): https://lists.openembedded.org/g/openembedded=
-devel/message/99882
> Mute This Topic: https://lists.openembedded.org/mt/95377962/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

