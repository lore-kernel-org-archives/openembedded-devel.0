Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P8KHk-0007GG-CN
	for openembedded-devel@openembedded.org; Wed, 20 Oct 2010 00:04:01 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 508531D3616D;
	Wed, 20 Oct 2010 00:03:18 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 00:03:21 +0200
Message-Id: <1287525802-13312-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287525802-13312-1-git-send-email-ynezz@true.cz>
References: <1287525802-13312-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] ts72xx: update machine config
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
X-List-Received-Date: Tue, 19 Oct 2010 22:05:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- add autoloading of common modules
- specify parameters for UBIFS image
- move CMDLINE to kernel
- update MACHINE_FEATURES
- specify KERNEL_IMAGETYPE

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/machine/ts72xx.conf |   23 +++++++++++++++++++++--
 1 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/conf/machine/ts72xx.conf b/conf/machine/ts72xx.conf
index 3e0a869..f990fe0 100644
--- a/conf/machine/ts72xx.conf
+++ b/conf/machine/ts72xx.conf
@@ -5,11 +5,30 @@
 TARGET_ARCH =3D "arm"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
+KERNEL_IMAGETYPE =3D "zImage"
+IMAGE_FSTYPES ?=3D "tar.bz2 ubi"
=20
-MACHINE_FEATURES =3D "kernel26 ext2 usbhost bluetooth"
+MACHINE_FEATURES =3D "kernel26 ext2 usbhost usbgadget vfat"
=20
 SERIAL_CONSOLE =3D "115200 ttyAM0"
 USE_VT =3D "0"
-CMDLINE =3D "console=3DttyAM0,115200 ip=3D192.168.1.3:192.168.1.2:192.16=
8.1.2:255.255.255.0 root=3D/dev/nfs nfsroot=3D192.168.1.2:/media/data/dev=
el/oe/ts72xx-stable/tmp/deploy/glibc/images/ts72xx/nfsroot"
+
+module_autoload_ohci-hcd =3D "ohci-hcd"
+module_autoload_rtc-ep93xx =3D "rtc-ep93xx"
+module_autoload_rtc-m48t86 =3D "rtc-m48t86"
+module_autoload_ts72xx_sbcinfo =3D "ts72xx_sbcinfo"
+
+# do ubiattach /dev/ubi_ctrl -m 1
+# From dmesg:
+# UBI: physical eraseblock size:   16384 bytes (16 KiB)
+# UBI: logical eraseblock size:    15872 bytes
+# UBI: smallest flash I/O unit:    512
+# UBI: sub-page size:              256
+# UBI: VID header offset:          256 (aligned 256)
+# UBI: data offset:                512
+# From ubiattach stdout:
+# UBI device number 0, total 1856 LEBs
+MKUBIFS_ARGS =3D "-m 512 -e 15872 -c 1856"
+UBINIZE_ARGS =3D "-m 512 -p 16KiB -s 256 -O 256"
=20
 require conf/machine/include/tune-arm920t.inc
--=20
1.7.0.4



