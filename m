Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04575C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 23:08:05 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.61.1684969684113188078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 16:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=X556JKYs;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-394c7ba4cb5so364131b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684969683; x=1687561683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Nyt1FbcmF42MphSEBu/V63L8IYTeA4c+kV92MN76BQ=;
        b=X556JKYsRnuzIpZa1hLZ5XBva0+WkBTjAQdl8z9LYblfLKKr94wfce9JYdfZQHswPZ
         pHT7MinW95s6HnjKGR3k6ZOPbIcrgDDJMOipOR8YOD83bucqeZbIK36CZ+IiLaUDKqzg
         TFbptSbITSGfXQkTYjhAYVTRBXYla7hMHSHCz+xytJuDqX36gC9GobniXpGllvwIg+jY
         aRVyF3NxoLhMoBtHhZqPBywETCMt/bK5mzORW6lUeDqixGyy//iUKn1ccrjkcSVA8S9r
         HIB38QkL6F1MSueQNJEqL+SUn1QTfBF0uBWxnrwD5r5Aet1/UK30BfjQ0twvhMqwa3Ql
         8ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684969683; x=1687561683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Nyt1FbcmF42MphSEBu/V63L8IYTeA4c+kV92MN76BQ=;
        b=jxv1vgG5OSJfdW83Snjih+IdeFb6KHIvxqX1hV/DxqArZf1WFOoun945x7d42tYXug
         0OmndDGNFgcDziqcPmSvxLnh2KCFTr3/BaC41XPqN8VdJOED9w5MxVCWkGiJpRvGG0Bm
         vyr+1x6wH7/lHK88QSo5jD1qXXjWaXVdZMGY32T9UqOiuxEiWIehqkyKGcgFam1ncoG2
         Fm5ZRCF0cmwaMyuhR3oSiFjpEj0j2+CS4UikbmeKegy98yvrZ4lPQd3saCcun8mVmFfM
         ZP44BV+KvMXvDKNSrlJ+8OFfVB9nNmmUx5wXjgidwy4LCO9NvJh5qf19sa8lnj7xZO3Q
         YKSA==
X-Gm-Message-State: AC+VfDz6uUzNlzQiA+xjH3PHI7GPU/49N45qoBH82ANTZIME9vi/e7YL
	/Ch4t4omeHcO7L0KL/lLqwlZWxJC4zVZQwTWsgaN/6zs/z0=
X-Google-Smtp-Source: ACHHUZ6h4embq0PhvLCpzmhYojcUexXKVLZgvODmMROxjrC17jxfsXZSFpzDeNfwb31/n0lke2t9BKBpnmDCiGWYwhI=
X-Received: by 2002:a05:6808:18a:b0:398:57fa:9b23 with SMTP id
 w10-20020a056808018a00b0039857fa9b23mr1179697oic.0.1684969683079; Wed, 24 May
 2023 16:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230524171438.122588-1-ross.burton@arm.com> <20230524171438.122588-3-ross.burton@arm.com>
In-Reply-To: <20230524171438.122588-3-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 May 2023 16:07:37 -0700
Message-ID: <CAMKF1soXa-2H8=mdoMURtW5E1Jfh7hHvXy5zHgBQT6PXKbJ2=g@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/6] firewalld: add features_check on gobject-introspection-data
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 23:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102794

I see some more fallouts with this

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2772

On Wed, May 24, 2023 at 10:14=E2=80=AFAM Ross Burton <ross.burton@arm.com> =
wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> This project uses gobject-introspection, so depend on the DISTRO_FEATURE.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-connectivity/firewalld/firewalld_1.2.0.bb         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/firewalld/firewalld_1.2.0.bb b/meta-networking/dynamic-layers/meta-pyth=
on/recipes-connectivity/firewalld/firewalld_1.2.0.bb
> index 987cc640e1..8efbd39f74 100644
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/fir=
ewalld/firewalld_1.2.0.bb
> +++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/fir=
ewalld/firewalld_1.2.0.bb
> @@ -15,7 +15,9 @@ SRC_URI[sha256sum] =3D "28fd90e88bda0dfd460f370f3534748=
11b2e295d7eb27f0d7d18ffa3d7
>  # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gset=
tings.m4
>  DEPENDS =3D "intltool-native glib-2.0-native nftables"
>
> -inherit gettext autotools-brokensep bash-completion pkgconfig python3nat=
ive python3-dir gsettings systemd update-rc.d ptest
> +inherit gettext autotools-brokensep bash-completion pkgconfig python3nat=
ive python3-dir gsettings systemd update-rc.d ptest features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
>  PACKAGECONFIG[systemd] =3D "--with-systemd-unitdir=3D${systemd_system_un=
itdir},--disable-systemd"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102787): https://lists.openembedded.org/g/openembedde=
d-devel/message/102787
> Mute This Topic: https://lists.openembedded.org/mt/99113395/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

