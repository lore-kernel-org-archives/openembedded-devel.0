Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F70C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 05:27:20 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.14261.1684214832846924833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 22:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GtVQQf/d;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-192d5ab4d40so10873254fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 22:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684214832; x=1686806832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5+hEjfiTrjkj23F70+2Ji3VW9CpM6tVWevDsZYevgw=;
        b=GtVQQf/dWWmj2XFvKqhXvFP4Rjs0Qxck2Bo7Ut/cA3nfku2v1TrlavRmJf1fuwNgvG
         rvcegvAnLXjKf6IIupF5qz1sGxey9LAonDVTokAjV54sERaq2h1TEFh48qaK9u7Dpx2k
         gVQaN0AAKlX+k+7lsyQcmbg8wpoSXtOrUCd6V28FFbHvDZFUKr5DeFLLrwHiIuSt+kNy
         +5xkM42epDUuq7P9ZOtoJLG9sudR5ZQYnfoo/5hPFQY0XYDXKlazy3fdZJME0e68JR5M
         wLBSY3R9BcdH8HS4qWO9ZTETa+v/Lo8p0Yqh0nGBOfKsxmX4rvFweFtfju7RaReX0ruh
         nzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684214832; x=1686806832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5+hEjfiTrjkj23F70+2Ji3VW9CpM6tVWevDsZYevgw=;
        b=AfPTb3ZJIWUMoJLCJOjC4+T2uR4rnZBXxFxFAKBNYyCH7a4yIZdn/hE0KwDygXVkeE
         pzco3XebPa+imUNyi2ilW3cmUynyOacaXIaNqTOQ9m7Dn4w3PtcDtTpSzhK/s+ahVsf+
         tzDR6k/Fu9lZgYlY8JiLz6JFHifHG+GKqKWCp+kLyaOet9lv7viY3IMfMuhsezhusKZ0
         +33hFCWp8cYr19I9ACuJxDoH5Jg2t4pW4UrE1aJf9QjHrw9Hufe5WgGdtcht1OpfjQU2
         j9UBVvTVkFngHpBHhQRIrQItQI+DWkLEKIXEqQJxi1jGtrQKo5VU41vgCLV3fbz8nk/K
         TwBQ==
X-Gm-Message-State: AC+VfDy7QbIdRJB06istBzk5KX22WPMQGvXI3pr4IA33VYkoD/Jm3Nxi
	S1lFZDSTXGsHFUvRcwrqL5aVk/wMlGAw+7mq5ro=
X-Google-Smtp-Source: ACHHUZ6yJl15UYgKbeAK9ddDoIhGbNRjM3ut64n/LJP9PARBD9R5Fhk5oAFwLd0nO6K6m7ncfVCKoo0ZAZ6aucMmPnA=
X-Received: by 2002:a05:6870:a484:b0:17e:e91b:28a6 with SMTP id
 j4-20020a056870a48400b0017ee91b28a6mr15611983oal.32.1684214831847; Mon, 15
 May 2023 22:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230516043458.6180-1-f_l_k@t-online.de> <20230516043458.6180-4-f_l_k@t-online.de>
In-Reply-To: <20230516043458.6180-4-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2023 22:26:45 -0700
Message-ID: <CAMKF1soBAvB2NQQCTFMGAp3+AG-EGzzUnAumgRg0ciH1_poG=w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/7] evince: update 44.0 -> 44.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 05:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102618

On Mon, May 15, 2023 at 9:35=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - remove buildpath from enum-types
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../evince/{evince_44.0.bb =3D> evince_44.1.bb}              | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/evince/{evince_44.0.bb =3D> evince_44.1.=
bb} (84%)
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince_44.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_44.1.bb
> similarity index 84%
> rename from meta-gnome/recipes-gnome/evince/evince_44.0.bb
> rename to meta-gnome/recipes-gnome/evince/evince_44.1.bb
> index 1c7103c900..a2a6f9aae7 100644
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
> +    sed -i -e 's|${B}/||g' ${B}/libview/ev-view-type-builtins.c
> +    sed -i -e 's|${B}/||g' ${B}/libdocument/ev-document-type-builtins.c
> +}
> +

do these files get compiled into binary ? if so then it might be too
late to edit these paths out. Perhaps they should
be removed before they get compiled in.

>  FILES:${PN} +=3D "${datadir}/dbus-1 \
>                  ${datadir}/metainfo \
>                  ${datadir}/thumbnailers \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102614): https://lists.openembedded.org/g/openembedde=
d-devel/message/102614
> Mute This Topic: https://lists.openembedded.org/mt/98920482/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

