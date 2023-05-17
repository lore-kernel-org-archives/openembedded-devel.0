Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E9FC77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 16:26:11 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.55033.1684340767313310742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 09:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ejPob7op;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6a82841e582so129933a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684340766; x=1686932766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wP5jfN7txNl2A4K/a5fcSdF82B+pIB4hLiMFAmtYG0=;
        b=ejPob7op3zjsiq762uQuXu8GgLJ10JSzARUEcxxTQmebtPQHBqYp567VH++OOAk5dh
         C0wNu30JnBKTt3OSU02SI2v9Wa3xAWq2kv/w3q6rB3U5lzUp3yOy35RtqgUULE3nRFpp
         nQ6+6nfm9POSwPJ9quEIxSclF7KsUiqO0RTmwMUE0+dzUR7rEhE2YsJyb+Pc8n9BMjOO
         S6DYaPlPgcqWsxIh8At80kzMhKQKr26ZCRgzRRTHmqvtNCT2yJudG536+aldDTpV1AAe
         Y1a8wGuafIo64gmBelDnDpivlMd/KYzn53fmo56BHmau2c9bNi+lxx1oB24yWckj/ipM
         FMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684340766; x=1686932766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wP5jfN7txNl2A4K/a5fcSdF82B+pIB4hLiMFAmtYG0=;
        b=k8VvowCdZo+9xzIu5uKXApjzGKXS1//OPLDX2sXz/jg2ryuZSdhYaOMq3jIMsOEo0w
         x5ylObZbbzvGOsInG3GN6jzv84iusTM944pxgnCkf1vcltNTH04GSdShislCYa41zhYR
         /Et2C94kFsUsPIonwKlKYVUCvIcE5dZG7LNflu8W4dVttInGOwqB3EIWco9qmz2tBQ01
         8gNOVJPHNcaR9m3sdRqvzQP6Din80VMsnCIv3x20GQUQYNqlmrNMjwndx3DZGLLrjyC4
         LCoUdUmna9hv2nwsIbNvMFFkZFercwYub08YFRxQtjYDRyGpXCRwaB0QX8HaZbbnWTY5
         xQvA==
X-Gm-Message-State: AC+VfDx5rLau+li0PnyVi2NP20OBuPog84GPpNa/O1sP78n2ttz4VgD2
	X6qb9RG8QGsszO+ePYpVm/NfHbw9EAdu2iRkbjM=
X-Google-Smtp-Source: ACHHUZ7il7W634wc8nNpVlwRZLMdEi6dpvqhXfwcbBIpV22LIe34Hog1Zbo824kJJzKvpUcio0eTHFvJ179lT71Wvfg=
X-Received: by 2002:aca:efc4:0:b0:394:4a66:a89 with SMTP id
 n187-20020acaefc4000000b003944a660a89mr1351786oih.1.1684340766311; Wed, 17
 May 2023 09:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230517112303.1127846-1-f_l_k@t-online.de>
In-Reply-To: <20230517112303.1127846-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 May 2023 09:25:40 -0700
Message-ID: <CAMKF1sog9wcG29Pph1MOiR22WRZP1me0XcM6L-6cD+GohZuuHQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] evince: update 44.0 -> 44.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 16:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102649

Can you send a v2 as incremental patch on top of v1, I already applied v1

On Wed, May 17, 2023 at 4:23=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - remove buildpath from enum-types
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../evince/{evince_44.0.bb =3D> evince_44.1.bb}              | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/evince/{evince_44.0.bb =3D> evince_44.1.=
bb} (79%)
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince_44.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_44.1.bb
> similarity index 79%
> rename from meta-gnome/recipes-gnome/evince/evince_44.0.bb
> rename to meta-gnome/recipes-gnome/evince/evince_44.1.bb
> index 1c7103c900..a844324ade 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_44.0.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_44.1.bb
> @@ -34,7 +34,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'open
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
>
> -SRC_URI[archive.sha256sum] =3D "339ee9e005dd7823a13fe21c71c2ec6d2c4cb745=
48026e4741eee7b2703e09da"
> +SRC_URI[archive.sha256sum] =3D "15afd3bb15ffb38fecab34c23350950ad270ab03=
a85b94e333d9dd7ee6a74314"
>
>  GTKDOC_MESON_OPTION =3D "gtk_doc"
>
> @@ -46,6 +46,11 @@ RRECOMMENDS:${PN} =3D "adwaita-icon-theme"
>
>  PACKAGES =3D+ "${PN}-nautilus-extension"
>
> +do_install:prepend() {
> +    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/libview/ev-view-type-builtins.c
> +    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/libdocument/ev-document-type-builtins.c
> +}
> +
>  FILES:${PN} +=3D "${datadir}/dbus-1 \
>                  ${datadir}/metainfo \
>                  ${datadir}/thumbnailers \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102645): https://lists.openembedded.org/g/openembedde=
d-devel/message/102645
> Mute This Topic: https://lists.openembedded.org/mt/98945571/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

