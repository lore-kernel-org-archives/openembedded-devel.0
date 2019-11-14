Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD197FA19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:42:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h15so6507389qka.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OKAuMw8tyHLC1Wd3f7krOQLfiQ4c4ohPijoZzvnsLW0=;
	b=YBojsVoR4LxhXPuXopiT6d/VUMzS1o39LtYvhYZdGfeDaoFAyS+o2+OeFdb+io0tAU
	E28ba0rkmK6TgS+PfesZ0FiRTM7Ja9gKhsV6ASGnpJ6IHDEQC3CfFgFh++/cY2EDFojE
	sFpclGTDaHLUmsOZPdPuKojsiC2dG519l6GCXmhHzMVQHUSwoTUH5DroIAB7QHOqq6l0
	/m+AaLbsNrv2NJq8dcoptPT72Nz+jsJKi3JzUN4SsV+82P0xZ4IB3A4HyXag7/VRYZIX
	+CxL4n5PiVbybBvqL8JVCDiM7A3Td5jCyhFmw2CR9FIWH7ml3wuXvhqhb7z0BC4bleJE
	+BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OKAuMw8tyHLC1Wd3f7krOQLfiQ4c4ohPijoZzvnsLW0=;
	b=Rj/uqUqc5kWC8v6e5m/PsCdNK3YGBxlBM6z6Bpz98dRcdoQwgPEK+erk3JgqOJXorL
	5R0hyHNRKwkn0Sp047VC52ZRsLz0Cvp7Hd8mLErrNQRMjIBFXpYggDwAkrTMqb/emHkP
	GbO6GpKtQTECoMZeW/Lzpz6ZFLHtfjvMv4RRmJqUDVuqWphi2AAaGSIzZUGCmf7z8cyp
	v5cqBuZY8IuePLE1Ruvo2ClTkRU2Xsc8V6QMzQ0mkFxhmLgVo6XGRDEEt34MtkxkHAYS
	lJOws0iYXzn2m5abtegG6a0eyRlbjibZjbwB3sX6XSRuQz6n4iTJJyqZKO8m4xdlzzHh
	ouZw==
X-Gm-Message-State: APjAAAWrqv5pnMPZKkYzMiX1N463pv8U3AI0GewBpDpRNMbdU+ysn+4t
	V82MSGbNrX0YdckLCd7Ny72wT3wfy7HzVmoHaLU=
X-Google-Smtp-Source: APXvYqzwotawXXC1eTewsjwXOIiVj2psc+ECSzplw49qyacVEzAJp3NG+4fc0hfEIg4pE0ZCrMZndpWbmrYIe6LuPJw=
X-Received: by 2002:a37:a2c3:: with SMTP id l186mr9922564qke.337.1573771379080;
	Thu, 14 Nov 2019 14:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-6-schnitzeltony@gmail.com>
In-Reply-To: <20191114194930.2786-6-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:42:32 -0800
Message-ID: <CAMKF1spx9AWfa2xanQf4bSR5U_4_fo9-0DbBR+AfOTGoEC5cfQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/16] gnome-terminal: re-add 3.34.2
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
X-List-Received-Date: Thu, 14 Nov 2019 22:42:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails on musl

https://errors.yoctoproject.org/Errors/Details/275786/

perhaps a patch proposed here will help us ?
https://gitlab.gnome.org/GNOME/vte/issues/72

On Thu, Nov 14, 2019 at 11:50 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../gnome-terminal/gnome-terminal_3.34.2.bb   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-termina=
l_3.34.2.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.=
2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
> new file mode 100644
> index 000000000..d688176d5
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "GNOME terminal"
> +LICENSE =3D "GPLv3 & GFDL-1.3"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967949 \
> +    file://COPYING.GFDL;md5=3Da22d0be1ce2284b67950a4d1673dd1b0 \
> +"
> +
> +inherit gnomebase gnome-help gettext itstool upstream-version-is-even
> +
> +DEPENDS =3D " \
> +    glib-2.0-native \
> +    intltool-native \
> +    yelp-tools-native \
> +    desktop-file-utils-native \
> +    gtk+3 \
> +    gsettings-desktop-schemas \
> +    vte \
> +    dconf \
> +    libpcre2 \
> +"
> +
> +SRC_URI[archive.md5sum] =3D "13fa9f5f459481c7f05b6964c470ef16"
> +SRC_URI[archive.sha256sum] =3D "3bd723f4058ec014da4715db4181b7d73eccc797=
b85ad5e6236996951c01803d"
> +
> +EXTRA_OECONF +=3D " \
> +    --disable-search-provider \
> +    --without-nautilus-extension \
> +"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/metainfo \
> +    ${datadir}/dbus-1 \
> +    ${systemd_user_unitdir} \
> +"
> +
> +RRECOMMENDS_${PN} +=3D "vte-prompt gsettings-desktop-schemas"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

