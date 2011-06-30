Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcDDQ-0006GT-Pa for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 11:07:29 +0200
Received: from f053041173.adsl.alicedsl.de ([78.53.41.173]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcD9v-0002VB-Oh for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 09:03:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E0C3019.3070601@gmail.com>
References: <4E0C00ED.40407@gmail.com>  <4E0C3019.3070601@gmail.com>
Date: Thu, 30 Jun 2011 11:03:33 +0200
Message-ID: <1309424613.4326.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] linux-omap-psp-2.6.32 kernel: Fixed User-button GPIO to correct value for -xM
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
X-List-Received-Date: Thu, 30 Jun 2011 09:07:31 -0000
X-Groupsio-MsgNum: 32916
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ePIFnrfrTJLr+VUT0/cF"

--=-ePIFnrfrTJLr+VUT0/cF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.06.2011, 01:13 -0700 schrieb Khem Raj:
> On 06/29/2011 09:51 PM, Joel A Fernandes wrote:
> > Signed-off-by: Joel A Fernandes<agnel.joel@gmail.com>
> > ---
> >   ...agle-cleaned-up-board-revision-conditions.patch |    4 ++--
> >   1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-o=
map3-beagle-cleaned-up-board-revision-conditions.patch b/recipes/linux/linu=
x-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revisi=
on-conditions.patch
> > index 513a101..fb91cb6 100644
> > --- a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-be=
agle-cleaned-up-board-revision-conditions.patch
> > +++ b/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-be=
agle-cleaned-up-board-revision-conditions.patch
> > @@ -143,8 +143,8 @@ index 4bde54b..664a9c6 100644
> >    	omap3_beagle_i2c_init();
> >
> >   -	if (cpu_is_omap3630()) {
> > -+	if ((omap3_beagle_get_rev() !=3D OMAP3BEAGLE_BOARD_XMAB)&&
> > -+		(omap3_beagle_get_rev() !=3D OMAP3BEAGLE_BOARD_XMC)) {
> > ++	if ((omap3_beagle_get_rev() =3D=3D OMAP3BEAGLE_BOARD_XMAB) ||
> > ++		(omap3_beagle_get_rev() =3D=3D OMAP3BEAGLE_BOARD_XMC)) {
> >    		gpio_buttons[0].gpio =3D 4;
> >    	}
> >
>=20
> while the patch seems good it does not follow the submission guidelines.

Please read the following policies [1] in the Wiki [2][3][4].


Thanks,

Paul


[1] http://openembedded.org/index.php/Category:Policy
[2] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines
[3] http://openembedded.org/index.php/Commit_Policy
[4] http://openembedded.org/index.php/Commit_log_example

--=-ePIFnrfrTJLr+VUT0/cF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4MO90ACgkQPX1aK2wOHVjE3QCfR19vSaBEcqPYEw5JtbqcKIC1
UlkAnAvLUO9/VJnGIdHU4PRmeT8L6dQQ
=XL1m
-----END PGP SIGNATURE-----

--=-ePIFnrfrTJLr+VUT0/cF--
