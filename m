Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 30FF065CFE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:28:24 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2868725eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qObW1gK86UDEm+pbe/0QDMR1iXBHa7IZrev6MvQH0HA=;
	b=MJIPxNRmMc55DJP82Cc9A63SRj9U/fI9Wu4ZFmcBWtf5y/ec5WQCM/V+a0AaFzgzOu
	YeiHhaAkhtzykdrdoh7OZiBo8WyZjz6wi9a1yDVJodHAlP845CDXzgInNRTvQU+/PdOO
	mMVucdF/r1X46aiyH78Xikwtn5FK0lSQzPK3cOma6GAFl69GSgYr8mRccavCVbuPdQ3j
	vm5vDC7eOZWtzwxsIpqyS1gAn4NucNeBGJS6Gm9FoOsb9rqcxydUKDvyp3xroPk2LNjc
	icwcyxA1z5qQtsey6LEdYRjhXVNcIQXyPcHwi2fK1ebREGNHuwEBPG13AXIFZOJq6hrA
	pAfQ==
X-Received: by 10.15.31.70 with SMTP id x46mr37261247eeu.26.1397986105447;
	Sun, 20 Apr 2014 02:28:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm93003567eev.5.2014.04.20.02.28.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:28:24 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:28:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420092829.GF2486@jama>
References: <cover.1397459226.git.Chong.Lu@windriver.com>
	<bbac515278f9507ebb997506af418a1b8fe02753.1397459226.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <bbac515278f9507ebb997506af418a1b8fe02753.1397459226.git.Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/2] mariadb: use /bin/false as the login shell
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
X-List-Received-Date: Sun, 20 Apr 2014 09:28:26 -0000
X-Groupsio-MsgNum: 49313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PqX6tBBuHl4HmZHK"
Content-Disposition: inline

--PqX6tBBuHl4HmZHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2014 at 03:16:38PM +0800, Chong Lu wrote:
> Use /bin/false as the login shell, just like what Ubuntu does,
> otherwise there might be secure issue.

1/2 Merged, thanks

2/2 has question from koen, which needs to be resolved first

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/r=
ecipes-support/mysql/mariadb_5.1.67.inc
> index 100b3a7..37a0f0c 100644
> --- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
> @@ -35,7 +35,7 @@ INITSCRIPT_NAME =3D "mysqld"
>  INITSCRIPT_PARAMS =3D "start 45 5 . stop 45 0 6 1 ."
> =20
>  USERADD_PACKAGES =3D "${PN}-server"
> -USERADD_PARAM_${PN}-server =3D "--system --home-dir /var/mysql -g nogrou=
p mysql"
> +USERADD_PARAM_${PN}-server =3D "--system --home-dir /var/mysql -g nogrou=
p --shell /bin/false mysql"
> =20
> =20
>  export ac_cv_path_PS=3D"/bin/ps"
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PqX6tBBuHl4HmZHK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkz0ACgkQN1Ujt2V2gBwxpwCgt4gao8HtVGcPB/t3bvScrG3v
KaUAoJgLFCOxoPJOXqF7B6KjXVToDgqh
=JI4+
-----END PGP SIGNATURE-----

--PqX6tBBuHl4HmZHK--
