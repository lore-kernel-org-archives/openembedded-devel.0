Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QhUJq-0007IA-Qy for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 00:23:42 +0200
Received: from f053033096.adsl.alicedsl.de ([78.53.33.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QhUGb-0007aW-El; Thu, 14 Jul 2011 22:20:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1310680981-2394-1-git-send-email-agnel.joel@gmail.com>
References: <1310680981-2394-1-git-send-email-agnel.joel@gmail.com>
Date: Fri, 15 Jul 2011 00:19:42 +0200
Message-ID: <1310681982.20700.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: s-kipisz2@ti.com, joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>,
	jdk@ti.com, k-kooi@ti.com
Subject: Re: [PATCHi v2] linux-omap-psp: Added patch by Steve Sakoman to fix timeout errors
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
X-List-Received-Date: Thu, 14 Jul 2011 22:23:42 -0000
X-Groupsio-MsgNum: 33162
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bdlyH28nYojztZmwoaS6"

--=-bdlyH28nYojztZmwoaS6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Joel,


Am Donnerstag, den 14.07.2011, 17:03 -0500 schrieb Joel A Fernandes:

in my opinion the commit summary should be the following.

Add patch to fix MMC errors due to timeouts

The name of the author can go into the commit message.

> This fixes MMC errors due to timeouts, and is borrowed from linux-omap-2.=
6.39 recipe (as noticed by Jason Kridner)

Did somebody actually experience this problem or this this precaution?
If the forme could you please add a link to the problem report?

> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Changes since earlier patch:
>  * Fixed commit summary
>=20
> Some useful links shared by Jason:
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg42214.html
> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/linux/lin=
ux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-errors=
.patchRelevant links:

At the end there is missing a line break.

> The link to the patch in org.openembedded.dev:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/lin=
ux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-errors=
.patch?h=3Dorg.openembedded.dev

I would like to see those information in the commit message.

>  ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   22 ++++++++++++++=
++++++
>  recipes/linux/linux-omap_2.6.32.bb                 |    1 +
>  2 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-=
dto-to-eliminate-timeout-errors.patch
>=20
> diff --git a/recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to-=
eliminate-timeout-errors.patch b/recipes/linux/linux-omap-2.6.32/0010-omap-=
mmc-Adjust-dto-to-eliminate-timeout-errors.patch
> new file mode 100644
> index 0000000..ae5a7aa
> --- /dev/null
> +++ b/recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to-elimina=
te-timeout-errors.patch
> @@ -0,0 +1,22 @@
> +From 26a79f408bd41ad7b4a47f2683909d3fc1575eab Mon Sep 17 00:00:00 2001
> +From: Steve Sakoman <steve@sakoman.com>
> +Date: Wed, 12 Jan 2011 05:54:55 -0800
> +Subject: [PATCH 24/31] omap: mmc: Adjust dto to eliminate timeout errors
> +
> +A number of SD card types were experiencing timeout errors.  This
> +could also lead to data corruption in some cases.
> +
> +This fix proposed by Sukumar Ghoral of TI.
> +---
> +diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc=
.c
> +index 9646a75..ef458d6 100644
> +--- a/drivers/mmc/host/omap_hsmmc.c
> ++++ b/drivers/mmc/host/omap_hsmmc.c
> +@@ -1032,6 +1032,7 @@ static void set_data_timeout(struct omap_hsmmc_hos=
t *host,
> + 	cycle_ns =3D 1000000000 / (clk_get_rate(host->fclk) / clkd);
> + 	timeout =3D timeout_ns / cycle_ns;
> + 	timeout +=3D timeout_clks;
> ++	timeout *=3D 2;
> + 	if (timeout) {
> + 		while ((timeout & 0x80000000) =3D=3D 0) {
> + 			dto +=3D 1;
> diff --git a/recipes/linux/linux-omap_2.6.32.bb b/recipes/linux/linux-oma=
p_2.6.32.bb
> index 348ec96..404387f 100644
> --- a/recipes/linux/linux-omap_2.6.32.bb
> +++ b/recipes/linux/linux-omap_2.6.32.bb
> @@ -33,6 +33,7 @@ file://0005-ARM-OMAP-add-support-for-TCT-Zippy-to-Beagl=
e-board.patch \
>  file://0006-ARM-OMAP-Make-beagle-u-boot-partition-writable.patch \
>  file://0007-ASoC-enable-audio-capture-by-default-for-twl4030.patch \
>  file://0009-MTD-NAND-omap2-proper-fix-for-subpage-read-ECC-error.patch \
> +file://0010-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
>  file://madc/0009-drivers-mfd-add-twl4030-madc-driver.patch \
>  file://madc/0010-ARM-OMAP-Add-twl4030-madc-support-to-Overo.patch \
>  file://madc/0011-ARM-OMAP-Add-twl4030-madc-support-to-Beagle.patch \

Otherwise this looks good.


Thanks,

Paul

--=-bdlyH28nYojztZmwoaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4fa34ACgkQPX1aK2wOHVhTxQCffHLWCXAL8KvudNg2JuFGCaOr
rEcAnRuDGo3oww03HFqMdOZk+Cu6Hkef
=9WUO
-----END PGP SIGNATURE-----

--=-bdlyH28nYojztZmwoaS6--
