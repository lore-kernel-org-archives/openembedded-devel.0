Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.296.1623172839462895394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 10:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lH+SMw1x;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id g12so11179291qvx.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2jMGNDSwcEB7HhQnr/F/UVfnsBVfOg2Ft/gyGDcJjX4=;
        b=lH+SMw1x+a16QRYN9GWM7yZhWQm8lLF9h6iOCPNK2HjLtqpggB10kAtDJ9NHldPsTB
         NUcLENr4giiv5Fu+oGdTv0aVedXTZ2nlusBn+nEU8k0bFCXfmLLwR5JK4uK2IeC1Gob6
         JdJEgyCMi7/yiQbi5cp29gknwvQSDlhpwsG9UO/9p0LAGELnAi+0iOh9rMpy1MkkCW+G
         V89TbPQ9TG67Sxg7NqHTsvRzbygmA+6IR85UxEIFhUF8eUAOMAbiMSm+JC3mdO8aXXtr
         EtIdLfMEEHOcOAX1UDjqRnZ2MCvbeyC7J+JjhKWdxRxbejDozOTXIzb1n1r90XxJ8Jgg
         xmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2jMGNDSwcEB7HhQnr/F/UVfnsBVfOg2Ft/gyGDcJjX4=;
        b=FnUecWUPjxO5MtC39I5hm5JoSMUbDmpEAPUCykY5wV2gk1ugnvd9qD73gyj//CQt3g
         8XnVkbG9GzyHwgK/Xm3Icegom4q6gM2vah2H9sLe2TxXOt16zkxWOqKASID1thbuu07n
         n24wDzgWRQZuZcGrvpDlPllU7XNA3xuJB2LLIs4xa91dU++bWsRoEPQwTNe3AijmWWUA
         lDs5ZhkKTOE/0nUoyidCpkw64Rc7qP8b6q99m/+EQWbgWsROGKOmb7ClletbtlMVVDf5
         IS6/hI8e4Wu9yjmZ4Vf4Av3ueN+vIVKEEIDtWTaoW8y1CZa+YOT9d6XJW4qVgD68sJVf
         556w==
X-Gm-Message-State: AOAM530WIWwcpRQdsteQKh9fDAHJk/RtRbD01BMy4nxs6Ncz4T14AvZE
	HVGc+hTPQGM570bj7VoAsMtCpcKl2O33iuhIQHM=
X-Google-Smtp-Source: ABdhPJyUa8VheBeVsh+W1eHuMGTgP8V0Zbugy+QEEmkgDVCJ5M432mK4Rv/we92PbxMQC5V51NbdA2eCY1PZoq5Io7Y=
X-Received: by 2002:a05:6214:1869:: with SMTP id eh9mr1309488qvb.16.1623172838452;
 Tue, 08 Jun 2021 10:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210608062212.2887426-1-schnitzeltony@gmail.com> <20210608062212.2887426-4-schnitzeltony@gmail.com>
In-Reply-To: <20210608062212.2887426-4-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 8 Jun 2021 10:20:12 -0700
Message-ID: <CAMKF1srWuzL8WW31Nz0cj5JO=EGj106+8xkeh+dZVkTW6NiguA@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] gthumb: initial add 3.10.3
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing this errors

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1314

On Mon, Jun 7, 2021 at 11:22 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-gnome/gthumb/gthumb_3.10.3.bb     | 29 +++++++++++++++++++
>  .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
>
> diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb b/meta-gno=
me/recipes-gnome/gthumb/gthumb_3.10.3.bb
> new file mode 100644
> index 000000000..94cac89a9
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.10.3.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Image viewer and browser"
> +LICENSE=3D"GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f=
6552"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +DEPENDS =3D " \
> +    glib-2.0-native \
> +    bison-native \
> +    yelp-tools-native \
> +    gtk+3 \
> +    gsettings-desktop-schemas \
> +    zlib \
> +    jpeg \
> +    exiv2 \
> +    colord \
> +    lcms \
> +    libraw \
> +    librsvg \
> +    libsoup-2.4 \
> +    json-glib \
> +    libsecret \
> +"
> +
> +inherit gnomebase gnome-help gsettings itstool mime-xdg
> +
> +SRC_URI[archive.sha256sum] =3D "dab73f77cc2963ebe90112972c301441d228af3=
003cfef3f8b7300a6d5d3c212"
> +
> +FILES_${PN} +=3D "${datadir}/metainfo"
> diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome=
-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps=
.bb
> index 593e5866d..8771cb368 100644
> --- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.b=
b
> +++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.b=
b
> @@ -17,6 +17,7 @@ RDEPENDS_${PN} =3D " \
>      gnome-font-viewer \
>      gnome-photos \
>      gnome-terminal \
> +    gthumb \
>      libwnck3 \
>      nautilus \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'gnome-system-mon=
itor gnome-disk-utility', '', d)} \
> --
> 2.31.1
>
>
>=20
>
