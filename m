Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LKXsz-00037S-6p
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 13:51:49 +0100
Received: (qmail 12634 invoked by uid 813007); 7 Jan 2009 12:45:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Jan 2009 12:45:43 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Jan 2009 13:45:43 +0100
User-Agent: KMail/1.10.92 (Linux/2.6.28; KDE/4.1.86; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200901071345.43987.openembedded@haerwu.biz>
Cc: =?iso-8859-1?q?=D8yvind_Repvik?= <repvik@foonas.org>
Subject: [REVIEW] conf/machine cleanup
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
X-List-Received-Date: Wed, 07 Jan 2009 12:51:49 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Hi

I made cleanup in conf/machine directory today. All duplicates in=20
EXTRA_PACKAGE_ARCHS are removed now. I moved EXTRA_PACKAGES_ARCHS to=20
include/tune-* files (PPC and x86 targets), dropped it for ARM targets
(as tune-arm* files have them defined properly).

There are some machines which have broken configs:

=2D mnci, rt3000 - not maintained in OE anymore
=2D lspro, ts109, ts209, ts409 - missing include/orion.inc
=2D ts101, ts201 - missing include/tsppc.inc
=2D lsarm - missing lsarm-image.bbclass
=2D lsmipsel - missing lsmipsel-image.bbclass


Please test does your device works with that patch applied.

 conf/machine/boc01.conf                    |    1 -
 conf/machine/canyonlands.conf              |    1 -
 conf/machine/d201gly2.conf                 |    3 +--
 conf/machine/dht-walnut.conf               |    1 -
 conf/machine/efika.conf                    |    1 -
 conf/machine/gumstix-custom-connex.conf    |    1 -
 conf/machine/gumstix-custom-verdex.conf    |    1 -
 conf/machine/h3600.conf                    |    1 -
 conf/machine/htcsable.conf                 |    1 -
 conf/machine/htctornado.conf               |    1 -
 conf/machine/htcwallaby.conf               |    1 -
 conf/machine/hx2000.conf                   |    2 +-
 conf/machine/i586-generic.conf             |    2 --
 conf/machine/i686-generic.conf             |    1 -
 conf/machine/include/lsppc.inc             |    2 +-
 conf/machine/include/tune-pentium.inc      |    2 +-
 conf/machine/include/tune-pentium4c.inc    |    2 +-
 conf/machine/include/tune-pentiumpro.inc   |    2 +-
 conf/machine/include/tune-ppc405.inc       |    1 +
 conf/machine/include/tune-ppc440.inc       |    1 +
 conf/machine/include/tune-ppc440e.inc      |    1 +
 conf/machine/include/tune-ppc603e.inc      |    1 +
 conf/machine/include/tune-ppce300c2.inc    |    1 +
 conf/machine/include/tune-ppce300c3.inc    |    1 +
 conf/machine/include/tune-strongarm.inc    |    1 +
 conf/machine/include/tune-x86-nocona.inc   |    1 +
 conf/machine/include/tune-x86-prescott.inc |    1 +
 conf/machine/kb9202.conf                   |    1 -
 conf/machine/kilauea.conf                  |    1 -
 conf/machine/lite5200.conf                 |    1 -
 conf/machine/logicpd-pxa270.conf           |    1 -
 conf/machine/looxc550.conf                 |    1 -
 conf/machine/lsarm.conf                    |    1 -
 conf/machine/magicbox.conf                 |    1 -
 conf/machine/mp900c.conf                   |    1 -
 conf/machine/mpc8313e-rdb.conf             |    1 -
 conf/machine/mpc8315e-rdb.conf             |    1 -
 conf/machine/mpc8323e-rdb.conf             |    1 -
 conf/machine/mtx-3.conf                    |    1 -
 conf/machine/mx21ads.conf                  |    1 -
 conf/machine/n2100.conf                    |    1 -
 conf/machine/navman-icn330.conf            |    1 -
 conf/machine/netbook-pro.conf              |    1 -
 conf/machine/netvista.conf                 |    1 -
 conf/machine/omap1510inn.conf              |    1 -
 conf/machine/omap1610h2.conf               |    1 -
 conf/machine/omap1710h3.conf               |    1 -
 conf/machine/omap2420h4.conf               |    1 -
 conf/machine/omap2430sdp.conf              |    1 -
 conf/machine/palmtt.conf                   |    1 -
 conf/machine/palmz71.conf                  |    1 -
 conf/machine/rx1950.conf                   |    1 -
 conf/machine/rx3000.conf                   |    1 -
 conf/machine/sarge-at91.conf               |    1 -
 conf/machine/sequoia.conf                  |    1 -
 conf/machine/smdk2440.conf                 |    1 -
 conf/machine/smdk2443.conf                 |    1 -
 conf/machine/storcenter.conf               |    2 +-
 conf/machine/triton.conf                   |    1 -
 conf/machine/vmware.conf                   |    1 -
 conf/machine/x86-32-nocona.conf            |    1 -
 conf/machine/x86-prescott.conf             |    1 -
 conf/machine/xilinx-ml403.conf             |    1 -
 conf/machine/xilinx-ml410.conf             |    3 +--
 64 files changed, 17 insertions(+), 58 deletions(-)

diff --git a/conf/machine/boc01.conf b/conf/machine/boc01.conf
index a7db1b1..7c8182a 100644
=2D-- a/conf/machine/boc01.conf
+++ b/conf/machine/boc01.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the Bollor=E9 telecom CPE v01
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppce300c3"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
=20
diff --git a/conf/machine/canyonlands.conf b/conf/machine/canyonlands.conf
index 177738b..0a9446f 100644
=2D-- a/conf/machine/canyonlands.conf
+++ b/conf/machine/canyonlands.conf
@@ -6,7 +6,6 @@
=20
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc440e"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 PREFERRED_VERSION_linux =3D "2.6.26"
diff --git a/conf/machine/d201gly2.conf b/conf/machine/d201gly2.conf
index 75a6920..fb65dce 100644
=2D-- a/conf/machine/d201gly2.conf
+++ b/conf/machine/d201gly2.conf
@@ -6,9 +6,8 @@
=20
=20
 TARGET_ARCH =3D "i686"
=2DPACKAGE_EXTRA_ARCHS =3D "x86 i386 i486 i586 i686 i686p4c"
=20
=2DPREFERRED_PROVIDER_virtual/kernel =3D "linux
+PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 KERNEL_IMAGETYPE =3D "bzImage"
 OLDEST_KERNEL =3D "2.6.17"
=20
diff --git a/conf/machine/dht-walnut.conf b/conf/machine/dht-walnut.conf
index 25fb5b1..a033de1 100644
=2D-- a/conf/machine/dht-walnut.conf
+++ b/conf/machine/dht-walnut.conf
@@ -5,7 +5,6 @@
 #@DESCRIPTION: Machine configuration for the DHT-Walnut 405GP  development=
 platform
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc405"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}"
 UBOOT_ENTRYPOINT =3D "0"
diff --git a/conf/machine/efika.conf b/conf/machine/efika.conf
index 5bf42da..dd4ba06 100644
=2D-- a/conf/machine/efika.conf
+++ b/conf/machine/efika.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the EFIKA development platform: h=
ttp://www.pegasosppc.com/efika.php
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc603e"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-rt"
=20
diff --git a/conf/machine/gumstix-custom-connex.conf b/conf/machine/gumstix=
=2Dcustom-connex.conf
index 65cbaca..b59b056 100644
=2D-- a/conf/machine/gumstix-custom-connex.conf
+++ b/conf/machine/gumstix-custom-connex.conf
@@ -4,7 +4,6 @@
=20
 MACHINE_FEATURES +=3D "connex"
 require conf/machine/include/gumstix.inc
=2Drequire conf/machine/include/tune-xscale.inc
=20
 #
 # Your flash size =3D Total flash (in MB) - 1 (for linux kernel partition)
diff --git a/conf/machine/gumstix-custom-verdex.conf b/conf/machine/gumstix=
=2Dcustom-verdex.conf
index 5e9360d..97e4def 100644
=2D-- a/conf/machine/gumstix-custom-verdex.conf
+++ b/conf/machine/gumstix-custom-verdex.conf
@@ -5,7 +5,6 @@
 MACHINE_FEATURES +=3D "verdex"
 MACHINE_FEATURES +=3D "iwmmxt"
 require conf/machine/include/gumstix.inc
=2Drequire conf/machine/include/tune-xscale.inc
=20
 #
 # Your flash size =3D Total flash (in MB) - 1 (for linux kernel partition)
diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index c037226..7bbb223 100644
=2D-- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -6,7 +6,6 @@
 # Hardware-based properties
 #
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 "
=20
 require conf/machine/include/tune-strongarm.inc
=20
diff --git a/conf/machine/htcsable.conf b/conf/machine/htcsable.conf
index 2ae1419..30dbaeb 100644
=2D-- a/conf/machine/htcsable.conf
+++ b/conf/machine/htcsable.conf
@@ -6,7 +6,6 @@
 # Hardware-based properties
 #
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5e armv5te "
=20
 require conf/machine/include/tune-xscale.inc
=20
diff --git a/conf/machine/htctornado.conf b/conf/machine/htctornado.conf
index b311afe..1c472f5 100644
=2D-- a/conf/machine/htctornado.conf
+++ b/conf/machine/htctornado.conf
@@ -5,7 +5,6 @@
 #-------------------------------------------------------------------------=
=2D---
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4t armv5te"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-tornado-omap2"
=20
diff --git a/conf/machine/htcwallaby.conf b/conf/machine/htcwallaby.conf
index 34255a1..4c5f1d6 100644
=2D-- a/conf/machine/htcwallaby.conf
+++ b/conf/machine/htcwallaby.conf
@@ -6,7 +6,6 @@
 # Hardware-based properties
 #
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 "
=20
 require conf/machine/include/tune-strongarm.inc
=20
diff --git a/conf/machine/hx2000.conf b/conf/machine/hx2000.conf
index 8473321..c9957e2 100644
=2D-- a/conf/machine/hx2000.conf
+++ b/conf/machine/hx2000.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for the hx2000 iPAQs with a pxa27x CP=
U=20
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5te iwmmxt  "
+PACKAGE_EXTRA_ARCHS +=3D "iwmmxt"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-rp"
=20
diff --git a/conf/machine/i586-generic.conf b/conf/machine/i586-generic.conf
index 7918131..02079d3 100644
=2D-- a/conf/machine/i586-generic.conf
+++ b/conf/machine/i586-generic.conf
@@ -6,8 +6,6 @@
=20
=20
 TARGET_ARCH =3D "i586"
=2DPACKAGE_EXTRA_ARCHS =3D "x86"
=2D
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 PREFERRED_PROVIDER_virtual/xserver =3D "xserver-kdrive"
diff --git a/conf/machine/i686-generic.conf b/conf/machine/i686-generic.conf
index b4d254c..5635377 100644
=2D-- a/conf/machine/i686-generic.conf
+++ b/conf/machine/i686-generic.conf
@@ -6,7 +6,6 @@
=20
=20
 TARGET_ARCH =3D "i686"
=2DPACKAGE_EXTRA_ARCHS =3D "x86"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 PREFERRED_PROVIDER_virtual/xserver =3D "xserver-kdrive"
diff --git a/conf/machine/include/lsppc.inc b/conf/machine/include/lsppc.inc
index 632a9ed..f380b4f 100644
=2D-- a/conf/machine/include/lsppc.inc
+++ b/conf/machine/include/lsppc.inc
@@ -4,7 +4,7 @@
=20
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc ppc603e"
+PACKAGE_EXTRA_ARCHS =3D "ppc"
 MACHINE_FEATURES =3D "kernel26 usbhost ext2 pci uboot"
 TARGET_FPU =3D "hard"
=20
diff --git a/conf/machine/include/tune-pentium.inc b/conf/machine/include/t=
une-pentium.inc
index 4e5be15..0df6917 100644
=2D-- a/conf/machine/include/tune-pentium.inc
+++ b/conf/machine/include/tune-pentium.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH =3D "-march=3Dpentium"
 BASE_PACKAGE_ARCH =3D "i586"
 FEED_ARCH =3D "i586"
=2DPACKAGE_EXTRA_ARCHS +=3D "i386 i486"
+PACKAGE_EXTRA_ARCHS +=3D "x86 i386 i486"
diff --git a/conf/machine/include/tune-pentium4c.inc b/conf/machine/include=
/tune-pentium4c.inc
index 302eb3c..42de0d9 100644
=2D-- a/conf/machine/include/tune-pentium4c.inc
+++ b/conf/machine/include/tune-pentium4c.inc
@@ -1,3 +1,3 @@
 TARGET_CC_ARCH =3D "-march=3Dprescott"
 BASE_PACKAGE_ARCH =3D "i686p4c"
=2D
+PACKAGE_EXTRA_ARCHS +=3D "x86 i386 i486 i586"
diff --git a/conf/machine/include/tune-pentiumpro.inc b/conf/machine/includ=
e/tune-pentiumpro.inc
index 63dda25..e5c4555 100644
=2D-- a/conf/machine/include/tune-pentiumpro.inc
+++ b/conf/machine/include/tune-pentiumpro.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH =3D "-march=3Dpentiumpro"
 BASE_PACKAGE_ARCH =3D "i686"
 FEED_ARCH =3D "i686"
=2DPACKAGE_EXTRA_ARCHS +=3D "i386 i486 i586"
+PACKAGE_EXTRA_ARCHS +=3D "x86 i387 i486 i586"
diff --git a/conf/machine/include/tune-ppc405.inc b/conf/machine/include/tu=
ne-ppc405.inc
index a54aec0..e5edd68 100644
=2D-- a/conf/machine/include/tune-ppc405.inc
+++ b/conf/machine/include/tune-ppc405.inc
@@ -3,3 +3,4 @@ TARGET_FPU   ?=3D  "soft"
 TARGET_CC_ARCH =3D "-mcpu=3D405"
 BASE_PACKAGE_ARCH =3D "ppc405"
 FEED_ARCH =3D "ppc405"
+PACKAGE_EXTRA_ARCHS +=3D "ppc405"
diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tu=
ne-ppc440.inc
index 7d7ca0e..feca186 100644
=2D-- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH =3D "-mcpu=3D440"
 BASE_PACKAGE_ARCH =3D "ppc440"
 FEED_ARCH =3D "ppc440"
+PACKAGE_EXTRA_ARCHS +=3D "ppc440e"
diff --git a/conf/machine/include/tune-ppc440e.inc b/conf/machine/include/t=
une-ppc440e.inc
index cbcef8a..8b6955a 100644
=2D-- a/conf/machine/include/tune-ppc440e.inc
+++ b/conf/machine/include/tune-ppc440e.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH =3D "-mcpu=3D440fp -mhard-float"
 BASE_PACKAGE_ARCH =3D "ppc440e"
 FEED_ARCH =3D "ppc440e"
+PACKAGE_EXTRA_ARCHS +=3D "ppc440e"
diff --git a/conf/machine/include/tune-ppc603e.inc b/conf/machine/include/t=
une-ppc603e.inc
index f48dc26..2f627a7 100644
=2D-- a/conf/machine/include/tune-ppc603e.inc
+++ b/conf/machine/include/tune-ppc603e.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH =3D "-mcpu=3D603e -mhard-float"
 BASE_PACKAGE_ARCH =3D "ppc603e"
 FEED_ARCH =3D "ppc603e"
+PACKAGE_EXTRA_ARCHS +=3D "ppc603e"
diff --git a/conf/machine/include/tune-ppce300c2.inc b/conf/machine/include=
/tune-ppce300c2.inc
index 41ddd41..1524c7c 100644
=2D-- a/conf/machine/include/tune-ppce300c2.inc
+++ b/conf/machine/include/tune-ppce300c2.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH =3D "-mcpu=3De300c2"
 BASE_PACKAGE_ARCH =3D "ppce300c2"
 FEED_ARCH =3D "ppce300c2"
+PACKAGE_EXTRA_ARCHS +=3D "ppce300c2"
diff --git a/conf/machine/include/tune-ppce300c3.inc b/conf/machine/include=
/tune-ppce300c3.inc
index 24af11a..467c4cc 100644
=2D-- a/conf/machine/include/tune-ppce300c3.inc
+++ b/conf/machine/include/tune-ppce300c3.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH =3D "-mcpu=3De300c3"
 BASE_PACKAGE_ARCH =3D "ppce300c3"
 FEED_ARCH =3D "ppce300c3"
+PACKAGE_EXTRA_ARCHS +=3D "ppce300c3"
diff --git a/conf/machine/include/tune-strongarm.inc b/conf/machine/include=
/tune-strongarm.inc
index 37499a6..5745c36 100644
=2D-- a/conf/machine/include/tune-strongarm.inc
+++ b/conf/machine/include/tune-strongarm.inc
@@ -6,3 +6,4 @@ ARM_ABI =3D "oabi"
 TARGET_CC_ARCH =3D "-march=3Darmv4 -mtune=3Dstrongarm"
 FEED_ARCH =3D "arm-oabi"
=20
+PACKAGE_EXTRA_ARCHS +=3D "armv4 "
diff --git a/conf/machine/include/tune-x86-nocona.inc b/conf/machine/includ=
e/tune-x86-nocona.inc
index f1189a1..9bee740 100644
=2D-- a/conf/machine/include/tune-x86-nocona.inc
+++ b/conf/machine/include/tune-x86-nocona.inc
@@ -1,2 +1,3 @@
 TARGET_CC_ARCH =3D "-march=3Dnocona"
 TARGET_CC_KERNEL_ARCH =3D "-march=3Dnocona"
+PACKAGE_EXTRA_ARCHS +=3D "x86 i386 i486 i586"
diff --git a/conf/machine/include/tune-x86-prescott.inc b/conf/machine/incl=
ude/tune-x86-prescott.inc
index f3ec4e9..0a584f0 100644
=2D-- a/conf/machine/include/tune-x86-prescott.inc
+++ b/conf/machine/include/tune-x86-prescott.inc
@@ -1,2 +1,3 @@
 TARGET_CC_ARCH =3D "-march=3Dprescott"
 TARGET_CC_KERNEL_ARCH =3D "-march=3Dprescott"
+PACKAGE_EXTRA_ARCHS +=3D "x86 i386 i486 i586"
diff --git a/conf/machine/kb9202.conf b/conf/machine/kb9202.conf
index 5b88f45..a25290e 100644
=2D-- a/conf/machine/kb9202.conf
+++ b/conf/machine/kb9202.conf
@@ -5,7 +5,6 @@
 TARGET_ARCH =3D "arm"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t"
=20
 require conf/machine/include/tune-arm920t.inc
=20
diff --git a/conf/machine/kilauea.conf b/conf/machine/kilauea.conf
index 0ec14a9..883448c 100644
=2D-- a/conf/machine/kilauea.conf
+++ b/conf/machine/kilauea.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the AMCC Kilauea (405EX)
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc405"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
=20
diff --git a/conf/machine/lite5200.conf b/conf/machine/lite5200.conf
index b67d3dc..16a723c 100644
=2D-- a/conf/machine/lite5200.conf
+++ b/conf/machine/lite5200.conf
@@ -1,5 +1,4 @@
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc"
 UBOOT_MACHINE =3D "Lite5200"
 SERIAL_CONSOLE=3D"38400 ttyS0"
=20
diff --git a/conf/machine/logicpd-pxa270.conf b/conf/machine/logicpd-pxa270=
=2Econf
index a046c5d..01bd1e2 100644
=2D-- a/conf/machine/logicpd-pxa270.conf
+++ b/conf/machine/logicpd-pxa270.conf
@@ -7,7 +7,6 @@ PREFERRED_VERSION_logicpd-pxa270 =3D "2.6.19.2"
 GUI_MACHINE_CLASS =3D "smallscreen"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5te"
=20
 require conf/machine/include/tune-xscale.inc
=20
diff --git a/conf/machine/looxc550.conf b/conf/machine/looxc550.conf
index 1792cda..88a1be3 100644
=2D-- a/conf/machine/looxc550.conf
+++ b/conf/machine/looxc550.conf
@@ -6,7 +6,6 @@
 # Hardware-based properties
 #
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5e armv5te "
=20
 require conf/machine/include/tune-xscale.inc
=20
diff --git a/conf/machine/lsarm.conf b/conf/machine/lsarm.conf
index 4760d64..2af5f99 100644
=2D-- a/conf/machine/lsarm.conf
+++ b/conf/machine/lsarm.conf
@@ -2,7 +2,6 @@
 #@NAME: ARM based Buffalo Linkstation
 #@DESCRIPTION: Machine configuration for various different ARM based links=
tations
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5te"
 INHERIT +=3D "lsarm-image"
=20
 MACHINE_EXTRA_RDEPENDS =3D "miconapl micro-evtd"
diff --git a/conf/machine/magicbox.conf b/conf/machine/magicbox.conf
index 9839b6d..bd29837 100644
=2D-- a/conf/machine/magicbox.conf
+++ b/conf/machine/magicbox.conf
@@ -7,7 +7,6 @@
 INHERIT +=3D "magicbox-image"
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc405"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}"
=20
diff --git a/conf/machine/mp900c.conf b/conf/machine/mp900c.conf
index 37055be..38b70a2 100644
=2D-- a/conf/machine/mp900c.conf
+++ b/conf/machine/mp900c.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the PXA255 based Mobile Pro 9xx p=
almtop computer
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5te"
=20
 require conf/machine/include/tune-xscale.inc
=20
diff --git a/conf/machine/mpc8313e-rdb.conf b/conf/machine/mpc8313e-rdb.conf
index 83167b1..ed2579c 100644
=2D-- a/conf/machine/mpc8313e-rdb.conf
+++ b/conf/machine/mpc8313e-rdb.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the Freescale MPC8313E-RDB
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppce300c3"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
=20
diff --git a/conf/machine/mpc8315e-rdb.conf b/conf/machine/mpc8315e-rdb.conf
index e0a1215..7d3a93b 100644
=2D-- a/conf/machine/mpc8315e-rdb.conf
+++ b/conf/machine/mpc8315e-rdb.conf
@@ -6,7 +6,6 @@
 # PCI Express x1, 2x SATA.
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppce300c3"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
=20
diff --git a/conf/machine/mpc8323e-rdb.conf b/conf/machine/mpc8323e-rdb.conf
index 78c9b8a..e01aeaa 100644
=2D-- a/conf/machine/mpc8323e-rdb.conf
+++ b/conf/machine/mpc8323e-rdb.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the Freescale MPC8323E-RDB
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppce300c2"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
=20
diff --git a/conf/machine/mtx-3.conf b/conf/machine/mtx-3.conf
index ac7a6c1..d6d14d8 100644
=2D-- a/conf/machine/mtx-3.conf
+++ b/conf/machine/mtx-3.conf
@@ -8,7 +8,6 @@
 # TARGET_ARCH should be set here in the machine configuration.
 # For compiling the kernel, ARCH will be derived form it by kernel-arch.bb=
class=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5e armv5te "
 require conf/machine/include/tune-arm926ejs.inc
=20
=20
diff --git a/conf/machine/mx21ads.conf b/conf/machine/mx21ads.conf
index 0a09256..3abfa49 100644
=2D-- a/conf/machine/mx21ads.conf
+++ b/conf/machine/mx21ads.conf
@@ -7,7 +7,6 @@ TARGET_ARCH =3D "arm"
 MACHINE_FEATURES =3D "kernel26 apm alsa ext2 pcmcia usbhost usbgadget"
=20
 GUI_MACHINE_CLASS =3D "smallscreen"
=2DPACKAGE_EXTRA_ARCHS =3D "arm armv4t armv5te"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}-kernel"
=20
diff --git a/conf/machine/n2100.conf b/conf/machine/n2100.conf
index 026339d..20d9001 100644
=2D-- a/conf/machine/n2100.conf
+++ b/conf/machine/n2100.conf
@@ -1,6 +1,5 @@
 TARGET_ARCH =3D "arm"
 TARGET_OS =3D "linux"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5e armv5te"
