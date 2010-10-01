Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P1ezP-0002YV-0w
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 14:46:50 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o91CjBql020066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 07:45:11 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o91CjBK2013967
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 07:45:11 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o91CjBBB021893
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 07:45:11 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 1 Oct 2010 07:45:10 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Oct 2010 07:45:09 -0500
Thread-Topic: [oe] [PATCH 1/5] ti816x: add support for ti816x family	of devices
Thread-Index: Actg9ydDjthR2GPLTQGyqLvDrFiyJgAbyUzA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310F20FA7@dlee06.ent.ti.com>
References: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
	<20100930232630.GB28782@denix.org>
In-Reply-To: <20100930232630.GB28782@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] ti816x: add support for ti816x family	of	devices
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
X-List-Received-Date: Fri, 01 Oct 2010 12:47:34 -0000
X-List-Received-Date: Fri, 01 Oct 2010 12:47:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Denys Dmytriyenko
> Sent: Thursday, September 30, 2010 6:27 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 1/5] ti816x: add support for ti816x family of
> devices
>=20
> On Thu, Sep 30, 2010 at 01:12:02PM -0500, Chase Maupin wrote:
> > * Add support for the TI816x family of devices.  This includes
> >   the c6a816x and am389x devices.
> > * Separate machine types are used because not all packages
> >   are valid for each machine.
> >
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > ---
> >  conf/machine/am389x-evm.conf    |    5 +++++
> >  conf/machine/c6a816x-evm.conf   |    5 +++++
> >  conf/machine/include/ti816x.inc |   26 ++++++++++++++++++++++++++
> >  3 files changed, 36 insertions(+), 0 deletions(-)
> >  create mode 100644 conf/machine/am389x-evm.conf
> >  create mode 100644 conf/machine/c6a816x-evm.conf
> >  create mode 100644 conf/machine/include/ti816x.inc
> >
> > diff --git a/conf/machine/am389x-evm.conf b/conf/machine/am389x-evm.con=
f
> > new file mode 100644
> > index 0000000..9bfe7a7
> > --- /dev/null
> > +++ b/conf/machine/am389x-evm.conf
> > @@ -0,0 +1,5 @@
> > +#@TYPE: Machine
> > +#@NAME: am389x evm
> > +#@DESCRIPTION: Machine configuration for the am389x evm
> > +
> > +require conf/machine/include/ti816x.inc
> > diff --git a/conf/machine/c6a816x-evm.conf b/conf/machine/c6a816x-
> evm.conf
> > new file mode 100644
> > index 0000000..a7ab9b0
> > --- /dev/null
> > +++ b/conf/machine/c6a816x-evm.conf
> > @@ -0,0 +1,5 @@
> > +#@TYPE: Machine
> > +#@NAME: c6a816x evm
> > +#@DESCRIPTION: Machine configuration for the c6a816x evm
> > +
> > +require conf/machine/include/ti816x.inc
> > diff --git a/conf/machine/include/ti816x.inc
> b/conf/machine/include/ti816x.inc
> > new file mode 100644
> > index 0000000..e5205f7
> > --- /dev/null
> > +++ b/conf/machine/include/ti816x.inc
> > @@ -0,0 +1,26 @@
> > +TARGET_ARCH =3D "arm"
> > +SOC_FAMILY =3D "ti816x"
> > +
> > +require conf/machine/include/tune-cortexa8.inc
> > +
> > +PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap3"
>=20
> Chase,
>=20
> There is no linux-omap3 recipe in OE, unlike Arago. Anyway, Koen said
> he'll
> make necessary updates when he pushes all the ti816x-related changes...

Denys,

Good point.  I see that the kernel changes went in today.=20

>=20
> --
> Denys
>=20
>=20
> > +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
> > +
> > +# Increase this everytime you change something in the kernel
> > +MACHINE_KERNEL_PR =3D "r1"
> > +
> > +KERNEL_IMAGETYPE =3D "uImage"
> > +
> > +UBOOT_ARCH =3D "arm"
> > +UBOOT_MACHINE =3D "ti8168_evm_config"
> > +UBOOT_ENTRYPOINT =3D "0x80008000"
> > +UBOOT_LOADADDRESS =3D "0x80008000"
> > +
> > +# Only build u-boot
> > +EXTRA_IMAGEDEPENDS +=3D "u-boot"
> > +
> > +# Ship all kernel modules
> > +IMAGE_FSTYPES ?=3D "jffs2 tar.bz2"
> > +EXTRA_IMAGECMD_jffs2 =3D "-lnp -e 0x20000 -s 2048"
> > +SERIAL_CONSOLE =3D "115200 ttyS2"
> > +MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 etherne=
t"
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


