Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Of9fF-00068e-32 for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 12:51:38 +0200
Received: from f053040133.adsl.alicedsl.de ([78.53.40.133]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Of9ew-0007fu-0e for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 10:51:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280504555-3633-2-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1280504555-3633-2-git-send-email-aalonso00@gmail.com>
Date: Sat, 31 Jul 2010 12:51:15 +0200
Message-ID: <1280573475.3721.44.camel@mattotaupa>
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
Subject: Re: [PATCH 02/10] xilinx-virtex4: new file
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
X-List-Received-Date: Sat, 31 Jul 2010 10:51:38 -0000
X-Groupsio-MsgNum: 21676
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Sq+j+ZqnHolwOBbyQKXg"

--=-Sq+j+ZqnHolwOBbyQKXg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 30.07.2010, 10:42 -0500 schrieb Adrian Alonso:

Please improve the summary line to something like.

	xilinx-virtex4: Add machine config for Xilinx Virtex4 platforms.

=C2=BBnew file=C2=AB is, at least for me, not useful.

> * New config machine, generic support for Xilinx
>   Virtex4 platforms ml401, ml403, ml405, ml410
> * Tested on ml405 target board, powerpc based ref
>   design at http://github.com/aalonso/xilinx-ml405
> * Target configuration handled in xilinx-bsp.bbclass
>=20
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  conf/machine/xilinx-virtex4.conf |   37 ++++++++++++++++++++++++++++++++=
+++++
>  1 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/xilinx-virtex4.conf
>=20
> diff --git a/conf/machine/xilinx-virtex4.conf b/conf/machine/xilinx-virte=
x4.conf
> new file mode 100644
> index 0000000..eeea44e
> --- /dev/null
> +++ b/conf/machine/xilinx-virtex4.conf
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@Name: Xilinx Virtex4 FPGA Development Platform
> +#@DESCRIPTION: Machine configuration for Xilinx Virtex4 family
> +# Supported targets
> +# ML403, ML405, ML410

The commit message says ml401 too.

> +TARGET_ARCH =3D "powerpc"
> +TARGET_CPU  =3D "405"
> +TARGET_FPU  =3D "soft"
> +#tune for the selected cpu
> +require conf/machine/include/tune-ppc405.inc
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx"
> +PREFERRED_VERSION_u-boot_xilinx-virtex4 =3D "u-boot-xilinx"

As far as I can see, those recipes are added in later patches. Would not
that make this patch produce a non-working machine and therefore for
example also render `git bisect` useless.

If I was right, please reorder the patches. I do not know what the
preferred way of adding new machines is. A big patch with all needed
files or incremental ones.

> +KERNEL_IMAGETYPE =3D "uImage"
> +
> +MACHINE_FEATURES =3D "kernel26 apm ext2 vfat ethernet"
> +MACHINE_EXTRA_RECOMMENDS =3D "kernel-modules"
> +
> +UBOOT_ENTRYPOINT ?=3D "0x00000000"
> +UBOOT_LOADADDRESS ?=3D "0x00000000"
> +
> +# Xilinx EDK override hardware definitions for xilinx-bsp

1. What does =C2=BBEDK=C2=AB mean? Embedded Development Kit [1]? What does =
it
refer to? Sorry for my ignorance. I just found [2], but I do not know
what this has to do with OE.
2. s/override/overrides/ ?

[1] http://acronyms.thefreedictionary.com/EDK
[2] http://www.xilinx.com/ise/embedded/edk_docs.htm

> +# Include in your local.conf
> +# XILINX_BSP_PATH =3D "complete path for Xilinx XPS project"
> +# XILINX_BOARD =3D "ml410"
> +
> +# Don't use tty1
> +USE_VT =3D "0"
> +SERIAL_CONSOLE =3D "9600 ttyS0"
> +
> +# Device nodes add xsa for (system ace)
> +IMAGE_DEVICE_TABLES =3D "files/device_table-minimal.txt \
> +                       files/device_table_add-xsa.txt"


Thanks,

Paul

--=-Sq+j+ZqnHolwOBbyQKXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxUACMACgkQPX1aK2wOHVhw0wCfUSCMfc4AKR0WvuQFDSCuoaub
G3UAnRr49oj7f6RZaGK6Xo6GDa2L7bPo
=NHBQ
-----END PGP SIGNATURE-----

--=-Sq+j+ZqnHolwOBbyQKXg--
