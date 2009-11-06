Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N6UiN-0002ns-LV
	for openembedded-devel@openembedded.org; Fri, 06 Nov 2009 20:43:22 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 0FE731D36078; Fri,  6 Nov 2009 20:42:02 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Fri,  6 Nov 2009 20:42:00 +0100
Message-Id: <1257536522-11924-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Machine configuration for IEI Nano GX-466
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
X-List-Received-Date: Fri, 06 Nov 2009 19:43:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/machine/iei-nanogx-466.conf |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/iei-nanogx-466.conf

diff --git a/conf/machine/iei-nanogx-466.conf b/conf/machine/iei-nanogx-4=
66.conf
new file mode 100644
index 0000000..8fbc570
--- /dev/null
+++ b/conf/machine/iei-nanogx-466.conf
@@ -0,0 +1,28 @@
+# Copyright (C) 2009, Petr Stetiar
+# Released under the MIT license (see packages/COPYING)
+#@TYPE: Machine
+#@NAME: IEI Nano GX-466
+#@DESCRIPTION: Machine configuration for IEI Nano GX-466 - http://bit.ly=
/t9TOj
+
+TARGET_ARCH =3D  "i586"
+
+require conf/machine/include/tune-geode.inc
+
+MACHINE_FEATURES =3D "kernel26 pci vfat ext2 keyboard usbhost sound touc=
hscreen screen serial ethernet"
+
+KERNEL_IMAGETYPE =3D "bzImage"
+IMAGE_FSTYPES ?=3D "ext2 tar.bz2"
+
+PREFERRED_PROVIDER_virtual/kernel =3D "linux"
+PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
+XSERVER =3D "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-input-tslib \
+           xf86-video-geode \
+           xf86-input-keyboard"
+
+GUI_MACHINE_CLASS =3D "bigscreen"
+
+GLIBC_ADDONS =3D "nptl"
+GLIBC_EXTRA_OECONF =3D "--with-tls --with-cpu=3Di586"
--=20
1.5.6.3