=20
 INHERIT +=3D "n2100-image"
=20
diff --git a/conf/machine/navman-icn330.conf b/conf/machine/navman-icn330.c=
onf
index b265503..c9a7f6c 100644
=2D-- a/conf/machine/navman-icn330.conf
+++ b/conf/machine/navman-icn330.conf
@@ -8,7 +8,6 @@
 # Hardware-based properties
 #
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5e armv5te"
=20
 #Compile with armv5te optimizations, incompatible with armv4(t) cpus
 require conf/machine/include/tune-xscale.inc
diff --git a/conf/machine/netbook-pro.conf b/conf/machine/netbook-pro.conf
index 330a128..a747468 100755
=2D-- a/conf/machine/netbook-pro.conf
+++ b/conf/machine/netbook-pro.conf
@@ -5,7 +5,6 @@
 INHERIT +=3D "linux-kernel-base"
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "${MACHINE}-kernel"
=20
diff --git a/conf/machine/netvista.conf b/conf/machine/netvista.conf
index 65ad872..2653b05 100644
=2D-- a/conf/machine/netvista.conf
+++ b/conf/machine/netvista.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for a Linux IBM 8365 / J320 PC-based =
internet terminals
=20
 TARGET_ARCH =3D "i486"
=2DPACKAGE_EXTRA_ARCHS =3D "netvista"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 PREFERRED_VERSION_linux =3D "2.6.23"
=20
diff --git a/conf/machine/omap1510inn.conf b/conf/machine/omap1510inn.conf
index ffec67b..938435e 100644
=2D-- a/conf/machine/omap1510inn.conf
+++ b/conf/machine/omap1510inn.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the OMAP H2 development board wit=
h a 1610 processor
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv5te"
=20
 PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-2.6"
