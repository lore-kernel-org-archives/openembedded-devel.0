Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYFcm-0005f7-AJ for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 11:20:48 +0100
Received: from f053036091.adsl.alicedsl.de ([78.53.36.91]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYFcX-0002Es-J6 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 10:20:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293699334-4159-1-git-send-email-eric@eukrea.com>
References: <1293699334-4159-1-git-send-email-eric@eukrea.com>
Date: Thu, 30 Dec 2010 11:20:31 +0100
Message-ID: <1293704431.5436.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] gnome-power-manager: fix compilation
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
X-List-Received-Date: Thu, 30 Dec 2010 10:20:48 -0000
X-Groupsio-MsgNum: 27579
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IDSf+XiTr7fcBPdHbejb"

--=-IDSf+XiTr7fcBPdHbejb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.12.2010, 09:55 +0100 schrieb Eric B=C3=A9nard:

I would prefer if the error message `libtool: Command not found` (if it
is that short) is noted in the commit summary.

	gnome-power-manager: fix compilation: `libtool: Command not found`

> * libtool is hardcoded in src/Makefile and leads to
> libtool: Command not found
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  recipes/gnome/gnome-power-manager_2.30.0.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/gnome/gnome-power-manager_2.30.0.bb b/recipes/gnome/=
gnome-power-manager_2.30.0.bb
> index a752852..0c7bcb5 100644
> --- a/recipes/gnome/gnome-power-manager_2.30.0.bb
> +++ b/recipes/gnome/gnome-power-manager_2.30.0.bb
> @@ -27,6 +27,7 @@ do_configure_append() {
>          for i in $(find ${S} -name "Makefile") ; do
>              sed -i -e s:-Werror::g $i
>          done
> +		sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefile
>  }
> =20
>  PACKAGES =3D+ "${PN}-applets"

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

What is the proper patch to send upstream? Is `${TARGET_SYS}` always
defined? But =C2=BB-=C2=AB would still make problems, wouldn=E2=80=99t it? =
Is there a
program implementing this correctly in `Makefile`?


Thanks,

Paul

--=-IDSf+XiTr7fcBPdHbejb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0cXOgACgkQPX1aK2wOHVhsCQCcDQPMwP78DTFkV07XBNP21Ujg
iggAn08wrgToell6xOk+bv4uzUizHxRR
=IpEG
-----END PGP SIGNATURE-----

--=-IDSf+XiTr7fcBPdHbejb--
