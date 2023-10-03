Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFEEE7545F
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 18:43:05 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.116209.1696358580810445624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 11:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LOAoOumn;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1dd1db54d42so826287fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696358580; x=1696963380; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9owY2hfHIkoh/WHhELdF/AkhE/4IfDjvE1uv4a8JZ2g=;
        b=LOAoOumniwJG+q7zGMhkxc2vFddVIi8SDG03q+rdwMMA96EuwdJRzNQJAT+SLDX/NM
         vgJGBZ1Phm1TINWAmqNghbmc2aY7V6hNWNERcYj1YGasVvRaxhzADxOZT2ZnGDsBELVC
         vzWopu7rY1HAnmy5EtQQEAkpvE2rPhc+R6Kmh2vTVGwSxHXq8VxMb8BTOUaC2jZD8ici
         wNxgU/i2YtGSOXzWiH72oDzySNYcYBhpYXDb00QL4bnxetJFI044S+EGfyZYpSnXIL14
         7ts5Av4/wG95HZlDQFmay8TaEKU7WKNY/cWns/XgzfJkl9wzyxzgMidJjI1qZZRkmtpM
         LO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696358580; x=1696963380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9owY2hfHIkoh/WHhELdF/AkhE/4IfDjvE1uv4a8JZ2g=;
        b=qAGhyqLWXobnndHGZF/YVLQ6CO5XM5DuS8L/ObTWmWJmPE2fmWWW5hqTzTh/juKvvw
         NbzjV/za3hEKPFuFZcLwuqYAtASnSqO1fvolBi2sKf4LwBxHw9Q1+2qwBtqHUODCHLZE
         DO5nQzxftBbATTKlZ6Wr8YAO+d2e99lTSFaq9r1bfToQNwi0DpB8ojik9VJ+pVYM4+oc
         fyYO5e8OjYuHF1sBsW+gfi/D0C27WBLnkLSjMqJsYaMMfFKxtC00WjaBYNCQh89T4pwI
         pyki62uP0QCz1niataZhOW/NNSSi9sqT9iAiuLOr+r246KAVQzpVHoZWaesE1T8rVhvj
         vVBg==
X-Gm-Message-State: AOJu0YzbIOzHkq7bGjxvJzZNoMM2mLilYGNNT7y69irK0i8DJ+SaY41W
	ulXxWr0vQrpZN1IaKV7+QyKQLkjyyPlJVrBVaG4Uh714ga8=
X-Google-Smtp-Source: AGHT+IH1J6ZK5VzHU7RGXUX/m6IkRrULcDMwSjWO3hqEnTW+zSgWO2pdegpm6AZPZ6X8PxOtOwEh8yxJPEMV3TE3aJI=
X-Received: by 2002:a05:6870:a98b:b0:1d6:55a4:d97 with SMTP id
 ep11-20020a056870a98b00b001d655a40d97mr481652oab.32.1696358579913; Tue, 03
 Oct 2023 11:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231003155720.172377-1-philip-dylan.gleonec@savoirfairelinux.com>
In-Reply-To: <20231003155720.172377-1-philip-dylan.gleonec@savoirfairelinux.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Oct 2023 11:42:33 -0700
Message-ID: <CAMKF1sp46mswsrKZA3Q42jdtBJbccN57Y1yd4ScVMLMhbu1ZNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cukinia: fix license field
To: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 18:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105327

Thanks for the patch, I have edited commit message for typo before
staging it in master-next

On Tue, Oct 3, 2023 at 8:57=E2=80=AFAM Philip-Dylan Gleonec
<philip-dylan.gleonec@savoirfairelinux.com> wrote:
>
> The recipe currently indicates that the cukinia package is licensed
> under both GPLv3 AND Apache 2.0 licensesi, but the upstream specifies
> GPLv3 OR Apache 2.0 license, at the choice of the user.
>
> Signed-off-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinu=
x.com>
> ---
>  meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb b/meta-oe/reci=
pes-test/cukinia/cukinia_0.6.2.bb
> index ed7a3f06a..1bcfb0a9b 100644
> --- a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
> +++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Linux firmware validation framework"
>  DESCRIPTION =3D "Cukinia is designed to help Linux-based embedded firmwa=
re \
>  developers run simple system-level validation tests on their firmware."
>  HOMEPAGE =3D "https://github.com/savoirfairelinux/cukinia"
> -LICENSE =3D "GPL-3.0-only & Apache-2.0"
> +LICENSE =3D "GPL-3.0-only | Apache-2.0"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPLv3;md5=3Dd32239bcb673463ab874e80=
d47fae504 \
>                      file://LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29=
e"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105324): https://lists.openembedded.org/g/openembedde=
d-devel/message/105324
> Mute This Topic: https://lists.openembedded.org/mt/101736700/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

