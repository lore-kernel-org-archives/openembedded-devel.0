Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTaxW-0000oI-W8 for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 16:39:15 +0200
Received: from f053045062.adsl.alicedsl.de ([78.53.45.62]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QTav9-0006gn-6x for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 14:36:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307369743-14738-1-git-send-email-j-lance1@ti.com>
References: <1307369743-14738-1-git-send-email-j-lance1@ti.com>
Date: Mon, 06 Jun 2011 16:35:59 +0200
Message-ID: <1307370959.4011.17.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/1] matrix_gui: Update SRCREV
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
X-List-Received-Date: Mon, 06 Jun 2011 14:39:15 -0000
X-Groupsio-MsgNum: 32521
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9abSDpb88d3KuvCqQ9Ek"

--=-9abSDpb88d3KuvCqQ9Ek
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jeff,

Am Montag, den 06.06.2011, 09:15 -0500 schrieb Jeff Lance:

you can make the commit subject more informational by writing the
following.

	matrix_gui: Update SRCREV to revision 257

> 	* Adding arm only multimedia apps to am37x
> 	* Wifi updates to am37x, am180x
> 	* Adding to am180x, am37x, am35x, beagle:
> 		* Oprofile example

do you copy those lines from `git log`? `git log` adds indentation in
front of the commit message. Please use `git format-patch`.

> Signed-off-by  Jeff Lance   <j-lance1@ti.com>

A colon =C2=BB:=C2=AB is missing and it is formatting strangely. Please use=
 the
option `-s`.

As I wrote often enough please make sure the From and Signed-off-by
field match.

> ---
>  recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
>  recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
>  recipes/ti/matrix-gui_1.3.bb        |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-=
common_1.4.bb
> index 6f7376d..0b4b25b 100644
> --- a/recipes/ti/matrix-gui-common_1.4.bb
> +++ b/recipes/ti/matrix-gui-common_1.4.bb
> @@ -4,5 +4,5 @@ require matrix-gui-common.inc
>  # prebuilt version in the repository.
>  RRECOMMENDS_${PN} =3D "am-sysinfo"
> =20
> -SRCREV =3D "249"
> -PR =3D "${INC_PR}.10"
> +SRCREV =3D "257"

Would it be beneficial to add `SRCREV` to `matrix-gui.inc` and require
that everywhere?

> +PR =3D "${INC_PR}.11"
> diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3=
.bb
> index 8f2df1c..a6eb17f 100644
> --- a/recipes/ti/matrix-gui-e_1.3.bb
> +++ b/recipes/ti/matrix-gui-e_1.3.bb
> @@ -1,5 +1,5 @@
>  require matrix-gui-e.inc
> =20
> -SRCREV =3D "249"
> -PR =3D "${INC_PR}.9"
> +SRCREV =3D "257"
> +PR =3D "${INC_PR}.10"
> =20
> diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
> index f7e56a3..51678df 100644
> --- a/recipes/ti/matrix-gui_1.3.bb
> +++ b/recipes/ti/matrix-gui_1.3.bb
> @@ -1,4 +1,4 @@
>  require matrix-gui.inc
> =20
> -SRCREV =3D "249"
> -PR =3D "${INC_PR}.5"
> +SRCREV =3D "257"
> +PR =3D "${INC_PR}.6"

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

I did not build or runtest though.


Thanks,

Paul

--=-9abSDpb88d3KuvCqQ9Ek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3s5c8ACgkQPX1aK2wOHVjUWwCgicIAoLlLeUrub5lJFwOZmIWP
faUAnRNtxjicoGCDr/S4GlD+FaXd/yVg
=lF8L
-----END PGP SIGNATURE-----

--=-9abSDpb88d3KuvCqQ9Ek--
