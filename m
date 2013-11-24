Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id AD8776B5DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 14:17:29 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so1794931eak.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BHWvkug/3OFki+my4OIU7y5oSPZouvd5FOZh2D78rBY=;
	b=hulMrd0e+0hvGDTkD49B6VUYCye6SaZBej9AAhzvWhM/wpbBBLdcy7ASqGvv3UyvZU
	CkxtqRf8WMCVq0uyvxONsMDyK/dArngRMEFZ8ZODgiA40KgAiJCnrU/HaI9UrXLmn/bA
	NRWS1u/Zw5k5uOpczLyRq9pWUNQnmtQVRsPvrAkUYWQmkY2KzwgtgLF9NTdVjZIL0Rxc
	0It8e0q4gAmrlGhabG/vSRAoIpQkEuHlLNWbWww8JQfqfCrSgimY25onqvv0wSx0BRGG
	M04IooJYB9H0yEqXMEmfQBdihxU+PGZRDK+w2Azzw/7beKxzLE0wOY+EF3K/BabsV0wk
	QcJQ==
X-Received: by 10.15.43.140 with SMTP id x12mr29873890eev.4.1385302649063;
	Sun, 24 Nov 2013 06:17:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm53047812eeg.13.2013.11.24.06.17.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2013 06:17:28 -0800 (PST)
Date: Sun, 24 Nov 2013 15:17:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131124141728.GB2870@jama>
References: <1385022230-30471-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
In-Reply-To: <1385022230-30471-1-git-send-email-ulf@emagii.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] pangomm,goffice: Add missing dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Nov 2013 14:17:30 -0000
X-Groupsio-MsgNum: 47244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2013 at 09:23:50AM +0100, Ulf Samuelsson wrote:
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>

Please rebase to master first, librsvg is already there and pangomm_2.28.2
is already gone _and_ fixed, both many months ago

commit 45b798b2880463813d0f6673615b54fcbdad1a02
Author:     Martin Jansa <Martin.Jansa@gmail.com>
AuthorDate: Thu Aug 8 09:13:50 2013 +0200
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Wed Aug 14 13:34:29 2013 +0200

    goffice: add librsvg dependency
   =20
    * No package 'librsvg-2.0' found
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gn=
ome/recipes-support/goffice/goffice_0.10.1.bb
index 5b46d99..098e275 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION=3D"Gnome Office Library"
 LICENSE=3D"GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6dc33ff21e1ba1ac1a2a1069d361e29=
e"
=20
-DEPENDS =3D "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf l=
ibpcre libxml2 libart-lgpl"
+DEPENDS =3D "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf l=
ibpcre libxml2 libart-lgpl librsvg"
=20
 inherit gnome pkgconfig perlnative
=20
commit 2c55673d4b39a36b95d96b4107af91c1e2014d61
Author:     Khem Raj <raj.khem@gmail.com>
AuthorDate: Fri May 17 05:53:15 2013 +0000
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Tue May 21 12:45:48 2013 +0200

    pangomm: Add missing dependency on pango
   =20
    Fixes errors like
   =20
    | configure:15678: error: Package requirements (glibmm-2.4 >=3D 2.14.1
    cairomm-1.0 >=3D 1.2.2 pangocairo >=3D 1.23.0) were not met:
    |
    | No package 'pangocairo' found
   =20
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/rec=
ipes-graphics/pango/pangomm_2.28.2.bb
index 4419113..302062c 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1c=
b29a1e3fd737b499 \
=20
 PR =3D "r2"
=20
-DEPENDS =3D "mm-common cairomm glibmm"
+DEPENDS =3D "mm-common cairomm glibmm pango"
=20
 SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split=
('.')[1]}"
=20
> ---
>  .../recipes-support/goffice/goffice_0.10.1.bb      |    5 ++++-
>  meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb   |    2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-=
gnome/recipes-support/goffice/goffice_0.10.1.bb
> index 5b46d99..77dd60e 100644
> --- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
> +++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
> @@ -3,7 +3,10 @@ DESCRIPTION=3D"Gnome Office Library"
>  LICENSE=3D"GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6dc33ff21e1ba1ac1a2a1069d361e=
29e"
> =20
> -DEPENDS =3D "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf=
 libpcre libxml2 libart-lgpl"
> +DEPENDS =3D "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf=
 libpcre libxml2 libart-lgpl librsvg gdk-pixbuf"
> +
> +# The following dependencies exists, but are they handled in OpenEmbedde=
d?
> +# DEPENDS =3D "gobject-2.0 gmodule-2.0 gio-2.0"
> =20
>  inherit gnome pkgconfig perlnative
> =20
> diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/r=
ecipes-graphics/pango/pangomm_2.28.2.bb
> index 4419113..302062c 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c=
1cb29a1e3fd737b499 \
> =20
>  PR =3D "r2"
> =20
> -DEPENDS =3D "mm-common cairomm glibmm"
> +DEPENDS =3D "mm-common cairomm glibmm pango"
> =20
>  SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKSCngACgkQN1Ujt2V2gBxWHgCfW06Yw3NA2X2LTpMabG+vpAGY
T9IAoLPft/Csbu+/UxR0C+rFxnjILlbg
=0OSn
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
