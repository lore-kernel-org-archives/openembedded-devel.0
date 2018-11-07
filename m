Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF0636FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 20:44:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p2-v6so16893780wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 12:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W3R2g5Injit21eAn/dckhkVpDUAixQjr5+nD3Y2SKZY=;
	b=vBiuK5IOMJ0q5ngnq+mgcqJlaCBvMKsmCNxdmE+uCG4AHuJCdqBMNTlWIhisYIEsIS
	D5QgnopEqTrH8vkLbDkyfxxFJRTz95URnbyWaQBGJWHYkBXILGFsDBRuTuEltqb+YxbM
	e/Qjd61gFDKRUork8INJyGeaAgMcG+VZF6SWYeNl6ENHkPTIj1UXujwpQOVlhFVoFF7M
	6Fg5xhDxWE0RvavEkYq1k8cGjOzaZ80Br+WImYvVjIsuZdp12LmRxESGqdNE0SuQ5UEv
	LuMB5Y16WRdCcES0YVOjBmRZ/zOMZj5U4LYVk8il7+vJAjvZ4YJbcvK9/1eX0+Y6JazK
	8w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W3R2g5Injit21eAn/dckhkVpDUAixQjr5+nD3Y2SKZY=;
	b=jIshZUmBdUDR4UYP9Xtm40skN1L5+khpT4zlPVfDIslVO7b/jKgmTWRPpiWhtHzWCL
	XgGM1mYZDvRGY4d28bwyQOxVtIULxXTib7BEEgaULAV4qKBi6wIiEK77rDn/FJlQ33AJ
	F7g7gNRfMrDzLK66fHWUsAaqcyWNHHlKdkSsKNE63oVW/ztBgdszputNWEcgIVsOt9pj
	jv4GY9CH95jQ40llyOH+00qfBKJFIWvHOD3EfZblaeMtHnFAjsV746OVkIctUeLqO1kt
	oDKUvA2JLHNCKgCFEro9tsNSiMZnl7l7C6uAdjiaRg8voVjAvqIoCywpHh15XL3kjShU
	Izuw==
X-Gm-Message-State: AGRZ1gL3Fp1jZ7U6ShiV6PsXxKkEZ2kWM0mBNHQTvEGADOv8zc3jdggU
	VuSn9Z/R81sXra1NwSp9VmY=
X-Google-Smtp-Source: AJdET5ee8JV0y1ZHuDMY3xoIybEU8p6guObiApVZxTvbmL8bVCF309R3055v+fhWla+8HNDYFcZCwA==
X-Received: by 2002:a1c:3e84:: with SMTP id
	l126-v6mr1502136wma.57.1541623449316; 
	Wed, 07 Nov 2018 12:44:09 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x16-v6sm1857743wro.28.2018.11.07.12.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Nov 2018 12:44:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Nov 2018 21:44:12 +0100
To: akuster808 <akuster808@gmail.com>
Message-ID: <20181107204412.GB1408@jama>
References: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
	<CALbNGRR1gd6fr8iivhxqfBqPnvL+yiAtKFHRvKD-v-G4GyV8eQ@mail.gmail.com>
	<fb6b0063-4d24-c1b1-eff2-c0e5849bea16@gmail.com>
MIME-Version: 1.0
In-Reply-To: <fb6b0063-4d24-c1b1-eff2-c0e5849bea16@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] blueman: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Nov 2018 20:44:09 -0000
X-Groupsio-MsgNum: 75321
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline

--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 07, 2018 at 11:40:40AM -0800, akuster808 wrote:
>=20
> On 11/7/18 11:22 AM, Andreas M=FCller wrote:
> > On Wed, Nov 7, 2018 at 8:12 PM Armin Kuster <akuster808@gmail.com> wrot=
e:
> >> fixes
> >> ERROR: Required build target 'blueman' has no buildable providers.
> >> Missing or unbuildable dependency chain was: ['blueman', 'thunar']
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  meta-networking/recipes-connectivity/blueman/blueman_git.bb | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.=
bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> index 8eb99ed..06a11b7 100644
> >> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> +++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> @@ -27,9 +27,10 @@ RRECOMENDS_${PN} +=3D "adwaita-icon-theme"
> >>  RDEPENDS_${PN} +=3D " \
> >>      python3-dbus \
> >>      packagegroup-tools-bluetooth \
> >> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'thunar', '', d)} \
> >>  "
> >> -
> >> -PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-se=
ndto,,thunar"
> >> +PACKAGECONGIG ??=3D ""
> >> +PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-se=
ndto,,"
> >>
> >>  FILES_${PN} +=3D " \
> >>      ${datadir}/dbus-1 \
> >> --
> >> 2.7.4
> >>
> > This is not right: How shall this happen if meta-xfce is not in your
> > layers - I suggest you run a cleansstate after changing layer
> > configuration
>=20
>=20
> I am running the yocto-check-layer.=A0 Should this recipe really be in
> meta-xfce? .. I am out of options on how to get this to pass. Maybe no
> one cares if it ever does???

Isn't the error shown only with your addition to RDEPENDS? Because
without this patch the thunar dependency is enabled only when meta-xfce
layer is included with:

cat ./meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend
PACKAGECONFIG_append =3D " thunar"

Why would blueman depend on thunar without meta-xfce?
And with both meta-networking and meta-xfce included it will find thunar
depdencency in meta-xfce.

But with your change you're adding thunar dependency whenever x11 is in
DISTRO_FEATURES with or without meta-xfce included which is clearly
wrong and yocto-check-layer would be correct to complain.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW+NOmwAKCRA3VSO3ZXaA
HIxRAJ419HonI/x/Ifz0dz0RToEeJSnMAwCgmrVt88kmRJy4kw+1zo8Ghy4X8CM=
=pdsI
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
