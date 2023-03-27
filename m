Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C08C74A5B
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:19:56 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.26691.1679887196496178956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BXxziF26;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17786581fe1so7852575fac.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 20:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679887196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80Hif3h4PQRUdCy2KWgFoQ8kMZuI3ZjPmyKtLNPx2zs=;
        b=BXxziF26CP7LwES8mHRSqYgEX+mnlMY6AU163mP9r02zEoLs6nXvwTz2gXuMJFvPLm
         W39afU9++t1m1y5MbmrGBL2FHZMiPdaMtwObkORuJcRxhsDeRCPKreyOuipjjb2njONu
         sue3WBV1pKnZFOtmcRbN++luKkJLkAAlyC5WoTtlsK5CyQOBY1qCDCOJlsy33BxDXsvy
         yP9bYwKS30me4ilrjfS9/dbAsXWv6qOQHArbmTG0pJO9pmv1U7DqAvibg43RGao/ywZs
         xHSS0ZPEhK3c6HIt6/pCj84RltQ9gKqRcFf81mjxTAMfHUfN8WJyV4E4i4O8eUHRe1N6
         4z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679887196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80Hif3h4PQRUdCy2KWgFoQ8kMZuI3ZjPmyKtLNPx2zs=;
        b=TU9/1Ug/TRsZ+eEl3eRLlQKoZ6L6eR4n7qCrGWa5IftNDjbJODQjbvXpbgUNwI/cQA
         DSsP9n4aywnDA+CryqzyWygqSLLihTuzfz4D2ZqMeAYBTJgSX4kvH2r3Kr859hurU3vg
         5N+PQtQGwZBsG49uMZtBh8o3SrguOFEziZC01GzX4wNber88tuBO030poRq09T7gOq0x
         SFkl1EMhdnTDd8Czs9HHJoMr/k4WkuKiu2RPb3JIn6j45QMXB5hUm1DykZS/2uIY8F9b
         TuUYDLD69lRMJsL4OgYoh+0bBo3HMFDdMsXy8q1SP6ZPbHQ5kxlATXx0wnbWFFY9EbcX
         Yp0Q==
X-Gm-Message-State: AO0yUKXe0j8SPY7W3lndoRKB0Sz5/w6406fpx9VMnwmsuXYmvFXI28zu
	R7w5jdG0Rh5Nei7M/puxf6oEIfFFTvI6X4VHRUP0B76BQgY=
X-Google-Smtp-Source: AKy350Zw1bxqtIHgcNsigb/Kz4tGtRyqGP9siljEOjt4RbpP/VJpyQFHUKpFoEylGQPAUSS5EUkAh78aRr3w/gm2VF0=
X-Received: by 2002:a05:6870:130f:b0:177:a5ec:b41 with SMTP id
 15-20020a056870130f00b00177a5ec0b41mr3502162oab.4.1679887195684; Sun, 26 Mar
 2023 20:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com> <1679886322-20954-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1679886322-20954-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 20:19:29 -0700
Message-ID: <CAMKF1sp3n_DGzT_bxX-fey49OEgvpH+0JL01LPdEgFPs97Pidg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH] gnome-font-viewer: upgrade 43.0 -> 44.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101766

please rebase on master-next and see if its still needed then resend.

On Sun, Mar 26, 2023 at 8:05=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> * The app now provides standard shortcuts like Ctrl+Q and Ctrl+F
> * New widgetry allows for navigation via the back mouse button, alt+arrow=
s, and touchscreen swipes
> * Various buttons can now be used with mnemonics
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{gnome-font-viewer_43.0.bb =3D> gnome-font-viewer_44.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_43.=
0.bb =3D> gnome-font-viewer_44.0.bb} (82%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer=
_43.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.=
0.bb
> similarity index 82%
> rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_=
43.0.bb
> rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44=
.0.bb
> index 130c26924..ff5e1e2c8 100644
> --- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.b=
b
> +++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.b=
b
> @@ -16,7 +16,7 @@ inherit gnomebase gtk-icon-cache gettext features_check=
 mime-xdg
>
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>
> -SRC_URI[archive.sha256sum] =3D "81c6bffb06d5332346e00eaecaec1bdcfd617c51=
dfd95bcd058d6c76c76dd2b9"
> +SRC_URI[archive.sha256sum] =3D "a1511df30b228cc2ef1175dd9d2b93438ea912e2=
5913404b263cf3d457bb9f97"
>
>  FILES:${PN} +=3D " \
>      ${datadir}/dbus-1 \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101762): https://lists.openembedded.org/g/openembedde=
d-devel/message/101762
> Mute This Topic: https://lists.openembedded.org/mt/97874734/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

