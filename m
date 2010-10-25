Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PALND-0004iJ-TD for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 13:37:57 +0200
Received: from f053043161.adsl.alicedsl.de ([78.53.43.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PALMb-0006VQ-0D for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 11:37:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1288000524-18800-1-git-send-email-sledz@dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A505AF5C@exchange.intern.dresearch.de>
	<1288000524-18800-1-git-send-email-sledz@dresearch.de>
Date: Mon, 25 Oct 2010 13:37:15 +0200
Message-ID: <1288006635.3793.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] epiphany-2.30.2: unbreak do_configure by setting ca-file path
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
X-List-Received-Date: Mon, 25 Oct 2010 11:37:57 -0000
X-Groupsio-MsgNum: 25447
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DqHax9F8JosZSqyrJTrB"

--=-DqHax9F8JosZSqyrJTrB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 25.10.2010, 11:55 +0200 schrieb Steffen Sledz:
> * Disable existence check for ca-bundle file in configure.ac because
>   it does not work in OE cross compile environment (location at build
>   host may differ from location at target).
> * Explicitely set ca-bundle file path according to the one used by
>   ca-certificates package.
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/gnome/epiphany/ca-file-configure.patch |   17 +++++++++++++++++
>  recipes/gnome/epiphany_2.30.2.bb               |    6 ++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/gnome/epiphany/ca-file-configure.patch
>=20
> diff --git a/recipes/gnome/epiphany/ca-file-configure.patch b/recipes/gno=
me/epiphany/ca-file-configure.patch
> new file mode 100644
> index 0000000..b77d441
> --- /dev/null
> +++ b/recipes/gnome/epiphany/ca-file-configure.patch
> @@ -0,0 +1,17 @@
> +--- epiphany-2.30.2.orig/configure.ac	2010-10-25 11:10:31.316864572 +020=
0
> ++++ epiphany-2.30.2/configure.ac	2010-10-25 11:12:29.562614607 +0200
> +@@ -272,9 +272,11 @@
> +     fi
> +=20
> +     AC_MSG_RESULT($with_ca_file)
> +-    if ! test -f "$with_ca_file"; then
> +-        AC_MSG_ERROR([No such file '$with_ca_file'. Use --with-ca-file=
=3Dpath to set, or --without-ca-file to disable])
> +-    fi
> ++# disable this check because it does not work in all environments
> ++# (location at build host may differ from target)
> ++#    if ! test -f "$with_ca_file"; then
> ++#        AC_MSG_ERROR([No such file '$with_ca_file'. Use --with-ca-file=
=3Dpath to set, or --without-ca-file to disable])
> ++#    fi
> +     GTLS_SYSTEM_CA_FILE=3D"$with_ca_file"
> +=20
> +     AC_DEFINE_UNQUOTED([GTLS_SYSTEM_CA_FILE], ["$GTLS_SYSTEM_CA_FILE"],=
 [path to system Certificate Authority list])

Would adding the following check also work?

        if test "$cross_compiling" !=3D "yes"; then
         =E2=80=A6
        fi

I think this would be more portable. Could you report that issue
upstream too please.

[=E2=80=A6]


Thanks,

Paul

--=-DqHax9F8JosZSqyrJTrB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzFa+sACgkQPX1aK2wOHVjNHwCdF9iNghkYA/DMdMupDwmcaROp
d2MAn24C53gGWHhZdYVQQWn/x12kZBgx
=yxD2
-----END PGP SIGNATURE-----

--=-DqHax9F8JosZSqyrJTrB--
