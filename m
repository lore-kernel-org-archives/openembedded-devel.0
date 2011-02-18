Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PqZ8u-0005Ly-OY for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 23:49:40 +0100
Received: from f053032163.adsl.alicedsl.de ([78.53.32.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PqZ7k-0007CQ-S4 for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 22:48:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1298038322-20481-1-git-send-email-sledz@dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
	<1298038322-20481-1-git-send-email-sledz@dresearch.de>
Date: Fri, 18 Feb 2011 23:48:27 +0100
Message-ID: <1298069307.3776.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] u-boot-2009.03: use AMD fixups for AMIC too
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
X-List-Received-Date: Fri, 18 Feb 2011 22:49:40 -0000
X-Groupsio-MsgNum: 29471
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/zV1WrtxxX8LWIhOOHqz"

--=-/zV1WrtxxX8LWIhOOHqz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 18.02.2011, 15:12 +0100 schrieb Steffen Sledz:
> From: Mario Schuknecht <m.schuknecht@dresearch.de>
>=20
> * AMIC flashes are AMD clones and need the same fixups.

=E2=80=A6 otherwise the uBoot command `saveenv` does not work.

Please add in the commit message or in the patch file that this patch
has been sent upstream [1].

[1] http://patchwork.ozlabs.org/patch/82763/

> Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch |   11 +++++++++++
>  recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch |    3 ++-
>  recipes/u-boot/u-boot_2009.03.bb                   |    7 +++++--
>  3 files changed, 18 insertions(+), 3 deletions(-)
>  create mode 100644 recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
>=20
> diff --git a/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch b/recipes=
/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
> new file mode 100644
> index 0000000..9d8c7ab
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
> @@ -0,0 +1,11 @@
> +diff -Nurd u-boot-2009.03.orig//drivers/mtd/cfi_flash.c u-boot-2009.03/d=
rivers/mtd/cfi_flash.c
> +--- u-boot-2009.03.orig//drivers/mtd/cfi_flash.c	2011-02-18 14:11:24.870=
432001 +0100
> ++++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2011-02-18 14:11:45.440432001=
 +0100
> +@@ -1883,6 +1883,7 @@
> + 		/* Do manufacturer-specific fixups */
> + 		switch (info->manufacturer_id) {
> + 		case 0x0001:
> ++		case 0x0037: // AMIC
> + 			flash_fixup_amd(info, &qry);
> + 			break;
> + 		case 0x001f:
> diff --git a/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch b/recipes=
/u-boot/u-boot-2009.03/hipox/00-hipox.patch
> index 5b91d28..20a47da 100644
> --- a/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
> +++ b/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
> @@ -6190,10 +6190,11 @@ diff -Nurd u-boot-2009.03.orig/cpu/arm926ejs/star=
t.S u-boot-2009.03/cpu/arm926ej
>  diff -Nurd u-boot-2009.03.orig/drivers/mtd/cfi_flash.c u-boot-2009.03/dr=
ivers/mtd/cfi_flash.c
>  --- u-boot-2009.03.orig/drivers/mtd/cfi_flash.c	2009-04-15 11:05:24.0000=
00000 +0200
>  +++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2009-04-15 11:08:18.000000000=
 +0200
> -@@ -1883,6 +1883,7 @@
> +@@ -1883,7 +1883,8 @@
>   		/* Do manufacturer-specific fixups */
>   		switch (info->manufacturer_id) {
>   		case 0x0001:
> + 		case 0x0037: // AMIC
>  +		case 0x00da: // Winbond
>   			flash_fixup_amd(info, &qry);
>   			break;
> diff --git a/recipes/u-boot/u-boot_2009.03.bb b/recipes/u-boot/u-boot_200=
9.03.bb
> index 2cbded9..4b822f1 100644
> --- a/recipes/u-boot/u-boot_2009.03.bb
> +++ b/recipes/u-boot/u-boot_2009.03.bb
> @@ -6,9 +6,12 @@ DEFAULT_PREFERENCE_hipox =3D "1"
> =20
>  DEPENDS_append_hipox =3D " oxnas-boot-tools oxnas-boot-tools-native "
> =20
> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
> +SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
> +	file://cfi-amic-fixup.patch \
> +"
> =20
> -SRC_URI_append_hipox =3D "file://00-hipox.patch \
> +SRC_URI_append_hipox =3D " \
> +	file://00-hipox.patch \
>  	file://01-hipox-fix-gmac-reset.patch \
>  	file://02-hipox-enable-mmu.patch \
>  	file://03-hipox-direct-switch.patch \

If you build for `hipox` is not your fix applied twice? Or am I
mistaken?

If I am and with the changes requested in the beginning,

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-/zV1WrtxxX8LWIhOOHqz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1e9zsACgkQPX1aK2wOHVgeaQCeMo2hdDMWWXM+YbLeQSoninXc
0MgAoIgjsarYLA/e8bMYc8huvYcF5rI3
=gLfh
-----END PGP SIGNATURE-----

--=-/zV1WrtxxX8LWIhOOHqz--
