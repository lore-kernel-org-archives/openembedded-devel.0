Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FF1E67817
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 18:58:44 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86489.1766429918462462177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 10:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DmtMey4G;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64306a32ed2so3642089d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 10:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766429917; x=1767034717; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm69yLw4fGWSfGphRUl7ts+3jltNYVvY78eyxmGnRms=;
        b=DmtMey4GHFL0oTqvA5sH1RHKSx9jtvU+quya+2l0zVgIHZHPs4CerKRURYzlhTHE2F
         ZXWwmAal44FBow1cWCY/SwKFON3Yzwn9qe6ASUo1KAqur0VCl3idB5WkBS0XHG5R8peQ
         hwRFdUHmzljci3EfAhwcp83tlKST32LC3uR9vp3ob93iTWYoY8qIXvvicTRn6AK6oLmy
         OHU+lGHB2O61bKjeiV20CHTsZODptLE9SC61b69tWwSW7b3Qk2eZNR4CPDALqX5wLFXY
         VoPi/3NlwOoHPZMBcoiTjxbQADQF/bfW/+7aH72aKQl7ejUQ2tIT0GnbTC+URmQQy0B0
         8Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766429917; x=1767034717;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wm69yLw4fGWSfGphRUl7ts+3jltNYVvY78eyxmGnRms=;
        b=tT21Hl/cJsvCK1OL5b3F8jnMwQOX55hQL8D3nnlpMbIRj/6hcIJI9qXZkHEYSNLk/T
         oOaeGsL0eRipvA31gkNY1RKylSJwiOH9gSE6o03vzYKrmpsRoNfMQr2PWKGiMrCR2y7v
         G+H0oERv8dfuSf3VJocdmBtu31TTKaoX3MCQ5uch8/QJjOIa2lWdVXwe+KMODmkuZ/zi
         snW33aJXjFos/+j8ts910sZBhDErdzzTO5789jH+vlnOuL5aKAhtk/YqybtuBBIuHmNY
         1s8hC8bPLrc1YX/506zvrswp9cwwqvVh7qFdKhDnG4H+FSEzwwTPBja/GvZ5+IHaxf7m
         WGHA==
X-Gm-Message-State: AOJu0YwDWyOPRfT69U1hnQeaxGcYUT7Rnh9N4VCzZheuldsvyMQJOuCm
	3+h2bIOQBPHfsxugUp5KCXafnrpzYtkHKk+H6xyG7MJ3K3g21kIS+3lKffZsX1Us6013rpYPite
	RKS6Uh1xBD0ytoymD3HGVIAEd6WVrQjxiK06G
X-Gm-Gg: AY/fxX7dfOxGk4ZTZ4H6gY0EWqK9tl2s+RSDG10F+fxNEbRztQAHfXaaBqcRRbbw1Aa
	zQ+L09fjglyAMD5mrNtlTfV4Fi4lp3Jb7kL0d2X4mfEdXi2ayATZ7iRzS7X2OGs46gsgdHncsys
	UbFgGMiuRcJRGtjsW7ftWxJuYlNRbj/ECUBVNZxQ8m6cH/GDBvfmcp/BiORWL3GMoY2ZGVXypqo
	2RGO5CmLDeU4q3XPBwQibm9KT3hP/A3gWFhfFkzlpvtPMG/GtoAQU+2cgKFgUQwTBpBp2ANP8wo
	rOYqB/IQRj7kwZDfsLJDj4ccrw==
X-Google-Smtp-Source: AGHT+IFz+gG2jvi6jK0gn+Yt6CUcQN4JyWkJL+wFqCU+OhnKos22EVkTsVOZAljSOc30PwwuNJpUhNi6z8Alz4SpB/U=
X-Received: by 2002:a53:ed4a:0:b0:641:eb21:d6ac with SMTP id
 956f58d0204a3-6466a8afd6cmr8748387d50.44.1766429917341; Mon, 22 Dec 2025
 10:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20251222185220.1722980-1-jan.vermaete@gmail.com>
In-Reply-To: <20251222185220.1722980-1-jan.vermaete@gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 22 Dec 2025 19:58:26 +0100
X-Gm-Features: AQt7F2q8VXBnTsEL8H33fnGgBDOy6o6ZnDY0rChv9R-zcNszayjYmc5CHP8GIDI
Message-ID: <CABF_=yhOCYZ2htospYbwxFfTyGV+B=ZQ74yVCrk28JhXnckfxA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] freeglut: version 3.4.0 -> 3.8.0
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 18:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122798

