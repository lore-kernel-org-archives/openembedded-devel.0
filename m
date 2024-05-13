Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107FDC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 20:30:50 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4215.1715632245621947329
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 13:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXfP2axb;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51aa6a8e49aso6614308e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715632244; x=1716237044; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kcseed+Xxv4i1eBnKKAn8JK+aFyR0sWFYRiGT8/ucq0=;
        b=UXfP2axb5UVzRyzwL9hUM1ClUTKeQAm8UGKZnWoEQziOA7SUBaksumwqgPVgFkvNPx
         1hEft9UsUhw0t6dmHLeEtn/qsBZMtuunFXpg48n9v2kFocwbBy7Uf1qMUBi1tj1C1vH6
         LyJ/6rgiHESy5d5zD2LZWhIlSBuLcFPTDp5uPU0Sh/tSXjbRKei3w9IY+k52LHI6Wyj5
         Q9+AL6Cb8jEBYJD1908TdHkCzrEbTajs0VqOaYvZxZ8Cduc6UvwTWSZu9YyMB0ivx3I/
         pd8dm/Aa7ecBIvngaogMGN7pE3zNfaSFwdkw21FoJOiTZtLuBpsXWZy4uNaE7aswjiZJ
         HAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715632244; x=1716237044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kcseed+Xxv4i1eBnKKAn8JK+aFyR0sWFYRiGT8/ucq0=;
        b=hLwjfsMvDd75omlWrsu96R6HNJCHBXsJVkMFrDwuavqfyq3tkqZhpFtaOs2hmkM4m1
         Ce15G5ovG2kRnniqdeeY2ek8sBCABhEjdR46Fk8wdPDl4cK3jZ9lfZzYzB8keXPE1Tuw
         H6XTU13kTKm8If3xv3bHcEF+LNoLgY7rQ9rxmPckqV6tD4GgK+Dr6MPbruOuaqswoWRv
         wMTOb0VzAnRx9xqagox/Ff071Ex0F9mu8uN8C0ZDPlM3apQNolCpYSXI0fdmZ561+3tN
         tlOKsSIGXFGY4OF761P1ClxspQOBqAJftZBN0MkmM2v4+VveCKuCtELgOOrx9QBsE1g7
         ti5Q==
X-Gm-Message-State: AOJu0YwyErVaeKhETcUhUhVZBFTO/8SpV0DvaOuCxWkbjEkC+FUGcBxf
	jdfTSl/GozndFTmeUxShOpYb4Z7SS+QA8/hENj5NatBVu6DSOxCHuY3g9ZenwodS6ZixMUiTdl/
	d2YBZju324m5ByU0P4bChuHAMBD8=
X-Google-Smtp-Source: AGHT+IGTxiNAH4DxR7gXDQ9na5X7JJYwPXNctDFX0CHiVcqjoBFvyC2V2NQ71QJhucUVXduCBS1yACqOfhw3NTaFgBM=
X-Received: by 2002:a19:381e:0:b0:51c:c1a3:a4f9 with SMTP id
 2adb3069b0e04-5220ff72f76mr5999345e87.64.1715632243507; Mon, 13 May 2024
 13:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240513200825.39767-1-f_l_k@t-online.de>
In-Reply-To: <20240513200825.39767-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 May 2024 22:30:31 +0200
Message-ID: <CA+chaQfXGRSwepv6+DS2fYx6ashYnHN0mXx7qc9-XjGcEL-nLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent to RDEPENDS
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 20:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110343

If libmalcontent-ui-1.so.1 links with libmalcontent-0.so.0 then this
should be build-time DEPENDS (and then shlibs code in do_package will
automatically add malcontent to RDEPENDS.

On Mon, May 13, 2024 at 10:07=E2=80=AFPM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> This fixes:
> ERROR: malcontent-ui-0.12.0-r0 do_package_qa: QA Issue: /usr/lib/libmalco=
ntent-ui-1.so.1
> contained in package malcontent-ui requires libmalcontent-0.so.0()(64bit)=
, but no providers
> found in RDEPENDS:malcontent-ui? [file-rdeps]
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb b/m=
eta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
> index 4ff16a82d..f64f69a78 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
> @@ -48,3 +48,5 @@ do_install() {
>
>  FILES:${PN} =3D "${bindir} ${libdir} ${datadir}"
>
> +RDEPENDS:${PN} =3D "malcontent"
> +
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110341): https://lists.openembedded.org/g/openembedde=
d-devel/message/110341
> Mute This Topic: https://lists.openembedded.org/mt/106081394/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

