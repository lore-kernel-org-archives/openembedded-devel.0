Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F38CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 16:50:50 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.14297.1761670245107838166
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 09:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3M50I8O;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7861978aca2so1417417b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670244; x=1762275044; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2pkiKChO/ShVKrn8658rOUJgos48dsrhqvGJcLejXc=;
        b=G3M50I8OXugWI/J21bdWVjfSPr3cDTWiKSiLqfvJfakyONoQ+jnkda/K0PnrATA+4M
         QOzAdDbtMxD5dmmT9JGJY59ARmuWbtJiZHcqaIKx9fEXKkuq8GSEYpPQcg3BsW/HnF/F
         Xv1+fyk34LGaE3sIm7q1Nw7PVo1Eeoe+PlB9COteDbZIXE6TddOccKx12+BNkNqqelcu
         NXuCVTmfUNvychUIgmGRYRV/Bofg0avQctAD4IcCXqn2ST8MmIekBUH2O8K+9CZ4l37c
         kOLYANFjf/kRTIX4464JZihPu7KXAV0SEOUoYW5jnZBHJLCceJ1Ge73g2oLOUH8zhbn2
         5T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670244; x=1762275044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2pkiKChO/ShVKrn8658rOUJgos48dsrhqvGJcLejXc=;
        b=xMTwVKOlBnAQ4q5s7yPYcOcEQVxoX17dvxCblKeEe/gSwjuAMq8xsoYks3X51t4j27
         8gscw8jEiQI+2TvgT6S3nAjr+UTfAmQM+dqh3JdNCBQ+5eAQA/TUMuIIHR1HkQ3x0RPc
         xtIZv9KphaIKEn4VeSGxK8LftcMDBvIqzHUgEBSlF/kuggZkOL68V4zpdnc1bIEt8OQO
         iYPq9OnKasCtFX1qdQLs3w57xwNOAsBpltycyr8sjIqxEc/hwI+tYJ0IWPZf1u1ne4JH
         ildkD/MDPVrCThspfoZ4fj9RuiEJLZXYvDD12ynKL4g2hoySeD+hVaMmBYsY18CtUxO8
         68pQ==
X-Gm-Message-State: AOJu0Yzs3x7L4coIKhUZufrIyRzCyRg/TSFu9I71HwFv+8Wzf6docmB0
	InIrjcKQUwJ0QP4YLJDiJxN99kabQVUGBp1uprrb0Qo6kfPAm+94UnkOOUpYSfiH8ZgauMWsIhW
	UXgLfbEZgDhqkP3l/Y/cAO5AzM2YWmQ7TF7z2
X-Gm-Gg: ASbGncthBPZoJbs5RZ7wHBEXpnLnOVUXcH2mxXaC6JtIK8N9KoKZQSlfwIoIBDN8rUn
	B6otnuCAiNmRRyGb+MTrdS/ova/PXSFaOhB3fxs68ckzFcNJ4nYhbfSFW1IpGWJxWygtpW4iZcd
	zY596Ep9kP6EShB5jLGFTug8Z+A8N0b21fOd84ZsQg6rnpIl7Owdxfk0+aSCw3YtYhpCveN9WA6
	vLTIwmtyrjehvy6A6Ffi11GgcqHhoVc1Q2vp4qQDlrPNZlxgNdeR/1fKjKQw2NgJWabJaqOVPiO
	N9hCOseq9OhKjqqStdkcQDiJi5T3Yi0zSPI5H78+zP/8Y1LVqQD3ziX+bcdE+kBcPsGUZ8o8zMi
	bVQ==
X-Google-Smtp-Source: AGHT+IG3SnLrn1DxHo7IwPLaURNTkI9bzcxWZ5G1nhQsoe6ppx4wZIcUfK2qEgAk0lNQdCRgdmrD2mK0CHUDEAIMUJg=
X-Received: by 2002:a05:690c:3503:b0:781:64f:2b79 with SMTP id
 00721157ae682-786191dc59emr31649967b3.34.1761670244118; Tue, 28 Oct 2025
 09:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251028164419.462005-1-f_l_k@t-online.de>
In-Reply-To: <20251028164419.462005-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Oct 2025 09:50:17 -0700
X-Gm-Features: AWmQ_bnusEfUEESmhofwPbMMcw50KG0QgOpnh4tMzAfIZfPY0DphBciLjot26OM
Message-ID: <CAMKF1so4wMWv_koEjHgQ3w=1AwT2hP4N4hs2YOOUJix7iafeVQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-remote-desktop: update 48.0 -> 49.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 16:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121095