diff --git a/conf/machine/omap1610h2.conf b/conf/machine/omap1610h2.conf
index ffec67b..938435e 100644
=2D-- a/conf/machine/omap1610h2.conf
+++ b/conf/machine/omap1610h2.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the OMAP H2 development board wit=
h a 1610 processor
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv5te"
=20
 PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap-2.6"
diff --git a/conf/machine/omap1710h3.conf b/conf/machine/omap1710h3.conf
index 98e3a7d..951cb16 100644
=2D-- a/conf/machine/omap1710h3.conf
+++ b/conf/machine/omap1710h3.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the OMAP H3 development board wit=
h a 1710 processor
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv5te"
=20
 PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap1"
diff --git a/conf/machine/omap2420h4.conf b/conf/machine/omap2420h4.conf
index 343b009..9483259 100644
=2D-- a/conf/machine/omap2420h4.conf
+++ b/conf/machine/omap2420h4.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the OMAP H4 development board wit=
h a 2420 processor
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4t armv5te armv6"
 PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap2"
 PREFERRED_VERSION_u-boot =3D "1.1.4"
diff --git a/conf/machine/omap2430sdp.conf b/conf/machine/omap2430sdp.conf
index 0e6b646..7b1f8ab 100644
=2D-- a/conf/machine/omap2430sdp.conf
+++ b/conf/machine/omap2430sdp.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the OMAP 2430 SDP development boa=
rd with a arm1136 processor.
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4t armv5te armv6"
 PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap2"
 PREFERRED_VERSION_u-boot =3D "1.1.4"
