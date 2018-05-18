Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE4A748C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 07:23:07 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id j5-v6so13180722wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=840tpflkeI/0216rDC6GBsN4i1H4XGkp+94LeE8RXv0=;
	b=RXMcMSH+wtzvppDXI7Nyn9njyXrLSS43uIiLNSF+s86S9SPblVvZMulrDjGbcp8n7n
	ic4GKwE/KIF9fmGkGBi+KSIcosKBXX+S9a+/O+oCNAR9+sde4z4esTMSVjnlRDZcgXZM
	LDTdYcpRZftPkA2SadB8KQRZ1ayApVAQ2RR/vR5FtJ6jTQAT/WsZ7bHPSPx4VqT7swat
	BmxKFir5aE0B3gJueJDrk0xjW3ZOveV0N9pHi1CzAijRjkJrua3zR27IKUppR1WU4uL+
	MyTOVoNeKp3fihrQwaLj6zsP2yaBdx5l1BWOskpr1qbVLA5btHz5BdtYJHTaiC3kHTMl
	U0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=840tpflkeI/0216rDC6GBsN4i1H4XGkp+94LeE8RXv0=;
	b=SQ39tG3t3pxdrsUlUjiX5NfiApsHVZ6BJoGCWGNkWFBn+t4A6tpiSCWijv6DxptWl8
	n8Mv/4HIWY2jm105zSnZnp44XczkTXYpbypTBlfip5V6Ss7JBXTbBbY0sPLvaS/1bxT1
	TgHPp8jeCIF7Pe4+AzP0kJmRUGxXo90EkuVdtKdNKIZHMfjUOF14RJnmVS36525a0Tmf
	X+yFdpTdhDeCRhkRgzeBU3AzOEXxkMKwW5ZEImUhp0+FeTAwohGc3eMEETjIm185DYXD
	/fDhkqehgTDCMsMg6CnHKXW+o878CaXuwEstTkCyYKP8yl/8JXtBSwcYoRRonqPaombX
	JNow==
X-Gm-Message-State: ALKqPwc6o9IrO7bkrc4ml2U8TeQcHQV6Ed1L6QN7GEz451dRc4nWqyxT
	0zGI0NZDH/oSA85HQCW0gkk=
X-Google-Smtp-Source: AB8JxZoBgiRMO0NtaPArfAKDltNhRu+3IL5KZv8Ejw2H6dw/H0yctOf5xftX2gPTnNmZU8Tyx3gcTQ==
X-Received: by 2002:a1c:71c4:: with SMTP id
	d65-v6mr3511151wmi.157.1526628188737; 
	Fri, 18 May 2018 00:23:08 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p7-v6sm6357393wrj.85.2018.05.18.00.23.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 May 2018 00:23:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 May 2018 09:23:08 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180518072308.GA1715@jama>
References: <20180517232110.22663-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180517232110.22663-1-raj.khem@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH 1/5] evince: Reset PR to 0
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
X-List-Received-Date: Fri, 18 May 2018 07:23:08 -0000
X-Groupsio-MsgNum: 72249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 04:21:06PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-gnome/recipes-gnome/evince/evince_3.28.1.bb | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb b/meta-gnom=
e/recipes-gnome/evince/evince_3.28.1.bb
> index ce73620b09..97fe769c5d 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
> @@ -3,7 +3,6 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96f2f8d5ee576a2163977938ea36f=
a7b"
>  SECTION =3D "x11/office"
>  DEPENDS =3D "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11=
','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-ico=
n-theme intltool-native gnome-common-native"
> -PR =3D "r5"

Why, it makes the version going backwards without any good reason to do
that.

> =20
>  inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection d=
istro_features_check systemd
> =20
> --=20
> 2.17.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWv5/XAAKCRA3VSO3ZXaA
HP3KAKCDLfKFv9DLL0soSm8jp7GaaTDKNACglXZRxH/jvStlg67k0k0jj8N4tyg=
=UFlS
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
