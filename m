Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QUM08-0007MP-Jd for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 18:53:04 +0200
Received: from g229061018.adsl.alicedsl.de ([92.229.61.18]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QULxn-0005tb-1n for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 16:50:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307541389-2401-1-git-send-email-matteo.facchinetti@sirius-es.it>
References: <1307541389-2401-1-git-send-email-matteo.facchinetti@sirius-es.it>
Date: Wed, 08 Jun 2011 18:49:45 +0200
Message-ID: <1307551786.4193.25.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Wed, 08 Jun 2011 16:53:04 -0000
X-Groupsio-MsgNum: 32589
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-e6ymQBOeTx6lFSf+pC1S"

--=-e6ymQBOeTx6lFSf+pC1S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 08.06.2011, 15:56 +0200 schrieb Matteo Facchinetti:
> From: Matteo Facchinetti <engineering@sirius-es.it>
>=20
> Compile task fail with error:
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
> | cc1plus: internal compiler error: in add_path, at c-incpath.c:425
>=20
> Fix it forcing right path in configuration.

It builds fine for me without this patch using `minimal` for `MACHINE =3D
"beagleboard"`. How can I reproduce your build error?

> Signed-off-by: Matteo Facchinetti <engineering@sirius-es.it>
> ---
>  recipes/wxwidgets/wxbase_2.8.9.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/wxwidgets/wxbase_2.8.9.bb b/recipes/wxwidgets/wxbase=
_2.8.9.bb
> index fb18710..b87da11 100644
> --- a/recipes/wxwidgets/wxbase_2.8.9.bb
> +++ b/recipes/wxwidgets/wxbase_2.8.9.bb
> @@ -9,7 +9,8 @@ SRC_URI +=3D "file://Makefile.in.patch"
>  EXTRA_OECONF =3D " --disable-gui \
>                   --enable-largefile \
>                   --enable-gpe \
> -                 --without-subdirs"
> +                 --without-subdirs \
> +                 --with-sdl-prefix=3D${STAGING_BINDIR_CROSS}/.."

Maybe add `\` to the end and put the `"` to the new line so that future
patches will be smaller.

-                 --without-subdirs"
+                 --without-subdirs \
+                 --with-sdl-prefix=3D${STAGING_BINDIR_CROSS}/.. \
+                 "

>  LEAD_SONAME =3D "libwx_base-2.8.so"


Thanks,

Paul

--=-e6ymQBOeTx6lFSf+pC1S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3vqCkACgkQPX1aK2wOHVj1nACfXgKxYGALnKNcxZlBDcqKi8il
QAgAoIcaPimWTZCOgJ0hdgOb1H9yNoaE
=Jc/g
-----END PGP SIGNATURE-----

--=-e6ymQBOeTx6lFSf+pC1S--
