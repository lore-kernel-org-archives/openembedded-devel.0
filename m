Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D6AC36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:40:27 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.4678.1743457220123424375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kdBO8BY6;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f6aa4b3a7fso1402051b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743457219; x=1744062019; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDtTm9tKaF/R97GZaLeotOtoP3FDsmoqWIoKcEQ0EJY=;
        b=kdBO8BY6jrxNcbq8Mx7SWuKOrKRINIQVWcHy3dD+FD/ev0ueemGuYVPS6OF7VfVsET
         BaTQaLkfrjWh44MPUydgpLqQJ/uBJn5S0c2/uYNZf+rBpRETYIXR2wNvM7UajP21KagF
         SfjT2jLDBSoVHUj+6QzyNKIsZ1TPLwz33okqvHubRYyzp/0r2l67Aun/yzBEKjx88j6K
         muXBciCI73UE5p/YGyy72olWW3s6+NbiQ/FEb1HkZu1kbg2ndcvX8fbP/TrSgMPmPjyc
         XiXlrgPN1JJ+KJzO0LKkC2M/YlNZkdr7U3+46HUZYHmYJ3TQ+fwbBWNDA9YCHZln8Ttq
         7WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457219; x=1744062019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDtTm9tKaF/R97GZaLeotOtoP3FDsmoqWIoKcEQ0EJY=;
        b=ZNKuqV9hUS03wTS1q9ObEKmkMl6DkyPBY/nGaKLMQRXBdg3v3t4kDlDpT346saUDKX
         KBC/ITKok0X7DuHV3Eoy0pySfUe9CE2bEEAbDtgm6eShyQMGdZrNnpvFZXUWQZf3p5b4
         xCVonugiNTjzXIRLFXdHsgyZv017QJ3U3WoKTzVmLKE4y+yUZaZpWN888hDXgG3t8MBW
         nJJy2ysgmmq39YIxH09zZLPBmLEDdvC+yycw4Zcm6tXkGhUBH6Ia5zZMXmDdqXxIID7b
         uno7CUhwzypRmtiuHzasUJn4kczMUNhi24rJuQ95JtIG9xk7cdjaYCm8SxI+NPJ604f0
         uKGQ==
X-Gm-Message-State: AOJu0YynpmrPqzEqpnj/7JBGDoNsEc4OljLKlFWed+q7IZfPdi6yL6Ei
	C3R1X29xfFhxPRIJi+X8GRnY5nCIUCmu0QGiGtBSRMvQf7nYZiyFeypfYSYZ7FTIvmQ8Qf3mFem
	xrMJxUkwjD0S2Z0M5pdEkZr0nMec=
X-Gm-Gg: ASbGncvKXiYkZltWGE+m0ZX4YtVlQxGrKPw/+fZ5MuRXPuMwFdoM6NtpE+wnaRukU7r
	hqGH+10PFfF0tsPRiNwK0OaFndsKGZ/7Fr0DgaOz4k/B5FCZCFnnridnvP7zsO97fw1w62ETx1a
	4zlLuACBhpp1ka6yA59c6sgAmy7ZYqudoWj4c=
X-Google-Smtp-Source: AGHT+IHnXfgyeXlDSLT8DIh+dKwNePSlA8pySm+ah4icmvRd6T5yRW69pZw772oVzD3CEcxBEMtnWjAAfaeUxLne+WY=
X-Received: by 2002:a05:6808:ed0:b0:3f6:d59c:6a40 with SMTP id
 5614622812f47-3ff0f5a7e25mr7844360b6e.28.1743457219144; Mon, 31 Mar 2025
 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250331062237.8115-1-f_l_k@t-online.de> <20250331062237.8115-2-f_l_k@t-online.de>
In-Reply-To: <20250331062237.8115-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 14:39:53 -0700
X-Gm-Features: AQ5f1JpmzWdwx6J42X1uPrhHJ3d3QrXDtTJ1xmZd-aqv9ESEzjhDWjMjzQuJuQQ
Message-ID: <CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] celluloid: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116458

On Sun, Mar 30, 2025 at 11:22=E2=80=AFPM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> Celluloid is a nice and clean gtk4/libadwaita frontend for mpv that impro=
ves
> usability in gnome
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../celluloid/celluloid_0.2.7.bb              | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-gnome/recipes-extended/celluloid/celluloid_0.2.7=
.bb
>
> diff --git a/meta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb b/m=
eta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb
> new file mode 100644
> index 0000000000..d4aada37ff
> --- /dev/null
> +++ b/meta-gnome/recipes-extended/celluloid/celluloid_0.2.7.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "Celluloid is a simple GTK4 frontend for mpv"
> +HOMEPAGE =3D "https://github.com/celluloid-player/celluloid"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8006d9c814277c1bfc4ca22af94b5=
9ee"
> +
> +DEPENDS =3D " \
> +    appstream-glib \
> +    appstream-glib-native \
> +    desktop-file-utils-native \
> +    gtk4 \
> +    glib-2.0 \
> +    glib-2.0-native \
> +    libadwaita \
> +    libepoxy \
> +    mpv \

I think due to mpv dependency  here amd mpv needing ffmpeg this needs
something like below

EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED",
"commercial", "0", "1", d)}"


> +"
> +
> +inherit meson gettext mime-xdg pkgconfig gtk-icon-cache
> +
> +SRC_URI =3D "git://github.com/celluloid-player/celluloid.git;protocol=3D=
https;branch=3Dmaster"
> +SRCREV =3D "a7d30b11693e48b18637eb8adc3cfd6a07794680"
> +S =3D "${WORKDIR}/git"
> +
> +FILES:${PN} +=3D "${datadir}"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116394): https://lists.openembedded.org/g/openembedde=
d-devel/message/116394
> Mute This Topic: https://lists.openembedded.org/mt/111999601/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

