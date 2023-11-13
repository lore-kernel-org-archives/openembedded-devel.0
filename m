Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C78C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 00:08:55 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.26743.1699834126232824364
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 16:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3nqY029;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1ea82246069so2324594fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 16:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699834125; x=1700438925; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IohAW9ozAaQjei2IGDTrcq48daghNKmR3KSJQ3P2kJA=;
        b=k3nqY029OprWYHKUdDEobwHECsd/wzpuMhB3CjoBS9IXDAbCIj3AsPta0nxh2f/qJw
         sUlrqxr9kPdeeqAtmehfARYf4DyFhyGaDAwzEWAKsIGKnorqVlQlkSCR8fQTgjy/FUty
         kEib0IUq2PK+RnolUwVjzSX8nEo1IiFjix0zJjZ+qFZYzPMjy/PTlObqFoZo1D85ckkt
         T711y53RDQAIkBT5UBuXz2H+3EwRaWwrGarZ9nUIqhaF0k6T0otZ+PJ+sYZb5xx8IV00
         r/UpaNzpWuCUPqjNmnJmFcrnXyOlobE6X7PpMTMHR68jP3MROhSCjwKOMvjbGePstcYk
         mwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699834125; x=1700438925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IohAW9ozAaQjei2IGDTrcq48daghNKmR3KSJQ3P2kJA=;
        b=T9otrFp45Z4fKxiDDmKCD+eNIZEwevYKPSFdgwn6/y+xI44/snZOLByjbMujis7nJE
         BzS4eM1se5cWdZGLSXrh9QGnDYrH8urU/cRFsZflKbsIMH62qO4UU2fmcT01TFnnUYk1
         rZ9lbssvusTxLWAjnkuOp8wP9dZlQR26QfHTUL7CgbKFM0KY0U59FWPoyjsCcNL0TViU
         oBaG2F93lkurhKCW2Cls1JZdut+jz8bJWW2moQwC5uiIAev95L+an86XTHYFMbqchwuq
         vd7XjrwJadsSb2ZmLnlFRRmt2RPlNKJlUs6nKifeOu263utKT7ggdoGAfIEughn/ZgdL
         JsoQ==
X-Gm-Message-State: AOJu0Yyqlb2guoBzmUfk7tqyuOVb6OirNSebEZSWOdehOyXFkervuDEx
	5An4b2K1j6AaNc2FbM5/xW8Rm2OtOvI1aEnLGsM=
X-Google-Smtp-Source: AGHT+IHerIaw5JoTY8XanhUNEl6hNi3q49mPrp0HALLZLyuwSs9n1Yfe5ExNIChzrZUwapUxskil629Doha9D0sYKMA=
X-Received: by 2002:a05:6870:670c:b0:1bb:583a:db4a with SMTP id
 gb12-20020a056870670c00b001bb583adb4amr8049129oab.44.1699834125437; Sun, 12
 Nov 2023 16:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20231111205914.942045-1-f_l_k@t-online.de>
In-Reply-To: <20231111205914.942045-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 16:08:19 -0800
Message-ID: <CAMKF1srfP8_oLRiSEdfozKRQonUVDrbh9omk165v2Vvhiok0+A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-terminal: Upgrade 3.48.1 -> 3.50.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 00:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106619

seeing this

http://sprunge.us/WE2F64

On Sat, Nov 11, 2023 at 12:59=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-terminal_3.48.1.bb =3D> gnome-terminal_3.50.1.bb} | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.48.1.bb=
 =3D> gnome-terminal_3.50.1.bb} (86%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> similarity index 86%
> rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1=
.bb
> rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.b=
b
> index 8f91f7cca..f3eb0c6cc 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM =3D " \
>      file://COPYING.GFDL;md5=3Da22d0be1ce2284b67950a4d1673dd1b0 \
>  "
>
> -
> -inherit pkgconfig meson gsettings gnome-help gettext itstool upstream-ve=
rsion-is-even
> +inherit gnomebase pkgconfig gsettings gnome-help gettext itstool upstrea=
m-version-is-even
>
>  DEPENDS =3D " \
>      glib-2.0 \
> @@ -14,7 +13,7 @@ DEPENDS =3D " \
>      desktop-file-utils-native \
>      gtk+3 \
>      gsettings-desktop-schemas \
> -    vte \
> +    vte9 \
>      dconf \
>      libpcre2 \
>  "
> @@ -22,7 +21,7 @@ DEPENDS =3D " \
>  SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3D=
https;nobranch=3D1 \
>             file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch =
\
>             "
> -SRCREV =3D "1446ff0abc478bdd03c6665b718214d075729024"
> +SRCREV =3D "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
>  S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ?=3D ""
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106574): https://lists.openembedded.org/g/openembedde=
d-devel/message/106574
> Mute This Topic: https://lists.openembedded.org/mt/102532842/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

