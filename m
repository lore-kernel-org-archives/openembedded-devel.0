Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QITVU-0001f4-UK for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 00:28:20 +0200
Received: from f053032229.adsl.alicedsl.de ([78.53.32.229]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QITU2-0003Rb-IM for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 22:26:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304719828-22697-1-git-send-email-raj.khem@gmail.com>
References: <1304719828-22697-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 07 May 2011 00:25:40 +0200
Message-ID: <1304720740.3928.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH] conf/layer.conf: conf/layer.conf: Document the operation on BBPATH correctly in the comment
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
X-List-Received-Date: Fri, 06 May 2011 22:28:21 -0000
X-Groupsio-MsgNum: 31673
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-62STNoJSoeQi1aBH2jzx"

--=-62STNoJSoeQi1aBH2jzx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 06.05.2011, 15:10 -0700 schrieb raj.khem@gmail.com:
> From: Khem Raj <raj.khem@gmail.com>
>=20
> Provide additional commentary that should help a bit more
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-efl/conf/layer.conf   |    2 +-
>  meta-gnome/conf/layer.conf |    2 +-
>  meta-gpe/conf/layer.conf   |    2 +-
>  meta-oe/conf/layer.conf    |   18 +++++++++++++++++-
>  4 files changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
> index f019337..272fc04 100644
> --- a/meta-efl/conf/layer.conf
> +++ b/meta-efl/conf/layer.conf
> @@ -1,4 +1,4 @@
> -# We have a conf and classes directory, prepend to BBPATH to prefer our =
versions
> +# We have a conf and classes directory, append to BBPATH=20
>  BBPATH .=3D ":${LAYERDIR}"
> =20
>  # We have a recipes directory, add to BBFILES
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index 6e8ff28..902ab8f 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -1,4 +1,4 @@
> -# We have a conf and classes directory, prepend to BBPATH to prefer our =
versions
> +# We have a conf and classes directory, append to BBPATH
>  BBPATH .=3D ":${LAYERDIR}"
> =20
>  # We have a recipes directory, add to BBFILES
> diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
> index 006b6af..6c018b1 100644
> --- a/meta-gpe/conf/layer.conf
> +++ b/meta-gpe/conf/layer.conf
> @@ -1,4 +1,4 @@
> -# We have a conf and classes directory, prepend to BBPATH to prefer our =
versions
> +# We have a conf and classes directory, append to BBPATH
>  BBPATH .=3D ":${LAYERDIR}"
> =20
>  # We have a recipes directory, add to BBFILES
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 36137e9..d5c2a17 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -1,4 +1,14 @@
> -# We have a conf and classes directory, prepend to BBPATH to prefer our =
versions
> +# It really depends on order of the layers appearing in BBLAYERS
> +# variable in toplevel bblayers.conf file, where bitbake will search
> +# for .inc files and others where bitbake uses BBPATH since it will
> +# search the directories from first to last as specfied in BBPATH

spec*i*fied

> +# Therefore if you want a given layer to be considered high priority
> +# for the .inc and .conf etc. then consider it adding at the beginning

=E2=80=A6 then consider adding it to the =E2=80=A6

> +# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
> +# the recipe contention so the order of directories in BBFILES does=20
> +# not matter

Full stop at the end?

> +
> +# We have a conf and classes directory, append to BBPATH
>  BBPATH .=3D ":${LAYERDIR}"
> =20
>  # We have a recipes directory, add to BBFILES
> @@ -6,4 +16,10 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/=
recipes-*/*/*.bbappend"
> =20
>  BBFILE_COLLECTIONS +=3D "openembedded-layer"
>  BBFILE_PATTERN_openembedded-layer :=3D "^${LAYERDIR}/"
> +
> +# Define the priority for recipes (.bb files) from this layer

Add an extra line to make paragraph more clear or start with a capital
letter below?

> +# this should be noted when you use this layer since it has

Note sounds strange. Use =C2=BBdefined=C2=AB again?

> +# to fall into the correct layer priority order that you have decided
> +# for you layering model

s/you/your/

> +
>  BBFILE_PRIORITY_openembedded-layer =3D "6"

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

But please wait a bit before pushing it. Maybe a native speaker will
read through the new comments.


Thanks,

Paul

--=-62STNoJSoeQi1aBH2jzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3EdWQACgkQPX1aK2wOHVgXKgCZAe56nmanOHHFN8pn6bE5t4zP
2aQAnixL9qdnWW+AYVJ71/60alaag3nU
=FdpU
-----END PGP SIGNATURE-----

--=-62STNoJSoeQi1aBH2jzx--
