Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 347C37F95C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 19:57:50 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id c2so4698685qvp.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+daz/cSK0zWAR5Iph+U9dZS/UJcyrEpvLApuf5odUIU=;
	b=EhfpUSlbTeMlDRSAFbUXHRBI+CGLfbwmTgOatDf7mO6Ht7w1DO4wTXMbeaMtFuWDxz
	gXLzx4EWCynWNwmZPZdrh1DccauhRWE4EQHLjD9QPSmHHf7K7oPPXD3f2OtbgjKEqFfk
	/QhMykTzXbzPWQeUGHN17pT6IH6G5I9RrBs+QJIkWWy648Jo+l/KRu1oZL4s6HC+zowv
	32IG4genW1PJIAb1FQ/cdHsHMMZk2oKitQ7unzd5c4jyXOReTVQyOsT1Q1qh6BHnga6r
	Av9G5QhpCA0ds3JZYJu9tUyC8ojOhRCSjzKpvj6RM51Tpd7/HknIwdgCtUbpSRfd5fQB
	jYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+daz/cSK0zWAR5Iph+U9dZS/UJcyrEpvLApuf5odUIU=;
	b=mOtXTfgObrHw4m/fwGPCocJrF3ZTj7PY8s/xGRc8mdhzkMSPgJjLAcFf6dai9OfZiR
	LMOdbEvCEoRB0MRaIvw2Ci2/GlDan3HNWKeNFkED3KPEnLhz8o/gzgqjhMNESN+ZNRF5
	3jpPo27HZypN4/3dDx/CcCdJDM/YyBg3PKKRavEtFzDwJKeZ8MkZmHpJTjkIqJvfXZTr
	rBvTw6xnvxjN5wPIJx3oYsnHHzWS5bD3JigFMSMWR2cxygs2M041DMwK0oapzOvJZemX
	yL8DJ1ifP71pBLlIHxks/6OKGpdsR/cY3lqjs1lQrkmvMqa8k5HYOUz3MoIMx+YjdIIB
	kWEg==
X-Gm-Message-State: APjAAAVqRmbh8AyIheCSEjsVapHQ2iVCf4KPUWpFrQkAQidK4SfvuRyS
	K94tlKuE9EVfYt2iIflfrrPotJo4shgLMvaCD5o=
X-Google-Smtp-Source: APXvYqzV5AYvfLDKETZjkMg2HSJ8mP+JTuFnanw28Psjk2kzbpLSKx3l4CMmrnpsm6TrdoytCWpcBdJErwRMAh9DIoA=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr30130582qvm.206.1576007870536;
	Tue, 10 Dec 2019 11:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
	<20191209083612.23922-6-schnitzeltony@gmail.com>
In-Reply-To: <20191209083612.23922-6-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 11:57:24 -0800
Message-ID: <CAMKF1spG5KPsiw7PkDG0JwPVGwJudMFduieEcmf73trCUMSG-g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v3 05/20] accountsservice: initial add 0.6.55
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Dec 2019 19:57:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2019 at 12:37 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> It is a dependency for upcoming gnome-control-center
>

This seems to have hard dependency on systemd ? or can it be
configured without systemd as well see

https://errors.yoctoproject.org/Errors/Details/296904/

in case it can not, then we need to exclude it from parsing when
systemd is not in DISTRO_FEATURES

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../accountsservice/accountsservice_0.6.55.bb | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice_0.6.55.bb
>
> diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_0=
.6.55.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.5=
5.bb
> new file mode 100644
> index 000000000..bf603b3bc
> --- /dev/null
> +++ b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.b=
b
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "D-Bus interfaces for querying and manipulating user acc=
ount information"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/AccountsService/=
"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +DEPENDS =3D " \
> +    dbus \
> +    polkit \
> +"
> +
> +inherit meson gobject-introspection gtk-doc features_check systemd
> +
> +REQUIRED_DISTRO_FEATURES =3D "polkit"
> +
> +SRC_URI =3D "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.ta=
r.xz"
> +SRC_URI[md5sum] =3D "6e4c6fbd490260cfe17de2e76f5d803a"
> +SRC_URI[sha256sum] =3D "ff2b2419a7e06bd9cb335ffe391c7409b49a0f0130b890bd=
54692a3986699c9b"
> +
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
> +
> +SYSTEMD_SERVICE_${PN} =3D "accounts-daemon.service"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/polkit-1 \
> +"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

