Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UcEBS-0007J7-2X
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 14:18:27 +0200
Received: by mail-pa0-f44.google.com with SMTP id jh10so458026pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=min+fHszIy5oW9qieNPUMR1xIQ4D7eVhdXLHY33Bttk=;
	b=RDfOPZjeja6vUsxp813Ikl4Bi184uZSeTCyc7h5MxnKwraSrkP+tsqhD/Dh4pqfKT2
	l1NhsBbhOrrFgqDs322JHwNItCqqyoPFhWcPFgIMlavQ1T3S/kKz7zq6MfQ3FqJWtq53
	iDu8YqUu2Gk2uvWdhqL+mfTLfG29Mc/mzZ/Vg4PRZLPbkSikv3mmpgZh9jyR15FaWRxB
	XvNk8rpqpiUMNaS19dcjd9gnyVjYkeJ6s6OSEeqP2fu14aW1QRJndqRZohibMwWszmz1
	1N8KhN5nxE3XuiW0hCaTgc04d03zjWMcuogj8rwOGMWlkG9HUg5ycnXWmanCpjkoYkKw
	iNpQ==
X-Received: by 10.68.218.8 with SMTP id pc8mr33438218pbc.115.1368532810258;
	Tue, 14 May 2013 05:00:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qi1sm19150053pac.21.2013.05.14.05.00.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 14 May 2013 05:00:09 -0700 (PDT)
Date: Tue, 14 May 2013 14:00:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130514120008.GH3187@jama>
References: <1368524249-8219-1-git-send-email-hong-hua.yin@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1368524249-8219-1-git-send-email-hong-hua.yin@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core master] yajl: pass the cmake variable LIB_SUFFIX to handle installation on 64-bit systems
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
X-List-Received-Date: Tue, 14 May 2013 12:18:32 -0000
X-List-Received-Date: Tue, 14 May 2013 12:18:32 -0000
X-Groupsio-MsgNum: 44705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline

--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2013 at 05:37:29PM +0800, Olivia Yin wrote:
> WARNING: QA Issue: yajl: Files/directories were installed but not shipped
>   /usr/lib
>   /usr/lib/libyajl.so.2
>   /usr/lib/libyajl.so
>   /usr/lib/libyajl_s.a
>   /usr/lib/libyajl.so.2.0.4
>   /usr/lib/.debug
>   /usr/lib/.debug/libyajl.so.2.0.4
>=20
> NOTE: for 64-bit systems where lib64 is used you can pass the cmake
>       variable LIB_SUFFIX to cause installation into the system's 'lib64'
>       directory.

Subject incorrectly says oe-core.

> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
> ---
>  meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb b/meta-oe/recipe=
s-devtools/yajl/yajl_2.0.4.bb
> index 7359520..9d67e2d 100644
> --- a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION =3D "Yet Another JSON Library - A Portable JSON parsing and =
serialization library in ANSI C"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74f541bd9a2b6c8e5d0714bcdc327=
f32"
> +PR =3D "r1"
> =20
>  SRCREV =3D "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
>  SRC_URI =3D "git://github.com/lloyd/yajl.git"
> @@ -8,3 +9,5 @@ SRC_URI =3D "git://github.com/lloyd/yajl.git"
>  S =3D "${WORKDIR}/git"
> =20
>  inherit cmake lib_package
> +
> +EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib', True).replace('=
lib', '')}"
> --=20
> 1.7.0.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGSJ0gACgkQN1Ujt2V2gBwkkwCfaYttKB8JSJfHlFZ0zCpwwWC3
hk8An1bdJGE7EPLrcwUbgnYwRpmOZ1yV
=KcpN
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--
