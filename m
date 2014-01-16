Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0076E3AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 09:27:22 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so1384118eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 01:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FvjjoBccj18y8qSHwNBbPrMV3ANcEclk6JdhD/jXuAI=;
	b=qBoGzjVbGMKLraMp4swjiRAl9ibMW36jEIRaZlHlx0XSbOcngwWEuzCkHx/xiI3jW6
	C2yrs1hnpRVORbEwjy3cp763yQxDo4cUp92Jg+ae59jIBd1SZBC8fqtk3TruwpR1q2RC
	beLyOaQciiUSG0a9u9TYKsUdpsV0afLm/ceWjd9674+XvftF/uHHaOWX7vRIhOgZaMMr
	8kON/ychqBzql4rCOV/pxSK0yX8HSVkw8P/pTwqMUvzLzPsLELAcWQLyP9XF+0PGaTod
	l+BgJg+rVPl3tFVMbbvq0RLUhj65k7QKrCXS5rkdI0jRQtFzcnjjwHV9t+Bo1Jq4FNZu
	A4sw==
X-Received: by 10.14.0.201 with SMTP id 49mr10914508eeb.38.1389864441441;
	Thu, 16 Jan 2014 01:27:21 -0800 (PST)
Received: from localhost ([89.176.104.107])
	by mx.google.com with ESMTPSA id z46sm16859992een.1.2014.01.16.01.27.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 01:27:20 -0800 (PST)
Date: Thu, 16 Jan 2014 10:27:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140116092731.GE3742@jama>
References: <1389842914-12116-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1389842914-12116-1-git-send-email-b40290@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] python-mako: remove
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
X-List-Received-Date: Thu, 16 Jan 2014 09:27:23 -0000
X-Groupsio-MsgNum: 47771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline

--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2014 at 11:28:34AM +0800, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
>     *This recipe is now back in OE-Core.
>=20

Ross already sent removal for all these yesterday.

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../recipes-devtools/python/python-mako_0.7.2.bb   | 22 ----------------=
------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-=
oe/recipes-devtools/python/python-mako_0.7.2.bb
> deleted file mode 100644
> index 1d2bdd7..0000000
> --- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION =3D "Templating library for Python"
> -SECTION =3D "devel/python"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda8dd26ed9751ee0cfdf9df1a16bb=
b54"
> -
> -PR =3D "r2"
> -
> -SRC_URI =3D "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "e3c0a677aa4216da9e89ef8fa76cbafb"
> -SRC_URI[sha256sum] =3D "fe8698e845035586bd711a6748e4e40a208a58de276b9138=
026164700494b68f"
> -
> -S =3D "${WORKDIR}/Mako-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} =3D "python-threading \
> -                  python-netclient \
> -                  python-html \
> -"
> -RDEPENDS_${PN}_class-native =3D ""
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.8.3.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLXpgMACgkQN1Ujt2V2gBwpiQCePwNUP0amb46ng1uA2yZ6tKAa
WpgAoKYc7T36qUKA25oRWyGjReZWMS6H
=vwnf
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
