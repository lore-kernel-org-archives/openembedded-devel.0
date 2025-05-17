Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE11C3ABD8
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 00:48:44 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.4127.1747442918399942495
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 17:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJgkRZnO;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6060200710bso1701626eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 17:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747442917; x=1748047717; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdHdF6tDwlfbdqfUH5q9KmCp+zVVYWNJ8gTg3XfnSIo=;
        b=VJgkRZnOp5OvvCBaFuGw+wtoguQL4cxVzAY3+bWET1Jp8nKk+DWRTe2QOM5Y0ejyIE
         vu7cyEF/ap7ScD/G0asB/PN6/XOzyJi1D07alOvUS9VdvvNydA95TXz7aPH+bOiiDOyd
         LR6HUXGsyx3+WvSfCHeqeZRi4pI3oPkRxCGzkMceHSIxygtzAcW68qkl7ez/oycZONpu
         axomKknxdCmGoM5DoMtO6MykWNwn4N9g0XSR7+V7oiGbufonggyV+5D1xLgZb4n2a1IG
         Wg+7O8b6KAJZfVP3ydIRHN+HjKTfG7udnGM8jMeo/PyiuKmDpTlCYeFOfG6FQd52OYKX
         yBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747442917; x=1748047717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdHdF6tDwlfbdqfUH5q9KmCp+zVVYWNJ8gTg3XfnSIo=;
        b=fbV5AX/7cSe/X8/tJMqsk591w9rDWaWAi4wt5skGe+T3AmCGYovVU7Gm//vKRnpSar
         yyO9Nj1PYnaAqUF3W03aSpzI8GzVE2/TA0cCMs4zdNmiXJZpkWmWx4hot7f1A9gO2S+H
         qjbJaD1d4M4HvhQk1qy4hchQa4zjUgFc0H3KJYg27YaSobY8XY6cbAS5oko3g3j9v5EQ
         i/+t4VOOf73uq8sxI7U8ZfxD3Zs505BEh6KZXkW0idD2Ie/kG1QtRAuMa0QN/K7Ob+Vj
         SgIZx3KpLLjpUlisJ0IibF/F2uC4ibBAlvjs5jO3ewLtqs6ufn6mAuJAqY4w6UIFO8nt
         qv/w==
X-Gm-Message-State: AOJu0Yzcp91r+DPE94Qy/REdc9i9y5F/e/Cq4lpEesfXMQxLkUazLpHl
	lFyCcfRSlwFo29fWwfHslJNq+Qd65kum4wFwocHP6+GJUx1H+xO09xGrenIFZo5395y0S7r5Gxn
	aenzTb7yJ+jFhG3qhznObA6EHcbpu5Z0=
X-Gm-Gg: ASbGncuZc8PfB8XfgE0p7U1ngbb5CIdKBylpjdcNEBmCcmDNAeBPjk0fS0zOxbR04e9
	RcWt5KnjGbr/LtR7WbKITkZka8MvNhr/kOF4JfQatGkiq2N5PHJlrreJh4Uy6+9tpkHok1tyZSa
	861O+9rI9tGi/ZIK14OAS6NT4fadNoWpSB
X-Google-Smtp-Source: AGHT+IHEKpmBPHLGLWtp/7iSHBN/FgVutLCRgBBdrsw2CboRMcCnXfE4OjUN3qj4k9idpnp78a5pzOCrYfUm0Vitcc8=
X-Received: by 2002:a05:6820:1843:b0:603:f973:1b6 with SMTP id
 006d021491bc7-609f37776a6mr2939335eaf.5.1747442917534; Fri, 16 May 2025
 17:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250516162617.2910805-1-f_l_k@t-online.de>
In-Reply-To: <20250516162617.2910805-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 May 2025 17:48:11 -0700
X-Gm-Features: AX0GCFs9I5cIbjAe5ers9tIUmVgzt8dxsUfxGskxmH_HmCs5i7woPa46ejCUBiM
Message-ID: <CAMKF1srLxh-ge+ud=7FKioaXhuABo_forxrU2fiDbu6vF2cZoA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] librest: update 0.8.1 -> 0.9.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 00:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117439

I am seeing this error

https://errors.yoctoproject.org/Errors/Details/854795/

Rest-1.0.gir should perhaps come from librest and not from rest package ?

On Fri, May 16, 2025 at 9:26=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - switch to meson buildsystem
> - add missing dependencies
> - use libsoup-3
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gnome/rest/librest_0.8.1.bb       | 33 -------------------
>  .../recipes-gnome/rest/librest_0.9.1.bb       | 23 +++++++++++++
>  2 files changed, 23 insertions(+), 33 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/=
recipes-gnome/rest/librest_0.8.1.bb
> deleted file mode 100644
> index 63372afa5d..0000000000
> --- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY =3D "library to access web services that claim to be "RESTful""
> -HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> -
> -DEPENDS =3D " \
> -    glib-2.0 \
> -    glib-2.0-native \
> -    libsoup-2.4 \
> -    libxml2 \
> -"
> -
> -GNOMEBASEBUILDCLASS =3D "autotools"
> -inherit gnomebase gobject-introspection vala pkgconfig gtk-doc
> -
> -GNOMEBN =3D "rest"
> -
> -SRC_URI[archive.sha256sum] =3D "0513aad38e5d3cedd4ae3c551634e3be1b9baaa7=
9775e53b2dba9456f15b01c9"
> -
> -S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
> -# * gnome environment requires libsoup build with in gnome PACKAGECONFIG
> -# * libsoup-gnome support was removed upstream three years ago [1]
> -# [1] https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2bb38a7bf722=
45cdf2f1ecad17e9a720
> -EXTRA_OECONF =3D "--without-gnome"
> -
> -do_configure:prepend() {
> -    # rest expects introspection.m4 at custom location (see aclocal.m4).
> -    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}=
/build
> -}
> -
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH=3D"${B}/rest/.libs"
> -}
> diff --git a/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb b/meta-gnome/=
recipes-gnome/rest/librest_0.9.1.bb
> new file mode 100644
> index 0000000000..f923c7c1cd
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "library to access web services that claim to be "RESTful""
> +HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +    glib-2.0-native \
> +    gtksourceview5 \
> +    libadwaita \
> +    libsoup \
> +    libxml2 \
> +    json-glib \
> +"
> +
> +inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
> +
> +GNOMEBN =3D "rest"
> +
> +SRC_URI[archive.sha256sum] =3D "9266a5c10ece383e193dfb7ffb07b509cc1f5152=
1ab8dad76af96ed14212c2e3"
> +
> +S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
> +
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117435): https://lists.openembedded.org/g/openembedde=
d-devel/message/117435
> Mute This Topic: https://lists.openembedded.org/mt/113148143/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

