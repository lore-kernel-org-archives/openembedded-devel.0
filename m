Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B873C7746D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 18:10:55 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id un2so6535423wjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RfWh8u9YkxuHV3RKk0bKA9u154vUfgwQRYf2Cerwvqk=;
	b=Wz09UPL9+mu7v7yfASZ5UydFozLx0Hkcuo7oZF7gUtSTgcCUTGvo2kUlHNXH3yqlel
	ZPxyOwRNzVafQxP7dKn9dO3/UIkaiVO8UWHKPP6C7hY1P4ZUgmRGuU5B6gmR3tL7g12I
	hUxWaKA1fuhp1k9DxQ9VuBNaHLmo6zfm8278rBZEu9poEsTuMdxQhWlFguKOMdfaLuBq
	vBtZPZk2ClqHDpPJMrTcPBGq8teE2DhWLHZwfTSorLaWo8oWP21mFYN+4M72hFUnbuAU
	Es2LtHePJAcHqklgSSJL9mE3911kmaaS6OnyNT4Mi7qcUwN1djL/jlEGR90TmoHU366O
	FC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RfWh8u9YkxuHV3RKk0bKA9u154vUfgwQRYf2Cerwvqk=;
	b=DjzETrJ05k6g3Ufssd8OyzPV6KWcacv2i8awV1JXGPF1cf+eBPBEjf52A3UwI1lxL9
	4QXOKjM7t/42c9CtH9Os8Oxz6XnXpyw0OGbCCX4WSpeChhVFxAUjCA9Z84CZdHRNzP+J
	Tx+CGBX6AyRXEieeDEPucKiPIlz+/3+cHM1kDdafeWh+YS/IAGn/OZ3t1DdbDBck7MaG
	kPGTK1eo0XfICzrXlt//hcbPl9Ier1WX+6Wb8XPP4qLwN9t2ywsdxuk689YE392rcOb9
	dHtJez+Fv587v0cWONGzqJoIEpIifqzF17Y25fTJtbUYzaaZAyO4iyDGgh1mwbUWeJgi
	12VA==
X-Gm-Message-State: AIkVDXJazaKvPel14dalOlIYWwKkRgcenqjT5rRgVL7Dfdcdtn4WoQdOgelQnWXMNMU3Bw==
X-Received: by 10.223.164.207 with SMTP id h15mr8442455wrb.142.1485540655244; 
	Fri, 27 Jan 2017 10:10:55 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m84sm5054993wmf.10.2017.01.27.10.10.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 10:10:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Jan 2017 19:10:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170127181055.GB9282@jama>
References: <1484831267-76876-1-git-send-email-herve.jourdain@neuf.fr>
MIME-Version: 1.0
In-Reply-To: <1484831267-76876-1-git-send-email-herve.jourdain@neuf.fr>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH] Minor improvements: configure complains it can't find oe-device-extra.pri, and add libxkbcommon in the dependencies
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
X-List-Received-Date: Fri, 27 Jan 2017 18:10:56 -0000
X-Groupsio-MsgNum: 64911
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline

--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 09:07:47PM +0800, Herve Jourdain wrote:
> During configure, it complains it can't find oe-device-extra.pri, but it =
doesn't result in any error. Fix it, though, just in case.
> In qtwayland, xkb should be optional, but it's not for the moment, so add=
 it to the dependencies.

Can you please check if both of these are still needed for 5.8 (in
master-next) and if so, send rebased version (preferably 2 separate
commits) with proper commit summary?

See:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

>=20
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  recipes-qt/qt5/qtbase_git.bb    | 3 +++
>  recipes-qt/qt5/qtwayland_git.bb | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 6541973..258c7ed 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -173,6 +173,9 @@ do_configure() {
>          ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
>      fi
> =20
> +    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device=
-extra.pri: No such file or directory" during configuration
> +    touch ${S}/mkspecs/oe-device-extra.pri
> +
>      ${S}/configure -v \
>          -opensource -confirm-license \
>          -sysroot ${STAGING_DIR_TARGET} \
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_g=
it.bb
> index e315924..51421d5 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -18,6 +18,7 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  #FIXME: xkb should be optional; we add it here to fix the build error wi=
thout it
>  #       (https://bugreports.qt.io/browse/QTBUG-54851)
> +DEPENDS +=3D "libxkbcommon"
>  PACKAGECONFIG ?=3D " \
>      compositor-api \
>      wayland-egl \
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIuNLgAKCRA3VSO3ZXaA
HIuVAJ9YucBTpW4VibLVZ1TJZqU/eouGSgCgkiry7fwiT9u9UHHEv+WTfhRHreU=
=vxX7
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
