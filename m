Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7884DC54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 17:12:56 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.1885.1710436366653992089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 10:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Atnwrqeh;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-221816e3ab9so745381fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710436366; x=1711041166; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJkbvP4MMsp+f1qlpW8ayhGDVcgh+XdYPAgi42y9FiQ=;
        b=AtnwrqehiTENx2Fcg2LlQpZDZWgL980MWHBhBgx8k20HolssCMyspM3UqaOKI8tS1g
         0tW6f9EJh1B+jC6wZFES2NuCkz7kIf+nj7votUrwH7CTI7O1wS+o363Tce/zd5mdNUdA
         TJ9nqphk2xwe1upDtM9OliSrcj/0tp6ZP6sZvTNcwADb9H5AV0BlQ02GIgZpzYuOluda
         bRepgdZuf0x1AcNVpXFRugeGCGCH7LzdbXNCwzkLJlxusMd+UX52941G3wXjeQDDSaGq
         S2QqvPrXE5cnJBvhwGOn1nHP+N1sdN4Qqo38I+PDnaQPybbzsXJMDhW8OQ43GYEmuFAc
         z8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710436366; x=1711041166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJkbvP4MMsp+f1qlpW8ayhGDVcgh+XdYPAgi42y9FiQ=;
        b=XqzRNMd30SKfJv0vPOtG3ws5TaYLVpBRIjM8XJWgOqxBLEWggNUWGo3pBssceozZKg
         UQ2a0K7wi2U7mBrovKcDk4hL0Ihgi9B+AgjLvd8T42hKhbsiMi/pB5pqphJxVlNCGN1I
         GfO1gAaDNMXIMLoQVqwVhXJNuVlsyL1cPMiGX9WSjjfiXXPpktaLfik7AwlD+OVPVPw1
         WBLeROFy1s55H+Yg7mWwku0iWomo70zuR4pfs3aZoNA6jk/9Z3/nMlkYCqqSXRZ7RWdR
         sFP3LRFE3Yhb9wB/gkk4YqZ8ww1DUjlndpgR6u9YV6aBKUGfbMCIvHBmtSN1K9L5DMVD
         +OJQ==
X-Gm-Message-State: AOJu0YxfO0dDZzxk1yXXz+B7d+fw4CzobkbGrU/GjIOwjby04lFIKJ2v
	9+8J4hw5iMBtrf7sAfBLcx5IdxckEW9m3lGeqSIcrrvodte/zCxZzb1e/ywOekr4PfLasSWpbE6
	EMZ3tYlITU9HEYOw635+zWg0l0ckg3nqSvsI=
X-Google-Smtp-Source: AGHT+IGKguodqyYrgeZy69G4JqtpLAjjeNvJBF8y7mpys19rZjt0OEOKKbApFHzRLDc0Y5dED9OND+4jMaRm+JsqWrw=
X-Received: by 2002:a05:6870:9d8c:b0:220:8d07:1670 with SMTP id
 pv12-20020a0568709d8c00b002208d071670mr2576242oab.29.1710436365797; Thu, 14
 Mar 2024 10:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240314072215.6854-1-changqing.li@windriver.com>
In-Reply-To: <20240314072215.6854-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2024 10:12:19 -0700
Message-ID: <CAMKF1srgr=EqeoZXiYLjzvjiQ_fH6csQHDayCQXX2rcED8ZVyA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] postgresql: fix a runtime error
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 17:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109314

On Thu, Mar 14, 2024 at 12:22=E2=80=AFAM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> initdb on target will fail with below error:
> 2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library "/usr/l=
ib64/postgresql/dict_snowball.so": /usr/lib64/postgresql/dict_snowball.so: =
undefined symbol: CurrentMemoryContext
>
> Refer [1][2], for cross compile, --export-dynamic is assumed as not
> supported, and cause above error. For oe, both gcc and clang support
> --export-dynamic, fixed by set LDFLAGS_EX_BE directly
>
> [1] https://www.postgresql.org/message-id/79e63515-0f5e-30f4-136d-96e23b1=
a817d%40posteo.de
> [2] https://github.com/postgres/postgres/commit/9db49fc5bfdc0126be03f4b89=
86013e59d93b91d#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47=
f1d5daa810
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
> index 868a2e443..e29a5bef7 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -35,6 +35,7 @@ LEAD_SONAME =3D "libpq.so"
>
>  # LDFLAGS for shared libraries
>  export LDFLAGS_SL =3D "${LDFLAGS}"
> +export LDFLAGS_EX_BE =3D "-Wl,--export-dynamic"

this will add all the symbols into dynamic symbol table which may not
be best scenario, can we just export the ones needed ?
perhaps look into using --dynamic-list.

>
>  inherit autotools pkgconfig perlnative python3native python3targetconfig=
 useradd update-rc.d systemd gettext cpan-base multilib_header
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109311): https://lists.openembedded.org/g/openembedde=
d-devel/message/109311
> Mute This Topic: https://lists.openembedded.org/mt/104922226/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

