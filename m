Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38B1CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 23:24:58 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web11.244.1759361091535162910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 16:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=faVUkTJk;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-635401a8f5aso506980d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759361091; x=1759965891; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwDG/L6xR8s0Xv6+SSoQPhjEHMybNL4TMlR0HSBGrTM=;
        b=faVUkTJkF5y6sh4z5BdbcXoX37PF1h3r4zuIVeZya7TlXbeGAkOXGyP+QYWhedQRBv
         FGXGvruZemXIdUUEC88a95kOutzMBhPr1hVqbR8JG0i9kmc/rNGokoleeB5ZzrNfEWiX
         5hk9QwvLacYBxqK+0e9YCpepzIR9BV3Z1/725/NOsmEWCsUE/5jPi7aoUYp5DcCWZvQ/
         jvp6x/C90MIH4Y78zKy2oQcaw9Eg8EvkWhQPPLAk2NHPtRyRfk6yXJ5X0xDThnNnfxdl
         27ioMfYDtSPdOUdmxrBn5+ceavhjznJpsKdq6+lfc5Z16W9gdbTIi2vYVBz8KL6NDmdI
         oxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759361091; x=1759965891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwDG/L6xR8s0Xv6+SSoQPhjEHMybNL4TMlR0HSBGrTM=;
        b=X52GxomSxA1ssG9F+tYA3cKoRewVO1L2x34btvGFco9gXbd3werh+l0KXDfRmy9o/b
         80PscFpY+9YyhFhzGPxN/cW5srMjjqRgiRQHxkq50OE6D/KMCCoaiYS6FbURYck6clX/
         wTeqd4zc3siKc2Sg0xR6bPbLiXp7MsRVCzwrvEkykhWk8enPCt1qbC4P1A/U9T+H+TfM
         JxMzacGvnhh5hDQHgV+QWLgFCBKKASlj5jfZTCMwUvabriVUxTLXAFMQXNSgGAIzOGGV
         nx/uh6VUzF9nQgUHold0hcd6NN7pMrRtC9ofMAxD5L5uiOmDa2wztODoH6IjHomBb7mh
         Pj1A==
X-Gm-Message-State: AOJu0YzTQQPdtJPutZu+kbXJ06hI9JY0BGCVRTgT+HSmvJ7J88TP5yy5
	/JIKAi3QhH5dEfxKROoAQeDz42k3juaqN0tCepfF+nrKwGhVSbeyhs9VhIKz2DsNpPXlSFiuFRr
	YejkPCq6Zzum96PjVi5QzFt3LaGawrww=
X-Gm-Gg: ASbGnctLYrMDhpit085gC92fwKni8hXKJBeZCo6WovPE0S2/ARX2CMy6t2aaztbh2+z
	NL1J0+WAFOdUX+DC6X5enLcRsll6zZMwsOYa1qSiUCgqteZ4w9NDPPX1KjQA+juojs14ng6lcBx
	5aYLsqAoeQ2DSVQzLKUUbEaNpyXTH1gx5bnsxQe50NbyUXbukmnNXV1zgONT3anP/gjLzRu5JSn
	hh/F1mMsnrLvJn08631aIgoBRI9Hv3ENRy5bOhCfNbCbiRQ8gAr5Jzleo3et9mlZPedCRiC5dyB
	d5K+q2T1bgz89G2gu8vpB2sErqA+/8iHm5RFuQ07JhEPXbJ7wylICVXneX5/YCozVnns5FnUutk
	0XqThnBvNg0dx1Buv
X-Google-Smtp-Source: AGHT+IGsFltKCzvR7i/Wf9J3KwKggAbcbxSauuVem8vwsa0cKxvQShzS7pYO14s3IMhwGsjAUAX7chZY8i31GEUDvlY=
X-Received: by 2002:a53:e017:0:b0:615:7d8f:66ed with SMTP id
 956f58d0204a3-63b6feba0b7mr5763919d50.17.1759361090566; Wed, 01 Oct 2025
 16:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251001062339.74011-1-f_l_k@t-online.de>
In-Reply-To: <20251001062339.74011-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 16:24:24 -0700
X-Gm-Features: AS18NWBTBQAkqkKzK9TeKi84dNpNTHnW4rGXnddX0nR2wtDgJPOtsPXGn-MaHY4
Message-ID: <CAMKF1sr2ks3j3RzogOdsYOS6Dk6wyaNqcCqsfhOG0DYAgOFoLQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] telepathy-mission-control: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 23:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120145

On Tue, Sep 30, 2025 at 11:23=E2=80=AFPM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> 'telepathy-mission-control' is an account manager as requested by the 'fo=
lks' telepathy
> backend at runtime.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../telepathy/telepathy-mission-control_5.16.6.bb  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-miss=
ion-control_5.16.6.bb

Its being added to meta-oe but it needs networkmanager and
networkmanager is in meta-networking. So layer compat check fails
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/963/step=
s/12/logs/stdio

perhaps put it in a dynamic layer in
meta-oe/dynamic-layers/networking-layer or just directly in
meta-networking.
>
> diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-con=
trol_5.16.6.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-c=
ontrol_5.16.6.bb
> new file mode 100644
> index 0000000000..c6ff3abe9f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.=
16.6.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Telepathy Mission Control 5 is an account manager and chann=
el dispatcher for the Telepathy framework"
> +HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
> +LICENSE =3D "LGPL-2.1-only"
> +
> +DEPENDS =3D "telepathy-glib dbus networkmanager dbus-native dbus-glib"
> +
> +SRC_URI =3D "http://telepathy.freedesktop.org/releases/telepathy-mission=
-control/${BP}.tar.gz"
> +SRC_URI[sha256sum] =3D "2df8ae3995e919a7670e01aa3568215ef0777e34961ace1c=
ac1c6477cb297a45"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
> +
> +inherit autotools pkgconfig gtk-doc
> +
> +FILES:${PN} +=3D "${datadir}/dbus-1 ${datadir}/glib-2.0"
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120087): https://lists.openembedded.org/g/openembedde=
d-devel/message/120087
> Mute This Topic: https://lists.openembedded.org/mt/115528296/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

