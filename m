Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C2BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:46:50 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.29375.1702576009358614728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7ngzdt9;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-203198c9aa5so1876115fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702576008; x=1703180808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxeY8064Zb/B2rc8Iz6TJsx367tG7EjrKdGWVdVlt3Y=;
        b=l7ngzdt9zUDelHxiokSbucO17bms3Hyt5yEGa1okZqqQI5AjPVt+WepeyBassRjn8i
         QVQ6Vi4e0EfWGELIWNdv8aA6lAlqIKBbwS9FMWz2f4WesJ425VNsjWMNr3WdJhqh6QJB
         svwBgyL1udENmNZ/qv8sv7ik84vVkTFvXpKd3p2PE8JSJ275VC+AMKCGyjEwq7fnSGDt
         IMLJbnLKLfGxhSy5Qf66Ouvrp2LYWytlJazWV9++CYpZYdai5FNunC+1ARpIZvADFpik
         XBinEenGq2jP+5prhCvdAQsjdZL5LHMOys9g+0gg3krZjNbZDcPoX7JqeIlLf3/s6np2
         IB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576008; x=1703180808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxeY8064Zb/B2rc8Iz6TJsx367tG7EjrKdGWVdVlt3Y=;
        b=Pa59zguMP2gLGTcoxrok+P3xBn4oFClWiav7nDgIQ58ueBkdBZx1vx3/gvHIHgyjXb
         UedrKsgl+6yhjgRK/pPH0NsppHtQ2MyyyEieDBecqPMth5ZsC66Tr7eyaa8DNZJ0qwfG
         CVIY99h5dyqrYwjVjpYXZel4A86VPusGnxAbj9KTfVnbm8mv9/E8ONdIyP66osK3Wq8r
         XhCM3CozKcFDbml3N0WVoigOv9taS18GA5qCSLcf3/DSlm737LNP7lQaHtKphcKdmcKr
         ZaTl4ul3KJRa8r+YLHSvaAoF2Z4Gkdrw0ra/nkCireLUt3aAbd6Neo7qUUZ9sjWRcllg
         VyNA==
X-Gm-Message-State: AOJu0YwLCWPn65YzkZeF2p70kMgyswamDTzbC0Ba/omMniytuqQYpUG+
	evi7Zy8ZUzc5zsaLrp0oQYgucc8202gxHVqlGp7dz7NuH7c=
X-Google-Smtp-Source: AGHT+IFimAxnNQSqCMkTg2wwunfZo/lGPVUpHIVtqOB6rFJI6kK2V+QaNKeaXiUC6SNZxWfYwItq4lWZxSZL9EivUFE=
X-Received: by 2002:a05:6871:809:b0:1fa:f404:b94b with SMTP id
 q9-20020a056871080900b001faf404b94bmr12016644oap.58.1702576008564; Thu, 14
 Dec 2023 09:46:48 -0800 (PST)
MIME-Version: 1.0
References: <1702543786-27640-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702543786-27640-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:46:22 -0800
Message-ID: <CAMKF1spu8DvXhsveMQkpEzyBqo+5DMhiv_MPLokHmPQQijJO=A@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-colorlog: upgrade 6.7.0 -> 6.8.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107462

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121405=
0339.1190691-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 12:50=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Remove universal wheel, python 2 is unsupported
> -Fix running tests in environment with NO_COLOR=3D1
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-colorlog_6.7.0.bb =3D> python3-colorlog_6.8.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-colorlog_6.7.0.bb =
=3D> python3-colorlog_6.8.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.b=
b b/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
> index 69f4be17c..6aefef6d1 100644
> --- a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
> @@ -7,6 +7,6 @@ inherit pypi setuptools3
>
>  PYPI_PACKAGE =3D "colorlog"
>
> -SRC_URI[sha256sum] =3D "bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1=
a989e474f6e582e5"
> +SRC_URI[sha256sum] =3D "fbb6fdf9d5685f2517f388fb29bb27d54e8654dd31f58bc2=
a3b217e967a95ca6"
>
>  RDEPENDS:${PN} +=3D "python3-logging"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107428): https://lists.openembedded.org/g/openembedde=
d-devel/message/107428
> Mute This Topic: https://lists.openembedded.org/mt/103166777/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

