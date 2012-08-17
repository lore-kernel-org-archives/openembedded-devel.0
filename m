Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T2HSY-00054X-Jn
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 09:59:10 +0200
Received: by wgbdr1 with SMTP id dr1so2771733wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2012 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e1I8bb17Q4HQegAF7JbM5l3Yx+rHWVy93L1dQIGV4vU=;
	b=pM1Xr/6SC4AYGj5DkK5P4GjH8za1Anvb5QjlwZAXfpoDioMAT9ronBWJhJTFCSrvFD
	hdyP0RM9vM+qDD449tmbsfHlnYd6sbjdLiItZuzJYMHgkJJVOjCDslcCCPZVuwp5WnoI
	qzF1jRjungqXLAYPH/4pu/GhFEqvck2jmKtpnsOSKTNHn7YNw66ZXyVBu05tdl3npAPw
	jMp/kr98ZsOmbfMHkb0tjAeRyi7VmI9n8a1AXwuEo5N2xztNVoVpTONaHOLqWdBvJ9SD
	X8LROdEm+oSdbKYVRCumyOzwZgQa1Ie9E8+TKjFcNgFvnRIt77ckUpA+fr4NKtXcze21
	/EyQ==
Received: by 10.180.84.169 with SMTP id a9mr2808902wiz.8.1345189632494;
	Fri, 17 Aug 2012 00:47:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm12528878wiz.11.2012.08.17.00.47.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 00:47:11 -0700 (PDT)
Date: Fri, 17 Aug 2012 09:47:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120817074714.GD3625@jama.jama.net>
References: <1345189700-26130-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1345189700-26130-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] pango: remove and use oe-core version 1.30
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 07:59:10 -0000
X-Groupsio-MsgNum: 40235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline

--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 09:48:19AM +0200, Andreas M=FCller wrote:
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  .../pango/pango-1.29.4/no-tests.patch              |   11 -----------
>  meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |   10 ----------
>  2 files changed, 0 insertions(+), 21 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.=
patch
>  delete mode 100644 meta-oe/recipes-graphics/pango/pango_1.29.4.bb
>=20
> diff --git a/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch b=
/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
> deleted file mode 100644
> index ce64db1..0000000
> --- a/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -diff -uNr pango-1.29.4.orig/Makefile.am pango-1.29.4/Makefile.am
> ---- pango-1.29.4.orig/Makefile.am	2011-08-16 03:11:08.000000000 +0200
> -+++ pango-1.29.4/Makefile.am	2011-09-30 16:11:53.792567952 +0200
> -@@ -1,6 +1,6 @@
> - ## Process this file with automake to create Makefile.in.
> -=20
> --SUBDIRS=3D pango modules pango-view examples docs tools tests build
> -+SUBDIRS=3D pango modules pango-view examples docs tools build
> -=20
> - EXTRA_DIST =3D 			\
> - 	autogen.sh		\
> diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/rec=
ipes-graphics/pango/pango_1.29.4.bb
> deleted file mode 100644
> index ea79a63..0000000
> --- a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require recipes-graphics/pango/pango.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7"
> -
> -SRC_URI[archive.md5sum] =3D "a5ee785f4f31d6bdd8625a09ea3f8b4b"
> -SRC_URI[archive.sha256sum] =3D "f15deecaecf1e9dcb7db0e4947d12b5bcff11258=
6434f8d30a5afd750747ff2b"
> -
> -SRC_URI +=3D "file://no-tests.patch"
> -
> -PR =3D "r4"
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAt9wIACgkQN1Ujt2V2gBwq+ACaA1PtkEu36e0zSCsYM8NUwJiv
5u0AoI7yUilsEC7GpfoF8/oyW0xdnClZ
=JyH2
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
