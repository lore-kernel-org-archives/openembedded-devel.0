Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CF4C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:23:48 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.4026.1706289825257048616
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 09:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2M0raF3;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-20536d5c5c7so382102fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 09:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706289824; x=1706894624; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOEVZQvshg44wQRMLRNYOay7Hahw5/ykwmT3vcOR/WA=;
        b=S2M0raF3x/0YIDwkmVxnknQtBcLYuR79xuOdVo4OIhqAqtplE4mcqq+8LY71/R7ffF
         prg7RSe+FtnbFU1LI46dPOXaLyREz13R1klCUnRBl8G+swLTwUOcqLEXici2XREt6UTu
         1qrtNtPFplBGOcjVxbp7aR1urxi0MNizkH6g0mIOHv7WHAzTqpJm18IK7JLSY5r9Bye2
         lc2qwlz7L4kMFKzLlCMYjkd7sCrD970RbLudHOpH2P/heGv5p+TOkEZyWoX3HrvF3jNk
         i6SXprIBw0gPZbWLyYFdF63UKaTeEz1L6vl6+VeldznG2MTiEnRG1bRNd0vomWYxM7mH
         7fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289824; x=1706894624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOEVZQvshg44wQRMLRNYOay7Hahw5/ykwmT3vcOR/WA=;
        b=Uq5cRiuIaiMI5bb/XcQKXJL14VSzb+McnnnpFcbTajclDXRgvct/oMtk6ifUcVkR47
         MhNvg+Ak364HH9w3ylJROIm1ZpcEoptgDRIwM9NMQZLT9ABVO/2hWtmBoIApjyuTRpQu
         xHFNz/EZc9vxug2ZuJigaV1Sb3xQH+VeamNMc03ca6KWTIL6tcGp4BcAXksV+wwYrGfP
         WaCkZMz6v5ShOL/QhUze8NCOunQ9XYLvjFen5YFLD45LGn6acgbwbCnflZTXcMtSDY0P
         GNgm9HtdbEsbZ58o9NclzskzhathGhkK9xsODriP44WmbCsFiQMt0Te9xusaAjQJxh7u
         w+Jg==
X-Gm-Message-State: AOJu0YzzysyeJgYO/md4psMHdWeFyv1VWQGRVdT83txsQe8saBi49kfs
	9eMjI0wlAXwtdiDrx1lUBMsXnOm4FzGwQ1qRXZ+eUX2ZrwqSATQjrNhH5MJ7SRwIgHlAqY4BYJ5
	Fj5iKTgdynXzIPcWpP2tkLZNeCp4=
X-Google-Smtp-Source: AGHT+IE7jXd8FVo1czSJ95tnTlamGBySq5On1gpWFcbz6BGuo129ibdBS2ZSq/pV8d4J2iak1Bxe8D5wtyae0BWvUeU=
X-Received: by 2002:a05:6870:c1cf:b0:206:c934:49db with SMTP id
 i15-20020a056870c1cf00b00206c93449dbmr1420587oad.99.1706289824521; Fri, 26
 Jan 2024 09:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20240126102409.215142-2-Angelo.Ribeiro@criticaltechworks.com>
In-Reply-To: <20240126102409.215142-2-Angelo.Ribeiro@criticaltechworks.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jan 2024 09:23:18 -0800
Message-ID: <CAMKF1srz8JZbAxGotp8cm5HguPqXNJ928yfNKRDXhrbQ6apDRA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add tool recipe
To: Angelo.Ribeiro@criticaltechworks.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 17:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108464

Thanks for your contribution Angelo

On Fri, Jan 26, 2024 at 2:24=E2=80=AFAM Angelo Ribeiro via
lists.openembedded.org
<Angelo.Ribeiro=3Dcriticaltechworks.com@lists.openembedded.org> wrote:
>
> e2tools is a simple set of GPL'ed utilities to read, write, and manipulat=
e
> files in an ext2/ext3 filesystem.
> These utilities access a filesystem directly using the ext2fs library.
>
> Signed-off-by: Angelo.Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
> ---
>  .../recipes-utils/e2tools/e2tools_git.bb      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>
> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta=
-filesystems/recipes-utils/e2tools/e2tools_git.bb
> new file mode 100644
> index 000000000..d8492bf8d
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Set of GPL'ed utilities to ext2/ext3 filesystem."
> +DESCRIPTION =3D "e2tools is a simple set of GPL'ed utilities to read, wr=
ite, \
> +and manipulate files in an ext2/ext3 filesystem. These utilities access =
a \
> +filesystem directly using the ext2fs library. Can also be used on a Linu=
x \
> +machine to read/write to disk images or floppies without having to mount=
 \
> +them or have root access."
> +HOMEPAGE =3D "https://github.com/e2tools/e2tools"
> +SECTION =3D "base"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +DEPENDS +=3D "e2fsprogs"
> +
> +PV =3D "0.1.0+gitr${SRCPV}"

I think SRCPV can be dropped here these days. PV =3D "0.1.0+git" would suff=
ice.

> +
> +SRC_URI =3D " \
> +           git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dma=
ster \
> +"
> +SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
> The information in this communication may contain confidential or legally=
 privileged information. It is intended solely for the use of the individua=
l or entity it addresses and others authorized to receive it. If you are no=
t an intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution or action in reliance on the contents of this information =
is strictly prohibited and may be unlawful. If you have received this commu=
nication by error, please notify us immediately by responding to this e-mai=
l and then delete it from your system. Critical TechWorks is not liable for=
 the proper and complete transmission of the information in this communicat=
ion nor for any delay in its receipt
>
> This e-mail is environmentally friendly, just like Critical TechWorks, wh=
ich lives in a paper-free atmosphere. Therefore, please consider the enviro=
nment before printing it!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108460): https://lists.openembedded.org/g/openembedde=
d-devel/message/108460
> Mute This Topic: https://lists.openembedded.org/mt/103973659/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

