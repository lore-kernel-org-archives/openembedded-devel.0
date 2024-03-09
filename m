Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB229C54791
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 18:53:47 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.18765.1710010418271531439
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Mar 2024 10:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h5R2oh4k;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2218b571776so1498800fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 10:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710010417; x=1710615217; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfZuStMIs640GunrDDQRXmcMTu7Wv8oYyB28H/j9rcs=;
        b=h5R2oh4kOb6sQL5GbYaP/fgRR2OGXPr6m5rds8ZSXzUBwoWIFKWiDvhpjSP+wvyP0K
         rNt2rtEmdepgSaKTcxuKK86br+lb7TRA130uCo/kpwHMbKBRbDIiaM/+YacK68jW9IGO
         7vjZMsfMK87UdlGjgc/tjzrwK7xJlltvavPudCa5jyTzT9j8fbyNCXNA1dNgEap275G1
         OSka4IE8k6DyZVPsZhBQFE27JwZ1UeH1J3u6LECZ4w31ZSNrxTMaH4afhZnYvxZeKrfP
         Rjx+GBleYJquKJFoAW0FMLmZ4HtT6qLF1ehI/x+UhchXVBGGr9Wgv8RYXvwyYSUSRMrQ
         8Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710010417; x=1710615217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfZuStMIs640GunrDDQRXmcMTu7Wv8oYyB28H/j9rcs=;
        b=IPiO956zhQYDxLkIJOqPy0KS2P1gJx3+q1fPoF96UYWW/f4C+Q8wuec84hk33WxQlr
         q4F16lKZETdtyRi/njnMLcC3i8IvzYJbTNdnG6Kw14dLmHwT9rrbRKE5DsPa0FZqF7cT
         XNgfIFnK333kK2daonGfHO6k0/hf2vwaZhMNkEQ0b2PdUVRyI7u+RH8YPfMwEbExvMUm
         rlJ+RYZvMUyWIz5jIxqcFEYLaiSzwtuZcI90E/idutr3JQmUO0r5AZTE868HO9Xm99dh
         Sls89dX6pGMuk1jp21vBEZr7q8+4IyRdOW1xfzYrPZnKdOQgrbSionC2X8jIpT/0Sy3t
         sKJw==
X-Gm-Message-State: AOJu0YzA0haJpYyOolmE/sHU/VI8hYMYmSjgLbvR70VdEd1fvxKo6nNo
	er89Nj04jnbBc83sYc+mM/X/qFoCsA2USt1MNRdNBeb02rJAlvOLC42EIFubYmvHDlmUjaZaqOT
	xeMmxMcS31jmgPePs0ufWAPgIFgQ=
X-Google-Smtp-Source: AGHT+IF20NwItMopv4M0wN7cxYz8a9z27oiBOQyumsXm1QBHLhHWcE9TRhVAAzMNHrCV/sSSS2Rq/oabmbEAbRpslNE=
X-Received: by 2002:a05:6871:60e:b0:221:8143:eeef with SMTP id
 w14-20020a056871060e00b002218143eeefmr2726668oan.3.1710010417392; Sat, 09 Mar
 2024 10:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20240308190829.2442866-1-f_l_k@t-online.de> <20240308190829.2442866-4-f_l_k@t-online.de>
In-Reply-To: <20240308190829.2442866-4-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Mar 2024 10:53:11 -0800
Message-ID: <CAMKF1spJUP-Dg2jZBPSiG2dMtNcMCVJCtB18TO6oNFsfkmSxCA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 4/5] gnome-terminal: fix reproducibility issue
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 18:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109246

On Fri, Mar 8, 2024 at 11:08=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> gnome-terminal inserts lines containing ${S} into the source. Although re=
quired for
> compilation, it affects reproducibility for the src package.
>
> Fix this by simply not packaging the modified source code
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb       | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> index 53f11e95f..3bbfe9ece 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> @@ -31,6 +31,8 @@ PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtrue,-Dnautilus_exte=
nsion=3Dfalse,nautilus,nautilus"
>  PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue -Ddbus_inte=
rface_dir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=3Dfalse,=
gnome-shell"
>
> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> +

While this will fix the problem, it might degrade debugging
experience. I think it would be good to look into
the generated sources and see why they embed absolute filenames, often
the reason is that some tool
like lex or bison is used to generate them and it encodes them due to
how it is invoked especially in cross
compilation. This can then be fixed by correcting the call to lex or
invoking it in appropriate dir to avoid
absolute paths or use particular commandline options to eliminate the
absolute prefix.

>  FILES:${PN} +=3D " \
>      ${datadir} \
>      ${libdir}/nautilus/extensions-4 \
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109234): https://lists.openembedded.org/g/openembedde=
d-devel/message/109234
> Mute This Topic: https://lists.openembedded.org/mt/104815316/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

