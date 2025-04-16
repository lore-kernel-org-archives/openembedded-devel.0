Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF37C369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:09:36 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.29820.1744834167076682623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NEQ/ohBk;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-603fd257386so1751eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744834166; x=1745438966; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVB32yyI2x4J3WJwe/NSwlVJO57mnF2y+P9bhBPupUI=;
        b=NEQ/ohBk4qpuA8PyKy15sDpmkEHOv/26URrF8+/hF/uhVi8wFi0vXyYNaGPAAt3pNN
         0Q0E8ekeJo2cGsHf55fLBF5/zmFAzEa+BYlRNejkN/IflrL2J8r5CMv326aFNb6vc+75
         kjHnxmFYQxBlKfPmHUfb2VpSQZhUBwzqq38PBrjD/w04q/m6791MKAik4aEQ71IL5xjE
         21IyGSnnyuLWUQTyPR1cb4I+a9geZMYPRMXgUGA1vL66/Cc61pp0D0W6YiUxtJ78kXfM
         8xchDdk6Z5KmIWNngEjWWGT2VNihgN0eU5spDFcQJvieOGWYY++3JI8xR3c/tfgB/I5w
         VnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834166; x=1745438966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVB32yyI2x4J3WJwe/NSwlVJO57mnF2y+P9bhBPupUI=;
        b=ICIAd1BFjghAkKeN7vK6vxFZ+Xc69hMjmAMbRMMmftQqCp7STwGhgrsD9V9GZICU6v
         qKd21H/hKjef0xp5wBoUdog2PQD7g3OuWy/gvtA5ozePZYrI7bS/fr02zQxJ0hW/pm+8
         SzlpbnZrtZe17lJ9QQI97zBQ/qqoEm8xigDc4ae2HJTmA2f7O0lkaZeH3atS8JR+yrrH
         Z/G62LW+JVYZXZF/zoXF/8ggVbp43oCGqd7iospxQy2OARpi5OuJi7JCQkolan6oBJbm
         Hhat9yBz95C+bYTYpx5nsmbXeU3ywIi4yvujMHepEMLolC96lo/06CBar5pS2xerM8pp
         /KiQ==
X-Gm-Message-State: AOJu0YyGUNSASZgiU9+L4/oK/b3jjOs2vP9guO4ppRmoiIua/60pnuuZ
	WnBkfYksYisM0lJzt2XAQlSEWQYr3E2WXU/NC37ran2eKOOpZ7REleoQFGQ2yrjV1JNxBtH/cpZ
	XzHyUuPlmM81JZuKFo/sIqWh2OEk=
X-Gm-Gg: ASbGncupxiOqNqkEs0HqAHRQXjTQdoGNgBmcAgpvt9LngGxvEA0skhuj63PNMGBUP8c
	RQ72CFPLSTRfV4sNVk9UXydqfNiivvvOmpTE0oB5UBqZHzb0umXQYp1wJ5pWZl9aFSSmmF5a2ty
	OgfwFsIg3NSN7/G0/V0ThlncAfiKwVgYmVleuY/c+pFXjQrv1AEu4=
X-Google-Smtp-Source: AGHT+IHOeIihiu3sZbOn6ecVmezcoMDBg2A/XHuUq741ZNVmoaekj97ePO73fSf23Bl8fp6u/4OcXGeZrvacuOYAvHo=
X-Received: by 2002:a05:6820:174d:b0:604:9c9b:d096 with SMTP id
 006d021491bc7-604a92aa8f8mr2040962eaf.4.1744834166268; Wed, 16 Apr 2025
 13:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250416134410.712154-1-f_l_k@t-online.de>
In-Reply-To: <20250416134410.712154-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 13:08:59 -0700
X-Gm-Features: ATxdqUHaaBDUnq9IUl4SozuU0Mv2BycYZLNKN3bRAWOy8joR0L2NOsCLnKIQkZA
Message-ID: <CAMKF1srbYXLicn2wMEFhT70M+7trV_uLjDgsPmwwOnPt5RQyOQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] gnome-remote-dsktop: add requested user
To: f_l_k@t-online.de, Yoann CONGAL <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 20:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116914

On Wed, Apr 16, 2025 at 6:44=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This fixes:
> WARNING: gnome-image-1.0-r0 do_rootfs: User gnome-remote-desktop has neve=
r been defined
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gnome-remote-desktop_48.0.bb                 | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_48.0.bb b/meta-gnome/dynamic-layers/met=
a-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_48.0.bb
> index 5f8a06c5c3..bfb603514b 100644
> --- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
> +++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>
>  GNOMEBASEBUILDCLASS =3D "meson"
>
> -inherit gnomebase gettext gsettings features_check
> +inherit gnomebase gettext gsettings features_check useradd
>
>  REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
>
> @@ -36,5 +36,19 @@ PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,lib=
vncserver"
>  PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common shaderc-native"
>  PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
>
> +do_install:append() {
> +       install -d ${D}${sysconfdir}/tmpfiles.d
> +       echo "d ${localstatedir}/lib/gnome-remote-desktop 700 gnome-remot=
e-desktop gnome-remote-desktop - -" > ${D}${sysconfdir}/tmpfiles.d/gnome-re=
mote-desktop.conf
> +}
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D " \
> +       --system \
> +       --no-create-home \
> +       --user-group \
> +       --home-dir ${localstatedir}/lib/gnome-remote-desktop \
> +       gnome-remote-desktop \
> +"

same question here for adding into meta-gnome/files/static-passwd-meta-gnom=
e

> +
>  PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>  FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir} ${da=
tadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116908): https://lists.openembedded.org/g/openembedde=
d-devel/message/116908
> Mute This Topic: https://lists.openembedded.org/mt/112294932/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

