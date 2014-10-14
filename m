Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1636ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:18:58 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so40772wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eLGsaIuLnnryM4lGGAo+QOfJK79OXWV6+pDv7tmZzII=;
	b=tQlFGAl/r8Qr2oM0r356fmzmalio7oq9OxzJE0s51wjwY8WnoR7m4knOJySIAQukDY
	ZQJ9n07hR/W1zqejMGRbnTOAIt2MJ+YgSxW0QG99LQ/+VHP4dZWl4cMGLU2dkz16twhh
	vtMLibT1KQz7NJshtDXDfJpdUCM0yZZ0skT3SheiLotcUVGEAmcf+VkMfy9Hyw6k1X2I
	lE0W3tm3KskAkkduItcF8nhuXhJJW2lV1yxYo0gDGrffTvOcxZ8DlEpgMh7z5TA5pE2V
	++scKphv1CZXkUbUgGTJA/DCSxuXiRZ9OUJwEne4Wu6KsLjwZP/KrDgV7oI51Uq0W1oT
	eK9A==
X-Received: by 10.194.76.135 with SMTP id k7mr6025889wjw.94.1413325139611;
	Tue, 14 Oct 2014 15:18:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d3sm17160601wix.5.2014.10.14.15.18.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:18:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Oct 2014 00:20:48 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141014222048.GN3000@jama>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 00/15] updates and qa fixes
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
X-List-Received-Date: Tue, 14 Oct 2014 22:19:03 -0000
X-Groupsio-MsgNum: 52515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ngPZezdD7QsvFaqQ"
Content-Disposition: inline

--ngPZezdD7QsvFaqQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2014 at 12:14:13AM +0200, Andreas M=FCller wrote:
> The following changes since commit d1951db22a9971a1bb7cf25810ec3bdc9669a6=
f1:
>=20
>   modphp: using PKGCONFIG and PACKAGECONFIG for libxml and soap (2014-10-=
14 11:48:58 +0200)

You want this in dizzy right? I'm happy to see QA fixes, thanks a lot!

> are available in the git repository at:
>=20
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches
>=20
> for you to fetch changes up to 3d89bac9443e27b68ac88571eefbfb8d77e2d3dc:
>=20
>   libgphoto2: add bash to RDEPENDS (2014-10-14 20:15:29 +0200)
>=20
> ----------------------------------------------------------------
> Andreas M=FCller (15):
>       xfce4-clipman-plugin: update to 1.2.6
>       xfce4-equake-plugin: update to 1.3.5
>       xfce4-terminal: update to 0.6.3
>       xfce-app.bbclass: SRC_URI calculation supports multiple digit versi=
on numbers
>       orage: update to 4.10.0
>       glade3: update to 3.8.5
>       mime-support: add perl to RDEPENDS
>       xfce4-places-plugin: update to 1.6.0
>       gigolo: initial add 0.4.2
>       xfce4-mailwatch-plugin: initial add 1.2.0
>       packagegroup-xfce-extended: add xfce4-mailwatch-plugin and gigolo
>       tumbler: make build deterministic by adding PACKAGECONFIG for gstre=
amer-thumbnailer
>       xfce4-dev-tools: add bash to RDEPENDS
>       geany update to 1.24.1
>       libgphoto2: add bash to RDEPENDS
>=20
>  meta-oe/recipes-devtools/geany/{geany_1.23.bb =3D> geany_1.24.1.bb}     =
                                   |  4 ++--
>  meta-oe/recipes-devtools/glade/{glade3_3.8.2.bb =3D> glade3_3.8.5.bb}   =
                                   |  9 ++++-----
>  meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb                   =
                                 |  1 +
>  meta-oe/recipes-support/mime-support/mime-support_3.48.bb               =
                                 |  1 +
>  meta-xfce/classes/xfce-app.bbclass                                      =
                                 |  2 +-
>  meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb                           =
                                 | 11 +++++++++++
>  meta-xfce/recipes-apps/orage/{orage_4.8.4.bb =3D> orage_4.10.0.bb}      =
                                   |  4 ++--
>  meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.2.bb =3D> xfce=
4-terminal_0.6.3.bb}               |  4 ++--
>  meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.3.bb =
=3D> xfce4-clipman-plugin_1.2.6.bb} |  6 ++++--
>  meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.3.bb =3D=
> xfce4-equake-plugin_1.3.5.bb}    |  5 ++---
>  meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.b=
b                                | 11 +++++++++++
>  meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.5.0.bb =3D=
> xfce4-places-plugin_1.6.0.bb}    |  4 ++--
>  meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb      =
                                 |  2 ++
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb                        =
                                 |  3 +++
>  meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb        =
                                 |  2 ++
>  15 files changed, 50 insertions(+), 19 deletions(-)
>  rename meta-oe/recipes-devtools/geany/{geany_1.23.bb =3D> geany_1.24.1.b=
b} (73%)
>  rename meta-oe/recipes-devtools/glade/{glade3_3.8.2.bb =3D> glade3_3.8.5=
=2Ebb} (73%)
>  create mode 100644 meta-xfce/recipes-apps/gigolo/gigolo_0.4.2.bb
>  rename meta-xfce/recipes-apps/orage/{orage_4.8.4.bb =3D> orage_4.10.0.bb=
} (80%)
>  rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.2.bb =
=3D> xfce4-terminal_0.6.3.bb} (67%)
>  rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2=
=2E3.bb =3D> xfce4-clipman-plugin_1.2.6.bb} (69%)
>  rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.3=
=2Ebb =3D> xfce4-equake-plugin_1.3.5.bb} (64%)
>  create mode 100644 meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailw=
atch-plugin_1.2.0.bb
>  rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.5.0=
=2Ebb =3D> xfce4-places-plugin_1.6.0.bb} (74%)
>=20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ngPZezdD7QsvFaqQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ9ocAACgkQN1Ujt2V2gBxcQgCfSrKXTsdvDmUAYTyKUgJHdAoN
N18AoIfiSuaLgsdkvLyNMy3c2Qc408lN
=WY8F
-----END PGP SIGNATURE-----

--ngPZezdD7QsvFaqQ--