On Tue, Oct 28, 2025 at 9:44=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - Add '-I${STAGING_INCDIR}/winpr3' to CFLAGS in order to bypass a build f=
ailure
>   caused by missing header after freerdp update
>
> | In file included from ../sources/gnome-remote-desktop-49.1/src/grd-sett=
ings.c:28:
> | /home/flk/poky/build/tmp/work/corei7-64-poky-linux/gnome-remote-desktop=
/49.1/recipe-sysroot/usr/include/freerdp3/freerdp/freerdp.h:25:10: fatal er=
ror: winpr/stream.h: No such file or directory
> |    25 | #include <winpr/stream.h>
> |       |          ^~~~~~~~~~~~~~~~
> | compilation terminated.
>
> 49.1
> =3D=3D=3D=3D
> * Fix crash [Jonas; !345]
> * Fix image corruption on some NVIDIA GPUs [Stephan; !344]
> Contributors:
>   Abduqadir Abliz, Jonas =C3=85dahl, Stephan Seitz
> Translators:
>   twlvnn kraftwerk [bg], Abduqadir Abliz [ug], Jo=C3=A3o Carvalhinho [pt]=
,
>   Andi Chandler [en_GB], Quentin PAG=C3=88S [oc]
> 49.0
> =3D=3D=3D=3D
> * Handle Vulkan dma-buf format compatibility issues [Pascal; !339]
> * Fix crash [Jonas; !341]
> Contributors:
>   Jonas =C3=85dahl, Pascal Nowack
> Translators:
>   Makoto Sakaguchi [ja], luming zh [zh_CN], Ekaterine Papava [ka],
>   Anders Jonsson [sv], Artur S0 [ru], Daniel Mustieles [es],
>   Jordi Mas i Hernandez [ca], Asier Saratsua Garmendia [eu], Seong-ho Cho=
 [ko],
>   Yuri Chornoivan [uk], Aurimas Aurimas =C4=8Cernius [lt],
>   Juliano de Souza Camargo [pt_BR], Francisco Di=C3=A9guez Souto [gl],
>   Ask Hjorth Larsen [da], Nathan Follens [nl], Kristjan SCHMIDT [eo],
>   Emin Tufan =C3=87etin [tr]
> 49.rc
> =3D=3D=3D=3D=3D
> * Allow systemd service management of all units via grdctl [Joan; !320]
> * Misc bug fixes & cleanups [Jonas, Pascal; !329, !331, !324, !333, !326,=
 !336]
> * Add support for relative pointer movements via RDP [Pascal; !332]
> * Add support for extending desktop with virtual monitor via RDP [Pascal;=
 !334]
> Contributors:
>   Jonas =C3=85dahl, Joan Torres L=C3=B3pez, Pascal Nowack
> Translators:
>   Fabio Tomat [fur], Du=C5=A1an Kazik [sk], Antonio Marin [ro], Martin [s=
l],
>   Daniel Rusek [cs], Danial Behzadi [fa], Nathan Follens [nl], Bal=C3=A1z=
s =C3=9Ar [hu],
>   Piotr Dr=C4=85g [pl], Yaron Shahrabani [he]
> 49.alpha
> =3D=3D=3D=3D=3D=3D=3D=3D
> * Add touch support [Pascal; !314]
> * Fix failure to connect on some NVIDIA systems [Jonas; !323]
> * Plumb locked keyboard modifiers via libei [Jonas; !311]
> * Documentation improvements [W.; !317]
> * Fix crash [Pascal; !325]
> * Plug leak [Michael; !319]
> * Misc cleanups & improvements [Pascal, Jonas; !315, !313, !327]
> Contributors:
>   Jonas =C3=85dahl, Michael Catanzaro, Pascal Nowack, W. Michael Petullo
> Translators:
>   Takayuki KUSANO [ja], Emilio Sep=C3=BAlveda [ia], Antonio Marin [ro],
>   Aefgh Threenine [th]
> 48.1
> =3D=3D=3D=3D
> * Reduce latency when PipeWire stream uses shared memories
> Contributors:
>   Pascal Nowack
>
> Translators:
>   Baxrom Raxmatov [uz], Cheng-Chia Tseng [zh_TW], Philipp Kiemle [de]
> ---
>  ...me-remote-desktop_48.0.bb =3D> gnome-remote-desktop_49.1.bb} | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_48.0.bb =3D> gnome-remote-desktop_49.1.bb} =
(91%)
>
> diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_48.0.bb b/meta-gnome/dynamic-layers/met=
a-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_49.1.bb
> similarity index 91%
> rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_48.0.bb
> rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_49.1.bb
> index a80b101a6e..c63ca7fa4a 100644
> --- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
> +++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_49.1.bb
> @@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check userad=
d
>
>  REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
>
> -SRC_URI[archive.sha256sum] =3D "038c42e48fe1d890849bec5d567566c152bd6d7f=
463eadeec59b1eae8fbb32a0"
> +SRC_URI[archive.sha256sum] =3D "7800f388301eeb8147b0be55e8fa7cbd7521066a=
48a06115cc0ead9f0cea188a"
>
>  DEPENDS =3D " \
>      asciidoc-native \
> @@ -31,6 +31,8 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  "
>
> +CFLAGS +=3D "-I${STAGING_INCDIR}/winpr3"
> +

Isn't there some pkgconfig magic that should have done it automatically ?

>  PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,pipewire-native=
 wireplumber-native dbus-native"
>  PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvncserver"
>  PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common shaderc-native"
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121094): https://lists.openembedded.org/g/openembedde=
d-devel/message/121094
> Mute This Topic: https://lists.openembedded.org/mt/115997211/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

