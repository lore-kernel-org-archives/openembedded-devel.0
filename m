Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48Ss-0002g4-Rb for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:42:39 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48O1-0003EG-5d for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 09:37:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:37:28 +0200
In-Reply-To: <1316077931-7737-3-git-send-email-npavel@mini-box.com>
References: <1316077931-7737-1-git-send-email-npavel@mini-box.com>
	<1316077931-7737-3-git-send-email-npavel@mini-box.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316079449.4523.34.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/2] Add machine configuration for picoSAM9G45 board
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
X-List-Received-Date: Thu, 15 Sep 2011 09:42:39 -0000
X-Groupsio-MsgNum: 34250
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-hWq2mis4yHQRDZU6Z7+L"

--=-hWq2mis4yHQRDZU6Z7+L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 15.09.2011, 12:12 +0300 schrieb Nicu Pavel:
> Add machine configuration for picoSAM9G45 board[1].
> More information about this board and software support can be found at [2=
].
>=20
> 1. http://www.mini-box.com/pico-SAM9G45-X
> 2. http://arm.mini-box.com/index.php?title=3DMain_Page
>=20
> Signed-off-by: Nicu Pavel <npavel@mini-box.com>
> ---
>  conf/machine/picosam9.conf |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/picosam9.conf
>=20
> diff --git a/conf/machine/picosam9.conf b/conf/machine/picosam9.conf
> new file mode 100644
> index 0000000..3d75627
> --- /dev/null
> +++ b/conf/machine/picosam9.conf
> @@ -0,0 +1,17 @@
> +#@TYPE: Machine
> +#@Name: pico-SAM9G45 (http://www.mini-box.com/pico-SAM9G45-X)
> +#@DESCRIPTION: Machine configuration for the picoSAM9G45 board with a at=
91sam9g45 processor
> +
> +# More information can be found here:=20
> +# http://arm.mini-box.com/index.php?title=3DCompiling_Angstrom_for_pico-=
SAM9G45
> +# Images tested: base-image and x11-image

=E2=80=A6 with `angstrom-2010.x` I guess.

> +
> +TARGET_ARCH =3D "arm"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "picosam9"
> +
> +PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
> +
> +MACHINE_FEATURES +=3D "usbhost kernel26 apm vfat screen touchscreen ethe=
rnet wifi bluetooth"
> +
> +require conf/machine/include/tune-arm926ejs.inc

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I will commit your patches tomorrow if nobody has any objections.


Thanks,

Paul

--=-hWq2mis4yHQRDZU6Z7+L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5xx1gACgkQPX1aK2wOHViyFQCeNUDniGxlp1SsNtllewaDDmUI
b8sAn1whY//2yqxdMO88SaISBAy9H384
=P9m/
-----END PGP SIGNATURE-----

--=-hWq2mis4yHQRDZU6Z7+L--
