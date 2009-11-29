Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NEkBX-0001iB-St
	for openembedded-devel@openembedded.org; Sun, 29 Nov 2009 14:51:34 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 9224B1D36076;
	Sun, 29 Nov 2009 14:49:57 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Nov 2009 14:49:58 +0100
Message-Id: <1259502600-10053-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] linux-omap-2.6.29: add support for ET&T TC5UH touchscreen controller
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
X-List-Received-Date: Sun, 29 Nov 2009 13:51:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/machine/include/omap3.inc                     |    2 +-
 .../linux/linux-omap-2.6.29/beagleboard/defconfig  |   32 +++++++-
 recipes/linux/linux-omap-2.6.29/ett-tc5uh.patch    |   84 ++++++++++++++=
++++++
 recipes/linux/linux-omap_2.6.29.bb                 |    1 +
 4 files changed, 116 insertions(+), 3 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.29/ett-tc5uh.patch

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.=
inc
index 2f242a4..3d6bfee 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r50"
+MACHINE_KERNEL_PR =3D "r51"
=20
 KERNEL_IMAGETYPE =3D "uImage"
=20
diff --git a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig b/reci=
pes/linux/linux-omap-2.6.29/beagleboard/defconfig
index a1848d5..1f4351b 100644
--- a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
+++ b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.29-omap1
-# Wed Sep  9 09:58:54 2009
+# Sat Nov 28 17:58:38 2009
 #
 CONFIG_ARM=3Dy
 CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
@@ -1213,7 +1213,35 @@ CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
 # CONFIG_MOUSE_GPIO is not set
 # CONFIG_INPUT_JOYSTICK is not set
 # CONFIG_INPUT_TABLET is not set
-# CONFIG_INPUT_TOUCHSCREEN is not set
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_TSC2005 is not set
+# CONFIG_TOUCHSCREEN_TSC210X is not set
+CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dy
+# CONFIG_TOUCHSCREEN_USB_EGALAX is not set
+# CONFIG_TOUCHSCREEN_USB_PANJIT is not set
+# CONFIG_TOUCHSCREEN_USB_3M is not set
+# CONFIG_TOUCHSCREEN_USB_ITM is not set
+# CONFIG_TOUCHSCREEN_USB_ETURBO is not set
+# CONFIG_TOUCHSCREEN_USB_GUNZE is not set
+# CONFIG_TOUCHSCREEN_USB_DMC_TSC10 is not set
+# CONFIG_TOUCHSCREEN_USB_IRTOUCH is not set
+# CONFIG_TOUCHSCREEN_USB_IDEALTEK is not set
+# CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH is not set
+# CONFIG_TOUCHSCREEN_USB_GOTOP is not set
+CONFIG_TOUCHSCREEN_USB_ETT_TC5UH=3Dy
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
 CONFIG_INPUT_MISC=3Dy
 # CONFIG_INPUT_ATI_REMOTE is not set
 # CONFIG_INPUT_ATI_REMOTE2 is not set
diff --git a/recipes/linux/linux-omap-2.6.29/ett-tc5uh.patch b/recipes/li=
nux/linux-omap-2.6.29/ett-tc5uh.patch
new file mode 100644
index 0000000..ce04664
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.29/ett-tc5uh.patch
@@ -0,0 +1,84 @@
+[PATCH] Input: usbtouchscreen - add support for ET&T TC5UH touchscreen c=
ontroller
+
+This patch adds support for the ET&T TC5UH 5-wire USB touchscreen contro=
ller.
+More info at http://www.etandt.com.tw/board_solution.html
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+
+Index: linux-2.6.31.5/drivers/input/touchscreen/Kconfig
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.31.5.orig/drivers/input/touchscreen/Kconfig	2009-11-24 22:=
31:47.000000000 +0100
++++ linux-2.6.31.5/drivers/input/touchscreen/Kconfig	2009-11-24 22:34:16=
.000000000 +0100
+@@ -468,6 +468,11 @@
+ 	bool "GoTop Super_Q2/GogoPen/PenPower tablet device support" if EMBEDD=
ED
+ 	depends on TOUCHSCREEN_USB_COMPOSITE
+=20
++config TOUCHSCREEN_USB_ETT_TC5UH
++	default y
++	bool "ET&T TC5UH touchscreen controller support" if EMBEDDED
++	depends on TOUCHSCREEN_USB_COMPOSITE
++
+ config TOUCHSCREEN_TOUCHIT213
+ 	tristate "Sahara TouchIT-213 touchscreen"
+ 	select SERIO
+Index: linux-2.6.31.5/drivers/input/touchscreen/usbtouchscreen.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- linux-2.6.31.5.orig/drivers/input/touchscreen/usbtouchscreen.c	2009-=
11-24 22:31:58.000000000 +0100
++++ linux-2.6.31.5/drivers/input/touchscreen/usbtouchscreen.c	2009-11-24=
 22:40:50.000000000 +0100
+@@ -118,6 +118,7 @@
+ 	DEVTYPE_IDEALTEK,
+ 	DEVTYPE_GENERAL_TOUCH,
+ 	DEVTYPE_GOTOP,
++	DEVTYPE_TC5UH,
+ };
+=20
+ #define USB_DEVICE_HID_CLASS(vend, prod) \
+@@ -191,6 +192,10 @@
+ 	{USB_DEVICE(0x08f2, 0x00f4), .driver_info =3D DEVTYPE_GOTOP},
+ #endif
+=20
++#ifdef CONFIG_TOUCHSCREEN_USB_ETT_TC5UH
++	{USB_DEVICE(0x0664, 0x0309), .driver_info =3D DEVTYPE_TC5UH},
++#endif
++
+ 	{}
+ };
+=20
+@@ -563,6 +568,19 @@
+ }
+ #endif
+=20
++/**********************************************************************=
*******
++ * ET&T TC5UH part
++ */
++#ifdef CONFIG_TOUCHSCREEN_USB_ETT_TC5UH
++static int tc5uh_read_data(struct usbtouch_usb *dev, unsigned char *pkt=
)
++{
++	dev->x =3D ((pkt[2] & 0x0F) << 8) | pkt[1];
++	dev->y =3D ((pkt[4] & 0x0F) << 8) | pkt[3];
++	dev->touch =3D pkt[0] & 0x01;
++
++	return 1;
++}
++#endif
+=20
+ /**********************************************************************=
*******
+  * the different device descriptors
+@@ -702,6 +720,17 @@
+ 		.read_data	=3D gotop_read_data,
+ 	},
+ #endif
++
++#ifdef CONFIG_TOUCHSCREEN_USB_ETT_TC5UH
++	[DEVTYPE_TC5UH] =3D {
++		.min_xc		=3D 0x0,
++		.max_xc		=3D 0x0fff,
++		.min_yc		=3D 0x0,
++		.max_yc		=3D 0x0fff,
++		.rept_size	=3D 5,
++		.read_data	=3D tc5uh_read_data,
++	},
++#endif
+ };
+=20
+=20
diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-oma=
p_2.6.29.bb
index 1a0fc51..eaff3dd 100644
--- a/recipes/linux/linux-omap_2.6.29.bb
+++ b/recipes/linux/linux-omap_2.6.29.bb
@@ -173,6 +173,7 @@ SRC_URI_append =3D " \
            file://smsc/smsc911x-2.patch;patch=3D1 \
            file://smsc/smsc911x-3.patch;patch=3D1 \
            file://smsc/smsc911x-4.patch;patch=3D1 \
+           file://ett-tc5uh.patch;patch=3D1 \
 "
=20
=20
--=20
1.6.0.4



