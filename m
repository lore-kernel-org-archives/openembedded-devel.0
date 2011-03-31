Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Q5ITy-00065v-D7
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 16:04:18 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2VE2E8c026061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 09:02:14 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id p2VE2CpU013549
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 09:02:12 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2VE2CK7025272
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 09:02:12 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 31 Mar 2011 09:02:04 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Mar 2011 09:02:03 -0500
Thread-Topic: [oe] [PATCH 1/6] ti814x: Add new machine definitions
Thread-Index: AcvvbtJbIAOJYyCAQSmh+1O3juY3XwAPVLgw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340B8D9F1@dlee06.ent.ti.com>
References: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
	<in17n8$pfl$1@dough.gmane.org>
In-Reply-To: <in17n8$pfl$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] ti814x: Add new machine definitions
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
X-List-Received-Date: Thu, 31 Mar 2011 14:04:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Thursday, March 31, 2011 1:42 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 1/6] ti814x: Add new machine definitions
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 30-03-11 20:08, Chase Maupin wrote:
> > * Add new am387x-evm machine definition
> > * Add new dm814xx-evm machine definition
> > * Add new c6a814x-evm machine definition
> > * New SOC_FAMILY ti814x available
> > * Based on machine configuration files from Arago contributed
> >   by Siddharth Heroor
>=20
> FWIW, the machines get generally added last in the patch series since
> now you have a commit where there are machines, but no uboot/kernel/etc.
>=20

Koen,

Thanks.  I'll do it that way going forward.

> regards,
>=20
> Koen
>=20
>=20
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  conf/machine/am387x-evm.conf    |    5 +++++
> >  conf/machine/c6a814x-evm.conf   |    5 +++++
> >  conf/machine/dm814x-evm.conf    |    5 +++++
> >  conf/machine/include/ti814x.inc |   26 ++++++++++++++++++++++++++
> >  4 files changed, 41 insertions(+), 0 deletions(-)
> >  create mode 100644 conf/machine/am387x-evm.conf
> >  create mode 100644 conf/machine/c6a814x-evm.conf
> >  create mode 100644 conf/machine/dm814x-evm.conf
> >  create mode 100644 conf/machine/include/ti814x.inc
> >
> > diff --git a/conf/machine/am387x-evm.conf b/conf/machine/am387x-evm.con=
f
> > new file mode 100644
> > index 0000000..ebf9889
> > --- /dev/null
> > +++ b/conf/machine/am387x-evm.conf
> > @@ -0,0 +1,5 @@
> > +#@TYPE: Machine
> > +#@NAME: AM389x evm
> > +#@DESCRIPTION: Machine configuration for the AM389x evm
> > +
> > +require conf/machine/include/ti814x.inc
> > diff --git a/conf/machine/c6a814x-evm.conf b/conf/machine/c6a814x-
> evm.conf
> > new file mode 100644
> > index 0000000..b85c489
> > --- /dev/null
> > +++ b/conf/machine/c6a814x-evm.conf
> > @@ -0,0 +1,5 @@
> > +#@TYPE: Machine
> > +#@NAME: c6a814x evm
> > +#@DESCRIPTION: Machine configuration for the c6a814x evm
> > +
> > +require conf/machine/include/ti814x.inc
> > diff --git a/conf/machine/dm814x-evm.conf b/conf/machine/dm814x-evm.con=
f
> > new file mode 100644
> > index 0000000..140dcc1
> > --- /dev/null
> > +++ b/conf/machine/dm814x-evm.conf
> > @@ -0,0 +1,5 @@
> > +#@TYPE: Machine
> > +#@NAME: DM814x evm
> > +#@DESCRIPTION: Machine configuration for the DM814x evm
> > +
> > +require conf/machine/include/ti814x.inc
> > diff --git a/conf/machine/include/ti814x.inc
> b/conf/machine/include/ti814x.inc
> > new file mode 100644
> > index 0000000..8fa7ee9
> > --- /dev/null
> > +++ b/conf/machine/include/ti814x.inc
> > @@ -0,0 +1,26 @@
> > +TARGET_ARCH =3D "arm"
> > +SOC_FAMILY =3D "ti814x"
> > +
> > +require conf/machine/include/tune-cortexa8.inc
> > +
> > +PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap3"
> > +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
> > +
> > +# Increase this everytime you change something in the kernel
> > +MACHINE_KERNEL_PR =3D "r1"
> > +
> > +KERNEL_IMAGETYPE =3D "uImage"
> > +
> > +UBOOT_ARCH =3D "arm"
> > +UBOOT_MACHINE =3D "ti8148_evm_config_nand"
> > +UBOOT_ENTRYPOINT =3D "0x80008000"
> > +UBOOT_LOADADDRESS =3D "0x80008000"
> > +
> > +# Only build u-boot
> > +EXTRA_IMAGEDEPENDS +=3D "u-boot"
> > +
> > +# Ship all kernel modules
> > +IMAGE_FSTYPES ?=3D "jffs2 tar.bz2"
> > +EXTRA_IMAGECMD_jffs2 =3D "-lqn -e 128"
> > +SERIAL_CONSOLE =3D "115200 ttyO0"
> > +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 etherne=
t"
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFNlCIoMkyGM64RGpERAkAmAJ9Eie7vs4ZP8LqzsxsOwmwhbas0fACgoUTl
> KodmBksvnoK3o5Kx+x6LQZk=3D
> =3DmssH
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


