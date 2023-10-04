Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2638DE7C4F1
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 20:06:40 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.4788.1696449992046394341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 13:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YjnWYips;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1e106eb414cso103834fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 13:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696449991; x=1697054791; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=so9GGiLLBG/O2Z7aqzFAxSHEVB4/8//lYp1muPfwAxI=;
        b=YjnWYipsa2YLxMtupEZq4BLk1/Pxvr8bvMhV6ID/NQWJE3om3u0/iwNAjL/p9yc2YS
         EEc8537L78Q7MzRhIGgFsOC606AMN3eZvFU1k+R+KO5BOsXJqXePc23p+Won+FST19t7
         gW/dU7LjIJ5Cwy2L9oTcapEDwoeuAZThY1KAwv0wSSOp7Ary8BtZdX7psrtXnCHQAYAx
         If22cIiks/65Op0ORoMVjLEQJ38FcJZPgyd1L7S8kB6v6nRd1qmGBB+jfqMg2pESJjjZ
         4KQJ2s7WvXOZYfFNFP3Q9OGZb1TZkvPOGeZ2XVffAO4g8vbvI8nNz7OBr5BNipPE2l+e
         7u7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696449991; x=1697054791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=so9GGiLLBG/O2Z7aqzFAxSHEVB4/8//lYp1muPfwAxI=;
        b=BF7GljrokDdKDRLSheItIyRk0eA9TlwyG+dGPXsGt8DPk5AMJ8pZyeTHQBP2cBKsVh
         rOqaTRzK2cXHSQU+y74sY/sTzFPQ2aDoF3rVcoP7/SJrzdcigZKPFnbDNX1YNvwIOPim
         DIWyW5gbGKAUSbgJOCauCEpQCwFlwDz0DB6NdtFpnlg/aygX2qI8dkSZU8Nt/UWpdI3Q
         8ZO+2p+LVI2viNQYuboPm9nleoQKFKgXtYVe2+EBmelMSFgSGPztR3tRthLJG4zEhDYU
         HFiO4lueB9DsbWLSohc8MXLrWeg5I06wwQxMvBmYgt5E18oK6wA/ZYg4USngFjQFRRcP
         ElLQ==
X-Gm-Message-State: AOJu0YzT6tLINuL8z6vWicsbkpSeizurZMHHBj+Me0rldV2/1ggP03r1
	rQT79P4M/sXBrvfrVgmA+gzfdb5xbKOjRQQAJ9c=
X-Google-Smtp-Source: AGHT+IGv1Zh2R22zilYuiQ66GSU65+6yjNrlDA6N4XHbqJDBo9OLLAZD1stEFITlCZnzQOu9Xoo23Bf8DXZszvnrunw=
X-Received: by 2002:a05:6870:9593:b0:1dd:7f3a:b703 with SMTP id
 k19-20020a056870959300b001dd7f3ab703mr3719696oao.0.1696449991290; Wed, 04 Oct
 2023 13:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231003205747.84389-1-marex@denx.de>
In-Reply-To: <20231003205747.84389-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Oct 2023 13:06:05 -0700
Message-ID: <CAMKF1sq3B8kq+dT1WMobwya_eVWOi_BTjB2xs5SvVjYGU70iKQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] faad2: Upgrade 2.10.0 -> 2.10.1
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 20:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105341

seeing this

make[2]: *** No rule to make target '../../git/include/faad.h', needed
by 'all-am'.  Stop.
make[2]: *** Waiting for unfinished jobs....

https://errors.yoctoproject.org/Errors/Details/739273/

is it some sort of race ?

On Tue, Oct 3, 2023 at 1:58=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Update faad2 to latest 2.10.1 release. Use SRCREV matching tag 2.10.1 .
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alex Kiernan <alex.kiernan@gmail.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  .../faad2/{faad2_2.10.0.bb =3D> faad2_2.10.1.bb}                  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-multimedia/faad2/{faad2_2.10.0.bb =3D> faad2_2.10=
.1.bb} (88%)
>
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb b/meta-oe/r=
ecipes-multimedia/faad2/faad2_2.10.1.bb
> similarity index 88%
> rename from meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
> rename to meta-oe/recipes-multimedia/faad2/faad2_2.10.1.bb
> index 1b4236073..5d54dcfe1 100644
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.10.1.bb
> @@ -10,7 +10,7 @@ LICENSE_FLAGS =3D "commercial"
>  PV .=3D "+git${SRCPV}"
>
>  SRC_URI =3D "git://github.com/knik0/faad2.git;branch=3Dmaster;protocol=
=3Dhttps"
> -SRCREV =3D "df42c6fc018552519d140e3d8ffe7046ed48b0cf"
> +SRCREV =3D "3918dee56063500d0aa23d6c3c94b211ac471a8c"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.40.1
>

