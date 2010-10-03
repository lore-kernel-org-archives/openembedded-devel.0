Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NSh-0004ex-Pv
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:15:08 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 0B2B51D363EB;
	Sun,  3 Oct 2010 14:14:22 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:14:23 +0200
Message-Id: <1286108063-11031-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rt3070: add support for Belkin F6D4050v2 USB adapter
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
X-List-Received-Date: Sun, 03 Oct 2010 12:15:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../rt3070-2.3.0.4/add_belkin_F6D4050v2.patch      |   12 ++++++++++++
 recipes/rt2x00/rt3070_2.3.0.4.bb                   |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/rt2x00/rt3070-2.3.0.4/add_belkin_F6D4050v2.pa=
tch

diff --git a/recipes/rt2x00/rt3070-2.3.0.4/add_belkin_F6D4050v2.patch b/r=
ecipes/rt2x00/rt3070-2.3.0.4/add_belkin_F6D4050v2.patch
new file mode 100644
index 0000000..e9b24a7
--- /dev/null
+++ b/recipes/rt2x00/rt3070-2.3.0.4/add_belkin_F6D4050v2.patch
@@ -0,0 +1,12 @@
+Index: DPO_RT3070_LinuxSTA_V2.3.0.4_20100604/common/rtusb_dev_id.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- DPO_RT3070_LinuxSTA_V2.3.0.4_20100604.orig/common/rtusb_dev_id.c	201=
0-10-02 10:39:35.000000000 +0200
++++ DPO_RT3070_LinuxSTA_V2.3.0.4_20100604/common/rtusb_dev_id.c	2010-10-=
02 10:40:23.000000000 +0200
+@@ -106,6 +106,7 @@
+ 	{USB_DEVICE(0x07FA,0x7712)}, /* Edimax */
+ 	{USB_DEVICE(0x0789,0x0166)}, /* Edimax */
+ 	{USB_DEVICE(0x148F,0x2070)}, /* Edimax */
++	{USB_DEVICE(0x050d,0x935b)}, /* Belkin F6D4050v2 */
+ #endif // RT3070 //
+ 	{ }/* Terminating entry */
+ };
diff --git a/recipes/rt2x00/rt3070_2.3.0.4.bb b/recipes/rt2x00/rt3070_2.3=
.0.4.bb
index c51cf74..fabe52e 100644
--- a/recipes/rt2x00/rt3070_2.3.0.4.bb
+++ b/recipes/rt2x00/rt3070_2.3.0.4.bb
@@ -2,13 +2,14 @@ DESCRIPTION =3D "Ralink 3070"
 HOMEPAGE =3D "http://eng.ralinktech.com.tw/support.php?s=3D2"
 SECTION =3D "kernel/modules"
 LICENSE =3D "GPLv2"
-PR =3D "r0"
+PR =3D "r1"
=20
 inherit module
=20
 # Original URL needs a click-wrap license.
 SRC_URI =3D "http://www.penguin.cz/~utx/hardware/Ralink_3071/DPO_RT3070_=
LinuxSTA_V${PV}_20100604.tar.bz2 \
 	   file://makefile.patch \
+           file://add_belkin_F6D4050v2.patch \
 	 "
=20
 EXTRA_OEMAKE =3D "LINUX_SRC=3D${STAGING_KERNEL_DIR}"
--=20
1.7.0.4



