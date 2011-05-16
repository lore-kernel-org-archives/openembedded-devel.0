Received: from bsmtp4.bon.at ([195.3.86.186] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1QLyCB-0008K8-GK for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:50:51 +0200
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id BFD682C400F;
	Mon, 16 May 2011 15:47:56 +0200 (CEST)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: Eric =?iso-8859-1?q?B=E9nard?= <eric@eukrea.com>
Date: Mon, 16 May 2011 15:47:55 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201104291145.05479.pgsellmann@portner-elektronik.at>
	<201105161155.05490.pgsellmann@portner-elektronik.at>
	<4DD0FC8C.4040104@eukrea.com>
In-Reply-To: <4DD0FC8C.4040104@eukrea.com>
MIME-Version: 1.0
Message-Id: <201105161547.56204.pgsellmann@portner-elektronik.at>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux_2.6.38: update support for PcontrolG20 HW rev 2
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
X-List-Received-Date: Mon, 16 May 2011 13:50:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Eric!
Patch is based on 34cb3c31bfd81035870a8242850884edac80aa11

Am Montag 16 Mai 2011, 12:29:32 schrieb Eric B=E9nard:
> Hi Peter,
>=20
> On 16/05/2011 11:55, Peter Gsellmann wrote:
> > Am Samstag 14 Mai 2011, 19:06:24 schrieb Eric B=E9nard:
> >> On 29/04/2011 11:45, Peter Gsellmann wrote:
> >>> All prototypes hardware rev 1 are drawn back
> >>> so default should be rev 2
> >>>
> >>> Signed-off-by: Peter Gsellmann<pgsellmann@portner-elektronik.at>
> >>> ---
> >>>    recipes/linux/linux-2.6.38/pcontrolg20/defconfig   | 1761 ++++++++=
++++++++++++
> >>>    .../pcontrolg20/pcontrolg20_2.6.38.patch           |  235 +++
> >>>    recipes/linux/linux_2.6.38.bb                      |    2 +
> >>>    3 files changed, 1998 insertions(+), 0 deletions(-)
> >>>    create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/defconfig
> >>>    create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/pcontrol=
g20_2.6.38.patch
> >>>
> >> I applied this patch and tried to build the kernel but it seems there =
is no
> >> machine definition for pcontrolg20 : can you please resend a patch ser=
ie to
> >> add the kernel support and the machine conf file.
> > the machine configuration for pcontrolg20 is still not in a stable stat=
e:
> > At least the kernel patch is stable, but for the at91bootstrap i have m=
ade changes for lowlevel initialization and memory detection which i have t=
o bring in sync with mainline; right now my at91bootstrap patch looks ugly =
and would be rejected deservedly.
> > Same is for U-boot. I patched a specific git-revision with a number of =
additional commands i need for factory testing.
> > Even worse, the perpetual discussions about kernel relocation/decompres=
sion convinced me to evaluate alternatives like barebox.
> >
> good choice ;-)
>=20
> > So my ToDo-list is:
> > (*) commit kernel.patch
> > * commit at91bootstrap.patch
> > * commit U-boot or Barebox patches
> > * commit conf/machine/pcontrolg20.conf
> > * commit recipes/pcontrolg20-image.bb
> >
> > If its ok for you this would be the first commit.
> >
> > I could commit the pcontrolg20.conf also, but the entries for at91boost=
trap and u-boot would be commented out.
>=20
> yes a kernel recipe without the machine conf file can't be tested : pleas=
e=20
> send the 2 patches (kernel + conf file), then you will be able to add ent=
ries=20
> for at91bootstrap & u-boot to the conf file later when you add the suppor=
t for=20
> you board in their respective recipes.

=46rom 69cc3b9bcef7534a18dc780506e5678e0538eb58 Mon Sep 17 00:00:00 2001
=46rom: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Date: Mon, 16 May 2011 12:01:43 +0200
Subject: [PATCH] adding machine PControlG20

This is a no-screen machine.
=46eaturing NV-RAM, Isolated RS485 (Modbus-RTU), Ethernet switch, ...

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
=2D--
 conf/machine/pcontrolg20.conf |   39 +++++++++++++++++++++++++++++++++++++=
++
 1 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/pcontrolg20.conf

diff --git a/conf/machine/pcontrolg20.conf b/conf/machine/pcontrolg20.conf
new file mode 100644
index 0000000..9710de9
=2D-- /dev/null
+++ b/conf/machine/pcontrolg20.conf
@@ -0,0 +1,39 @@
+#@TYPE: Machine
+#@Name: PControl G20
+#@DESCRIPTION: Machine configuration for the PControl_G20 with Taskit Stam=
p9g20.
+
+TARGET_ARCH =3D "arm"
+
+MACHINE_FEATURES =3D "kernel26 ext2 ethernet serial mmc"
+MACHINE_FEATURES +=3D "usbhost usbgadget"
+
+GUI_MACHINE_CLASS =3D "noscreen"
+
+PREFERRED_PROVIDER_virtual/kernel =3D "linux"
+
+MACHINE_EXTRA_RRECOMMENDS =3D " \
+    "
+
+PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
+
+KERNEL_IMAGETYPE =3D "uImage"
+
+PREFERRED_PROVIDER_classpath =3D "classpath-minimal"
+PREFERRED_PROVIDER_virtual/java-initial =3D "jamvm-initial"
+
+#don't try to access tty1
+USE_VT =3D "0"
+
+SERIAL_CONSOLE =3D "115200 ttyS0"
+
+IMAGE_FSTYPES =3D "tar.gz jffs2"
+
+IMAGE_ROOTFS_SIZE =3D "1927168"
+
+module_autoload_plat_ram   =3D "plat_ram"
+module_autoload_uio_pdrv   =3D "uio_pdrv"
+module_autoload_w1_gpio    =3D "w1_gpio"
+module_autoload_i2c_gpio   =3D "i2c_gpio"
+module_autoload_g_ether    =3D "g_ether"
+
+require conf/machine/include/tune-arm926ejs.inc
=2D-=20
1.7.2.3




