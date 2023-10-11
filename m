Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E24CDB462
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:21:42 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.20999.1697041293120270174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 09:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BcCeuApI;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so5213512fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697041292; x=1697646092; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK//cQcKGxBKtngJtikCanC8gfANUyEQ4RV9fuBJ84s=;
        b=BcCeuApIA8zc6dBNIBNOC6TfN1spQuGWLHtRaJLq5RKJrg/hA6Tda34PgdwLRi4TF8
         oxPTJy3gJeG1KzXX1x8irn3Ls0c2eHNgEh+U0hwtIZKRpvdwjlXt4ZQoclgHwGipOrDs
         YXvlwLTwapNiu7qm9yHSlxXj3ze2aH7sgJNcM9dKHMYlW0ox7RLiCYHz9f9aN3yrOuef
         rRaOLXJbu2l/OAdyQ8AEKhVEuCYVz8HQ0jo9hlwjiIaWY0AbmmOt79vjmihUuzr8TLDp
         zjqeGVXuP3rJSS/aAdS3yl/AQiW02kcgSAIiKeKYZMkJglqHlL3iaOL2Uwh4VdjH8T43
         ghsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697041292; x=1697646092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WK//cQcKGxBKtngJtikCanC8gfANUyEQ4RV9fuBJ84s=;
        b=F1vY61ADG8XBYtpVC7BWMcuJ25Cxanzv8DxBcPWN7n9AOunD28symSYtQ1oTbOXziT
         wYN12sNDH5yuMamQUetUnaIGR2ctFhcP1U99fEQTYDioO/yUEF8xrw2FGRfLpdYSKA9+
         q7B7kYo1BZ+5vkknleUJaegoOvYZrbIFCj4t518XpJL9SAOyEszZ/O1C10tn1AUAxrMT
         r971KUyYh/ktFX0VWb9BjG/TYJrm51pIsWy1hZhTvqRCPls5BXLQwrrOQy9mSGgmfYtK
         oqdpxlUzAC0+QQr7WqvnB+kRhv/HmxZ0gSgrNyXH9DGTPfb7wo+z7XPdnGbP+8Vm7nRi
         P6gQ==
X-Gm-Message-State: AOJu0YwaDOBH0lkifvL5bux6RuS7rTAeLV4Y8ZPB1jvLYyOT4wxYBq8s
	/6oC0u7Iv6P/St1wlfAEOnhDDF5uypJkYgp0ysY=
X-Google-Smtp-Source: AGHT+IGoOwnEmTyxLeLJCE50L3EClNAJljF05WybO+CHAEENaPFldFOxvRjDfIPrSINZfkvqVmMlfYFsQyV46A4OrUY=
X-Received: by 2002:a05:6870:8919:b0:1d5:8d8b:dcc with SMTP id
 i25-20020a056870891900b001d58d8b0dccmr24993396oao.18.1697041292282; Wed, 11
 Oct 2023 09:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231011090631.195716-1-akash.hadke27@gmail.com>
In-Reply-To: <20231011090631.195716-1-akash.hadke27@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2023 09:21:06 -0700
Message-ID: <CAMKF1so7uQnqjOmAb8AV12HXmjBy0zMwndTTv0eakORx4_SWdg@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH] libeigen: Set LICENSE for libeigen-dev
To: akash hadke <akash.hadke27@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	akash hadke <akash.hadke@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 16:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105425

is there any GPL-3.0 code in main package ? if not perhaps it should
mention GPL-2.0-only maybe instead and no need to make special entry
for dev package.

On Wed, Oct 11, 2023 at 2:07=E2=80=AFAM akash hadke <akash.hadke27@gmail.co=
m> wrote:
>
> Set 'LICENSE' for 'libeigen-dev' package as
> 'MPL-2.0 & Apache-2.0 & BSD-3-Clause & LGPL-2.1-only'
>
> 'libeigen-dev' package does not contain any 'GPL-3.0-only'
> and 'MINPACK' license files hence update the license.
>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>
> Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
> ---
>  meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.4.0.bb
> index 1cae76b42..467c51d98 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Eigen is a C++ template library for line=
ar algebra: matrices, vec
>  AUTHOR =3D "Beno=C3=AEt Jacob and Ga=C3=ABl Guennebaud and others"
>  HOMEPAGE =3D "http://eigen.tuxfamily.org/"
>  LICENSE =3D "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-3.0-only & LGPL-2=
.1-only & MINPACK"
> +LICENSE:${PN}-dev =3D "MPL-2.0 & Apache-2.0 & BSD-3-Clause & LGPL-2.1-on=
ly"
>  LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619b=
ab123dad \
>                      file://COPYING.BSD;md5=3D2dd0510ee95e59ca28834b875bc=
96596 \
>                      file://COPYING.GPL;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105422): https://lists.openembedded.org/g/openembedde=
d-devel/message/105422
> Mute This Topic: https://lists.openembedded.org/mt/101893030/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

