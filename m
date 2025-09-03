Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4089CA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:32:58 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.6179.1756881172397719285
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dC1g1SMs;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-72267c0505fso35003997b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756881171; x=1757485971; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9J/jpSO/wazDcFeKm7VXekjSo7ZbZN5jYFzLTIwNRg=;
        b=dC1g1SMs1qKea/pj1TcdJ4/TBCd4/Hs49rJSq5CVjdOR2p+BNvtJ6GM8/knVZMA6iq
         1Sg6E7sopwEKqOSgbzF8Z8TBjzBywbmaA09KeTbJrQcranTgZLfz+wwYhU77MEfYJlPM
         /MNSpAOm//b+ulMhQWyNfMKtUcaZTiCKXuBMi4xDg3lPk+2gjzmQgib9WVy3j59XExKG
         i1gorySHbgZVddCvREzWpPpXiRVvZo+iMlBUoQtRXxux8c/85YruagZxzOMELxEDS/8i
         KEEcg6uzkv4Iek8qd+AdJmXMJN/jAoc9xkmhrhCkddVaPReFy9DlVkFActv9Ha5f7VvT
         ahjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756881171; x=1757485971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9J/jpSO/wazDcFeKm7VXekjSo7ZbZN5jYFzLTIwNRg=;
        b=SEaNt9b0EOlTlPAB25S2JObBnuolGIhYdw6Nei+Z3lZ6o102sb/QiIphAHhoXQsrG+
         d59N58YJ0ZCRlVTeIlK9AmXVmO65EyUZY4nEYVHFPVzoucKaV+SHUohLwrAYrtorMoRu
         bVfj+KtR5LT0skYhZBk/c5ny3xFJQHovwvb5XDaIWwjS/lS5k6az5HkuCEMA5ETOuXNS
         1AFXFASNPY2gkWrIXF9JU1G9Sv9ZFZOkPGz9qBPeaxOTE9UesQbdddRkG0wzgNJTa994
         GQd6mJEEb350rVD7LEFZNJHfmM7OBNoOclPlKiNBw5qOzK923kqpObGHSht164tcHbKX
         CBJg==
X-Gm-Message-State: AOJu0Yy7VfOntxPDEwkw3UicDTpI68swDoPUO8evFcUCfRBNAON4RyMd
	8HBQ6ucAUD9Sw0j8r3gd4+o4a1Z3XAGOc/JblGZb2bn7oinrWxKkBQttxx2tgNCnyx7EXdIRLW4
	4w2uWaRiMOmM2CujvNuByqJK3UDqQ4+MFJtpuGnQ=
X-Gm-Gg: ASbGncvwYe7hY3WlpsorBBnAQSzNoZLZ/Vm3LFtp59SmknGs5sk5i3HQKSnyBl6OXi+
	FL/79ZIsGyNwwPN0RS9uk/OozyRk6LxczzuZC8sQsQVgQEaTP5nfMT4tuQnHZFFpUETX0/2J4Sc
	ulIxa2st51wAznY7t/lzWi2BvCbMSk2e9/TbWPqrxC8zxXfces6Wbgsi/bAYS+2/gfqhaQ2eG2C
	6A1HTbAd7cY1zNrkJPvTDOoVanQ1t0QUNJYTLjnJPaOwPj3/cA+LZST/lvdsN4+AxJLHQvBCFOY
	XOWPHnrdwcBhVIQ21aW/+7xrY93+qwitWGyjTBiamOJRNXhO8uMbB0a+Do85R0+d1Ija
X-Google-Smtp-Source: AGHT+IHPgRmbdYnjNOsldHo8/IlIgcFwReZ3weyLfLeFHE4zzzrcEH28JRIzdcsaWP7Weh6+IjEh92GkdDRzEZ5fPTA=
X-Received: by 2002:a05:690c:7444:b0:721:6b2e:a08d with SMTP id
 00721157ae682-722764ad101mr182260147b3.30.1756881171398; Tue, 02 Sep 2025
 23:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250903062503.122121-1-hongxu.jia@windriver.com> <20250903062503.122121-3-hongxu.jia@windriver.com>
In-Reply-To: <20250903062503.122121-3-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Sep 2025 23:32:24 -0700
X-Gm-Features: Ac12FXwsAxC2cnD7_0HbVVkQx48Di03nlufvsVeK5zDOyaLj_X8MQj_qy3jUAPM
Message-ID: <CAMKF1srmfThv_-t+EMG2CVHQ_Pnh5rbF_BbD8FdGr87RWMBWqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] cheese: require distro feature opengl
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119194

On Tue, Sep 2, 2025 at 11:25=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Make cheese require distro feature opengl. Otherwise it fails
> to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
> ...
> |ERROR: Nothing PROVIDES 'clutter-gst-3.0' (but meta-openembedded/meta-gn=
ome/recipes-gnome/
> cheese/cheese_44.1.bb DEPENDS on or otherwise requires it)
> |clutter-gst-3.0 was skipped: missing required distro feature 'opengl' (n=
ot in DISTRO_FEATURES)
> |ERROR: Required build target 'meta-world-pkgdata' has no buildable provi=
ders.
> |Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'che=
ese', 'clutter-gst-3.0']
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-gnome/recipes-gnome/cheese/cheese_44.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/=
recipes-gnome/cheese/cheese_44.1.bb
> index 180f3f6319..8e78162991 100644
> --- a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
> +++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da17cb0a873d252=
440acfdf9b3d0e7fbf"
>
>  inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gset=
tings gnome-help gtk-doc
>
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +

this also needs inherit features_check

>  SRC_URI +=3D "file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incom=
patibl.patch"
>
>  SRC_URI[archive.sha256sum] =3D "5f2185c4c99e54ddf2b8baf60c82819950e54952=
e132e8639875f3edcbf8f68e"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119192): https://lists.openembedded.org/g/openembedde=
d-devel/message/119192
> Mute This Topic: https://lists.openembedded.org/mt/115041303/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

