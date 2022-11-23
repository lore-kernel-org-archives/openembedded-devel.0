Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E11C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 21:54:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.9259.1669240442921078655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 13:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xd4m47c/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so2243734wmg.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 13:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcTa2drc/6LiWKIDKpbxozDbd4y7IgS/jSgB6UoZWuo=;
        b=Xd4m47c/Bguj7qhF3n0TouwB+RtplQ1BK42KzYFO7wS8wJ7HvnDD+Cu94qqLBW4UK+
         nICe6h3P41GcajPgfLKhSrhZjaAuUvvsvNqLdS8/Y/quLgg390kWIsoULHBtiio3Q4Ii
         fZ26z5c2RoJyEYZ8rUnwbwjml0CJwyiT7oAhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gcTa2drc/6LiWKIDKpbxozDbd4y7IgS/jSgB6UoZWuo=;
        b=WHufLhVYo9etnqG4KC1oVDWLCDhJ92R3xKY7tpTTRn1Uzy6VN6Gc5uBFro+mTYISb4
         Pt5V4gMWiHjPOe6mYWi8avq68PL9crYnw+XpsiLOscLx/3jjU4++zwWrJrhvCujIqCKJ
         fMpMYXQfhxOMycsKGTbm1JdbffTSehOqsnw2WCEXWJ95LhKRqrWRjrkd4IONi5qnaEsU
         sHYxk7GdJkCDSvHgHW2Gfai8YBVaR+3G2SnMEMZeWGANITONumlAgU+5+DyHeOY8Dvri
         7KzatbLeEfOAE8F89EXmNYjOu/gT/L7tDidAtbonKkOiI9eKRVbSTbQ5MKlEsvD2HEav
         91Dw==
X-Gm-Message-State: ANoB5pmGFhG9fIqit0ei7jNYqhkZfWCW99VNZe4zzQXj5ZlGEPqQzUMJ
	KNIqjyKJh52MHiTdOf0dKkcOJQ==
X-Google-Smtp-Source: AA0mqf742lVETx0n9OibbLEZKwB1FSU+l+ZfDx92NylY6kVZOJJKrEi2h92QCmsxgUtzQtc69HnPtg==
X-Received: by 2002:a05:600c:3c91:b0:3cf:6f23:a3e3 with SMTP id bg17-20020a05600c3c9100b003cf6f23a3e3mr2926711wmb.1.1669240441249;
        Wed, 23 Nov 2022 13:54:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4038:3d32:5f00:5957? ([2001:8b0:aba:5f3c:4038:3d32:5f00:5957])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c4f1600b003b4935f04a4sm4771629wmq.5.2022.11.23.13.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:53:59 -0800 (PST)
Message-ID: <6cd78cd57b8c2099946452ce3257e240da11efbc.camel@linuxfoundation.org>
Subject: Re: [oe] [PATCH] kbd: DEPEND on bison-native and don't build tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ola x Nilsson <olani@axis.com>, openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2022 21:53:57 +0000
In-Reply-To: <20221122160039.3693939-1-olani@axis.com>
References: <20221122160039.3693939-1-olani@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 21:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99705

On Tue, 2022-11-22 at 17:00 +0100, Ola x Nilsson wrote:
> bison-native is required if any .y-file is changed.
>=20
> Add --disable-tests to EXTRA_OECONF as the tests are not usable in
> ptest - they can only run in-situ - and fails when building with
> -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64.
>=20
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/recipes-core/kbd/kbd_2.5.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/k=
bd_2.5.1.bb
> index aa3ab6e121..75b3c2765a 100644
> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
> =20
>  inherit autotools gettext pkgconfig
> =20
> -DEPENDS +=3D "flex-native"
> +DEPENDS +=3D "bison-native flex-native"
> =20
>  RREPLACES:${PN} =3D "console-tools"
>  RPROVIDES:${PN} =3D "console-tools"
> @@ -18,6 +18,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${B=
P}.tar.xz \
> =20
>  SRC_URI[sha256sum] =3D "ccdf452387a6380973d2927363e9cbb939fa2068915a6f93=
7ff9d24522024683"
> =20
> +EXTRA_OECONF =3D "--disable-tests"
>  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>                    "

This needs to go to the other list. I'd also want to understand why we
don't normally run into any problems despite the missing dependency?
That needs to be explained in the commit message.

Cheers,

Richard


