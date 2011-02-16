Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ppiks-0003Lx-Ve for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 15:53:23 +0100
Received: from f053043244.adsl.alicedsl.de ([78.53.43.244]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ppijl-00048x-CW for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 14:52:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1297862774-31036-1-git-send-email-m.schuknecht@dresearch.de>
References: <1297862774-31036-1-git-send-email-m.schuknecht@dresearch.de>
Date: Wed, 16 Feb 2011 15:52:12 +0100
Message-ID: <1297867932.3729.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] u-boot-2009.03: Fix sector table direction for AMIC (hipox machine only)
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
X-List-Received-Date: Wed, 16 Feb 2011 14:53:23 -0000
X-Groupsio-MsgNum: 29315
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-p6Dna9w+XTwFLT1WB4JJ"

--=-p6Dna9w+XTwFLT1WB4JJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mario,


thank you for your patch.

Am Mittwoch, den 16.02.2011, 14:26 +0100 schrieb Mario Schuknecht:

Just curious. What were the symptoms of this problem?

> Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
> ---
>  .../u-boot-2009.03/hipox/11-cfi-amic-fixup.patch   |   11 +++++++++++
>  recipes/u-boot/u-boot_2009.03.bb                   |    1 +
>  2 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup=
.patch
>=20
> diff --git a/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch =
b/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch
> new file mode 100644
> index 0000000..a7432a5
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch
> @@ -0,0 +1,11 @@
> +diff -Nurd u-boot-2009.03.orig//drivers/mtd/cfi_flash.c u-boot-2009.03/d=
rivers/mtd/cfi_flash.c
> +--- u-boot-2009.03.orig//drivers/mtd/cfi_flash.c	2011-02-11 15:18:38.000=
000000 +0100
> ++++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2011-02-11 15:19:06.000000000=
 +0100
> +@@ -1883,6 +1883,7 @@
> + 		/* Do manufacturer-specific fixups */
> + 		switch (info->manufacturer_id) {
> + 		case 0x0001:
> ++		case 0x0037: // AMIC
> + 		case 0x00da: // Winbond
> + 			flash_fixup_amd(info, &qry);
> + 			break;

Has this fix been applied upstream yet? What uBoot versions are
affected?

[=E2=80=A6]


Thanks,

Paul

--=-p6Dna9w+XTwFLT1WB4JJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1b5JYACgkQPX1aK2wOHVjuJACfSTLltZv+fQsqvR2AKuwR3NTZ
ciAAnj0ydcAMYwF/6k9PVxxArTJBqten
=yedW
-----END PGP SIGNATURE-----

--=-p6Dna9w+XTwFLT1WB4JJ--
