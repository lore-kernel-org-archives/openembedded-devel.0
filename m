Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2E8C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 06:20:33 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.7726.1692944425366816212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 23:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PspHx+2O;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1c8d895a602so357045fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692944424; x=1693549224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOtvBoIzN0GM8ceUPTs3lGWTbEH2o3DhxHixun5sxqk=;
        b=PspHx+2OjZGVaduGs0Y41XcDzwYCiEobD7ft3Jvdhv+PHUpTEugsLbYVWHbWX45YQW
         zC+r4k8n5EIT/YQ4PUD61Aib9KMFMx2+wojdbTAaO3IhpnTlRUP3n5qkhh7d4hWSSxU4
         LJy/HWR2TNyZl7GrD33vwvLfiP9aOPaX8mGOxDdjRejhfQhtp1TnDs6UHqa4pjldjQg1
         3feqZ3yU8J22XmW5+9FFVMtfJGsYBGJ5yjYfpW5YBkSvFmvrOHtTe4CDhaM6EhoSyNzM
         HdWY6RymU8uYDp92yctFPCBRlgAdO9boWJN8se+oFEm06Olge0fwa/OxIPGBbftg+q4U
         kEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692944424; x=1693549224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOtvBoIzN0GM8ceUPTs3lGWTbEH2o3DhxHixun5sxqk=;
        b=kvNLaLsZXZXgTPIHzmVrldmHUDC45LvP8EqluP3Z/R0icOoqocsEcx1+e+puzZYEw5
         5MIuBiuR33heYbj8c3ABjaIXS0aiyCZqO/Zos79H4kvQKm03b0jcS3ZeumF3ZSSMqPi6
         ueAyI0Up0DAlv5M9qMcUYmpNqqial3MFOzl+zkxg/G2kufynodYo/CXd8EL847+0SJhM
         Tam7w8yVoe66oCykdlXMKk4xZLN816BwNj1u8WyaQj6LXCyna/kI2D00+eGmDynquCd6
         tvX/BuDEFIm54leMRzmZX/mVJjtVD31Uu+USSlYj+NQm6p17ToO+XGTFCQyChR5vZf7Y
         GgGQ==
X-Gm-Message-State: AOJu0Yy4LYnjySe3mtdrliN4PS307MoS2jbmVLm+5vXNHlpFyQb5XZ+y
	NQptqvEs6pLo/Zg59Ijar7Acb85ndFMUx7HHv38wVbS/r66+eA==
X-Google-Smtp-Source: AGHT+IFVtFniDq99keDI/Vi25FGDl9PFE+q61Jz5aOzUGeMaaUPvP5KV0FtfdBIlohupJKoJXr9VlBIcKDPoeFjD0Wg=
X-Received: by 2002:a05:6870:211:b0:1bf:11f1:4729 with SMTP id
 j17-20020a056870021100b001bf11f14729mr1954184oad.56.1692944424490; Thu, 24
 Aug 2023 23:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230825054449.2315061-1-f_l_k@t-online.de>
In-Reply-To: <20230825054449.2315061-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Aug 2023 23:19:58 -0700
Message-ID: <CAMKF1sp8VBzFdqy2NMwNJ4SVrTwJYas2bL66-op_gO+zBJQd2Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/5] spice-guest-vdagent: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 06:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104598

On Thu, Aug 24, 2023 at 10:45=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> The spice-vdagent needs to be running alongside qemu-guest-agent on
> virtualizationguest systems that are using the spice protocol to
> get seamless integration.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../spice/spice-guest-vdagent_0.22.1.bb       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-networking/recipes-support/spice/spice-guest-vda=
gent_0.22.1.bb
>
> diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.=
22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.=
bb
> new file mode 100644
> index 0000000000..8894d58e21
> --- /dev/null
> +++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Spice agent for Linux"
> +HOMEPAGE =3D "https://spice-space.org"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +SRCREV =3D "aa08162f036840d3e33502dc0a836b03b9cec97c"
> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/spice/linux/vd_agent.git;proto=
col=3Dhttps;branch=3Dmaster"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS =3D "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol"
> +

since it needs gtk I think it will need
ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
REQUIRED_DISTRO_FEATURES =3D "opengl"

> +EXTRA_OECONF =3D " \
> +       --with-gtk4 \
> +       --enable-pie \
> +"
> +
> +FILES:${PN} +=3D "${datadir}"
> +
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104592): https://lists.openembedded.org/g/openembedde=
d-devel/message/104592
> Mute This Topic: https://lists.openembedded.org/mt/100950814/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

