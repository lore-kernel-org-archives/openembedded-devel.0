Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAE8CCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 16:57:48 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.1350.1760461061532561755
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 09:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxW1jMzT;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78113fdfd07so27998517b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760461060; x=1761065860; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=767x6jzeRfrSk1MLgP6XIuAAetxD4yzDgA42n08eCdA=;
        b=hxW1jMzTh5dCZpN8bAzcEqBH+4x532oFiV6DznK92ziw1kMNpRhUSmGwvD17e+5KTm
         JNFURP+krD3Y9jOc9mckewtyFEtehcHvDl+13/n+oNIZAQt1VW9SG+XGMCqfmAB74W+o
         GRzrDrdlKp8fTGRyucMUYvxerDt+iMXNwlF6wKGwSRyTFSrphSgM2hS5qP92SWwjpqAC
         MU3RBKtWUEVwDFttBFCXLHSKFl9HNIh9eHDKfKc0W3M/hHFktj0f5C5vuR/5nDZZcuMt
         QYZmyj3P6r683mQrGm8t13qAIEgnGEBC9y5THb7TyDCYtQZ/AYh/PrOXSdWSKAxZDyQy
         VU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760461060; x=1761065860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=767x6jzeRfrSk1MLgP6XIuAAetxD4yzDgA42n08eCdA=;
        b=Kg8J2rupiXOpu6iRlqLYAz6O9zRyGCHiyMC6mR6cD9dCTTG2Sv3QeVOLJ3Rni2wXJ0
         VnvEYJGAOznDRABxxn40jigJBGT4uAhxd448/y1D7kRAZTfaWAZcNS+DT267Vm7+0dSB
         jRZlrcEaUn9Q3/JtwnWKOE78cKpsZA4NeyCHBAqZAeYlLvUhtYHEO/9NVF0TB2ECne7Z
         OM88qISoosNFhW6UMWLWCWatzC+plKZLNbAn7RRAEd0vqReg1RI1rObdriEDg9j4OVzQ
         N/lYR5QR/3RXhjzRhMDfADkPkpF2y256H2ySlVyPG/oKWU8/dOXj8LLZX78Y44wirMrC
         krMQ==
X-Gm-Message-State: AOJu0YycDjvfqL0XE9mUQxeiDS2+CPLhbAL2CVTc//hjaIsYOviILIKZ
	bMG5I84NpOgEqjDFcbgtFCQRGjaq0s/K0EgSJnwgvIDgMg4IJHRqHRmO9m3vw2eTXDO0OVMYJHH
	9ElrVneM193bl7RGPbq8t7fxIrzrRsvA=
X-Gm-Gg: ASbGncvo5MBOHvz8ZfRi9KWLq0yC90XBcpITm1gye0UKsXDA0PPvT2+LLIB1TIkBVYZ
	m4F+jmVAtZUx8AXuv+cSuo7OnkYGPOGyBuK3FAw54IkR5mNvQwKmIqbH+HiZmFbKFhBRs020oCG
	0ez55hzu5bjB7mfydYUul0gUjgvzm9jY6wiiPvH/kelVoVtfQgmC28cpCUROyw8XGUrtEM0oz3W
	ADhuqXx2e8eSj6MRwKkVhZvdl/R7DtSC0QzKQMXyPg6xShHJjbxRf87fb6YXeZkMot4
X-Google-Smtp-Source: AGHT+IEwn3XlUPXks6ab82WDhLaMoqRmHYcsdWns36CcVanyiOPrhIEb/Se8lhlbmbYzibJPBBAfJBtdjB7PjEXHr5I=
X-Received: by 2002:a05:690e:201d:b0:636:f08:8ae3 with SMTP id
 956f58d0204a3-63ccb7ea48emr15187090d50.9.1760461060552; Tue, 14 Oct 2025
 09:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251014155909.575819-1-marc.ferland@sonatest.com>
In-Reply-To: <20251014155909.575819-1-marc.ferland@sonatest.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Oct 2025 09:57:14 -0700
X-Gm-Features: AS18NWA5Q8-8rI4614XOQ1zEgqgUIai6y3XxAkxPSL2-i9IJcE9mLbud_gUDp-Q
Message-ID: <CAMKF1sr17ez67vcOxZ6EJ6bUiu4JyHjRrn7__fb4em4DokJ+5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] upower: upgrade 1.90.6 -> 1.90.10
To: marc.ferland@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120619

On Tue, Oct 14, 2025 at 9:00=E2=80=AFAM Marc Ferland via
lists.openembedded.org <marc.ferland=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Marc Ferland <marc.ferland@sonatest.com>
>
> Update to latest release.
>
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> ---
>  .../upower/{upower_1.90.6.bb =3D> upower_1.90.10.bb}            | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/upower/{upower_1.90.6.bb =3D> upower_1.90=
.10.bb} (92%)
>
> diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/re=
cipes-support/upower/upower_1.90.10.bb
> similarity index 92%
> rename from meta-oe/recipes-support/upower/upower_1.90.6.bb
> rename to meta-oe/recipes-support/upower/upower_1.90.10.bb
> index d2f58d5b22..e3ddc88126 100644
> --- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
> +++ b/meta-oe/recipes-support/upower/upower_1.90.10.bb
> @@ -12,7 +12,7 @@ DEPENDS =3D " \
>  "
>
>  SRC_URI =3D "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${P=
V}/${BPN}-v${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "aed4e42a21307512ad236ad58d7ee4e0196670c8524a168a=
0edccdc32964ea0c"
> +SRC_URI[sha256sum] =3D "c1baf418b685ffe4150c8a75c04da0cec70323fe094b5b25=
7b287eea564d3f56"
>  S =3D "${UNPACKDIR}/${BPN}-v${PV}"
>
>  UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/t=
ags"
> @@ -50,4 +50,6 @@ do_install:append() {
>      # remove integration tests scripts
>      rm -rf ${D}${datadir}/installed-tests
>      rm -rf ${D}${libexecdir}/upower
> +    # remove zsh site-functions
> +    rm -rf ${D}${datadir}/zsh

Hmm, recently we have added capability to use zsh completions. So
maybe package it into ${PN}-zsh-completion see
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/kmo=
d/kmod_34.2.bb#n55-n58

>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120618): https://lists.openembedded.org/g/openembedde=
d-devel/message/120618
> Mute This Topic: https://lists.openembedded.org/mt/115755235/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