diff --git a/conf/machine/palmtt.conf b/conf/machine/palmtt.conf
index ab78e88..4326af9 100644
=2D-- a/conf/machine/palmtt.conf
+++ b/conf/machine/palmtt.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for Palm Tungsten T/T2
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv5te"
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS =3D "320"
diff --git a/conf/machine/palmz71.conf b/conf/machine/palmz71.conf
index 7837c5d..0a7f274 100644
=2D-- a/conf/machine/palmz71.conf
+++ b/conf/machine/palmz71.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for Palm Zire 71
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv5te"
=20
 PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-palm-omap1"
diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index f8ca7ec..0ec1b32 100644
=2D-- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -6,7 +6,6 @@
 # Hardware-based properties
 #
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t"
=20
 # Samsung S3C2xxx CPU
 require conf/machine/include/tune-arm920t.inc
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index 2531f98..83c8820 100644
=2D-- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -6,7 +6,6 @@
 # Hardware-based properties
 #
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4 armv4t"
=20
 # Samsung S3C2xxx CPU
 require conf/machine/include/tune-arm920t.inc
diff --git a/conf/machine/sarge-at91.conf b/conf/machine/sarge-at91.conf
index 60026a3..fb8882f 100644
=2D-- a/conf/machine/sarge-at91.conf
+++ b/conf/machine/sarge-at91.conf
@@ -5,7 +5,6 @@
 #Homepage: http://blackmesaeast.com.pl/projects/electronics/sarge-single-b=
