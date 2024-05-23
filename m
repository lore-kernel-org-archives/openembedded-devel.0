Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05229C25B7C
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 01:57:27 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.5934.1716429443410181401
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 18:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iGpzJtBl;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-24544cfbc69so2628662fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 18:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716429443; x=1717034243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmNLfKTi68+oPNr6aCte32n2+yWA6+R4ianjHjK1dcM=;
        b=iGpzJtBlefn1elQWECpjcVOxH+VB9R4PSF4uBufJ9jIG7HquiSpLbrPjfa4QgUEm9F
         KyUX4rafdAHR1w0lPP+meAzfJS+fQvwVVj1GWCoNC9D66MkvrFvpYlmu2T9kpxp00wNI
         WjFx+aMZdp4UzOdCrmPB7cD96mm/5EClta4vXEVdM3GYkjtXzXI56usoGVrTuaaGeTev
         ZoNtPNjdq/2SjiMX1Y48xmdu7UgaSoX4gM3m216S/U6HzhFNjwwI6hEV75orxruQ28Ww
         AbADeYArEoQG2fiwjVQ4rGs1JXBh2oFpJc6vBKsGL7cVhHG+HezwuOAiuaRBTxSznqU2
         SnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716429443; x=1717034243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmNLfKTi68+oPNr6aCte32n2+yWA6+R4ianjHjK1dcM=;
        b=e/jU01ZT6UdHRfmPZYj1XtfX2a1xL13NHlODvPfMRDyn6NgsSKrBfOTWvE8CHqwoAv
         eBpwU3H3clRlsuPGT2YMZT26Q2kOOze1szVjGrZ9kxF4vLwMBPaqUc9moKNNJrODL36n
         MZxm3Q5NHZZcTaf2WG02Jde3GPMVXf2BYQhjZ0fZTABlSvZMe3VUoMWEWFfjJ7ya7Hus
         3ZrWK8s0lAn/gvSrVnPv6nc47VMOElqIeNc7jXqZXfA1lCb4I49y1QeMbGTN2ZQw7fy9
         yP1zdWcyy7QuyvExyGLZbh4l0Wv+b1UWqQHwpO5B63/MwQcj4vQdP0y5xcPWY644+4bq
         hyEA==
X-Gm-Message-State: AOJu0Ywsog/ZwGy8rnYZIeQqJ0/YhsL5DxhhagEQbWYvDS+0Gwrn0ACN
	37zZyEZgZsx8S6Qfno0JCQ3bvn203L/GdBGOTwX6gwi/lacg/YolqfRcKO2DJ52B5AYJh6iex2L
	Lsp01Xt6nGMWvlEBjaBrBmVWOaNM=
X-Google-Smtp-Source: AGHT+IHKmP2HekXEYPLAcqW7XIfIBfd4WFnJHHgcC184+QXz2tFUllBSakfjhxAOoDCGNYE0PH+fjwBayhA7lET8r88=
X-Received: by 2002:a05:6871:58d:b0:234:56db:7c8c with SMTP id
 586e51a60fabf-24c68e72b53mr4068842fac.57.1716429442417; Wed, 22 May 2024
 18:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240523015510.1988259-1-changqing.li@windriver.com>
In-Reply-To: <20240523015510.1988259-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2024 18:56:56 -0700
Message-ID: <CAMKF1soJhcOmVx_XY68_-=FFEpvneAgeVNea47sDuRMbySknfA@mail.gmail.com>
Subject: Re: [oe] [master][meta-oe][PATCH V2] fuse3: remove sysv init script
 and install fuse kernel module explictly
To: changqing.li@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 01:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110493

On Wed, May 22, 2024 at 6:55=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> For systemd, there is not a fuse.service since systemd provides
> sys-fs-fuse-connections.mount to mount the fuse control filesystem, so
> instead, only fuse3.conf is added to modules-load.d to load the required
> fuse kernel module.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-support/fuse/fuse3/fuse3.conf |  1 +
>  meta-oe/recipes-support/fuse/fuse3_3.16.2.bb  | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/fuse/fuse3/fuse3.conf
>
> diff --git a/meta-oe/recipes-support/fuse/fuse3/fuse3.conf b/meta-oe/reci=
pes-support/fuse/fuse3/fuse3.conf
> new file mode 100644
> index 000000000..a517c488f
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse3/fuse3.conf
> @@ -0,0 +1 @@
> +fuse
> diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recip=
es-support/fuse/fuse3_3.16.2.bb
> index 307544bf3..b799b2c6b 100644
> --- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
> +++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
> @@ -27,6 +27,7 @@ inherit meson pkgconfig ptest
>
>  SRC_URI +=3D " \
>      file://run-ptest \
> +    file://fuse3.conf \
>  "
>
>  RDEPENDS:${PN}-ptest +=3D " \
> @@ -78,6 +79,20 @@ FILES:fuse3-utils =3D "${bindir} ${base_sbindir}"
>  DEBIAN_NOAUTONAME:fuse3-utils =3D "1"
>  DEBIAN_NOAUTONAME:${PN}-dbg =3D "1"
>
> +SYSTEMD_SERVICE:${PN} =3D ""
> +
>  do_install:append() {
>      rm -rf ${D}${base_prefix}/dev
> +
> +    # systemd class remove the sysv_initddir only if systemd_system_unit=
dir
> +    # contains anything, but it's not needed if sysvinit is not in DISTR=
O_FEATURES
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'tru=
e', d)}; then
> +        rm -rf ${D}${sysconfdir}/init.d/
> +    fi
> +
> +    # Install systemd related configuration file
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        install -d ${D}${sysconfdir}/modules-load.d
> +        install -m 0644 ${WORKDIR}/fuse3.conf ${D}${sysconfdir}/modules-=
load.d

This should be UNPACKDIR instead of WORKDIR here.

> +    fi
>  }
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110492): https://lists.openembedded.org/g/openembedde=
d-devel/message/110492
> Mute This Topic: https://lists.openembedded.org/mt/106255586/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