Note: I could not test these changes. The previous recipe did not
compile on master in the meta-ros layer, and I=E2=80=99m not sure where it =
is
currently used within meta-ros.

On Mon, Dec 22, 2025 at 7:54=E2=80=AFPM Jan Vermaete <jan.vermaete@gmail.co=
m> wrote:
>
>     2025-11-16  John Tsiombikas <nuclear@mutantstargoat.com>
>
>         freeglut 3.8 changes:
>
>         * New experimental Cocoa (native MacOS X) backend.
>         * Add glutSwapInterval, to control vsync (currently X11 and win32=
 only).
>         * glutExtensionSupported now also reports platform extensions (GL=
X/WGL).
>         * Fix build issues with new cmake versions while maintaining
>           compatibility with old cmake.
>         * Fix handling of UTF8 window/icon titles.
>         * Fix issue with some X11 window managers not properly restoring
>           iconified windows (send _NET_ACTIVE_WINDOW EWMH client message)=
.
>         * Fix build issues with C23 compilers (empty argument list semant=
ics).
>         * Fix compatibility with older versions of windows which don't ha=
ve
>           RAWHID support (before XP), by loading the entry points dynamic=
ally.
>         * Fix glutInitDisplayString parsing of "aux", and add =3DN parsin=
g support
>           to specify samples and auxbufs.
>         * Various fixes and improvements in the GameCube/Wii backend.
>         * Altbuild support for Solaris 2.6/SUN Workshop C.
>         * Started conversion of documentation from the website to markdow=
n in
>           the source tree: doc/api.md
>         * Added the original GLUT manpages, with permission from Mark Kil=
gard.
>         * New demos: accum, vsync, and windows.
>         * Cleanup of some old and no longer relevant, or redundant commen=
ts in
>           the source code.
>         * Removed some out of date README files, and updated others.
>
>     2024-06-08  John Tsiombikas <nuclear@member.fsf.org>
>
>         freeglut 3.6 changes:
>
>         * New platforms: Nintendo Gamecube and Nintendo Wii.
>         * Minimum cmake version raised to 3.1.
>         * Make XInput an optional dependency.
>         * Fix incorrect modifier bit mapped to GLUT_ACTIVE_SUPER on X11.
>         * Add support for ARM64 MSVC targets.
>         * Fix for unicode builds on windows.
>         * Fix build on some versions of MinGW carrying an incorrect winus=
er.h.
>         * Fix menu-related memory leak when an error occurs.
>         * Various build improvements & fixes.
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../freeglut/{freeglut_3.4.0.bb =3D> freeglut_3.8.0.bb}        | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb =3D> freeglu=
t_3.8.0.bb} (90%)
>
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-o=
e/recipes-graphics/freeglut/freeglut_3.8.0.bb
> similarity index 90%
> rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> rename to meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
> index 13f3d111fe..25ba1e05bb 100644
> --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
> @@ -5,12 +5,10 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78a=
dfb"
>
>  SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/$=
{BPN}-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd=
42bb0ea0c6f3eaec"
> +SRC_URI[sha256sum] =3D "674dcaff25010e09e450aec458b8870d9e98c46f99538db4=
57ab659b321d9989"
>
>  inherit cmake features_check pkgconfig
>
> -EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5"
> -
>  # depends on virtual/libgl and libxi
>  REQUIRED_DISTRO_FEATURES =3D "opengl x11"
>
> @@ -19,6 +17,7 @@ PACKAGECONFIG[gles] =3D "-DFREEGLUT_GLES=3DON,-DFREEGLU=
T_GLES=3DOFF,"
>  PACKAGECONFIG[wayland] =3D "-DFREEGLUT_WAYLAND=3DON,-DFREEGLUT_WAYLAND=
=3DOFF,libxkbcommon"
>  PACKAGECONFIG[demos] =3D "-DFREEGLUT_BUILD_DEMOS=3DON,-DFREEGLUT_BUILD_D=
EMOS=3DOFF,"
>  PACKAGECONFIG[x11] =3D ",,virtual/libx11 libice libxmu libglu libxrandr =
libxext"
> +
>  # Add -Wno-implicit-function-declaration since it might be otherwise tre=
ated at
>  # error by clang16+ and this is not really a problem
>  CFLAGS +=3D "-Wno-implicit-function-declaration"
> --
> 2.47.3
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

