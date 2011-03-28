Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4LpR-0004Ir-8m for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 01:26:33 +0200
Received: from f053033035.adsl.alicedsl.de ([78.53.33.35]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4Lna-0006dA-57 for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 23:24:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301348740-30018-1-git-send-email-philippedeswert@gmail.com>
References: <1301348740-30018-1-git-send-email-philippedeswert@gmail.com>
Date: Tue, 29 Mar 2011 01:24:33 +0200
Message-ID: <1301354673.6649.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] eeze: update to 1.0.1
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
X-List-Received-Date: Mon, 28 Mar 2011 23:26:33 -0000
X-Groupsio-MsgNum: 30682
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IJoNzZldkGtT5YQD2V2h"

--=-IJoNzZldkGtT5YQD2V2h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 29.03.2011, 00:45 +0300 schrieb phdeswer:
> * Update to 1.0.1

No need to recite the commit summary, in my opinion.

> * Contains bugfixes for udev watch/find functions to make sure devices ar=
e shown correctly

Since it looks like a minor update, maybe 1.0.0 should be replaced right
away.

> Signed-off-by: phdeswer <philippedeswert@gmail.com>

I think your full name is need here [1]. You can change your Git setup
using `git config user.name "Philippe Deswert"`.

> ---
>  recipes/efl1/eeze_1.0.1.bb |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/efl1/eeze_1.0.1.bb
>=20
> diff --git a/recipes/efl1/eeze_1.0.1.bb b/recipes/efl1/eeze_1.0.1.bb
> new file mode 100644
> index 0000000..cc1d721
> --- /dev/null
> +++ b/recipes/efl1/eeze_1.0.1.bb
> @@ -0,0 +1,10 @@
> +require eeze.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI =3D "\
> +  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
> +"
> +
> +SRC_URI[md5sum] =3D "e36b5e8ed444c8d13d27fd82d5f71659"
> +SRC_URI[sha256sum] =3D "736470383c33837edd88f417200c5612ca9cc5f400bc48d6=
1fd966fec3fe09d7"


Thank you for your patch,

Paul


[1] http://openembedded.org/index.php/Commit_Policy

--=-IJoNzZldkGtT5YQD2V2h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2RGLEACgkQPX1aK2wOHViG/wCfZSpsaRFBZVqa14qWJ/GHfIIF
I+EAn3UO3LH9W4tyI0vmJYhGvJsfyKfv
=mUAs
-----END PGP SIGNATURE-----

--=-IJoNzZldkGtT5YQD2V2h--
