Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id A60576C4D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 11:16:01 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a3so3774898ioc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 03:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E5q8nulxOc+BH7AkyAhh2kmpWDYnDf5ASvBhLd3cOSc=;
	b=bpcVFo8C+NwDDDKUUlcWye/m+YwYYVBVBS7PnabP0PM5FSRdZNlTQuF2De5PB9i1y7
	wQrBMzErYHxsGK2Tte+W42ZAWZMwTwG1gOz3WuFiNug/VsjkFULe4Skkjv5RFMAvdBy+
	G+2wblR5yewMTLyHqKFq/UMNKZdhSMeD+AmTA4AC+wcvHChLeTFl6mbn3p8vM+TpWx89
	mtmsxnmCOg5EaZdd80DUiFx6d803AOCsyuTu5eZQDr9djiid8Iz7XhgBkBHrpsJL7yqb
	DSgeihzaMU7J5YjwHxgQHc2Rb+EXmeWHDnkJ1CNCoNkQG1s75qUHlr50gpEA180T7PBm
	Kmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E5q8nulxOc+BH7AkyAhh2kmpWDYnDf5ASvBhLd3cOSc=;
	b=QFi8AghJZp0bQWIrEVWp6UGauspwnYytZFRjt5zQmcN1LS36/AOzoiByzluGi3uM8W
	N0xqGgn/dq8MKzIWkNeeyp8ATpx+/i+rcx3zrPqh00sfuw8qFbFHTvLr3NubAaSAMzqL
	pczB8b/562WYzrYkNQgLXw8yLd2pSsHCk1IC1U52tfpN7+vvuWf3ZFKIyowX0LEMCoWd
	J8wq/vE3b1l8RLmimCGRjP7kC4K8fxaBNPZ3a4glvKCuD2AP2UhH2yC/vd1ljtbb2A02
	1pKfJ90s01SFzkSDmV1n9+kJf13dYmlHVcn2DMQn43Q/FygA++esl4rAl55lTyAWJM+L
	E48g==
X-Gm-Message-State: AA+aEWZ5UxEQreLSSBQTW7cjHotkjeJCEkazzrPfmgeUksv0aVu9sxWg
	k46wKkgHCa0YWfUlMDaRU5ymASt1LHUh+Ei1CGxjTmzd7Ac=
X-Google-Smtp-Source: AFSGD/WRh1LRuhSuox2vvnGCi3nDU2IhertI+yRgXi+r4+zJkmhMOk1vH7rcL8reTzA1sURHmMgtzjJMQJlyQie8IEU=
X-Received: by 2002:a6b:1602:: with SMTP id 2-v6mr4176451iow.201.1542798962621;
	Wed, 21 Nov 2018 03:16:02 -0800 (PST)
MIME-Version: 1.0
References: <20181121081012.118414-1-martin@geanix.com>
	<20181121081012.118414-3-martin@geanix.com>
In-Reply-To: <20181121081012.118414-3-martin@geanix.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2018 11:15:51 +0000
Message-ID: <CAJTo0LYg0GkLrvO4zjCi660mxs94KEd-8xxX3CeugK25Ou1CVw@mail.gmail.com>
To: martin@geanix.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] iwd: add version 0.12
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
X-List-Received-Date: Wed, 21 Nov 2018 11:16:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Nov 2018 at 08:19, Martin Hundeb=C3=B8ll <martin@geanix.com> wro=
te:
> The iwd wireless daemon is an alternative to wpa_supplicant. It is
> controlled using the iwctl command line client (or the dbus interface).
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  meta-oe/recipes-connectivity/iwd/iwd_0.12.bb | 24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_0.12.bb
> new file mode 100644
> index 000000000..a4261547e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "Wireless daemon for Linux"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb504b67c50331fc78734fed90fb0=
e09"
> +
> +inherit autotools pkgconfig systemd
> +
> +DEPENDS =3D "ell readline dbus"
> +
> +SRC_URI =3D "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
> +SRCREV =3D "d7609915db4b57229f7dd4c04b4eabcce637872a"
> +S =3D "${WORKDIR}/git"
> +
> +SYSTEMD_SERVICE_${PN} =3D "iwd.service"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> +PACKAGECONFIG[systemd] =3D "--with-systemd-unitdir=3D${systemd_system_un=
itdir},--disable-systemd-service,systemd"
> +
> +EXTRA_OECONF +=3D "--enable-external-ell"
> +
> +do_configure_prepend () {
> +    mkdir -p ${S}/build-aux
> +}
> +
> +FILES_${PN} +=3D "${datadir}/dbus-1"

I started a recipe for this but never got around to submitting it.
You'll find it here:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dross/mutwipar=
gh&id=3D0e7d8a005540bdc36c7af68c0fdb8670ef74a0e0

I definitely think the PACKAGECONFIGs and ead.service need to be added
before merging.  The ptest stuff wasn't tested so I don't know how
useful it was.

Ross