oard-computer/
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4t"
=20
 # used by sysvinit_2
 SERIAL_CONSOLE =3D "115200 ttyS0"
diff --git a/conf/machine/sequoia.conf b/conf/machine/sequoia.conf
index cc87511..309c813 100644
=2D-- a/conf/machine/sequoia.conf
+++ b/conf/machine/sequoia.conf
@@ -6,7 +6,6 @@
=20
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc440e"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 KERNEL_IMAGETYPE =3D "uImage"
diff --git a/conf/machine/smdk2440.conf b/conf/machine/smdk2440.conf
index b11ca6e..5f17bba 100644
=2D-- a/conf/machine/smdk2440.conf
+++ b/conf/machine/smdk2440.conf
@@ -4,7 +4,6 @@
=20
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4t"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-smdk2440"
=20
diff --git a/conf/machine/smdk2443.conf b/conf/machine/smdk2443.conf
index d3fccf1..81c9a50 100644
=2D-- a/conf/machine/smdk2443.conf
+++ b/conf/machine/smdk2443.conf
@@ -4,7 +4,6 @@
=20
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4t"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-smdk2443"
 UBOOT_ENTRYPOINT =3D "30008000"
diff --git a/conf/machine/storcenter.conf b/conf/machine/storcenter.conf
index 9b90103..09b6d30 100644
=2D-- a/conf/machine/storcenter.conf
+++ b/conf/machine/storcenter.conf
@@ -1,7 +1,7 @@
 TARGET_ARCH =3D "powerpc"
 TARGET_OS =3D "linux"
 TARGET_FPU =3D "hard"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc ppc603e"
