Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUiYK-0004Yu-Bk
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 20:02:24 +0200
Received: by wgbdr1 with SMTP id dr1so899642wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ho5R47C6cdK6J3XqrDBi9AoedJddcKoSwIUbaZPGgkc=;
	b=sJb0Fs3r2TSj8g5w8TrNR6v4ODBnKE3zI2tb9Uh18nzsQ8+R9By36zZ8arFqJfkHO4
	xUsLrWFfV5398padbGzUzbDpukSa//ISRaNZjE3TTsjPm66O5hKrxbivmKNihanv3jn1
	sXrhmBwwn+sRUrs0pZ+QB1UBzdt4G/g4q//v4+XHZIblAe2r5YeZpryEiN6UnkdBYrEw
	sfpVkjdhWW0a6I1oNBNDjwxOgvowkHhbGGDdxBIX+q080p06TBvIMZXUf5tkjQwq8VLE
	Bt7JllDCCoDqeCFtVhEY4/Ozb2iMMiqI3co/D/KaerzjWiUMgd1iK+VITV9HnxYEQvHs
	NW6Q==
Received: by 10.180.103.42 with SMTP id ft10mr2062078wib.18.1337190742930;
	Wed, 16 May 2012 10:52:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n11sm11193922wiv.9.2012.05.16.10.52.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 10:52:22 -0700 (PDT)
Date: Wed, 16 May 2012 19:52:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120516175224.GE3154@jama.jama.net>
References: <1337181494-26467-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1337181494-26467-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libnl: bump PE
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
X-List-Received-Date: Wed, 16 May 2012 18:02:24 -0000
X-Groupsio-MsgNum: 38824
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline

--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 05:18:14PM +0200, Martin Jansa wrote:
> * libnl-2 in oe-core has PE 1, so in order to have upgrade patch from lib=
nl-2 to libnl-3 we need PE 1 here too

upgrade path would be even better if someone adds RREPLACES/RCONFLICTS
magic to resolve this:

 * check_data_file_clashes: Package libnl-3-200 wants to install file /etc/=
libnl/pktloc
   But that file is already provided by package  * libnl2

Cheers,

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/libnl/libnl_3.2.3.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb b/meta-oe/recip=
es-support/libnl/libnl_3.2.3.bb
> index 190ea4c..38d34bf 100644
> --- a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
> +++ b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
> @@ -2,6 +2,8 @@ DESCRIPTION =3D "libnl is a library for applications deal=
ing with netlink sockets.
>  HOMEPAGE =3D "http://www.infradead.org/~tgr/libnl/"
>  SECTION =3D "libs/network"
> =20
> +PE =3D "1"
> +
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2b41e13261a330ee784153ecbb6a8=
2bc"
> =20
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+z6VgACgkQN1Ujt2V2gBzKxwCeIW4zR0lylCwHvjjHQAs4DgGA
dN4AnjW4lNvDliBLOwc3QYo1vF5fhIpS
=QZ67
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
