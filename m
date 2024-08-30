Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1DACA0EEB
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 08:15:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.8108.1725005729994086625
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 01:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhlJtzZw;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso2126986e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 01:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725005728; x=1725610528; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piC8eDRHK5XirDuy6eP/9RF698nGeOq3fAU98T/XT0Q=;
        b=fhlJtzZwC6/RuDDXxWJqrI3JoCczUWXAdeA1Ffwhwaow4a+6/ZMgOtB8g8QkxuJuQc
         3dBz4KX0I60NVD8HIP9Lge0lK+0BRxyxaIn/+2QlpWRbSv2l6IzfZ/im2FnkdX3enM+e
         dGlmIMziSfq4lDyb5Caa1m1OMAyqwiXszNPFMOQ9gJY1Lh29iR9D/vzMiWEaNUJsESVU
         ajLl3/A2m/VkqmO5nuntGVvYcXhiAN/hgJGx2ccGQ8CpWa+KTzgEC8r45g/tjIdLv8nH
         4WdOwsOyaMCewGpv0FXak/4bVrBBDwGY6BrYor49t52ZrU+pbQGN3s8gbEl16YNCQ4Th
         tP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005728; x=1725610528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piC8eDRHK5XirDuy6eP/9RF698nGeOq3fAU98T/XT0Q=;
        b=PXp3YV5Wj/o5+3AjkeMiYG7uG3cZrjo7q/7k1KTC9/rJkYHviywlhoAw8n7BvM3RMY
         OZ/GE6iOYIwVs5PjUJ6noudK3cthx9w+un5836UdqD1RMb1EwM21orF6QZ2FdSkfELuJ
         yKrUWyeDz21w1LfoUaFD/UK5etobdiXlrUlHjwxyX3hQzz12GA0fkcsqDtR48POSFyog
         6Q9+4JiPr+S3A4EqgeO+at61wuSSu6pl6QDKUu5oiEuoq/LjQqlA5nnIGLGl5YM8i+HL
         i2VTFbHtWpWb6vSb8+5lxjydXUly5H0zirTjY790u5UM01uc7th3HqlizW/likkSI7hw
         8aHg==
X-Gm-Message-State: AOJu0YwNmX+1oPA3YWwFpktrGvo8m7Q7XJ5jVc/ELcScNlV3MRl82LJf
	Ao0rDxuYcAcxkiy56stpLLppyL+O1/gAZjDWPSgkn4fkY8ttyzJtThfalFcTNSbocvT24KVKTWP
	aNxLOmUh3WV6C9ZMChVGEUnys0YU=
X-Google-Smtp-Source: AGHT+IE3sQIIxpYiO7d3V6Vds7g9h7S5WMpniju6yyNtneMc8eZPArocpbGpMci/RwtAflvxZLDcKEG6CRaRJFEX5kE=
X-Received: by 2002:a05:6512:280c:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-53546b92af7mr920793e87.44.1725005727129; Fri, 30 Aug 2024
 01:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240810152807.899873-1-akuster808@gmail.com> <20240810152807.899873-2-akuster808@gmail.com>
In-Reply-To: <20240810152807.899873-2-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Aug 2024 10:15:11 +0200
Message-ID: <CA+chaQc6Y=vTRyEmdvM=zu63oZG68p6S=SrmOmEtpxbEpseWHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/7] gcab: ignore buildpaths
 error from sources
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Mikko Rapeli <mikko.rapeli@linaro.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 08:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112048

This doesn't work with multilib where the package is named ${PN}-src
(e.g. lib32-gcab-src) and it's better to just lower buildpaths from
ERROR_QA to WARN_QA instead of skipping it completely, because it's
still an issue which should be fixed (at least to improve hashserv
efficiency if you don't care about reproducibility itself)

Why was this even backported to scarthgap where buildpaths QA issues
aren't fatal?

On Sat, Aug 10, 2024 at 5:28=E2=80=AFPM Armin Kuster via
lists.openembedded.org <akuster808=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> gcab-src has some meson generated files which embed
> absolute paths from build environment. meson seems
> ot do this on purpose to fix other issues.
>
> Ignored those issues for now.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit db91757e7bd98494666ca00bc7727a7607b6004f)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gno=
me/gcab/gcab_1.6.bb
> index 4278fc9453..49c64f0ba6 100644
> --- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> +++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> @@ -22,3 +22,6 @@ PACKAGECONFIG[nls] =3D "-Dnls=3Dtrue,-Dnls=3Dfalse"
>  PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalled_tests=3Dtrue,-Dtest=
s=3Dfalse -Dinstalled_tests=3Dfalse"
>
>  BBCLASSEXTEND =3D "native"
> +
> +# meson embeds absolute paths to generated files on purpose
> +INSANE_SKIP:gcab-src +=3D "buildpaths"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111739): https://lists.openembedded.org/g/openembedde=
d-devel/message/111739
> Mute This Topic: https://lists.openembedded.org/mt/107826456/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

