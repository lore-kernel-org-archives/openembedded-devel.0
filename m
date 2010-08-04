Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgZAt-00059v-RP for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 10:18:08 +0200
Received: from f053041223.adsl.alicedsl.de ([78.53.41.223]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgZAs-0000Dk-2d for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 08:18:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280897047-28860-1-git-send-email-jkridner@beagleboard.org>
References: <1280897047-28860-1-git-send-email-jkridner@beagleboard.org>
Date: Wed, 04 Aug 2010 10:18:03 +0200
Message-ID: <1280909883.4225.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard-test-image: added ramdisk
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
X-List-Received-Date: Wed, 04 Aug 2010 08:18:08 -0000
X-Groupsio-MsgNum: 21807
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9R+VARwjDUAdjE8zBO+u"

--=-9R+VARwjDUAdjE8zBO+u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 03.08.2010, 23:44 -0500 schrieb Jason Kridner:
> Simply adding 'ext2.gz' to the IMAGE_FSTYPES to produce a default sized
> ramdisk image whenever this image is built.
> ---
>  recipes/images/beagleboard-test-image.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/images/beagleboard-test-image.bb b/recipes/images/be=
agleboard-test-image.bb
> index 0ea323a..f4d736d 100644
> --- a/recipes/images/beagleboard-test-image.bb
> +++ b/recipes/images/beagleboard-test-image.bb
> @@ -22,4 +22,5 @@ IMAGE_INSTALL +=3D " \
> =20
>  export IMAGE_BASENAME =3D "beagleboard-test-image"
> =20
> -EXTRA_IMAGEDEPENDS +=3D "x-load u-boot virtual/kernel"
> +EXTRA_IMAGEDEPENDS +=3D " x-load u-boot virtual/kernel"

Not needed [1].

        You can append values to existing variables using the +=3D
        operator. Note that this operator will add a space between the
        existing content of the variable and the new content.

(It should have been a separate patch anyway.)

> +IMAGE_FSTYPES +=3D " ext2.gz"


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/usermanual.html

--=-9R+VARwjDUAdjE8zBO+u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxZIjsACgkQPX1aK2wOHVicfwCfV0TXSqU67nccIDeAGRWKwgtu
OZoAn3o2FvJ/a2djnzqiTADo4X8mtSdM
=srXU
-----END PGP SIGNATURE-----

--=-9R+VARwjDUAdjE8zBO+u--
