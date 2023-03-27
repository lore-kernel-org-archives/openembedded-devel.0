Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19895C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:19:27 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.26644.1679887165775521679
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aMV9d79f;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-17aeb49429eso7875415fac.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 20:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679887165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lA0VKgM+Zqrfs/b4OiA84BMS68rySH6La0Q773cVE8=;
        b=aMV9d79f8cXuQTfTjOsmOWZ7qUVb4rqx3iJ/gvh9kuQKZig7j384uYm5PQWfYHG2Bt
         MckLcQrsk3CBbwbMBR9lISUhZEdEaMyIrk7Bxdt32QObUx/F8qAz6BfZYyMaJlADhw6t
         4Qhccjb62U8JIRvBHiirO7ULCD1lGoTynl0RwKX/NAf77CP1gZc6LmG1Ypl8HBhnNLqZ
         HBe4Iww76+jjFiUxDLBUQ+78OcJObmoMhqFX9PGa8oXGEi+8zpX89/W2LhnAmroc2wYK
         gu9BeEtEfgjE5v226CjzTWcVzLYibvnPzeFgESNW7+fDz1hd7U0STUHpbLcrgU1dukgh
         kiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679887165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lA0VKgM+Zqrfs/b4OiA84BMS68rySH6La0Q773cVE8=;
        b=J557BYWMPtzjALnuG3Uf0pXNfQhxgPLjKTR5x9PMd4ULq64KjKQenKG1T/Y5wHDpDG
         qwbqy8XH59tH+y2wYePiMSvzdZsEov9eHLydIqeYgYzsnZ1brt205EZwlnY8XOyDvVWb
         P3OjBId9ZVxNpZ4o94P1ewNURfhKUI7Akdz9/XrCIZtZYQ0xTXBxsBIyXsD25l2TkxRK
         0aQ5pQSIx3Ywd8YA8srODlQ8fUF3vPvU2yBHb7wTnfvuzl8Ijefgy4p5UCyjA5yKDk+5
         ZNJIsVdpAwHOJAqa+C9naqt8CKBQnkB1+uwaiajy/MT7kJpsxrBmTGGcCOj/3ooJZwRm
         DxAg==
X-Gm-Message-State: AAQBX9eamk6P2tBAjVNgUL3hwppybj1kIRxh+g1z5a1Mhqmi76I/2iDa
	GDuD4mI5yKsPZq1MAMwALJT3dXqXFWUiAo+QCkOT2uV5
X-Google-Smtp-Source: AK7set8khatAeWfHL6dc8fY6Sa6rj35G+QxQ0IRhLDTqmMz9yt/6RB2QG5Y/wg8j3/riyLj9Bia1qdxEbI3HlRQ/jLU=
X-Received: by 2002:a05:6871:e09:b0:17a:b713:63e9 with SMTP id
 vj9-20020a0568710e0900b0017ab71363e9mr3394364oab.4.1679887164881; Sun, 26 Mar
 2023 20:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com> <1679886213-20913-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1679886213-20913-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 20:18:59 -0700
Message-ID: <CAMKF1srUadzhaFz8N1y6YzkWnnFR6vkQ-_xQizdfyfTia+9GNQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH] eog: upgrade 43.2 -> 44.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101764

please rebase on master-next and see if its still needed then resend.

On Sun, Mar 26, 2023 at 8:04=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Bug fixes and improvements:
> ----------------------------
>  * help: Switch mailing list URLs over to GNOME Discourse
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-gnome/recipes-gnome/eog/{eog_43.2.bb =3D> eog_44.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/eog/{eog_43.2.bb =3D> eog_44.0.bb} (86%)
>
> diff --git a/meta-gnome/recipes-gnome/eog/eog_43.2.bb b/meta-gnome/recipe=
s-gnome/eog/eog_44.0.bb
> similarity index 86%
> rename from meta-gnome/recipes-gnome/eog/eog_43.2.bb
> rename to meta-gnome/recipes-gnome/eog/eog_44.0.bb
> index 7dbc0ecf2..c95d0e653 100644
> --- a/meta-gnome/recipes-gnome/eog/eog_43.2.bb
> +++ b/meta-gnome/recipes-gnome/eog/eog_44.0.bb
> @@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
>
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
>
> -SRC_URI[archive.sha256sum] =3D "9dcfdce5585a90e2bb1cf57e377cb1eb12d41bd9=
bcb9bbacdf506bc1b1354ef9"
> +SRC_URI[archive.sha256sum] =3D "41d85fab05c430898dbfd847e48e1f5b4935dc3c=
bcee546e759a907eda671054"
>
>  GTKDOC_MESON_OPTION =3D "gtk_doc"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101756): https://lists.openembedded.org/g/openembedde=
d-devel/message/101756
> Mute This Topic: https://lists.openembedded.org/mt/97874713/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

