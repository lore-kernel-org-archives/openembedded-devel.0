Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D63BC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 22:26:23 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.1525.1698877573794913252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 15:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnQEsDCl;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1e993765c1bso195002fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 15:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698877573; x=1699482373; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=063TeSa4d555i57Uva+xg3K7cgI+C1NV/KQAvj1Kk4I=;
        b=cnQEsDClytKEwwMGV/Rwkp/dUGG9hYVOCQx/dJRF1cJSxpohzw81v3niJJnJGEW0mO
         N9sZu8F9g5K/QKywQabxpW9JUjRwumRRaIKd2e97/L748vbj7qRguZAf8gCnxTPOdU85
         8mQgdX6aubNM/expofpxIHJ3CYOy6crBcFSbBp9KmYAxEdC48EgQKmdkD3zV8/fRT0j9
         joNyehqZlJAO6CHQzSl7t9TLIGMbX6jEWMAG02DCi/xdQMzLcu8V2QIFeuDGxbdq+OYt
         eMK2akMmF55ieeT5vMwkbN2zPdG+H1Sx9nwznDbrf/5gFNkXfzdMnP8xzkyL4HPYzw+s
         2lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698877573; x=1699482373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=063TeSa4d555i57Uva+xg3K7cgI+C1NV/KQAvj1Kk4I=;
        b=vsxq7AiNuOeJSb+ZC74/UCct0LMcluwy7WC+08mNnPeCBSKt/gWkNsp4o0AEpFT7Ck
         iXjbhlTtBFYIxQyf113KlzGAs4HX7Xm/dmdsXCZ2z4DpiFeX3VRcof+EH8XH8/1GroD9
         ILX3U4cUg5p3HrEJ0nAQ1arucNn3GzFiobmqnSsX5ZEie2jVAVdwPusRDVw94RLIzTeK
         bztuL4vh/LAbDoU4N9eIMQR4uYp+WuKSxPjQ2LrkT5RbdCa9RDJmitMvnfvaBTZ1PrBd
         ocvduKoBtrvO8hsvgoboOknOVLvaBfJ/7aGC49ZTOMUZdlZAFY4sw5h18MFEYpBz9tcB
         FTHQ==
X-Gm-Message-State: AOJu0Yw7ZCI3mA1aX0PXqKOuMHawFeIrbPDIzxCzoM3Ni5ZYvjHeaFvL
	auCirWc7ebDucJbLH4ttvmoYpQdZJ9cDvNn+Pbk3rT5wbQuWQw==
X-Google-Smtp-Source: AGHT+IHQJNpeqP8PDgEjsL3pL4OXnR7XMQFI9fT5yqqxOgyB/n2uecxQ/BKAtee/zQ2Lt+YmHeK2Pe2wVqgvzGEmczc=
X-Received: by 2002:a05:6870:ff45:b0:1ea:1b5e:fed4 with SMTP id
 qo5-20020a056870ff4500b001ea1b5efed4mr23403454oab.39.1698877572843; Wed, 01
 Nov 2023 15:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br> <20231101123317.1806460-2-arthur.oliveira@ossystems.com.br>
In-Reply-To: <20231101123317.1806460-2-arthur.oliveira@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Nov 2023 15:25:46 -0700
Message-ID: <CAMKF1sqbCC1yR6myUBuL-f__GSC9oHF7Wtc0OxXc4w8_BUu2jQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-flask-restx: Add
 Flask-RestX Python Recipe
To: arthur.oliveira@ossystems.com.br
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 22:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105826

seeing this error

https://errors.yoctoproject.org/Errors/Details/741222/

On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM <arthur.oliveira@ossystems.com.br> w=
rote:
>
> From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
>
> This commit introduces the python3-flask-restx recipe, which brings a ful=
ly
> featured framework for fast, easy, and documented API development with Fl=
ask.
> It is released under the BSD-3-Clause license.
>
> Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
> ---
> update license to BSD-3-Clause
> ---
>  .../python/python3-flask-restx_1.2.0.bb             | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-res=
tx_1.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.=
0.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
> new file mode 100644
> index 000000000..cff797139
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Fully featured framework for fast, easy and documented =
API development with Flask"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc96dd911c6d9e32868b6bc667a38a=
3e2"
> +
> +SRC_URI[sha256sum] =3D "9a5338b108c57fbed1d24d5d53fe98442b2be7ffa2ff3291=
305af7a613ce6fc0"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-isodate \
> +    python3-jsonschema \
> +    python3-pytz \
> +"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105816): https://lists.openembedded.org/g/openembedde=
d-devel/message/105816
> Mute This Topic: https://lists.openembedded.org/mt/102318089/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