+PACKAGE_EXTRA_ARCHS =3D "ppc"
=20
 INHERIT +=3D "storcenter-image"
=20
diff --git a/conf/machine/triton.conf b/conf/machine/triton.conf
index 0275f6b..56ef0bf 100644
=2D-- a/conf/machine/triton.conf
+++ b/conf/machine/triton.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the XScale based triton boards fr=
om KaRo Electronics=20
=20
 TARGET_ARCH =3D "arm"
=2DPACKAGE_EXTRA_ARCHS =3D "armv4t armv5te"
 PREFERRED_PROVIDER_virtual/kernel =3D "triton-kernel"
=20
 BOOTSTRAP_EXTRA_RDEPENDS =3D "virtual/kernel"
diff --git a/conf/machine/vmware.conf b/conf/machine/vmware.conf
index d318bb7..3c0d8fe 100644
=2D-- a/conf/machine/vmware.conf
+++ b/conf/machine/vmware.conf
@@ -6,7 +6,6 @@
 #@DESCRIPTION: Machine configuration for a VMWare virtual PC
=20
 TARGET_ARCH =3D "i686"
=2DPACKAGE_EXTRA_ARCHS =3D "vmware"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 PREFERRED_PROVIDER_virtual/xserver =3D "xserver-kdrive"
diff --git a/conf/machine/x86-32-nocona.conf b/conf/machine/x86-32-nocona.c=
onf
index 91cf003..d50d24e 100644
=2D-- a/conf/machine/x86-32-nocona.conf
+++ b/conf/machine/x86-32-nocona.conf
@@ -5,7 +5,6 @@
=20
 TARGET_ARCH =3D "i686"
 MACHINE_ARCH =3D "x86-32-nocona"
