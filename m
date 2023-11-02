Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D511AC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 03:09:14 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.23391.1698894547082355064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 20:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aX16r6gb;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1ea4a3d0a44so310845fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 20:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698894546; x=1699499346; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWPrtCkNEs2cPBBnRVKD7pAPn09Rh2QJSCCpE2eyE9c=;
        b=aX16r6gb11U7KTM81HP6J3Mm1l+yCC4r9qVgu6sBSYAAqJvHKundGTaUfWJFy9LApH
         GN9c+95sQzynEoI/clEMryL2JxVi/O5ao81bssDR98kErHkuuusTV09XzkT1GeItzUhJ
         1sWHxHUYXk5YgjfMdVfNfA+VuV7QUBJ+O7wb078etm8HsZOijY8A3oUW/HJgvhcgZk2G
         XWc0DLRA9dcY4bWaAJyGgkvZ9xX/xPuTghOkZLtYGXQCxkUlAHIg47KaH6n0hXNNdoGw
         HtulBUPxSv+AkHX+Jzi+pPSotKiOvjxCzRfISmZw0VlFvDWonYOJcmnod+SSGq93pRZX
         4zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698894546; x=1699499346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWPrtCkNEs2cPBBnRVKD7pAPn09Rh2QJSCCpE2eyE9c=;
        b=lAVQ8lVu7CrIcqNa8BBlSHlyxqUdj3iNHH2CEXF1pElzht7sJf0wiVKqSracYil9qi
         Q/dNg/TOW1OHKTT4CueDq7Q7tfOfQPnEeqZv4bk23iXGALCu0wzDtaFhdjqjEZeyfTeL
         e53elBZnjK4Um7jp5sgkSEdM96O0Ojps43bqMsBY2JYUJcdI/Sqa0VeaFfInHfQua5Q1
         DvgRAsT9yYduUi9uUDmm35DOHpx3hOvQUHQMUJ89LnXVH4cxTKyj48P/oM48Lcc0Dgew
         9LIPM2Blt1gkaQMbido0m7hbE9ZrkyDtiRbotZAiOK0gPA96ntVJQ6GKXXEavgkkVhSi
         S1bg==
X-Gm-Message-State: AOJu0YyX8228TocQg7gacP1M1TKlrAgvH7QTmAcNN88r86Ruh4YgQdrM
	ekk8XykZgBc0p0yJ8KL64CmFQWlLOlIVwAq5z3oZq6VAwxxGnQ==
X-Google-Smtp-Source: AGHT+IFlGnW9WvBfWI9/KkUIihS+bShQmOJE7GjftzjjW7lFZ9UAhzHCdT+M/1M5VHh3Q1Y+NOsZPdhF3c6fl8xNdDM=
X-Received: by 2002:a05:6870:d88f:b0:1e9:bda0:771 with SMTP id
 oe15-20020a056870d88f00b001e9bda00771mr21424287oac.4.1698894546160; Wed, 01
 Nov 2023 20:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br> <20231101123317.1806460-4-arthur.oliveira@ossystems.com.br>
In-Reply-To: <20231101123317.1806460-4-arthur.oliveira@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Nov 2023 20:08:39 -0700
Message-ID: <CAMKF1sout=pMrO1_Vu55pKDBbAWTyq=CQuQ7n7Apye9j3Jj5XQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-zopeevent: Add Zope.Event
 Python Recipe
To: arthur.oliveira@ossystems.com.br
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 03:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105829

fails to fetch - https://errors.yoctoproject.org/Errors/Details/741245/

On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM <arthur.oliveira@ossystems.com.br> w=
rote:
>
> From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
>
> This commit adds the python3-zopeevent recipe, which provides a simple ev=
ent
> system. It is licensed under ZPL-2.1.
> ---
>  .../recipes-devtools/python/python3-zopeevent_5.0.bb      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-zopeevent=
_5.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb=
 b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
> new file mode 100644
> index 000000000..1955ef4bb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
> @@ -0,0 +1,8 @@
> +DESCRIPTION =3D "The zope.event package provides a simple event system"
> +
> +LICENSE =3D "ZPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D72=
092419572155ddc2d4fb7631c63dd3"
> +
> +SRC_URI[sha256sum] =3D "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda69=
55f96bb9b91e67cd"
> +
> +inherit pypi setuptools3
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105818): https://lists.openembedded.org/g/openembedde=
d-devel/message/105818
> Mute This Topic: https://lists.openembedded.org/mt/102318091/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

