Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NUzOt-00024S-G9 for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 10:20:30 +0100
Received: from f053038039.adsl.alicedsl.de ([78.53.38.39]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NUzMp-0007Y6-Mt for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 09:18:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263341840-19186-1-git-send-email-Martin.Jansa@gmail.com>
References: <20100112222121.GD10781@jama>
	<1263341840-19186-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 13 Jan 2010 10:18:17 +0100
Message-ID: <1263374297.3228.3.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/3] opkg, update-alternatives-cworth: use /usr/lib/opkg/alternatives directory instead of /usr/lib/ipkg/alternatives
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
X-List-Received-Date: Wed, 13 Jan 2010 09:20:30 -0000
X-Groupsio-MsgNum: 15635
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XGq58c6GpD0AJjgWNX/C"

--=-XGq58c6GpD0AJjgWNX/C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 13.01.2010, 01:17 +0100 schrieb Martin Jansa:
> * It's usefull to make it compatible with u-a script in opkg package
> * Old entries are merged to new directory in quite verbose postinst
>   script
> * If entry exists only in old its moved

it=E2=80=99s

[=E2=80=A6]

> diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
> index 1716034..b317de4 100644
> --- a/recipes/opkg/opkg.inc
> +++ b/recipes/opkg/opkg.inc
> @@ -4,7 +4,7 @@ SECTION =3D "base"
>  LICENSE =3D "GPL"
>  DEPENDS =3D "curl gpgme"
>  PV =3D "0.1.6+svnr${SRCPV}"
> -INC_PR =3D "r18"
> +INC_PR =3D "r20"

I know it would not be a problem, but should not that only be increased
by one [1]?

[=E2=80=A6]


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/html/recipes_versioning.html

--=-XGq58c6GpD0AJjgWNX/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktNj9MACgkQPX1aK2wOHViNowCdFiaVs0kfS50UgzqLWiUn6bQW
t28AniP2X1hftmY4Y8x43wY3xTKqGiTb
=1exL
-----END PGP SIGNATURE-----

--=-XGq58c6GpD0AJjgWNX/C--
