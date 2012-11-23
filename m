Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbvSe-0008Ob-2y
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:46:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so5073709eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 07:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MbvPd+jsxCTFf1KpYVsBPv0RwqlTQNTBhH0opDDACno=;
	b=JoArJVKcTA4Q/yMbqiVs5V4XswlkQOn+ZvRD6vEgAhuz6sxjHv2PoQqp9WswoRTpgW
	A1SDzKEwVqTaL14ypShc74AoaydmQSKJVKVQECK6YupP8S1QpegwqA3Jspc1l3PjQBQ6
	jIAZzn2bDFRLeFgLvM92mLE5WTGSkLyp3lZXr9j7CTFACIO905I56fFvyW+LtaLR6vqo
	OoExTKLCLB2fOcgJ0TX3+yVjKahg6skytuGoHa69yemC8zKnLpP/RkJjVnvwi/aRYPvP
	b4BaFB1Z+7Mw1OfQ8BKPyB/GsUJ2XqxVzlR4ZD3i+txQB+Oq+fi7kYOZ4vNTENorO1Ww
	CoCg==
Received: by 10.14.176.68 with SMTP id a44mr14946149eem.1.1353684748559;
	Fri, 23 Nov 2012 07:32:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm14245658eel.14.2012.11.23.07.32.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 07:32:28 -0800 (PST)
Date: Fri, 23 Nov 2012 16:32:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121123153228.GQ12637@jama.jama.net>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1353684287-19180-10-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1353684287-19180-10-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 9/9] python-phoneutils: drop due to lack of libphone-utils
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
X-List-Received-Date: Fri, 23 Nov 2012 15:46:36 -0000
X-Groupsio-MsgNum: 41688
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k0QEB357i8jZX4tx"
Content-Disposition: inline

--k0QEB357i8jZX4tx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2012 at 04:24:47PM +0100, Marcin Juszkiewicz wrote:
> ERROR: Nothing PROVIDES 'libphone-utils' (but meta-openembedded/meta-oe/r=
ecipes-devtools/python/python-phoneutils_git.bb DEPENDS on or otherwise req=
uires it)
> ERROR: Required build target 'python-phoneutils' has no buildable provide=
rs.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-devtools/python/python-phoneutils_git.bb | 15 ----------=
-----
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/python/python-phoneutils_git=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb b/m=
eta-oe/recipes-devtools/python/python-phoneutils_git.bb
> deleted file mode 100644
> index 36f5241..0000000
> --- a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION =3D "Python Bindings for libphone-utils"
> -SECTION =3D "devel/python"
> -DEPENDS =3D "libphone-utils python-cython-native python-pyrex-native"
> -RDEPENDS_${PN} =3D "libphone-utils"
> -LICENSE =3D "LGPLv2.1+"
> -LIC_FILES_CHKSUM =3D "file://phoneutils/c_phoneutils.pyx;endline=3D18;md=
5=3Dca321e4ec3a30a44469b23ebca782665"
> -
> -SRCREV =3D "8a7c719e0c3f1f8c10f77f17422da02d7177f0dd"
> -PV =3D "0.0.2+gitr${SRCPV}"
> -PR =3D "r5"
> -
> -SRC_URI =3D "git://git.shr-project.org/repo/libphone-utils.git;protocol=
=3Dhttp;branch=3Dmaster"
> -S =3D "${WORKDIR}/git/src/python"
> -
> -inherit setuptools
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k0QEB357i8jZX4tx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCvlwwACgkQN1Ujt2V2gBwMEgCghZgpvdLlB8kZV6fVbbkS8HeF
LbQAn1tuPl8hnmWO59JEN/tRaOGZVwRF
=4e25
-----END PGP SIGNATURE-----

--k0QEB357i8jZX4tx--