=2DPACKAGE_EXTRA_ARCHS =3D "x86 i386 i486 i586 i686"
=20
 require conf/machine/include/tune-x86-nocona.inc
=20
diff --git a/conf/machine/x86-prescott.conf b/conf/machine/x86-prescott.conf
index 5ea5079..51606a6 100644
=2D-- a/conf/machine/x86-prescott.conf
+++ b/conf/machine/x86-prescott.conf
@@ -4,7 +4,6 @@
=20
 TARGET_ARCH =3D "i686"
 MACHINE_ARCH =3D "x86-prescott"
=2DPACKAGE_EXTRA_ARCHS =3D "x86 i386 i486 i586 i686"
=20
 require conf/machine/include/tune-x86-prescott.inc
=20
diff --git a/conf/machine/xilinx-ml403.conf b/conf/machine/xilinx-ml403.conf
index 219d1f3..eb2ddcf 100644
=2D-- a/conf/machine/xilinx-ml403.conf
+++ b/conf/machine/xilinx-ml403.conf
@@ -5,7 +5,6 @@
 #@DESCRIPTION: Machine configuration for Xilinx ML403 (softcore ppc) devel=
opment platform http://www.xilinx.com/ml403
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc405"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx-slab"
=20
diff --git a/conf/machine/xilinx-ml410.conf b/conf/machine/xilinx-ml410.conf
index ea61b7a..19418a9 100644
=2D-- a/conf/machine/xilinx-ml410.conf
+++ b/conf/machine/xilinx-ml410.conf
@@ -3,10 +3,9 @@
 #@TYPE: Machine
 #@Name: Xilinx ML410 FPGA Development Platform
 #@DESCRIPTION: Machine configuration for Xilinx ML410 Virtex-4 FX Embedded=
 Development Platform  \=20
=2D(softcore ppc) development platform http://www.xilinx.com/ml410
+#(softcore ppc) development platform http://www.xilinx.com/ml410
=20
 TARGET_ARCH =3D "powerpc"
=2DPACKAGE_EXTRA_ARCHS =3D "ppc405"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-${MACHINE}"
=20


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




