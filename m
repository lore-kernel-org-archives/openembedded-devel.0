Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4B471B10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:11:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so9819063wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=D+f1owIlLotxctZE91eULRynT1MPD/Azm1h3oZLj1wA=;
	b=Nhg06DSCkxL9p66ZJcsGb1/gPtrr3Ee2hO+7FHaijTniSh04rLhn21fw7poSVc6Mmj
	BB+2Tcf/OHZPGZ7MWAP1+O8WCUFP3rNbjEWzR4VRQGCEfu1ot2TMmJ+ioX05SaC/nKyJ
	4/0uc2xZZM7IXnzmVDDEY/76occY3x4gjhJLeKLpdEHyYFBDuCvHEq7MWcCCUOo/ARxn
	w/XTp0aW7ciCCaB/ejHigFu72UGP1Nzfs3gyxKAwrIIGXyuFkuE3yaqMSxG3k8Jf4pxq
	Go5jtn27TN0o0yp9NSEPGsp/6Na2uU627r724GXYP7b4IouRVKN+C7wUZNVXxgYB1uVC
	LFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=D+f1owIlLotxctZE91eULRynT1MPD/Azm1h3oZLj1wA=;
	b=XEuOyfiYL+JQEmgKRHJnIpEoE7zqoUp4DIFm2bGw3NuRmypbqvGOScwgf6anG/hilV
	AdzYsY5Z0cHbkndBp4xlISXW/xYIOjAq8+il4t2BKhQ44bTIpijYCDc18etfm0X4ug+L
	QUtu9G2+DoVUSwTLE6cAZ1dy6yXMqUQBCfTSqh2bRYQs5nipda07Who0MMmfx+GHOpL2
	QUcgVcJWB/nndX266vCakLS5j+DNFuNxpPo3b3GWjCQvfI6XFUwiyObVLg32JMmEND1w
	Nn5Xopjy3myCxnD972AYbQy4wFDuozVj/C4zlscKlHSCQm8RNO6Dz5Gyt51zh1OSiW+e
	agxQ==
X-Gm-Message-State: AKaTC00Cs/WK/PI3epoDpemayQUMH/kaLPSQ0oSoTFrUOEe8zDtt9+8TwWq6RHESZufVDw==
X-Received: by 10.28.199.71 with SMTP id x68mr9342663wmf.34.1480119072068;
	Fri, 25 Nov 2016 16:11:12 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	gk6sm31642892wjc.46.2016.11.25.16.11.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 16:11:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 01:11:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161126001115.GB3271@jama>
References: <1479910421-28750-1-git-send-email-ross.burton@intel.com>
	<1479910421-28750-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1479910421-28750-2-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [PATCH 2/4] meta-oe: add explicit dependencies on gnome-common
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
X-List-Received-Date: Sat, 26 Nov 2016 00:11:11 -0000
X-Groupsio-MsgNum: 64042
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 02:13:39PM +0000, Ross Burton wrote:
> gnome-common is deprecated and gnomebase.bbclass will soon stop depending=
 on it,
> so add gnome-common to DEPENDS for the recipes that still use it.

Doesn't it cause libgxim failure reported here?
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/11=
0050.html

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb | 3 +--
>  meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb          | 2 +-
>  meta-oe/recipes-gnome/vte9/vte9.inc                        | 3 +--
>  3 files changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb b=
/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
> index 77416d4..e490ae5 100644
> --- a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
> @@ -8,7 +8,7 @@ inherit autotools pkgconfig gnomebase distutils-base gobj=
ect-introspection
>  PYTHON_BASEVERSION =3D "2.7"
>  PYTHON_PN =3D "python"
> =20
> -DEPENDS +=3D "python glib-2.0"
> +DEPENDS +=3D "gnome-common-native python glib-2.0"
> =20
>  SRCNAME=3D"pygobject"
>  SRC_URI =3D " \
> @@ -31,4 +31,3 @@ do_install_append() {
>      # Remove files that clash with python3-pygobject; their content is s=
ame
>      rm ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconf=
ig/pygobject-3.0.pc
>  }
> -
> diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/=
recipes-extended/libgxim/libgxim_0.5.0.bb
> index 772babf..1d5ae95 100644
> --- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
> +++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
> @@ -20,6 +20,6 @@ LIC_FILES_CHKSUM =3D "\
>  file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
> =20
>  EXTRA_OECONF =3D " --disable-static --disable-rebuilds"
> -DEPENDS +=3D "gtk+ glib-2.0 ruby-native intltool-native"
> +DEPENDS +=3D "gtk+ glib-2.0 ruby-native intltool-native gnome-common-nat=
ive"
> =20
>  inherit autotools pkgconfig gettext
> diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/=
vte9/vte9.inc
> index 6a5c63c..206c430 100644
> --- a/meta-oe/recipes-gnome/vte9/vte9.inc
> +++ b/meta-oe/recipes-gnome/vte9/vte9.inc
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Virtual terminal emulator GTK+ widget library"
>  BUGTRACKER =3D "https://bugzilla.gnome.org/buglist.cgi?product=3Dvte"
>  LICENSE =3D "LGPLv2.0"
> -DEPENDS =3D " glib-2.0 gtk+ intltool-native ncurses"
> +DEPENDS =3D " glib-2.0 gtk+ intltool-native gnome-common-native ncurses"
>  RDEPENDS_libvte =3D "vte-termcap"
> =20
>  # help gnomebase get the SRC_URI correct
> @@ -16,4 +16,3 @@ EXTRA_OECONF =3D "--disable-python"
>  PACKAGES =3D+ "libvte9 vte9-termcap"
>  FILES_libvte9 =3D "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
>  FILES_vte9-termcap =3D "${datadir}/vte/termcap-0.0"
> -
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjTIwAKCRA3VSO3ZXaA
HBQjAJ9nVCHYGnbX3LBR1UNbfKUZO6W4SACguHyKALgM1NTZsEM33mcBijBUhhY=
=kirt
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
