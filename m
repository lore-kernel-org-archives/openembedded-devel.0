Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PxzB4-00055X-9a for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:02:34 +0100
Received: from f053042227.adsl.alicedsl.de ([78.53.42.227]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pxz9W-0008GJ-Rr for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 10:00:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299805412.5437.31.camel@computer>
References: <1299805412.5437.31.camel@computer>
Date: Fri, 11 Mar 2011 11:00:57 +0100
Message-ID: <1299837657.4137.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] transmission: add recipe for 2.22 version
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
X-List-Received-Date: Fri, 11 Mar 2011 10:02:34 -0000
X-Groupsio-MsgNum: 30058
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-k5EfT7XWg3Mr9SqJoudf"

--=-k5EfT7XWg3Mr9SqJoudf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lukas-David,


Am Freitag, den 11.03.2011, 02:03 +0100 schrieb Lukas-David Gorris:
> Depends on the the previously sent libevent bump.

Using `git format-patch -2 -s` you can create patches where the
dependencies are shown in the subject, e. g. [PATCH 1/2] and [PATCH
2/2].

> From: Lukas-David Gorris <lukas.gorris@gmail.com>
> Date: Fri, 11 Mar 2011 02:00:56 +0100
> Subject: [oe] [PATCH] transmission: add recipe for 2.22 version

As already written in another thread, your MUA mangled the patches.
Please turn off automatic line wrapping (normal to preformatted) or
using `git send-email`.

Your Signed-off-by line is also missing as demanded by the commit policy
[1].

Secondly, I would appreciate if you could add to the commit message,
what build configuration you tested your new recipe/patch with and if
all operations worked when running it.

> ---
>  recipes/transmission/transmission_2.22.bb |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/transmission/transmission_2.22.bb
>=20
> diff --git a/recipes/transmission/transmission_2.22.bb
> b/recipes/transmission/transmission_2.22.bb
> new file mode 100644
> index 0000000..e9a7891
> --- /dev/null
> +++ b/recipes/transmission/transmission_2.22.bb
> @@ -0,0 +1,9 @@
> +require transmission.inc
> +
> +DEPENDS +=3D "libevent"
> +
> +PR =3D ${INC_PR}.1

You should start at 0.

> +SRC_URI[archive.md5sum] =3D "6499986bf769276310b00bda1090090d"
> +SRC_URI[archive.sha256sum] =3D "5a4079194f45260c143f21ea6f33ce2660d89fca=
02ad8f1e65169968d365e4d4"


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy

--=-k5EfT7XWg3Mr9SqJoudf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk158tQACgkQPX1aK2wOHVjoWgCgiEsh6hzC78k/H0w6pg/A/+WR
r/YAn0oKmNzvz9s6K+2JlYgFKJOFqLVW
=fXu9
-----END PGP SIGNATURE-----

--=-k5EfT7XWg3Mr9SqJoudf--
