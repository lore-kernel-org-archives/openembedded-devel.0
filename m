Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2BBEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 04:13:40 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.65.1689135213230381338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 21:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l7FTvZno;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55e1a9ff9d4so207532eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 21:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689135212; x=1691727212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIFvnCZMJ3qeBPK8bCfk5LsjBPzFoGJMjeF4yAXmUTE=;
        b=l7FTvZnosKEvQlXApXgshJ3p691GIU18Hox/ln9dI+8XaTeCaXnBThjf4FQM2SDXMb
         iHWMEzAF6C2uH5WnYP1ACC6wG3oD99DYRUIiEtNHFIvcXovQsQDdjTsFJVVt4oMpC/Wc
         9Wvjwb/hmdryXaO1+l1anNvq/9VrDRJX9ORgjNgqFAmuLMkBdozViHmONYHPz9Mby7sr
         bo2MBi2d+Gip6Z6jL8kppGfZ7wFnpuXYjtCDNTDd9/35gnetPssoSmZ/t17191Ogg2BK
         zAuaRN8dyCfmtwC5Z1CFGX2CEf6SnkEG4BRVdGbWDoieHFQWgL4KaORiWXKVPIr9DbnT
         2dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689135212; x=1691727212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIFvnCZMJ3qeBPK8bCfk5LsjBPzFoGJMjeF4yAXmUTE=;
        b=EGt2BvQiRQod3P1amtI1lb8kpHQtYyGWz5OjvfmhClMcv5v9xaf1KGep0sZbXXwOGp
         RO49/FadKNon6pXLq9jffYosQs3icf2GKy885fIWELEyqjb74BCj2PmaU7G+61cmIcxO
         gtpHJP5U3p7g7lC0d3/xWy5UxAfzHUlfBhf9CQgUN7F0Nv0y3UnomUKd0ZxQ4SB7vSI6
         X/MvsOXVrFR+jgQBTsl+q2llrQnveFb6zxQ+43LEFmYbYdOXJrYNoqnREBBe4pHhVGiD
         F8tniXMTSCA/jo7l3z7+iNT672e4hrvnnH8d8TeiCXAmvZ8wDtNqq8C6s0/QeoAux/mv
         KFvA==
X-Gm-Message-State: ABy/qLYz+5e1YHFkrdfJ5rW+255ciDZ68IzgNjFXwEZwAP4UDw6fQQRk
	kFmBjcvGl0hgtYSaISt7IPJPA+8cmAG9UvWv2ZA=
X-Google-Smtp-Source: APBJJlEnG2HUbciRz4KeQk/ON6/9XJ+CA8IrKQWtw5ie/IyaqOERsqkWiOhLsLJbYd4AxWJMdDuFAk2vRcNt2msF25s=
X-Received: by 2002:a54:4791:0:b0:38e:e5b5:493e with SMTP id
 o17-20020a544791000000b0038ee5b5493emr671118oic.11.1689135212222; Tue, 11 Jul
 2023 21:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230712011122.105264-1-marex@denx.de>
In-Reply-To: <20230712011122.105264-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2023 21:13:06 -0700
Message-ID: <CAMKF1soi0_gwwkqV26a6HJ3oEo__=5LdugShV_MkQMVeZmWRCQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] libiio: update to version 0.25
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Christian Eggers <ceggers@arri.de>, Martin Siegumfeldt <mns@gomspace.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 04:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103736

On Tue, Jul 11, 2023 at 6:11=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> The version 0.25 has been released, it has not been tagged however.
> Update the this version anyway.

hmm how do we know where to peg SRCREV ? I wonder if we should wait
for tag to appear.

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Siegumfeldt <mns@gomspace.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_git.bb
> index ea51c19f4..b89ae29ea 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -4,8 +4,8 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a=
1b3a72c"
>
> -SRCREV =3D "c4498c27761d04d4ac631ec59c1613bfed079da5"
> -PV =3D "0.24"
> +SRCREV =3D "eee8cba6f42177a094ebe16759606a719676fda7"
> +PV =3D "0.25"
>
>  SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dmaster"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> --
> 2.40.1
>

