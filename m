Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E3BC2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 04:54:33 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.10152.1719550473222342317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 21:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxVatIKt;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ee4ab4076bso11669601fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 21:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719550471; x=1720155271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow96nqcdtLojk57rpIjHPL8DPqnhQSGUnjnbPWn2WBo=;
        b=LxVatIKtTJUj4kM+F52CVaC+WVDWZ3qKuZ5TQ29j5DcamWyKT9mNJF0wOivUgK7szS
         r8fD4xVUWfV48d8hnq+IvPcw+uuDnvTDwMHrHJRJn9eWDkcFwnxfzRu03/FScu9RJNgH
         Pf2waPBFOdnTdIF5Zcxu1djzTAVaezEyhXRyNJgfsdZZzVgmDLkGBT/Zl1LAK7fOJ6nN
         AP3UELExPmhXKRz1bCwsjsFR68qn/dfQOyszZ4rJXdFwHmmzauJFjBeHBtqUCPdtZOC7
         2Bb5wnvQjDqGYFNLDB5x1cApAthXm/rsQvD/m4FYiuaA2EKIR7T3mednHOD2gK3/bGqR
         bUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719550471; x=1720155271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow96nqcdtLojk57rpIjHPL8DPqnhQSGUnjnbPWn2WBo=;
        b=LjxuUy0W9FB9uIcRqwH/TEG50uhl0sjT+RS5wPVS9xwsephNtMozAB4lPA+qHmpi5h
         4NVPjoWVts32ZRYPI5N6/DlE2JwjM7XtwjXyGoU80NCCY2jgGXzHRu6P+5JM+I7uweU4
         l5hI8RI34ri3ZgEZnFhEih9IqpnDRWi03emiBAbwd1G/bZoprY5+gtLbEShZJXyGdRqk
         PkdNCC8qnXWXfzPc2tvEaPDVgOnWOOgAj6ylXWrQBUXlUlxouIL1iTfLuXQapJFgfcwB
         DCKNdDZaTj9r65mrKSn3eRyy76lzlnPT/v7x8KTEio5NE36hj0rpb+HpakVOXTuP8JCn
         jl1w==
X-Gm-Message-State: AOJu0Yw0TRMphCesiGJwoqmDIT/cmE++uhNyfW5uq8LmagXzYRC7Gnsa
	JvchO3oQaI73ZBwg+rWjoOIxWcXOnEm8huVfwF/qWJXDMZodIz+J13NCnrtK/Gzsw4/Hbqf+e/Z
	Cp1MIgfvd/3G62oPQzQZfzSxPj10=
X-Google-Smtp-Source: AGHT+IFqP4GPJSSoMgwrF3u8UlNK84FpvdUXDm2I1Uu0G53CVNKmm7CvgZPTYhbLEiTiPk46YlfXcztUthu/TNbZgEI=
X-Received: by 2002:a05:6512:3990:b0:52e:7478:9d14 with SMTP id
 2adb3069b0e04-52e7b8ec022mr150211e87.18.1719550470905; Thu, 27 Jun 2024
 21:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com> <1719544767-17994-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1719544767-17994-4-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Jun 2024 06:54:19 +0200
Message-ID: <CA+chaQeVNOdMCZuCq7SUnSVgwdvJnC11+mbhCoqrJ61fjj9FKg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 4/4] daemontools: fix build failure with gcc-14
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 04:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111142

see https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-sup=
port/daemontools/daemontools_0.76.bb?h=3Dmaster-next&id=3Dd196c0c1af16eba55=
f8f0277eea76129ed2f677d
which has the log as well.

On Fri, Jun 28, 2024 at 5:19=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-support/daemontools/daemontools/cross-compile.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/daemontools/daemontools/cross-compil=
e.patch b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.pat=
ch
> index 98d4a5e45..e37af2665 100644
> --- a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
> +++ b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
> @@ -13,7 +13,7 @@ diff -Nurp daemontools-0.76.orig/src/conf-cc daemontool=
s-0.76/src/conf-cc
>  +++ daemontools-0.76/src/conf-cc       2014-11-26 09:34:38.828812162 +08=
00
>  @@ -1,3 +1,3 @@
>  -gcc -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized=
 -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings
> -+${CC} -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitializ=
ed -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings
> ++${CC} -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitializ=
ed -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings -Wno-error=3Dincompati=
ble-pointer-types
>
>   This will be used to compile .c files.
>  diff -Nurp daemontools-0.76.orig/src/conf-ld daemontools-0.76/src/conf-l=
d
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111137): https://lists.openembedded.org/g/openembedde=
d-devel/message/111137
> Mute This Topic: https://lists.openembedded.org/mt/106922379/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

