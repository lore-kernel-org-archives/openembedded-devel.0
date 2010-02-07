Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NeBen-0007OH-R6
	for openembedded-devel@openembedded.org; Sun, 07 Feb 2010 19:14:57 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 001811D36079;
	Sun,  7 Feb 2010 19:12:19 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Feb 2010 19:12:23 +0100
Message-Id: <1265566343-31243-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
References: <1264620764-22806-1-git-send-email-ynezz@true.cz>
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH v2] rt2x00: new recipe for rt3070 version 2.1.2.0
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
X-List-Received-Date: Sun, 07 Feb 2010 18:14:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch adds support for rt3070 kernel driver, used for example by the=
 new
Belkin F6D4050v2 USB WiFi stick.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/rt2x00/files/add-belkin-F6D4050v2.patch |   12 +++++++++
 recipes/rt2x00/files/makefile.patch             |   18 ++++++++++++++
 recipes/rt2x00/rt3070_2.1.2.bb                  |   28 +++++++++++++++++=
++++++
 3 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 recipes/rt2x00/files/add-belkin-F6D4050v2.patch
 create mode 100644 recipes/rt2x00/files/makefile.patch
 create mode 100644 recipes/rt2x00/rt3070_2.1.2.bb

diff --git a/recipes/rt2x00/files/add-belkin-F6D4050v2.patch b/recipes/rt=
2x00/files/add-belkin-F6D4050v2.patch
new file mode 100644
index 0000000..7454faf
--- /dev/null
+++ b/recipes/rt2x00/files/add-belkin-F6D4050v2.patch
@@ -0,0 +1,12 @@
+Index: 2009_1110_RT3070_Linux_STA_v2.1.2.0/os/linux/usb_main_dev.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- 2009_1110_RT3070_Linux_STA_v2.1.2.0.orig/os/linux/usb_main_dev.c	201=
0-01-23 23:37:09.000000000 +0100
++++ 2009_1110_RT3070_Linux_STA_v2.1.2.0/os/linux/usb_main_dev.c	2010-01-=
23 23:37:14.000000000 +0100
+@@ -74,6 +74,7 @@
+ 	{USB_DEVICE(0x5A57,0x0283)}, /* Zinwell 3072 */
+ 	{USB_DEVICE(0x04BB,0x0945)}, /* I-O DATA 3072 */
+ 	{USB_DEVICE(0x203D,0x1480)}, /* Encore 3070 */
++	{USB_DEVICE(0x050d,0x935b)}, /* Belkin F6D4050v2 (N150 enhanced) */
+ #endif // RT3070 //
+ 	{ }/* Terminating entry */
+ };
diff --git a/recipes/rt2x00/files/makefile.patch b/recipes/rt2x00/files/m=
akefile.patch
new file mode 100644
index 0000000..e314d5f
--- /dev/null
+++ b/recipes/rt2x00/files/makefile.patch
@@ -0,0 +1,18 @@
+Index: 2009_1110_RT3070_Linux_STA_v2.1.2.0/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- 2009_1110_RT3070_Linux_STA_v2.1.2.0.orig/Makefile	2010-01-23 23:07:4=
2.000000000 +0100
++++ 2009_1110_RT3070_Linux_STA_v2.1.2.0/Makefile	2010-01-23 23:08:02.000=
000000 +0100
+@@ -149,11 +149,11 @@
+ ifneq (,$(findstring 2.4,$(LINUX_SRC)))
+ 	cp -f os/linux/Makefile.4 $(RT28xx_DIR)/os/linux/Makefile
+ 	make -C $(RT28xx_DIR)/os/linux/
+-	cp -f $(RT28xx_DIR)/os/linux/rt$(CHIPSET)sta.o /tftpboot
++	cp -f $(RT28xx_DIR)/os/linux/rt$(CHIPSET)sta.o $(RT28xx_DIR)
+ else
+ 	cp -f os/linux/Makefile.6 $(RT28xx_DIR)/os/linux/Makefile
+ 	make  -C  $(LINUX_SRC) SUBDIRS=3D$(RT28xx_DIR)/os/linux modules
+-	cp -f $(RT28xx_DIR)/os/linux/rt$(CHIPSET)sta.ko /tftpboot
++	cp -f $(RT28xx_DIR)/os/linux/rt$(CHIPSET)sta.ko $(RT28xx_DIR)
+ endif=09
+=20
+ clean:
diff --git a/recipes/rt2x00/rt3070_2.1.2.bb b/recipes/rt2x00/rt3070_2.1.2=
.bb
new file mode 100644
index 0000000..aa6a1b0
--- /dev/null
+++ b/recipes/rt2x00/rt3070_2.1.2.bb
@@ -0,0 +1,28 @@
+DESCRIPTION =3D "Driver for Ralink rt3070 USB 802.11abgn WiFi sticks"
+SECTION =3D "kernel/modules"
+LICENSE =3D "GPL"
+
+PR =3D "r0"
+
+TMP =3D "2009_1110_RT3070_Linux_STA_v${PV}.0"
+
+SRC_URI =3D "http://sources.openembedded.org/${TMP}.tar.bz2;name=3Dtarba=
ll \
+           file://makefile.patch;patch=3D1 \
+           file://add-belkin-F6D4050v2.patch;patch=3D1 \
+"
+
+SRC_URI[tarball.md5sum] =3D "01a4d6804fff2a76584d20f7c21b1af4"
+SRC_URI[tarball.sha256sum] =3D "46723d7284360435a9d5769ac1f81fb7f6058c39=
3bb0625dc3fa0a2f282feadd"
+
+inherit module
+
+S =3D "${WORKDIR}/${TMP}"
+
+EXTRA_OEMAKE =3D "LINUX_SRC=3D${STAGING_KERNEL_DIR}"
+
+do_install() {
+	install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/drivers/net/wir=
eless
+	install -d ${D}${sysconfdir}/Wireless/RT2870STA
+	install -m 0644 ${S}/${PN}sta${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}=
/modules/${KERNEL_VERSION}/drivers/net/wireless
+	touch ${D}${sysconfdir}/Wireless/RT2870STA/RT2870STA.dat
+}
--=20
1.6.0.4



