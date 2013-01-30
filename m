Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Wgo-0006D8-3T
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 13:22:54 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so750930dad.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LuxY6nTrQzpjCkHDZBmsN+w5cjNZLr7f2Zh7YnPuABw=;
	b=wsl6ET5GG2F7nVeCmzuBjDzpCSf31YtVOW5wU4s/TbF1Pap545nxbJVn0nujOyCEew
	cUAKWlsh36dSpll3zpnVtdL9mKvsnlE5OqUc08iHOJmnC79DNHWo46M91zykeA+fnVrT
	blZeh6VzbVvNyHV+OF8D4r7gRgRgbhyt3P7f+EOWpuMhXsZTb11ZtTKIxE+7zyb+vgx3
	/cezBkUruIOuaXYs4s9S2VnXIxmUFBH+RaSlyj7jjZRKXg8E0EXQxK2O3Y0CMUMqqUdj
	qZRvsNpj6VoBzuQ1fzKV6Hwrxu7miELpkg+T8sUDZc1GFpB0CgJTMLAPomC1H6mqC9F+
	J8QQ==
X-Received: by 10.66.77.99 with SMTP id r3mr10844261paw.10.1359547632149;
	Wed, 30 Jan 2013 04:07:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qm9sm1449084pbc.10.2013.01.30.04.07.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 04:07:10 -0800 (PST)
Date: Wed, 30 Jan 2013 13:07:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130130120707.GW16904@jama.palm1.palmone.com>
References: <1359539878-8331-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
In-Reply-To: <1359539878-8331-1-git-send-email-david.nystrom@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Subject: Re: [meta-oe][PATCH] Upgrade of python-lxml to 2.3.5
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
X-List-Received-Date: Wed, 30 Jan 2013 12:22:54 -0000
X-Groupsio-MsgNum: 42924
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v+f2vxqcSo8kvURS"
Content-Disposition: inline

--v+f2vxqcSo8kvURS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 10:57:58AM +0100, David Nystr=F6m wrote:
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  .../{python-lxml_2.2.8.bb =3D> python-lxml_2.3.5.bb} |   15 +++++++-----=
---
>  1 file changed, 7 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-devtools/python/{python-lxml_2.2.8.bb =3D> python=
-lxml_2.3.5.bb} (69%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-=
oe/recipes-devtools/python/python-lxml_2.3.5.bb
> similarity index 69%
> rename from meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> rename to meta-oe/recipes-devtools/python/python-lxml_2.3.5.bb
> index a175609..76821ff 100644
> --- a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> +++ b/meta-oe/recipes-devtools/python/python-lxml_2.3.5.bb
> @@ -2,20 +2,21 @@ DESCRIPTION =3D "Powerful and Pythonic XML processing l=
ibrary combining \
>  libxml2/libxslt with the ElementTree API."
>  HOMEPAGE =3D "http://codespeak.net/lxml"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D7de92baeb3b7bfaebe724041=
55fdb346"
> +LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D3638a580895ea734c2cbb46f=
586afd2c"
>  SRCNAME =3D "lxml"
> -PR =3D "r2"
> +PR =3D "r0"
> =20
>  DEPENDS =3D "libxml2 libxslt"
>  RDEPENDS_${PN} +=3D "libxml2 libxslt python-compression"
> =20
> -SRC_URI =3D "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNA=
ME}-${PV}.tar.gz;name=3Dlxml"
> -SRC_URI[lxml.md5sum] =3D "d6c612d63a84d79440912a1b29d3b981"
> -SRC_URI[lxml.sha256sum] =3D "89b73925b5e3295dcf4675cb948007a20eb029fe35c=
9a162ae19ec11f1abafe5"
> +SRC_URI =3D "http://lxml.de/files/lxml-2.3.5.tgz \
> +"
> =20
> +SRC_URI[md5sum] =3D "d03fb3b9139df7f182afffe72f412c87"
> +SRC_URI[sha256sum] =3D "7ec68de58814014543b3b6f21f36e3695359be715ad06348=
a14c7820dfa0e092"
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> =20
> -inherit setuptools
> +inherit setuptools=20

Please don't add trailing whitespace :).

>  DISTUTILS_BUILD_ARGS +=3D " \
>                       --with-xslt-config=3D'${STAGING_BINDIR_NATIVE}/pkg-=
config libxslt' \
> @@ -30,5 +31,3 @@ DISTUTILS_INSTALL_ARGS +=3D " \
>  BBCLASSEXTEND =3D "native nativesdk"
>  RDEPENDS_${PN}_virtclass-native =3D "libxml2-native libxslt-native"
> =20
> -
> -

Please save another byte and remove also previous empty line.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--v+f2vxqcSo8kvURS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEJDOsACgkQN1Ujt2V2gBzoxgCfV7TtQguhkpDvyfdq1Jufjgd6
i3EAn1+Lqg6KHRzREa3BK9gKhjUKtJ0J
=v+0E
-----END PGP SIGNATURE-----

--v+f2vxqcSo8kvURS--
