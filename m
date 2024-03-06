Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83214C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 19:05:54 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.2599.1709751953949332503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 11:05:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=She1PF5q;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-21f70f72fb5so5128465fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 11:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709751953; x=1710356753; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+UjnwUhOURe4QXjTa5x0qRCwOBacqHLow/HpQlwFDY=;
        b=She1PF5qQ4s8ZxkkluJvkqVEqLKidhJbO4N5NnM9euX5Gbr6WH/t3cHsdu8UY8QISB
         xbhcDEi8lN6CuoLF4LkaoFR2lpfIzd69F9gTi3W1paG+yAOkS5ivH9DUoMRjJ0qWWTea
         HyPDGZWRBG9O9Djpfsnibj13p0FZoJKGHzwVGd97Rnrywrf1unebyLgK6qcJq2claKtX
         aaeb2nOacUOA25zQL/DGrCsWryyb2lkwe2BGZg0UWzFBwLtZsrkI78PGNCQkmNiKdr8E
         AJFUFbijdiFORtnntvkBewUx+Ido+XxDEHXGLuk17SDc7ixf6KxXMfFylZYgM1meTIP+
         IqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709751953; x=1710356753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+UjnwUhOURe4QXjTa5x0qRCwOBacqHLow/HpQlwFDY=;
        b=dHsNBNXd5GZki5eUNFCc2TXKuiVp0szTF/fSOEtYYRoB2p0b5t9hMKE+Uji5Ln1sxf
         Wv7s7DjMCnKwHgwjnuEQw3ES9wos1Nfkz+/oKHosIcL17UUYBoAPbXjetPzioSiWPCPg
         gfWC2nHmfVpYBt0KBtr001WAi8O4s8RejzdyKy9+6HNvejyBkxI9ksbMN92zSkQ+/6K5
         xf1WfLPvH9JeFt001D7LFmp6haNrszoPiMJ3dISdLVSmdmWABEyhzkpbPCnde7q4ijv1
         JlkdUW7DHfRHhxmjEvfoHly5B56X5ZC57wAW+awqfwSUTOuyGhtgn3qyIm4UF2axl88N
         HDrw==
X-Gm-Message-State: AOJu0YwKo3usZJQbvLXglr20UF1xHZmhtvxMRDVqp0grXkQfbuFTJb0G
	0rwVj6WBKea9fHAEUgSe7u+d6ikFGjesuiDVC2rW7w7tvHXEjLnyCEsyqTZGFqz3XZdI7rBAa9N
	g2LstlEkP6lSfR0G5BaxScuzMtxo=
X-Google-Smtp-Source: AGHT+IHFGH/9K/lOfyL2dXf9MaLk1qJjJGVUdKV+O6miNNGQE8CzvHoE9VPgUerdrqDiZvcwbWiXDi5PPrXIycLoMtE=
X-Received: by 2002:a05:6870:f623:b0:221:5a6b:4c1d with SMTP id
 ek35-20020a056870f62300b002215a6b4c1dmr2215307oab.48.1709751953105; Wed, 06
 Mar 2024 11:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20240306185724.14629-1-andre.paiusco@gmail.com>
In-Reply-To: <20240306185724.14629-1-andre.paiusco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 11:05:27 -0800
Message-ID: <CAMKF1sq_zE8uKtEWTOD=A4iw8wvTjcqAb+LgNhy6Y6h9vzTcsg@mail.gmail.com>
Subject: Re: [oe] [PATCH] ydotool: Add new package
To: =?UTF-8?Q?Andr=C3=A9_Belmudes_Paiusco?= <andre.paiusco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 19:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109180

On Wed, Mar 6, 2024 at 10:58=E2=80=AFAM Andr=C3=A9 Belmudes Paiusco
<andre.paiusco@gmail.com> wrote:
>
> Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb      |  1 +
>  .../recipes-graphics/ydotool/ydotool_git.bb    | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6e2012dae..dd033208b 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
>      xcursorgen \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "=
", d)} \
>      yad \
> +    ydotool \
>      parallel-deqp-runner \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "=
", d)} \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts=
", "", d)} \
> diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/re=
cipes-graphics/ydotool/ydotool_git.bb
> new file mode 100644
> index 000000000..83ab1fc37
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Generic Linux command-line automation tool (no X!)"
> +DESCRIPTION =3D "ydotool is not limited to Wayland. You can use it on an=
ything as long as it accepts keyboard/mouse/whatever input."
> +LICENSE =3D "AGPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deb1e647870add0502f8f010b19de3=
2af"
> +
> +DEPENDS =3D "systemd"
> +PV =3D "1.0.4+git${SRCPV}"
> +

drop using SRCPV here. just 1.0.4+git is good.

> +SRC_URI =3D "git://github.com/ReimuNotMoe/ydotool;protocol=3Dhttps;branc=
h=3Dmaster"
> +SRCREV =3D "c07ae72be46c40912023b91b8ba737630d8720e1"
> +
> +inherit cmake systemd pkgconfig
> +
> +EXTRA_OECMAKE =3D "\
> +    -DBUILD_DOCS=3DOFF \
> +"
> +
> +SYSTEMD_SERVICE:${PN} =3D "ydotoold.service
> \ No newline at end of file
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109178): https://lists.openembedded.org/g/openembedde=
d-devel/message/109178
> Mute This Topic: https://lists.openembedded.org/mt/104772656/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

