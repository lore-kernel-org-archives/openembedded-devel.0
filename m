Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PimlL-0000uK-QX for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 12:45:11 +0100
Received: from f053044076.adsl.alicedsl.de ([78.53.44.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pimka-0001lA-23 for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 11:44:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1296209389-20272-1-git-send-email-fabian@progra.de>
References: <1296209389-20272-1-git-send-email-fabian@progra.de>
Date: Fri, 28 Jan 2011 12:44:22 +0100
Message-ID: <1296215062.3831.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] totem-pl-parser_2.30.0: fix configure without gobject introspection
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
X-List-Received-Date: Fri, 28 Jan 2011 11:45:11 -0000
X-Groupsio-MsgNum: 28559
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IRnNW7gSkGM6+/OtyEw2"

--=-IRnNW7gSkGM6+/OtyEw2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Fabian,


Am Freitag, den 28.01.2011, 11:09 +0100 schrieb Fabian Ruff:
> this bugfix removes the configure error:
>   HAVE_INTROSPECTION does not appear in AM_CONDITIONAL

please add your Signed-off-by line as required by the commit policy [1].

> ---
>  recipes/totem/totem-pl-parser_2.30.0.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/totem/totem-pl-parser_2.30.0.bb b/recipes/totem/tote=
m-pl-parser_2.30.0.bb
> index 31d6b04..a69de38 100644
> --- a/recipes/totem/totem-pl-parser_2.30.0.bb
> +++ b/recipes/totem/totem-pl-parser_2.30.0.bb
> @@ -11,10 +11,9 @@ inherit gnome
>  SRC_URI[archive.md5sum] =3D "81bf8e3043a9ec89bdd391c36ebd50d1"
>  SRC_URI[archive.sha256sum] =3D "403b18c1582c14effb4e2dabf339dfdbc4528520=
4a0cf958fc250a387b6fc65c"
> =20
> -EXTRA_OECONF =3D "--enable-introspection=3Dno"
> -
>  # Build of documentation is not yet possible:
>  do_configure_prepend() {
> +	sed -i -e 's:GOBJECT_INTROSPECTION_CHECK(\[0.6.7\]):AM_CONDITIONAL([HAV=
E_INTROSPECTION], [false]):g' ${S}/configure.in
>  	sed -i -e s:docs::g ${S}/Makefile.am
>  }

This problem seems to be still appear upstream. Could you report that to
them?


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy
[2] http://git.gnome.org/browse/totem-pl-parser/tree/configure.in?id=3D9fef=
f79d4b263280bfaadccef4c6d1d81841eae4#n155

--=-IRnNW7gSkGM6+/OtyEw2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1CrBAACgkQPX1aK2wOHVgF8wCdFjc9V6PYKliFQN0KhuLNpIlH
07EAn33O8yELv5WimmxPT6+2MzQWla8w
=3V4v
-----END PGP SIGNATURE-----

--=-IRnNW7gSkGM6+/OtyEw2--
