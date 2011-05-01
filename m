Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGTcV-0008JV-6p for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 12:11:19 +0200
Received: from f053032032.adsl.alicedsl.de ([78.53.32.32]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGTaw-0001LQ-F8 for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 10:09:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304243449-12028-1-git-send-email-heroor@ti.com>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
Date: Sun, 01 May 2011 12:08:44 +0200
Message-ID: <1304244524.23614.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Sun, 01 May 2011 10:11:19 -0000
X-Groupsio-MsgNum: 31537
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+5MjIQH+xRLJ7+w+W95N"

--=-+5MjIQH+xRLJ7+w+W95N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 01.05.2011, 15:20 +0530 schrieb Siddharth Heroor:
> Signed-off-by: Siddharth Heroor <heroor@ti.com>

The email differs again from the From line. If you want the TI address
be shown, please add a from line to the beginning of the message with
the patch. I guess `git send-email` can also be configured this way.

> ---
>  recipes/zeromq/zeromq.inc |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/zeromq/zeromq.inc
>=20
> diff --git a/recipes/zeromq/zeromq.inc b/recipes/zeromq/zeromq.inc
> new file mode 100644
> index 0000000..b631d98
> --- /dev/null
> +++ b/recipes/zeromq/zeromq.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "Socket Library that acts as a concurrency framework"
> +HOMEPAGE =3D "http://www.zeromq.org"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv3"=20
> +
> +PR =3D "r1"

In an `*.inc` file `INC_PR` is used [1]. Please also start with `r0`.

> +
> +SRC_URI =3D "http://download.zeromq.org/zeromq-${PV}.tar.gz"
> +
> +inherit autotools


Thanks,

Paul


[1] http://openembedded.org/index.php/Styleguide#PR_variables_with_recipes_=
that_use_INC_files

--=-+5MjIQH+xRLJ7+w+W95N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk29MSwACgkQPX1aK2wOHVj24gCfRHRVKXVpOGvN1tcSl/omqLkw
F7oAnAs/4Ozoixc5pSJ9StxYfRYAKRCF
=430Y
-----END PGP SIGNATURE-----

--=-+5MjIQH+xRLJ7+w+W95N--
