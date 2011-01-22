Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pgfsm-0001z0-Uq for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 17:00:09 +0100
Received: from f053037250.adsl.alicedsl.de ([78.53.37.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pgfs8-0001zS-28 for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 15:59:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295710776-10995-1-git-send-email-lm@larsmichelsen.com>
References: <1295710776-10995-1-git-send-email-lm@larsmichelsen.com>
Date: Sat, 22 Jan 2011 16:59:27 +0100
Message-ID: <1295711967.3850.221.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] python-caldav: New reciep - CalDAV rfc4791 client
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
X-List-Received-Date: Sat, 22 Jan 2011 16:00:09 -0000
X-Groupsio-MsgNum: 28315
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4accEBhMQQX3VUD2fDbI"

--=-4accEBhMQQX3VUD2fDbI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 22.01.2011, 16:39 +0100 schrieb Lars Michelsen:
> This patch adds a new reciep for the python caldav client library module.

s/reciep/recipe/ (also in commit summary)

It is not policy, but I like also to have a note in the commit message,
what distribution and architecture this recipe was build tested with.
And if it was tested.

> Signed-off-by: Lars Michelsen <lm@larsmichelsen.com>
> ---
>  recipes/python/python-caldav_0.1.6.bb |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/python/python-caldav_0.1.6.bb
>=20
> diff --git a/recipes/python/python-caldav_0.1.6.bb b/recipes/python/pytho=
n-caldav_0.1.6.bb
> new file mode 100644
> index 0000000..ecf8e39
> --- /dev/null
> +++ b/recipes/python/python-caldav_0.1.6.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "This project is a CalDAV (RFC4791) client library for P=
ython."
> +SECTION =3D "devel/python"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +HOMEPAGE =3D "http://bitbucket.org/cyrilrbt/caldav"
> +SRCNAME =3D "caldav"
> +PR =3D "r0"
> +DEPENDS =3D "python python-lxml python-vobject"
> +
> +SRC_URI  =3D "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCN=
AME}-${PV}.tar.gz"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"

I did not know of `${SRCNAME}` before. I think `${PN}` is more common
(since it is shorter?). Now I see that you defined it in the beginning.
You can use `${PN}`.

> +inherit setuptools
> +
> +SRC_URI[md5sum] =3D "e5eace7a3b6b7f511a1929a539e6a15d"
> +SRC_URI[sha256sum] =3D "4a3b1855000feb8023ab05f8c9e0cfa1648a9abab9ca65ad=
3e933c22bab61310"

I think these are put right below the first occurrence of `SRC_URI`. But
the style guide [1] does not mention it explicitly.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Styleguide

--=-4accEBhMQQX3VUD2fDbI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk06/t8ACgkQPX1aK2wOHViA3wCfTfmaePogMO3BCwGAaeYRgnQY
ExIAoImMF+XEdbbluzsf2UCx1+b1UH8u
=KDMw
-----END PGP SIGNATURE-----

--=-4accEBhMQQX3VUD2fDbI--
